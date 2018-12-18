From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:41 -0800
Subject: [PATCH 19/21] ARC: fix several unwining and cancelation tests
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-20-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Cupertino Miranda <cmiranda@synopsys.com>

1. Add dwarf CFI psuedo-ops to various syscall generators

2. Signature of sa_restorer was not what libgcc trampoline parser
   expects due to an intermediate mov instruction

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Cupertino Miranda <cmiranda at synopsys.com>
---
 ChangeLog                                 |  8 ++++++++
 sysdeps/arc/dl-trampoline.S               |  9 +++++++++
 sysdeps/arc/sysdep.h                      |  2 ++
 sysdeps/unix/sysv/linux/arc/Makefile      |  4 ++++
 sysdeps/unix/sysv/linux/arc/Versions      |  4 ++++
 sysdeps/unix/sysv/linux/arc/sigaction.c   |  8 +-------
 sysdeps/unix/sysv/linux/arc/sigrestorer.S | 28 ++++++++++++++++++++++++++++
 7 files changed, 56 insertions(+), 7 deletions(-)
 create mode 100644 sysdeps/unix/sysv/linux/arc/sigrestorer.S

diff --git a/ChangeLog b/ChangeLog
index ec068c7c5925..376d0e401117 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -1,6 +1,14 @@
 2018-12-17  Cupertino Miranda <cmiranda at synopsys.com>
 
 	* sysdeps/arc/dl-machine.h: Fix relocation.
+	* sysdeps/arc/dl-trampoline.S: Add cfi pseudo-ops.
+	* sysdeps/arc/sysdep.h: likewise.
+	* sysdeps/unix/sysv/linux/arc/sigrestorer.S: Add default sa_restorer
+	in asm.
+	* sysdeps/unix/sysv/linux/arc/sigaction.c: Delete "C" version of
+	restorer.
+	* sysdeps/unix/sysv/linux/arc/Makefile: Enable build.
+	* sysdeps/unix/sysv/linux/arc/Versions: expose default sa_restorer.
 
 2018-12-17  Vineet Gupta <vgupta at synopsys.com>
 
diff --git a/sysdeps/arc/dl-trampoline.S b/sysdeps/arc/dl-trampoline.S
index c704f0ff9a95..0fc9786ec1d3 100644
--- a/sysdeps/arc/dl-trampoline.S
+++ b/sysdeps/arc/dl-trampoline.S
@@ -37,11 +37,16 @@
 	st.a	r7, [sp, -4]
 	st.a	r8, [sp, -4]
 	st.a	r9, [sp, -4]
+	cfi_adjust_cfa_offset (40)
 	push_s	blink
+	cfi_adjust_cfa_offset (4)
+	cfi_rel_offset (blink, 0)
 .endm
 
 .macro RESTORE_CALLER_SAVED_BUT_R0
 	ld.ab	blink,[sp, 4]
+	cfi_adjust_cfa_offset (-4)
+	cfi_restore (blink)
 	ld.ab	r9, [sp, 4]
 	ld.ab	r8, [sp, 4]
 	ld.ab	r7, [sp, 4]
@@ -51,6 +56,7 @@
 	pop_s   r3
 	pop_s   r2
 	pop_s   r1
+	cfi_adjust_cfa_offset (-36)
 .endm
 
 ; Upon entry, PLTn, which led us here, sets up the following regs
@@ -69,4 +75,7 @@ ENTRY(_dl_runtime_resolve)
 	RESTORE_CALLER_SAVED_BUT_R0
 	j_s.d   [r0]    ; r0 has resolved function addr
 	pop_s   r0      ; restore first arg to resolved call
+	cfi_adjust_cfa_offset (-4)
+	cfi_restore (r0)
+
 END(_dl_runtime_resolve)
diff --git a/sysdeps/arc/sysdep.h b/sysdeps/arc/sysdep.h
index 5c6e063d03fe..920611277089 100644
--- a/sysdeps/arc/sysdep.h
+++ b/sysdeps/arc/sysdep.h
@@ -32,10 +32,12 @@
     .globl C_SYMBOL_NAME(name)			ASM_LINE_SEP	\
     .type C_SYMBOL_NAME(name),%function		ASM_LINE_SEP	\
   C_LABEL(name)					ASM_LINE_SEP	\
+    cfi_startproc				ASM_LINE_SEP	\
     CALL_MCOUNT
 
 #undef  END
 #define END(name)						\
+  cfi_endproc					ASM_LINE_SEP	\
   ASM_SIZE_DIRECTIVE(name)
 
 #ifdef SHARED
diff --git a/sysdeps/unix/sysv/linux/arc/Makefile b/sysdeps/unix/sysv/linux/arc/Makefile
index 76e5d24daea2..a6c6dfc6ec64 100644
--- a/sysdeps/unix/sysv/linux/arc/Makefile
+++ b/sysdeps/unix/sysv/linux/arc/Makefile
@@ -2,6 +2,10 @@ ifeq ($(subdir),stdlib)
 gen-as-const-headers += ucontext_i.sym
 endif
 
+ifeq ($(subdir),signal)
+sysdep_routines += sigrestorer
+endif
+
 ifeq ($(subdir),misc)
 # MIPS/Tile-style cacheflush routine
 sysdep_headers += sys/cachectl.h
diff --git a/sysdeps/unix/sysv/linux/arc/Versions b/sysdeps/unix/sysv/linux/arc/Versions
index ac3327426360..3d12161f7fe2 100644
--- a/sysdeps/unix/sysv/linux/arc/Versions
+++ b/sysdeps/unix/sysv/linux/arc/Versions
@@ -9,4 +9,8 @@ libc {
     _flush_cache;
     cacheflush;
   }
+  GLIBC_PRIVATE {
+    # A copy of sigaction lives in libpthread, and needs these.
+    __default_rt_sa_restorer;
+  }
 }
diff --git a/sysdeps/unix/sysv/linux/arc/sigaction.c b/sysdeps/unix/sysv/linux/arc/sigaction.c
index 0a58e78f8834..b437af677d58 100644
--- a/sysdeps/unix/sysv/linux/arc/sigaction.c
+++ b/sysdeps/unix/sysv/linux/arc/sigaction.c
@@ -22,13 +22,7 @@
 #include <string.h>
 #include <sys/syscall.h>
 
-/*
- * Default sigretrun stub if user doesn't specify SA_RESTORER
- */
-static void __default_rt_sa_restorer(void)
-{
-	INTERNAL_SYSCALL_NCS(__NR_rt_sigreturn, , 0);
-}
+extern void __default_rt_sa_restorer(void);
 
 #define SA_RESTORER	0x04000000
 
diff --git a/sysdeps/unix/sysv/linux/arc/sigrestorer.S b/sysdeps/unix/sysv/linux/arc/sigrestorer.S
new file mode 100644
index 000000000000..d74cf0ec00e3
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sigrestorer.S
@@ -0,0 +1,28 @@
+/* Default sigreturn stub for ARC Linux.
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
+
+	nop
+ENTRY(__default_rt_sa_restorer)
+	mov r8, __NR_rt_sigreturn
+	ARC_TRAP_INSN
+	j_s     [blink]
+PSEUDO_END_NOERRNO(__default_rt_sa_restorer)
-- 
2.7.4
