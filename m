From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:30 -0800
Subject: [PATCH 08/21] ARC: Linux Syscall Interface
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-9-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                                     |  12 ++
 sysdeps/unix/sysv/linux/arc/cacheflush.c      |  29 +++
 sysdeps/unix/sysv/linux/arc/clone.S           | 100 ++++++++++
 sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h  |   6 +
 sysdeps/unix/sysv/linux/arc/kernel-features.h |  28 +++
 sysdeps/unix/sysv/linux/arc/mmap_internal.h   |  26 +++
 sysdeps/unix/sysv/linux/arc/profil-counter.h  |   2 +
 sysdeps/unix/sysv/linux/arc/pt-vfork.S        |   1 +
 sysdeps/unix/sysv/linux/arc/sigaction.c       |  69 +++++++
 sysdeps/unix/sysv/linux/arc/syscall.S         |  38 ++++
 sysdeps/unix/sysv/linux/arc/sysdep.c          |  33 ++++
 sysdeps/unix/sysv/linux/arc/sysdep.h          | 259 ++++++++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/vfork.S           |  42 +++++
 13 files changed, 645 insertions(+)
 create mode 100644 sysdeps/unix/sysv/linux/arc/cacheflush.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/clone.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/kernel-features.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/mmap_internal.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/profil-counter.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/pt-vfork.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/sigaction.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/syscall.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/vfork.S

diff --git a/ChangeLog b/ChangeLog
index b946f57204b6..08a3ac7e8064 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -44,6 +44,18 @@
 	* sysdeps/arc/nofpu/math-tests-exception.h: New file.
 	* sysdeps/arc/nofpu/math-tests-rounding.h: New file.
 	* sysdeps/arc/sfp-machine.h: New file.
+	* sysdeps/unix/sysv/linux/arc/cacheflush.c: New file.
+	* sysdeps/unix/sysv/linux/arc/clone.S: New file.
+	* sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h: New file.
+	* sysdeps/unix/sysv/linux/arc/kernel-features.h: New file.
+	* sysdeps/unix/sysv/linux/arc/mmap_internal.h: New file.
+	* sysdeps/unix/sysv/linux/arc/profil-counter.h: New file.
+	* sysdeps/unix/sysv/linux/arc/pt-vfork.S: New file.
+	* sysdeps/unix/sysv/linux/arc/sigaction.c: New file.
+	* sysdeps/unix/sysv/linux/arc/syscall.S: New file.
+	* sysdeps/unix/sysv/linux/arc/sysdep.c: New file.
+	* sysdeps/unix/sysv/linux/arc/sysdep.h: New file.
+	* sysdeps/unix/sysv/linux/arc/vfork.S: New file.
 
 2018-12-17  Joseph Myers  <joseph at codesourcery.com>
 
diff --git a/sysdeps/unix/sysv/linux/arc/cacheflush.c b/sysdeps/unix/sysv/linux/arc/cacheflush.c
new file mode 100644
index 000000000000..7b14211eccf7
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/cacheflush.c
@@ -0,0 +1,29 @@
+/* cacheflush system call for ARC Linux.
+   Copyright (C) 2017-2018 Free Software Foundation, Inc.
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
+#include <stddef.h>
+#include <unistd.h>
+
+/* Flush cache(s).  */
+int
+_flush_cache (char *addr, const int nbytes, const int op)
+{
+  return INLINE_SYSCALL (cacheflush, 3, addr, nbytes, op);
+}
+weak_alias (_flush_cache, cacheflush)
diff --git a/sysdeps/unix/sysv/linux/arc/clone.S b/sysdeps/unix/sysv/linux/arc/clone.S
new file mode 100644
index 000000000000..04f2df5ef06d
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/clone.S
@@ -0,0 +1,100 @@
+/* clone() implementation for ARC.
+   Copyright (C) 2008-2018 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+   Contributed by Andrew Jenner <andrew at codesourcery.com>, 2008.
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
+   License along with the GNU C Library; if not, see
+   <http://www.gnu.org/licenses/>.  */
+
+
+#include <sysdep.h>
+#define _ERRNO_H	1
+#include <bits/errno.h>
+#include <tcb-offsets.h>
+
+#define CLONE_SETTLS		0x00080000
+
+; int clone(int (*fn)(void *), void *child_stack,
+;           int flags, void *arg, ...
+;           /* pid_t *ptid, struct user_desc *tls, pid_t *ctid */);
+;
+; NOTE: I'm assuming that the last 3 args are NOT var-args and in case all
+;	3 are not relevant, caller will nevertheless pass those as NULL.
+;       Current (Jul 2012) upstream powerpc/clone.S assumes similarly.
+;	Our LTP (from 2007) doesn't seem to have tests to prove otherwise
+
+; clone syscall in kernel (ABI: CONFIG_CLONE_BACKWARDS)
+;
+; int sys_clone(unsigned long clone_flags,
+;		unsigned long newsp,
+;		int __user *parent_tidptr,
+;		void *tls,
+;		int __user *child_tidptr)
+
+ENTRY(__clone)
+	cmp	r0, 0		; @fn can't be NULL
+	cmp.ne	r1, 0		; @child_stack can't be NULL
+	bz	.L__sys_err
+
+	; save some of the orig args
+	; r0 containg @fn will be clobbered AFTER syscall (with ret val)
+	; rest are clobbered BEFORE syscall due to different arg ordering
+	mov	r10, r0		; @fn
+	mov	r11, r3		; @args
+	mov	r12, r2		; @clone_flags
+	mov	r9,  r5		; @tls
+
+	; adjust libc args for syscall
+
+	mov 	r0, r2		; libc @flags is 1st syscall arg
+	mov	r2, r4		; libc @ptid
+	mov	r3, r5		; libc @tls
+	mov	r4, r6		; libc @ctid
+	mov	r8, __NR_clone
+	ARC_TRAP_INSN
+
+	cmp	r0, 0		; return code : 0 new process, !0 parent
+	blt	.L__sys_err2	; < 0 (signed) error
+	jnz	[blink]		; Parent returns
+
+	; ----- child starts here ---------
+
+	; Setup TP register (only recent kernels v4.19+ do that)
+	and.f	0, r12, CLONE_SETTLS
+	mov.nz	r25, r9
+
+	; child jumps off to @fn with @arg as argument, and returns here
+	jl.d	[r10]
+	mov	r0, r11
+
+	; exit() with result from @fn (already in r0)
+	mov	r8, __NR_exit
+	ARC_TRAP_INSN
+	; In case it ever came back
+	flag	1
+
+.L__sys_err:
+	mov	r0, -EINVAL
+.L__sys_err2:
+	; (1) No need to make -ve kernel error code as positive errno
+	;   __syscall_error expects the -ve error code returned by kernel
+	; (2) r0 still had orig -ve kernel error code
+	; (3) Tail call to __syscall_error so we dont have to come back
+	;     here hence instead of jmp-n-link (reg push/pop) we do jmp
+	; (4) No need to route __syscall_error via PLT, B is inherently
+	;     position independent
+	b   __syscall_error
+PSEUDO_END (__clone)
+libc_hidden_def (__clone)
+weak_alias (__clone, clone)
diff --git a/sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h b/sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h
new file mode 100644
index 000000000000..2fec69d21657
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h
@@ -0,0 +1,6 @@
+#define JMP_BUF_SIZE		(32 + 1 + 1024/32) * 4
+#define SIGJMP_BUF_SIZE		(32 + 1 + 1024/32) * 4
+#define JMP_BUF_ALIGN		4
+#define SIGJMP_BUF_ALIGN	4
+#define MASK_WAS_SAVED_OFFSET	32 * 4
+#define SAVED_MASK_OFFSET	33 * 4
diff --git a/sysdeps/unix/sysv/linux/arc/kernel-features.h b/sysdeps/unix/sysv/linux/arc/kernel-features.h
new file mode 100644
index 000000000000..d8f667ca4759
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/kernel-features.h
@@ -0,0 +1,28 @@
+/* Set flags signalling availability of kernel features based on given
+   kernel version number.
+
+   Copyright (C) 2009-2018 Free Software Foundation, Inc.
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
+   License along with the GNU C Library; if not, see
+   <http://www.gnu.org/licenses/>.  */
+
+/* The minimum supported kernel version for ARC is 3.9,
+   guaranteeing many kernel features.  */
+
+#include_next <kernel-features.h>
+
+#undef __ASSUME_CLONE_DEFAULT
+#define __ASSUME_CLONE_BACKWARDS 1
diff --git a/sysdeps/unix/sysv/linux/arc/mmap_internal.h b/sysdeps/unix/sysv/linux/arc/mmap_internal.h
new file mode 100644
index 000000000000..3c8c55d57d0e
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/mmap_internal.h
@@ -0,0 +1,26 @@
+/* mmap - map files or devices into memory.  Linux/ARC version.
+   Copyright (C) 2017-2018 Free Software Foundation, Inc.
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
+   License along with the GNU C Library; if not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#ifndef MMAP_ARC_INTERNAL_H
+#define MMAP_ARC_INTERNAL_H
+
+#define MMAP2_PAGE_UNIT 8192ULL	/* 8K page is default for ARC */
+
+#include_next <mmap_internal.h>
+
+#endif
diff --git a/sysdeps/unix/sysv/linux/arc/profil-counter.h b/sysdeps/unix/sysv/linux/arc/profil-counter.h
new file mode 100644
index 000000000000..8a6a0bcf3d59
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/profil-counter.h
@@ -0,0 +1,2 @@
+/* We can use the ix86 version.  */
+#include <sysdeps/unix/sysv/linux/i386/profil-counter.h>
diff --git a/sysdeps/unix/sysv/linux/arc/pt-vfork.S b/sysdeps/unix/sysv/linux/arc/pt-vfork.S
new file mode 100644
index 000000000000..65cc3823ac87
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/pt-vfork.S
@@ -0,0 +1 @@
+#include <sysdeps/unix/sysv/linux/alpha/pt-vfork.S>
diff --git a/sysdeps/unix/sysv/linux/arc/sigaction.c b/sysdeps/unix/sysv/linux/arc/sigaction.c
new file mode 100644
index 000000000000..0a58e78f8834
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sigaction.c
@@ -0,0 +1,69 @@
+/* ARC specific sigaction and signal restorer
+   Copyright (C) 1997-2018 Free Software Foundation, Inc.
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
+#include <errno.h>
+#include <signal.h>
+#include <string.h>
+#include <sys/syscall.h>
+
+/*
+ * Default sigretrun stub if user doesn't specify SA_RESTORER
+ */
+static void __default_rt_sa_restorer(void)
+{
+	INTERNAL_SYSCALL_NCS(__NR_rt_sigreturn, , 0);
+}
+
+#define SA_RESTORER	0x04000000
+
+/* If @act is not NULL, change the action for @sig to @act.
+   If @oact is not NULL, put the old action for @sig in @oact.  */
+int
+__libc_sigaction (int sig, const struct sigaction *act, struct sigaction *oact)
+{
+	struct sigaction kact;
+	const struct sigaction *arg;
+
+	/*
+	 * SA_RESTORER is only relevant for act != NULL case
+	 * (!act means caller only wants to know @oact)
+	 */
+	if (act && !(act->sa_flags & SA_RESTORER)) {
+		kact.sa_restorer = __default_rt_sa_restorer;
+		kact.sa_flags = act->sa_flags | SA_RESTORER;
+
+		kact.sa_handler = act->sa_handler;
+		kact.sa_mask = act->sa_mask;
+
+		arg = &kact;
+	} else {
+		arg = act;
+	}
+
+	/*
+	 * syscall also expects sizeof(sa_mask) and asm-generic kernel syscall
+	 * ABI mandates it be 2 words (8 bytes below) although glibc defines
+	 * sigset_to be much larger (1024 / 32 == 64 bytes)
+	 */
+	return INLINE_SYSCALL(rt_sigaction, 4, sig, arg, oact, _NSIG / 8);
+}
+
+libc_hidden_def (__libc_sigaction)
+
+#include <nptl/sigaction.c>
diff --git a/sysdeps/unix/sysv/linux/arc/syscall.S b/sysdeps/unix/sysv/linux/arc/syscall.S
new file mode 100644
index 000000000000..8f76fa43e95f
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/syscall.S
@@ -0,0 +1,38 @@
+/* syscall - indirect system call.
+   Copyright (C) 2017-2018 Free Software Foundation, Inc.
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
+   License along with the GNU C Library; if not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#include <sysdep.h>
+
+ENTRY (syscall)
+	mov_s	r8, r0
+	mov_s	r0, r1
+	mov_s	r1, r2
+	mov_s	r2, r3
+	mov_s	r3, r4
+#ifdef __ARC700__
+	mov	r4, r5
+	mov	r5, r6
+#else
+	mov_s	r4, r5
+	mov_s	r5, r6
+#endif
+
+	ARC_TRAP_INSN
+	brhi	r0, -1024, .Lcall_syscall_err
+	j	[blink]
+PSEUDO_END (syscall)
diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.c b/sysdeps/unix/sysv/linux/arc/sysdep.c
new file mode 100644
index 000000000000..d9bcc305b846
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sysdep.c
@@ -0,0 +1,33 @@
+/* ARC wrapper for setting errno
+   Copyright (C) 1997-2018 Free Software Foundation, Inc.
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
+   License along with the GNU C Library; if not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#include <sysdep.h>
+#include <errno.h>
+
+/* All syscall handler come here to avoid generated code bloat due to
+ * GOT reference  to errno_location or it's equivalent
+ */
+int __syscall_error(int err_no)
+{
+	__set_errno(-err_no);
+	return -1;
+}
+
+#if IS_IN (libc)
+hidden_def (__syscall_error)
+#endif
diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.h b/sysdeps/unix/sysv/linux/arc/sysdep.h
new file mode 100644
index 000000000000..39d1f03c3710
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sysdep.h
@@ -0,0 +1,259 @@
+/* Assembler macros for ARC.
+   Copyright (C) 2000-2018 Free Software Foundation, Inc.
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
+   License along with the GNU C Library; if not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#ifndef _LINUX_ARC_SYSDEP_H
+#define _LINUX_ARC_SYSDEP_H 1
+
+#include <asm/unistd.h>
+#include <sysdeps/arc/sysdep.h>
+#include <sysdeps/unix/sysv/linux/generic/sysdep.h>
+
+/* For RTLD_PRIVATE_ERRNO.  */
+#include <dl-sysdep.h>
+
+#include <tls.h>
+
+#undef SYS_ify
+#define SYS_ify(syscall_name)   __NR_##syscall_name
+
+#ifdef __ASSEMBLER__
+
+/* This is a "normal" system call stub: if there is an error,
+   it returns -1 and sets errno.  */
+
+# undef PSEUDO
+# define PSEUDO(name, syscall_name, args)			\
+  PSEUDO_NOERRNO(name, syscall_name, args)	ASM_LINE_SEP	\
+    brhi   r0, -1024, .Lcall_syscall_err	ASM_LINE_SEP
+
+#define ret	j  [blink]
+
+# undef PSEUDO_END
+# define PSEUDO_END(name)					\
+  SYSCALL_ERROR_HANDLER				ASM_LINE_SEP	\
+  END (name)
+
+/* --------- helper for SYSCALL_NOERRNO ----------- */
+
+/* This kind of system call stub never returns an error.
+   We return the return value register to the caller unexamined.  */
+
+# undef PSEUDO_NOERRNO
+# define PSEUDO_NOERRNO(name, syscall_name, args)		\
+  .text						ASM_LINE_SEP	\
+  ENTRY (name)					ASM_LINE_SEP	\
+    DO_CALL (syscall_name, args)		ASM_LINE_SEP	\
+
+/* return the return value register unexamined
+ * r0 is both syscall return reg and function return reg, so no need to do
+ * anything
+ */
+# define ret_NOERRNO						\
+  j_s  [blink]		ASM_LINE_SEP
+
+# undef PSEUDO_END_NOERRNO
+# define PSEUDO_END_NOERRNO(name)				\
+  END (name)
+
+/* --------- helper for SYSCALL_ERRVAL ----------- */
+
+/* This kind of system call stub returns the errno code as its return
+   value, or zero for success.  We may massage the kernel's return value
+   to meet that ABI, but we never set errno here.  */
+
+# undef PSEUDO_ERRVAL
+# define PSEUDO_ERRVAL(name, syscall_name, args)		\
+  PSEUDO_NOERRNO(name, syscall_name, args)	ASM_LINE_SEP
+
+/* don't set errno, return kernel error (in errno form) or zero */
+# define ret_ERRVAL						\
+  rsub   r0, r0, 0				ASM_LINE_SEP	\
+  ret_NOERRNO
+
+# undef PSEUDO_END_ERRVAL
+# define PSEUDO_END_ERRVAL(name)				\
+  END (name)
+
+
+/* To reduce the code footprint, we confine the actual errno access
+ * to single place in __syscall_error()
+ * this takes raw kernel error value, sets errno and returns -1
+ */
+#if IS_IN (libc)
+#define CALL_ERRNO_SETTER_C	bl     PLTJMP(HIDDEN_JUMPTARGET(__syscall_error))
+#else
+#define CALL_ERRNO_SETTER_C	bl     PLTJMP(__syscall_error)
+#endif
+
+# define SYSCALL_ERROR_HANDLER					\
+.Lcall_syscall_err:				ASM_LINE_SEP	\
+    st.a   blink, [sp, -4]			ASM_LINE_SEP	\
+    cfi_adjust_cfa_offset (4)			ASM_LINE_SEP	\
+    cfi_rel_offset (blink, 0)			ASM_LINE_SEP	\
+    CALL_ERRNO_SETTER_C				ASM_LINE_SEP	\
+    ld.ab  blink, [sp, 4]			ASM_LINE_SEP	\
+    cfi_adjust_cfa_offset (-4)			ASM_LINE_SEP	\
+    cfi_restore (blink)				ASM_LINE_SEP	\
+    j      [blink]
+
+# define DO_CALL(syscall_name, args)				\
+    mov    r8, SYS_ify (syscall_name)		ASM_LINE_SEP	\
+    ARC_TRAP_INSN				ASM_LINE_SEP
+
+#define ARC_TRAP_INSN	trap_s 0
+
+#else  /* !__ASSEMBLER__ */
+
+# define SINGLE_THREAD_BY_GLOBAL		1
+
+/* In order to get __set_errno() definition in INLINE_SYSCALL.  */
+#include <errno.h>
+
+extern int __syscall_error (int);
+
+#if IS_IN (libc)
+hidden_proto (__syscall_error)
+#define CALL_ERRNO_SETTER   "bl   __syscall_error    \n\t"
+#else
+#define CALL_ERRNO_SETTER   "bl   __syscall_error at plt    \n\t"
+#endif
+
+
+/* Define a macro which expands into the inline wrapper code for a system
+   call.  */
+#undef INLINE_SYSCALL
+#define INLINE_SYSCALL(name, nr_args, args...)				\
+({									\
+	register int __res __asm__("r0");				\
+	__res = INTERNAL_SYSCALL_NCS(__NR_##name, , nr_args, args);	\
+	if (__builtin_expect (INTERNAL_SYSCALL_ERROR_P ((__res), ), 0))	\
+	{								\
+		asm volatile ("st.a blink, [sp, -4] \n\t"		\
+			      CALL_ERRNO_SETTER				\
+			      "ld.ab blink, [sp, 4] \n\t"		\
+			      :"+r" (__res)				\
+			      :						\
+			      :"r1","r2","r3","r4","r5","r6",		\
+			       "r7","r8","r9","r10","r11","r12");	\
+	}								\
+	__res;								\
+})
+
+#undef INTERNAL_SYSCALL_DECL
+#define INTERNAL_SYSCALL_DECL(err) do { } while (0)
+
+#undef INTERNAL_SYSCALL_ERRNO
+# define INTERNAL_SYSCALL_ERRNO(val, err)    (-(val))
+
+/* -1 to -1023 are valid errno values */
+#undef INTERNAL_SYSCALL_ERROR_P
+#define INTERNAL_SYSCALL_ERROR_P(val, err)	\
+	((unsigned int) (val) > -1024U)
+
+#define ARC_TRAP_INSN	"trap_s 0	\n\t"
+
+#undef INTERNAL_SYSCALL_RAW
+#define INTERNAL_SYSCALL_RAW(name, err, nr_args, args...)	\
+({							\
+	/* Per ABI, r0 is 1st arg and return reg */	\
+	register int __ret __asm__("r0");		\
+	register int _sys_num __asm__("r8");		\
+							\
+	LOAD_ARGS_##nr_args (name, args)		\
+							\
+        __asm__ volatile (				\
+		ARC_TRAP_INSN				\
+		: "+r" (__ret)				\
+		: "r"(_sys_num) ASM_ARGS_##nr_args	\
+		: "memory");				\
+                                                        \
+	__ret;						\
+})
+
+/* Macros for setting up inline __asm__ input regs */
+#define ASM_ARGS_0
+#define ASM_ARGS_1	ASM_ARGS_0, "r" (__ret)
+#define ASM_ARGS_2	ASM_ARGS_1, "r" (_arg2)
+#define ASM_ARGS_3	ASM_ARGS_2, "r" (_arg3)
+#define ASM_ARGS_4	ASM_ARGS_3, "r" (_arg4)
+#define ASM_ARGS_5	ASM_ARGS_4, "r" (_arg5)
+#define ASM_ARGS_6	ASM_ARGS_5, "r" (_arg6)
+#define ASM_ARGS_7	ASM_ARGS_6, "r" (_arg7)
+
+/* Macros for converting sys-call wrapper args into sys call args */
+#define LOAD_ARGS_0(nm, arg)					\
+	_sys_num = (int) (nm);
+
+#define LOAD_ARGS_1(nm, arg1) 					\
+	__ret = (int) (arg1);					\
+	LOAD_ARGS_0 (nm, arg1)
+
+/*
+ * Note that the use of _tmpX might look superflous, however it is needed
+ * to ensure that register variables are not clobbered if arg happens to be
+ * a function call itself. e.g. sched_setaffinity() calling getpid() for arg2
+ *
+ * Also this specific order of recursive calling is important to segregate
+ * the tmp args evaluation (function call case described above) and assigment
+ * of register variables
+ */
+#define LOAD_ARGS_2(nm, arg1, arg2)				\
+	int _tmp2 = (int) (arg2);				\
+	LOAD_ARGS_1 (nm, arg1)					\
+	register int _arg2 __asm__ ("r1") = _tmp2;
+
+#define LOAD_ARGS_3(nm, arg1, arg2, arg3)			\
+	int _tmp3 = (int) (arg3);				\
+	LOAD_ARGS_2 (nm, arg1, arg2)				\
+	register int _arg3 __asm__ ("r2") = _tmp3;
+
+#define LOAD_ARGS_4(nm, arg1, arg2, arg3, arg4)			\
+	int _tmp4 = (int) (arg4);				\
+	LOAD_ARGS_3 (nm, arg1, arg2, arg3)			\
+	register int _arg4 __asm__ ("r3") = _tmp4;
+
+#define LOAD_ARGS_5(nm, arg1, arg2, arg3, arg4, arg5)		\
+	int _tmp5 = (int) (arg5);				\
+	LOAD_ARGS_4 (nm, arg1, arg2, arg3, arg4)		\
+	register int _arg5 __asm__ ("r4") = _tmp5;
+
+#define LOAD_ARGS_6(nm,  arg1, arg2, arg3, arg4, arg5, arg6)	\
+	int _tmp6 = (int) (arg6);				\
+	LOAD_ARGS_5 (nm, arg1, arg2, arg3, arg4, arg5)		\
+	register int _arg6 __asm__ ("r5") = _tmp6;
+
+#define LOAD_ARGS_7(nm, arg1, arg2, arg3, arg4, arg5, arg6, arg7)\
+	int _tmp7 = (int) (arg7);				\
+	LOAD_ARGS_6 (nm, arg1, arg2, arg3, arg4, arg5, arg6)	\
+	register int _arg7 __asm__ ("r6") = _tmp7;
+
+#undef INTERNAL_SYSCALL
+#define INTERNAL_SYSCALL(name, err, nr, args...) \
+	INTERNAL_SYSCALL_RAW(SYS_ify(name), err, nr, args)
+
+#undef INTERNAL_SYSCALL_NCS
+#define INTERNAL_SYSCALL_NCS(number, err, nr, args...) \
+	INTERNAL_SYSCALL_RAW(number, err, nr, args)
+
+/* Pointer mangling not yet supported  */
+# define PTR_MANGLE(var) (void) (var)
+# define PTR_DEMANGLE(var) (void) (var)
+
+#endif /* !__ASSEMBLER__ */
+
+#endif /* linux/arc/sysdep.h */
diff --git a/sysdeps/unix/sysv/linux/arc/vfork.S b/sysdeps/unix/sysv/linux/arc/vfork.S
new file mode 100644
index 000000000000..6d7f63c9900b
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/vfork.S
@@ -0,0 +1,42 @@
+/* vfork for ARC Linux.
+   Copyright (C) 2005-2018 Free Software Foundation, Inc.
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
+   License along with the GNU C Library; if not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#include <sys/syscall.h>
+#include <sysdep.h>
+#include <tcb-offsets.h>
+#define _SIGNAL_H
+#include <bits/signum.h>       /* For SIGCHLD */
+
+#define CLONE_VM		0x00000100
+#define CLONE_VFORK		0x00004000
+#define CLONE_FLAGS_FOR_VFORK	(CLONE_VM|CLONE_VFORK|SIGCHLD)
+
+ENTRY(__vfork)
+	mov	r0, CLONE_FLAGS_FOR_VFORK
+	mov_s	r1, sp
+	mov	r8, __NR_clone
+	ARC_TRAP_INSN
+
+	cmp	r0, 0
+	jge	[blink]	; child continues
+
+	b   __syscall_error
+PSEUDO_END (__vfork)
+libc_hidden_def (__vfork)
+
+weak_alias (__vfork, vfork)
-- 
2.7.4
