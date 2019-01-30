From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Jan 2019 17:25:42 -0800
Subject: [PATCH v2 02/15] ARC: ABI Implementation
In-Reply-To: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548811555-24373-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This code deals with the ARC ABI.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                    | 18 ++++++++++
 sysdeps/arc/__longjmp.S      | 50 +++++++++++++++++++++++++++
 sysdeps/arc/abort-instr.h    |  2 ++
 sysdeps/arc/bits/endian.h    | 12 +++++++
 sysdeps/arc/bits/setjmp.h    | 26 ++++++++++++++
 sysdeps/arc/bsd-_setjmp.S    |  1 +
 sysdeps/arc/bsd-setjmp.S     |  1 +
 sysdeps/arc/dl-runtime.c     | 39 +++++++++++++++++++++
 sysdeps/arc/dl-sysdep.h      | 25 ++++++++++++++
 sysdeps/arc/dl-trampoline.S  | 80 ++++++++++++++++++++++++++++++++++++++++++++
 sysdeps/arc/gccframe.h       | 21 ++++++++++++
 sysdeps/arc/gmp-mparam.h     | 23 +++++++++++++
 sysdeps/arc/jmpbuf-offsets.h | 47 ++++++++++++++++++++++++++
 sysdeps/arc/jmpbuf-unwind.h  | 47 ++++++++++++++++++++++++++
 sysdeps/arc/machine-gmon.h   | 35 +++++++++++++++++++
 sysdeps/arc/memusage.h       | 23 +++++++++++++
 sysdeps/arc/setjmp.S         | 66 ++++++++++++++++++++++++++++++++++++
 sysdeps/arc/sysdep.h         | 48 ++++++++++++++++++++++++++
 sysdeps/arc/tls-macros.h     | 47 ++++++++++++++++++++++++++
 19 files changed, 611 insertions(+)
 create mode 100644 sysdeps/arc/__longjmp.S
 create mode 100644 sysdeps/arc/abort-instr.h
 create mode 100644 sysdeps/arc/bits/endian.h
 create mode 100644 sysdeps/arc/bits/setjmp.h
 create mode 100644 sysdeps/arc/bsd-_setjmp.S
 create mode 100644 sysdeps/arc/bsd-setjmp.S
 create mode 100644 sysdeps/arc/dl-runtime.c
 create mode 100644 sysdeps/arc/dl-sysdep.h
 create mode 100644 sysdeps/arc/dl-trampoline.S
 create mode 100644 sysdeps/arc/gccframe.h
 create mode 100644 sysdeps/arc/gmp-mparam.h
 create mode 100644 sysdeps/arc/jmpbuf-offsets.h
 create mode 100644 sysdeps/arc/jmpbuf-unwind.h
 create mode 100644 sysdeps/arc/machine-gmon.h
 create mode 100644 sysdeps/arc/memusage.h
 create mode 100644 sysdeps/arc/setjmp.S
 create mode 100644 sysdeps/arc/sysdep.h
 create mode 100644 sysdeps/arc/tls-macros.h

diff --git a/ChangeLog b/ChangeLog
index e2091865afb5..ec8f6a0a9238 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -1,6 +1,24 @@
 2019-01-21  Vineet Gupta <vgupta at synopsys.com>
 
 	* elf/elf.h: add defines for ARC.
+	* sysdeps/arc/__longjmp.S: New file.
+	* sysdeps/arc/abort-instr.h: New file.
+	* sysdeps/arc/bits/endian.h: New file.
+	* sysdeps/arc/bits/setjmp.h: New file.
+	* sysdeps/arc/bsd-_setjmp.S: New file.
+	* sysdeps/arc/bsd-setjmp.S: New file.
+	* sysdeps/arc/dl-runtime.c: New file.
+	* sysdeps/arc/dl-sysdep.h: New file.
+	* sysdeps/arc/dl-trampoline.S: New file.
+	* sysdeps/arc/gccframe.h: New file.
+	* sysdeps/arc/gmp-mparam.h: New file.
+	* sysdeps/arc/jmpbuf-offsets.h: New file.
+	* sysdeps/arc/jmpbuf-unwind.h: New file.
+	* sysdeps/arc/machine-gmon.h: New file.
+	* sysdeps/arc/memusage.h: New file.
+	* sysdeps/arc/setjmp.S: New file.
+	* sysdeps/arc/sysdep.h: New file.
+	* sysdeps/arc/tls-macros.h: New file.
 
 2019-01-25  Siddhesh Poyarekar  <siddhesh at sourceware.org>
 
diff --git a/sysdeps/arc/__longjmp.S b/sysdeps/arc/__longjmp.S
new file mode 100644
index 000000000000..8296aa445f63
--- /dev/null
+++ b/sysdeps/arc/__longjmp.S
@@ -0,0 +1,50 @@
+/* longjmp for ARC.
+   Copyright (C) 2017-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public License as
+   published by the Free Software Foundation; either version 2.1 of the
+   License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#include <sysdep.h>
+#include <jmpbuf-offsets.h>
+
+;@ r0 = jump buffer from which regs will be restored
+;@ r1 = value that setjmp( ) will return due to this longjmp
+
+ENTRY (__longjmp)
+
+	ld_s r13,   [r0]
+	ld_s r14,   [r0,4]
+	ld   r15,   [r0,8]
+	ld   r16,   [r0,12]
+	ld   r17,   [r0,16]
+	ld   r18,   [r0,20]
+	ld   r19,   [r0,24]
+	ld   r20,   [r0,28]
+	ld   r21,   [r0,32]
+	ld   r22,   [r0,36]
+	ld   r23,   [r0,40]
+	ld   r24,   [r0,44]
+	ld   r25,   [r0,48]
+
+	ld   blink, [r0,60]
+	ld   fp,    [r0,52]
+	ld   sp,    [r0,56]
+
+	mov.f  r0, r1	; get the setjmp return value(due to longjmp) in place
+
+	j.d    [blink]	; to caller of setjmp location, right after the call
+	mov.z  r0, 1	; can't let setjmp return 0 when it is due to longjmp
+
+END (__longjmp)
diff --git a/sysdeps/arc/abort-instr.h b/sysdeps/arc/abort-instr.h
new file mode 100644
index 000000000000..49f33613c404
--- /dev/null
+++ b/sysdeps/arc/abort-instr.h
@@ -0,0 +1,2 @@
+/* FLAG 1 is privilege mode only instruction, hence will crash any program.  */
+#define ABORT_INSTRUCTION asm ("flag 1")
diff --git a/sysdeps/arc/bits/endian.h b/sysdeps/arc/bits/endian.h
new file mode 100644
index 000000000000..46f41e3cffe6
--- /dev/null
+++ b/sysdeps/arc/bits/endian.h
@@ -0,0 +1,12 @@
+/* Although ARC CPU can do BE, it is not supported.  */
+
+#ifndef _ENDIAN_H
+# error "Never use <bits/endian.h> directly; include <endian.h> instead."
+#endif
+
+#ifdef __LITTLE_ENDIAN__
+# define __BYTE_ORDER __LITTLE_ENDIAN
+#endif
+#ifdef __BIG_ENDIAN__
+# error "Big Endian NOt supported on ARC"
+#endif
diff --git a/sysdeps/arc/bits/setjmp.h b/sysdeps/arc/bits/setjmp.h
new file mode 100644
index 000000000000..3cb457d097c4
--- /dev/null
+++ b/sysdeps/arc/bits/setjmp.h
@@ -0,0 +1,26 @@
+/* Define the machine-dependent type `jmp_buf'.  ARC version.
+   Copyright (C) 1992-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#ifndef _ARC_BITS_SETJMP_H
+#define _ARC_BITS_SETJMP_H 1
+
+/* Saves r13-r25 (callee-saved), fp (frame pointer), sp (stack pointer),
+   blink (branch-n-link).  */
+typedef long int __jmp_buf[32];
+
+#endif
diff --git a/sysdeps/arc/bsd-_setjmp.S b/sysdeps/arc/bsd-_setjmp.S
new file mode 100644
index 000000000000..90b99cd8c3e0
--- /dev/null
+++ b/sysdeps/arc/bsd-_setjmp.S
@@ -0,0 +1 @@
+/* _setjmp is in setjmp.S.  */
diff --git a/sysdeps/arc/bsd-setjmp.S b/sysdeps/arc/bsd-setjmp.S
new file mode 100644
index 000000000000..d3b823c118bc
--- /dev/null
+++ b/sysdeps/arc/bsd-setjmp.S
@@ -0,0 +1 @@
+/* setjmp is in setjmp.S.  */
diff --git a/sysdeps/arc/dl-runtime.c b/sysdeps/arc/dl-runtime.c
new file mode 100644
index 000000000000..48f4a5a7e1d5
--- /dev/null
+++ b/sysdeps/arc/dl-runtime.c
@@ -0,0 +1,39 @@
+/* dl-runtime helpers for ARC.
+   Copyright (C) 2017-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public License as
+   published by the Free Software Foundation; either version 2.1 of the
+   License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+/* PLT jump into resolver passes PC of PLTn, while _dl_fixup expects the
+   address of corresponding .rela.plt entry.  */
+
+#ifdef __A7__
+# define ARC_PLT_SIZE	12
+#else
+# define ARC_PLT_SIZE	16
+#endif
+
+#define reloc_index						\
+({								\
+  unsigned long int plt0 = D_PTR (l, l_info[DT_PLTGOT]);	\
+  unsigned long int pltn = reloc_arg;				\
+  /* Exclude PL0 and PLT1.  */					\
+  unsigned long int idx = (pltn - plt0)/ARC_PLT_SIZE - 2;	\
+  idx;								\
+})
+
+#define reloc_offset reloc_index * sizeof (PLTREL)
+
+#include <elf/dl-runtime.c>
diff --git a/sysdeps/arc/dl-sysdep.h b/sysdeps/arc/dl-sysdep.h
new file mode 100644
index 000000000000..ffc30b69372b
--- /dev/null
+++ b/sysdeps/arc/dl-sysdep.h
@@ -0,0 +1,25 @@
+/* System-specific settings for dynamic linker code.  ARC version.
+   Copyright (C) 2009-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#include_next <dl-sysdep.h>
+
+/* _dl_argv cannot be attribute_relro, because _dl_start_user
+   might write into it after _dl_start returns.  */
+#define DL_ARGV_NOT_RELRO 1
+
+#define DL_EXTERN_PROTECTED_DATA
diff --git a/sysdeps/arc/dl-trampoline.S b/sysdeps/arc/dl-trampoline.S
new file mode 100644
index 000000000000..9da75fb1fe24
--- /dev/null
+++ b/sysdeps/arc/dl-trampoline.S
@@ -0,0 +1,80 @@
+/* PLT trampolines.  ARC version.
+   Copyright (C) 2005-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#include <sysdep.h>
+#include <libc-symbols.h>
+
+#include <sysdep.h>
+#include <sys/syscall.h>
+
+/* Save the registers which resolver could possibly clobber
+	r0-r9: args to the function - symbol being resolved
+	r10-r12 are already clobbered by PLTn, PLT0 thus neednot be saved.  */
+
+.macro	SAVE_CALLER_SAVED
+	push_s	r0
+	push_s	r1
+	push_s	r2
+	push_s	r3
+	st.a	r4, [sp, -4]
+	st.a	r5, [sp, -4]
+	st.a	r6, [sp, -4]
+	st.a	r7, [sp, -4]
+	st.a	r8, [sp, -4]
+	st.a	r9, [sp, -4]
+	cfi_adjust_cfa_offset (40)
+	push_s	blink
+	cfi_adjust_cfa_offset (4)
+	cfi_rel_offset (blink, 0)
+.endm
+
+.macro RESTORE_CALLER_SAVED_BUT_R0
+	ld.ab	blink,[sp, 4]
+	cfi_adjust_cfa_offset (-4)
+	cfi_restore (blink)
+	ld.ab	r9, [sp, 4]
+	ld.ab	r8, [sp, 4]
+	ld.ab	r7, [sp, 4]
+	ld.ab	r6, [sp, 4]
+	ld.ab	r5, [sp, 4]
+	ld.ab	r4, [sp, 4]
+	pop_s   r3
+	pop_s   r2
+	pop_s   r1
+	cfi_adjust_cfa_offset (-36)
+.endm
+
+/* Upon entry, PLTn, which led us here, sets up the following regs
+	r11 = Module info (tpnt pointer as expected by resolver)
+	r12 = PC of the PLTn itself - needed by resolver to find
+	      corresponding .rela.plt entry.  */
+
+ENTRY (_dl_runtime_resolve)
+	; args to func being resolved, which resolver might clobber
+	SAVE_CALLER_SAVED
+
+	mov_s 	r1, r12
+	bl.d  	_dl_fixup
+	mov   	r0, r11
+
+	RESTORE_CALLER_SAVED_BUT_R0
+	j_s.d   [r0]    /* r0 has resolved function addr.  */
+	pop_s   r0      /* restore first arg to resolved call.  */
+	cfi_adjust_cfa_offset (-4)
+	cfi_restore (r0)
+END (_dl_runtime_resolve)
diff --git a/sysdeps/arc/gccframe.h b/sysdeps/arc/gccframe.h
new file mode 100644
index 000000000000..40487fa77b4a
--- /dev/null
+++ b/sysdeps/arc/gccframe.h
@@ -0,0 +1,21 @@
+/* Definition of object in frame unwind info.  ARC version.
+   Copyright (C) 2017-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#define FIRST_PSEUDO_REGISTER 40
+
+#include <sysdeps/generic/gccframe.h>
diff --git a/sysdeps/arc/gmp-mparam.h b/sysdeps/arc/gmp-mparam.h
new file mode 100644
index 000000000000..e30695fc6b2d
--- /dev/null
+++ b/sysdeps/arc/gmp-mparam.h
@@ -0,0 +1,23 @@
+/* gmp-mparam.h -- Compiler/machine parameter header file.
+
+Copyright (C) 2017-2019 Free Software Foundation, Inc.
+
+This file is part of the GNU MP Library.
+
+The GNU MP Library is free software; you can redistribute it and/or modify
+it under the terms of the GNU Lesser General Public License as published by
+the Free Software Foundation; either version 2.1 of the License, or (at your
+option) any later version.
+
+The GNU MP Library is distributed in the hope that it will be useful, but
+WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
+License for more details.
+
+You should have received a copy of the GNU Lesser General Public License
+along with the GNU MP Library; see the file COPYING.LIB.  If not, see
+<http://www.gnu.org/licenses/>.  */
+
+#include <sysdeps/generic/gmp-mparam.h>
+
+#define IEEE_DOUBLE_BIG_ENDIAN 0
diff --git a/sysdeps/arc/jmpbuf-offsets.h b/sysdeps/arc/jmpbuf-offsets.h
new file mode 100644
index 000000000000..9760f3a3891e
--- /dev/null
+++ b/sysdeps/arc/jmpbuf-offsets.h
@@ -0,0 +1,47 @@
+/* Private macros for accessing __jmp_buf contents.  ARC version.
+   Copyright (C) 2006-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+/* Save offsets within __jmp_buf
+   We don't use most of these symbols; they are here for documentation. */
+
+/* Callee Regs.  */
+#define JB_R13 0
+#define JB_R14 1
+#define JB_R15 2
+#define JB_R16 3
+#define JB_R17 4
+#define JB_R18 5
+#define JB_R19 6
+#define JB_R20 7
+#define JB_R21 8
+#define JB_R22 9
+#define JB_R23 10
+#define JB_R24 11
+#define JB_R25 12
+
+/* Frame Pointer, Stack Pointer, Branch-n-link.  */
+#define JB_FP  13
+#define JB_SP  14
+#define JB_BLINK  15
+
+/* We save space for some extra state to accommodate future changes
+   This is number of words.  */
+#define JB_NUM	32
+
+/* Helper for generic ____longjmp_chk().  */
+#define JB_FRAME_ADDRESS(buf) ((void *) (unsigned long int) (buf[JB_SP]))
diff --git a/sysdeps/arc/jmpbuf-unwind.h b/sysdeps/arc/jmpbuf-unwind.h
new file mode 100644
index 000000000000..47be5758c75c
--- /dev/null
+++ b/sysdeps/arc/jmpbuf-unwind.h
@@ -0,0 +1,47 @@
+/* Examine __jmp_buf for unwinding frames.  ARC version.
+   Copyright (C) 2005-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#include <setjmp.h>
+#include <jmpbuf-offsets.h>
+#include <stdint.h>
+#include <unwind.h>
+
+/* Test if longjmp to JMPBUF would unwind the frame
+   containing a local variable at ADDRESS.  */
+
+#define _JMPBUF_UNWINDS(jmpbuf, address, demangle) \
+  ((void *) (address) < (void *) demangle (jmpbuf[JB_SP]))
+
+#define _JMPBUF_CFA_UNWINDS_ADJ(_jmpbuf, _context, _adj) \
+  _JMPBUF_UNWINDS_ADJ (_jmpbuf, (void *) _Unwind_GetCFA (_context), _adj)
+
+static inline uintptr_t __attribute__ ((unused))
+_jmpbuf_sp (__jmp_buf jmpbuf)
+{
+  uintptr_t sp = jmpbuf[JB_SP];
+#ifdef PTR_DEMANGLE
+  PTR_DEMANGLE (sp);
+#endif
+  return sp;
+}
+
+#define _JMPBUF_UNWINDS_ADJ(_jmpbuf, _address, _adj) \
+  ((uintptr_t) (_address) - (_adj) < (uintptr_t) (_jmpbuf_sp (_jmpbuf) - (_adj)))
+
+/* We use the normal longjmp for unwinding.  */
+#define __libc_unwind_longjmp(buf, val) __libc_longjmp (buf, val)
diff --git a/sysdeps/arc/machine-gmon.h b/sysdeps/arc/machine-gmon.h
new file mode 100644
index 000000000000..1d9e8108d9b9
--- /dev/null
+++ b/sysdeps/arc/machine-gmon.h
@@ -0,0 +1,35 @@
+/* Machine-dependent definitions for profiling support.  ARC version.
+   Copyright (C) 1996-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#include <sysdep.h>
+
+#define _MCOUNT_DECL(frompc, selfpc)					\
+static void								\
+__mcount_internal (unsigned long int frompc, unsigned long int selfpc)
+
+/* This is very simple as gcc does all the heavy lifting at _mcount call site
+    - sets up caller's blink in r0, so frompc is setup correctly
+    - preserve argument registers for original call.  */
+
+#define MCOUNT								\
+void									\
+_mcount (void *frompc)							\
+{									\
+  __mcount_internal ((unsigned long int) frompc,			\
+		     (unsigned long int) __builtin_return_address(0));	\
+}
diff --git a/sysdeps/arc/memusage.h b/sysdeps/arc/memusage.h
new file mode 100644
index 000000000000..29f234f5bac0
--- /dev/null
+++ b/sysdeps/arc/memusage.h
@@ -0,0 +1,23 @@
+/* Machine-specific definitions for memory usage profiling, ARC version.
+   Copyright (C) 2000-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#define GETSP() ({ register uintptr_t stack_ptr asm ("sp"); stack_ptr; })
+
+#define uatomic32_t unsigned int
+
+#include <sysdeps/generic/memusage.h>
diff --git a/sysdeps/arc/setjmp.S b/sysdeps/arc/setjmp.S
new file mode 100644
index 000000000000..518545a99e8b
--- /dev/null
+++ b/sysdeps/arc/setjmp.S
@@ -0,0 +1,66 @@
+/* setjmp for ARC.
+   Copyright (C) 1991-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+
+#include <sysdep.h>
+
+/* Upon entry r0 = jump buffer into which regs will be saved.  */
+ENTRY (setjmp)
+	b.d	__sigsetjmp
+	mov	r1, 1		; save signals
+END (setjmp)
+
+/* Upon entry r0 = jump buffer into which regs will be saved.  */
+ENTRY (_setjmp)
+	b.d	__sigsetjmp
+	mov	r1, 0		/* don't save signals.  */
+END (_setjmp)
+libc_hidden_def (_setjmp)
+
+/* Upon entry
+   r0 = jump buffer into which regs will be saved
+   r1 = do we need to save signals.  */
+ENTRY (__sigsetjmp)
+
+	st_s r13, [r0]
+	st_s r14, [r0,4]
+	st   r15, [r0,8]
+	st   r16, [r0,12]
+	st   r17, [r0,16]
+	st   r18, [r0,20]
+	st   r19, [r0,24]
+	st   r20, [r0,28]
+	st   r21, [r0,32]
+	st   r22, [r0,36]
+	st   r23, [r0,40]
+	st   r24, [r0,44]
+	st   r25, [r0,48]
+	st   fp,  [r0,52]
+	st   sp,  [r0,56]
+
+	/* Make a note of where longjmp will return to.
+	   that will be right next to this setjmp call-site which will be
+	   contained in blink, since "C" caller of this routine will do
+	   a branch-n-link */
+
+	st   blink, [r0,60]
+	b    __sigjmp_save
+
+END (__sigsetjmp)
+
+libc_hidden_def (__sigsetjmp)
diff --git a/sysdeps/arc/sysdep.h b/sysdeps/arc/sysdep.h
new file mode 100644
index 000000000000..127e9b01e735
--- /dev/null
+++ b/sysdeps/arc/sysdep.h
@@ -0,0 +1,48 @@
+/* Assembler macros for ARC.
+   Copyright (C) 2017-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public License as
+   published by the Free Software Foundation; either version 2.1 of the
+   License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#include <sysdeps/generic/sysdep.h>
+
+#ifdef	__ASSEMBLER__
+
+/* Syntactic details of assembler.
+   ; is not newline but comment, # is also for comment.  */
+# define ASM_SIZE_DIRECTIVE(name) .size name,.-name
+
+# define ENTRY(name)						\
+	.align 4				ASM_LINE_SEP	\
+	.globl C_SYMBOL_NAME(name)		ASM_LINE_SEP	\
+	.type C_SYMBOL_NAME(name),%function	ASM_LINE_SEP	\
+	C_LABEL(name)				ASM_LINE_SEP	\
+	cfi_startproc				ASM_LINE_SEP	\
+	CALL_MCOUNT
+
+# undef  END
+# define END(name)						\
+	cfi_endproc				ASM_LINE_SEP	\
+	ASM_SIZE_DIRECTIVE(name)
+
+# ifdef SHARED
+#  define PLTJMP(_x)	_x##@plt
+# else
+#  define PLTJMP(_x)	_x
+# endif
+
+# define CALL_MCOUNT		/* Do nothing for now.  */
+
+#endif	/* __ASSEMBLER__ */
diff --git a/sysdeps/arc/tls-macros.h b/sysdeps/arc/tls-macros.h
new file mode 100644
index 000000000000..4d54683eda4f
--- /dev/null
+++ b/sysdeps/arc/tls-macros.h
@@ -0,0 +1,47 @@
+/* Macros to support TLS testing in times of missing compiler support.  ARC version.
+   Copyright (C) 2017-2019 Free Software Foundation, Inc.
+
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+
+/* For now.  */
+#define TLS_LD(x)	TLS_IE(x)
+
+#define TLS_GD(x)					\
+  ({ int *__result;					\
+     __asm__ ("add r0, pcl, @" #x "@tlsgd      \n"     	\
+	  ".tls_gd_ld " #x "`bl __tls_get_addr at plt \n"	\
+	  "mov %0, r0                    \n"		\
+	  : "=&r" (__result)				\
+	  ::"r0","r1","r2","r3","r4","r5","r6","r7",	\
+	    "r8","r9","r10","r11","r12");		\
+     __result; })
+
+#define TLS_LE(x)					\
+  ({ int *__result;					\
+     void *tp = __builtin_thread_pointer();		\
+     __asm__ ("add %0, %1, @" #x "@tpoff   \n"		\
+	  : "=r" (__result) : "r"(tp));	        	\
+     __result; })
+
+#define TLS_IE(x)					\
+  ({ int *__result;					\
+     void *tp = __builtin_thread_pointer();		\
+     __asm__ ("ld %0, [pcl, @" #x "@tlsie]      \n"     \
+	  "add %0, %1, %0                       \n"	\
+	  : "=&r" (__result) : "r" (tp));		\
+     __result; })
-- 
2.7.4
