From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:31 -0800
Subject: [PATCH 09/21] ARC: Linux ABI
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-10-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                                     | 15 +++++
 sysdeps/arc/nptl/pthread-offsets.h            |  5 ++
 sysdeps/arc/nptl/pthreaddef.h                 | 32 +++++++++
 sysdeps/unix/sysv/linux/arc/bits/procfs-id.h  | 25 +++++++
 sysdeps/unix/sysv/linux/arc/bits/procfs.h     | 35 ++++++++++
 sysdeps/unix/sysv/linux/arc/bits/sigaction.h  | 85 ++++++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/getcontext.S      | 65 +++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/makecontext.c     | 74 +++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/setcontext.S      | 93 +++++++++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h  | 23 +++++++
 sysdeps/unix/sysv/linux/arc/swapcontext.S     | 92 ++++++++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/sys/cachectl.h    | 36 +++++++++++
 sysdeps/unix/sysv/linux/arc/sys/ucontext.h    | 71 ++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/sys/user.h        | 32 +++++++++
 sysdeps/unix/sysv/linux/arc/ucontext-macros.h | 29 +++++++++
 sysdeps/unix/sysv/linux/arc/ucontext_i.sym    | 20 ++++++
 16 files changed, 732 insertions(+)
 create mode 100644 sysdeps/arc/nptl/pthread-offsets.h
 create mode 100644 sysdeps/arc/nptl/pthreaddef.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/procfs-id.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/procfs.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/sigaction.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/getcontext.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/makecontext.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/setcontext.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/swapcontext.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/cachectl.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/ucontext.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/user.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext-macros.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext_i.sym

diff --git a/ChangeLog b/ChangeLog
index 08a3ac7e8064..ca010c356597 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -56,6 +56,21 @@
 	* sysdeps/unix/sysv/linux/arc/sysdep.c: New file.
 	* sysdeps/unix/sysv/linux/arc/sysdep.h: New file.
 	* sysdeps/unix/sysv/linux/arc/vfork.S: New file.
+	* sysdeps/arc/nptl/pthread-offsets.h: New file.
+	* sysdeps/arc/nptl/pthreaddef.h: New file.
+	* sysdeps/unix/sysv/linux/arc/bits/procfs-id.h: New file.
+	* sysdeps/unix/sysv/linux/arc/bits/procfs.h: New file.
+	* sysdeps/unix/sysv/linux/arc/bits/sigaction.h: New file.
+	* sysdeps/unix/sysv/linux/arc/getcontext.S: New file.
+	* sysdeps/unix/sysv/linux/arc/makecontext.c: New file.
+	* sysdeps/unix/sysv/linux/arc/setcontext.S: New file.
+	* sysdeps/unix/sysv/linux/arc/sigcontextinfo.h: New file.
+	* sysdeps/unix/sysv/linux/arc/swapcontext.S: New file.
+	* sysdeps/unix/sysv/linux/arc/sys/cachectl.h: New file.
+	* sysdeps/unix/sysv/linux/arc/sys/ucontext.h: New file.
+	* sysdeps/unix/sysv/linux/arc/sys/user.h: New file.
+	* sysdeps/unix/sysv/linux/arc/ucontext-macros.h: New file.
+	* sysdeps/unix/sysv/linux/arc/ucontext_i.sym: New file.
 
 2018-12-17  Joseph Myers  <joseph at codesourcery.com>
 
diff --git a/sysdeps/arc/nptl/pthread-offsets.h b/sysdeps/arc/nptl/pthread-offsets.h
new file mode 100644
index 000000000000..9617354dc7e3
--- /dev/null
+++ b/sysdeps/arc/nptl/pthread-offsets.h
@@ -0,0 +1,5 @@
+#define __PTHREAD_MUTEX_NUSERS_OFFSET   16
+#define __PTHREAD_MUTEX_KIND_OFFSET     12
+#define __PTHREAD_MUTEX_SPINS_OFFSET    20
+#define __PTHREAD_MUTEX_ELISION_OFFSET  22
+#define __PTHREAD_MUTEX_LIST_OFFSET     20
diff --git a/sysdeps/arc/nptl/pthreaddef.h b/sysdeps/arc/nptl/pthreaddef.h
new file mode 100644
index 000000000000..41e13c53038c
--- /dev/null
+++ b/sysdeps/arc/nptl/pthreaddef.h
@@ -0,0 +1,32 @@
+/* pthread machine parameter definitions, ARC version.
+   Copyright (C) 2002-2018 Free Software Foundation, Inc.
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
+/* Default stack size.  */
+#define ARCH_STACK_DEFAULT_SIZE	(2 * 1024 * 1024)
+
+/* Required stack pointer alignment at beginning.  */
+#define STACK_ALIGN		4
+
+/* Minimal stack size after allocating thread descriptor and guard size.  */
+#define MINIMAL_REST_STACK	2048
+
+/* Alignment requirement for TCB.  */
+#define TCB_ALIGNMENT		4
+
+/* Location of current stack frame.  */
+#define CURRENT_STACK_FRAME	__builtin_frame_address (0)
diff --git a/sysdeps/unix/sysv/linux/arc/bits/procfs-id.h b/sysdeps/unix/sysv/linux/arc/bits/procfs-id.h
new file mode 100644
index 000000000000..d0192fcbc36e
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/bits/procfs-id.h
@@ -0,0 +1,25 @@
+/* Types of pr_uid and pr_gid in struct elf_prpsinfo.  ARC version.
+   Copyright (C) 2018 Free Software Foundation, Inc.
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
+#ifndef _SYS_PROCFS_H
+# error "Never include <bits/procfs-id.h> directly; use <sys/procfs.h> instead."
+#endif
+
+typedef unsigned short int __pr_uid_t;
+typedef unsigned short int __pr_gid_t;
diff --git a/sysdeps/unix/sysv/linux/arc/bits/procfs.h b/sysdeps/unix/sysv/linux/arc/bits/procfs.h
new file mode 100644
index 000000000000..a3315beddb37
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/bits/procfs.h
@@ -0,0 +1,35 @@
+/* Types for registers for sys/procfs.h.  ARC version.
+   Copyright (C) 1996-2018 Free Software Foundation, Inc.
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
+#ifndef _SYS_PROCFS_H
+# error "Never include <bits/procfs.h> directly; use <sys/procfs.h> instead."
+#endif
+
+#include <sys/ucontext.h>
+
+/* And the whole bunch of them.  We could have used `struct
+   user_regs' directly in the typedef, but tradition says that
+   the register set is an array, which does have some peculiar
+   semantics, so leave it that way.  */
+#define ELF_NGREG (sizeof (struct user_regs_struct) / sizeof(elf_greg_t))
+
+typedef unsigned long int elf_greg_t;
+typedef unsigned long int elf_gregset_t[ELF_NGREG];
+
+/* There's no seperate floating point reg file in ARCv2  */
+typedef struct { } elf_fpregset_t;
diff --git a/sysdeps/unix/sysv/linux/arc/bits/sigaction.h b/sysdeps/unix/sysv/linux/arc/bits/sigaction.h
new file mode 100644
index 000000000000..47e86c06ce98
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/bits/sigaction.h
@@ -0,0 +1,85 @@
+/* The proper definitions for Linux's sigaction.
+   Copyright (C) 1993-2018 Free Software Foundation, Inc.
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
+#ifndef _BITS_SIGACTION_H
+#define _BITS_SIGACTION_H 1
+
+#ifndef _SIGNAL_H
+# error "Never include <bits/sigaction.h> directly; use <signal.h> instead."
+#endif
+
+/* Structure describing the action to be taken when a signal arrives.
+ * The generic struct is NOT ABI compatible with asm-generic Linux syscall variant*/
+
+struct sigaction
+  {
+    /* Signal handler.  */
+#if defined __USE_POSIX199309 || defined __USE_XOPEN_EXTENDED
+    union
+      {
+	/* Used if SA_SIGINFO is not set.  */
+	__sighandler_t sa_handler;
+	/* Used if SA_SIGINFO is set.  */
+	void (*sa_sigaction) (int, siginfo_t *, void *);
+      }
+    __sigaction_handler;
+# define sa_handler	__sigaction_handler.sa_handler
+# define sa_sigaction	__sigaction_handler.sa_sigaction
+#else
+    __sighandler_t sa_handler;
+#endif
+
+    /* Special flags.  */
+    int sa_flags;
+
+    /* Restore handler.  */
+    void (*sa_restorer) (void);
+
+    /* Additional set of signals to be blocked.  */
+    __sigset_t sa_mask;
+  };
+
+/* Bits in `sa_flags'.  */
+#define	SA_NOCLDSTOP  1		 /* Don't send SIGCHLD when children stop.  */
+#define SA_NOCLDWAIT  2		 /* Don't create zombie on child death.  */
+#define SA_SIGINFO    4		 /* Invoke signal-catching function with
+				    three arguments instead of one.  */
+#if defined __USE_XOPEN_EXTENDED || defined __USE_MISC
+# define SA_ONSTACK   0x08000000 /* Use signal stack by using `sa_restorer'. */
+#endif
+#if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8
+# define SA_RESTART   0x10000000 /* Restart syscall on signal return.  */
+# define SA_NODEFER   0x40000000 /* Don't automatically block the signal when
+				    its handler is being executed.  */
+# define SA_RESETHAND 0x80000000 /* Reset to SIG_DFL on entry to handler.  */
+#endif
+#ifdef __USE_MISC
+# define SA_INTERRUPT 0x20000000 /* Historical no-op.  */
+
+/* Some aliases for the SA_ constants.  */
+# define SA_NOMASK    SA_NODEFER
+# define SA_ONESHOT   SA_RESETHAND
+# define SA_STACK     SA_ONSTACK
+#endif
+
+/* Values for the HOW argument to `sigprocmask'.  */
+#define	SIG_BLOCK     0		 /* Block signals.  */
+#define	SIG_UNBLOCK   1		 /* Unblock signals.  */
+#define	SIG_SETMASK   2		 /* Set the set of blocked signals.  */
+
+#endif
\ No newline at end of file
diff --git a/sysdeps/unix/sysv/linux/arc/getcontext.S b/sysdeps/unix/sysv/linux/arc/getcontext.S
new file mode 100644
index 000000000000..af31f581e846
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/getcontext.S
@@ -0,0 +1,65 @@
+/* Save current context for ARC
+   Copyright (C) 2009-2018 Free Software Foundation, Inc.
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
+#include "ucontext-macros.h"
+
+/* int getcontext (ucontext_t *ucp)
+
+  Save machine context in @ucp and return 0 on success, -1 on error
+    - saves callee saved registers only
+    - layout mandated by uncontext_t:m_context (hence different from setjmp)
+*/
+
+ENTRY(__getcontext)
+
+	/* callee saved registers */
+	SAVE_REG(r13,   r0, 37)
+	SAVE_REG(r14,   r0, 36)
+	SAVE_REG(r15,   r0, 35)
+	SAVE_REG(r16,   r0, 34)
+	SAVE_REG(r17,   r0, 33)
+	SAVE_REG(r18,   r0, 32)
+	SAVE_REG(r19,   r0, 31)
+	SAVE_REG(r20,   r0, 30)
+	SAVE_REG(r21,   r0, 29)
+	SAVE_REG(r22,   r0, 28)
+	SAVE_REG(r23,   r0, 27)
+	SAVE_REG(r24,   r0, 26)
+	SAVE_REG(r25,   r0, 25)
+
+	SAVE_REG(blink, r0,  7)
+	SAVE_REG(fp,    r0,  8)
+	SAVE_REG(sp,    r0, 23)
+
+	/* save 0 in r0 placeholder to return 0 when this @ucp activated */
+	mov r9, 0
+	SAVE_REG(r9,    r0, 22)
+
+	/* rt_sigprocmask (SIG_BLOCK, NULL, &ucp->uc_sigmask, _NSIG8) */
+	mov r3, _NSIG8
+	add r2, r0, UCONTEXT_SIGMASK
+	mov r1, 0
+	mov r0, SIG_BLOCK
+	mov r8, __NR_rt_sigprocmask
+	ARC_TRAP_INSN
+	brhi    r0, -1024, .Lcall_syscall_err
+	j.d	[blink]
+	mov r0, 0	; success ; error case handled in .Lcall_syscall_err
+
+PSEUDO_END(__getcontext)
+weak_alias(__getcontext, getcontext)
diff --git a/sysdeps/unix/sysv/linux/arc/makecontext.c b/sysdeps/unix/sysv/linux/arc/makecontext.c
new file mode 100644
index 000000000000..7018bed9d64a
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/makecontext.c
@@ -0,0 +1,74 @@
+/* Create new context for ARC
+   Copyright (C) 2015-2018 Free Software Foundation, Inc.
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
+#include <stdarg.h>
+#include <stdint.h>
+#include <sys/ucontext.h>
+
+void
+__makecontext (ucontext_t *ucp, void (*func) (void), int argc, ...)
+{
+  extern void __startcontext (void) attribute_hidden;
+  unsigned long sp, *r;
+  va_list vl;
+  int i, reg_args, stack_args;
+
+  sp = ((unsigned long) ucp->uc_stack.ss_sp + ucp->uc_stack.ss_size) & ~7;
+
+  ucp->uc_mcontext.scratch.sp = sp;
+  ucp->uc_mcontext.scratch.fp = 0;
+
+  /* __startcontext is sort of trampoline to invoke @func
+   *  From setcontext() pov, the resume address is __startcontext,
+   *  set it up in BLINK place holder*/
+  ucp->uc_mcontext.scratch.blink = (unsigned long) &__startcontext;
+
+  /* __startcontext passed 2 types of args
+   *    - args to @func setup in canonical r0-r7
+   *    - @func itself in r9, and next function in r10
+   */
+  ucp->uc_mcontext.callee.r13 = (unsigned long) func;
+  ucp->uc_mcontext.callee.r14 = (unsigned long) ucp->uc_link;
+
+  r = &ucp->uc_mcontext.scratch.r0;
+
+  va_start (vl, argc);
+
+  reg_args = argc > 8 ? 8 : argc;
+  for (i = 0; i < reg_args; i++) {
+      *r-- = va_arg(vl, unsigned long);
+  }
+
+  stack_args = argc - reg_args;
+
+  if (__glibc_unlikely(stack_args > 0)) {
+
+    sp -=  stack_args * sizeof (unsigned long);
+    ucp->uc_mcontext.scratch.sp = sp;
+    r = (unsigned long *)sp;
+
+    for (i = 0; i < stack_args; i++) {
+        *r++ = va_arg(vl, unsigned long);
+    }
+  }
+
+  va_end (vl);
+}
+
+weak_alias (__makecontext, makecontext)
diff --git a/sysdeps/unix/sysv/linux/arc/setcontext.S b/sysdeps/unix/sysv/linux/arc/setcontext.S
new file mode 100644
index 000000000000..3f503c661d95
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/setcontext.S
@@ -0,0 +1,93 @@
+/* Set current context for ARC
+   Copyright (C) 2009-2018 Free Software Foundation, Inc.
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
+#include "ucontext-macros.h"
+
+/*
+   int setcontext (const ucontext_t *ucp)
+     - Restores the machine context in @ucp and resumes execution
+       (doesn't return to caller)
+*/
+
+ENTRY(__setcontext)
+
+	mov  r9, r0	/* stash @ucp across syscall */
+
+	/* rt_sigprocmask (SIG_SETMASK, &ucp->uc_sigmask, NULL, _NSIG8) */
+	mov  r3, _NSIG8
+	mov  r2, 0
+	add  r1, r0, UCONTEXT_SIGMASK
+	mov  r0, SIG_SETMASK
+	mov  r8, __NR_rt_sigprocmask
+	ARC_TRAP_INSN
+	brhi r0, -1024, .Lcall_syscall_err
+
+	/* restore scratch/arg regs for makecontext() case */
+	LOAD_REG(r0,    r9, 22)
+	LOAD_REG(r1,    r9, 21)
+	LOAD_REG(r2,    r9, 20)
+	LOAD_REG(r3,    r9, 19)
+	LOAD_REG(r4,    r9, 18)
+	LOAD_REG(r5,    r9, 17)
+	LOAD_REG(r6,    r9, 16)
+	LOAD_REG(r7,    r9, 15)
+
+	/* restore callee saved registers */
+	LOAD_REG(r13,   r9, 37)
+	LOAD_REG(r14,   r9, 36)
+	LOAD_REG(r15,   r9, 35)
+	LOAD_REG(r16,   r9, 34)
+	LOAD_REG(r17,   r9, 33)
+	LOAD_REG(r18,   r9, 32)
+	LOAD_REG(r19,   r9, 31)
+	LOAD_REG(r20,   r9, 30)
+	LOAD_REG(r21,   r9, 29)
+	LOAD_REG(r22,   r9, 28)
+	LOAD_REG(r23,   r9, 27)
+	LOAD_REG(r24,   r9, 26)
+	LOAD_REG(r25,   r9, 25)
+
+	LOAD_REG(blink, r9,  7)
+	LOAD_REG(fp,    r9,  8)
+	LOAD_REG(sp,    r9, 23)
+
+	j    [blink]
+
+PSEUDO_END(__setcontext)
+weak_alias(__setcontext, setcontext)
+
+
+/*
+   Helper for activating makecontext() created context
+     - r13 has @func, r14 has uc_link
+*/
+
+ENTRY(__startcontext)
+
+        /* call user @func, loaded in r13 by setcontext() */
+        jl   [r13]
+
+        /* if uc_link (r14) call setcontext with that */
+        mov  r0, r14
+        breq r0, 0, 1f
+
+        bl   __setcontext
+1:
+        /* exit with status 0 */
+        b    HIDDEN_JUMPTARGET(exit)
+END(__startcontext)
diff --git a/sysdeps/unix/sysv/linux/arc/sigcontextinfo.h b/sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
new file mode 100644
index 000000000000..852bbd96d47f
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
@@ -0,0 +1,23 @@
+/* ARC definitions for signal handling calling conventions.
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
+#include <sys/ucontext.h>
+#include "kernel-features.h"
+
+#define SIGCONTEXT int _code, struct ucontext_t *
+#define GET_PC(ctx)    ((void *) (ctx)->uc_mcontext.scratch.ret)
diff --git a/sysdeps/unix/sysv/linux/arc/swapcontext.S b/sysdeps/unix/sysv/linux/arc/swapcontext.S
new file mode 100644
index 000000000000..ad6bf70ab5e2
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/swapcontext.S
@@ -0,0 +1,92 @@
+/* Save and set current context for ARC
+   Copyright (C) 2009-2018 Free Software Foundation, Inc.
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
+#include "ucontext-macros.h"
+
+/* int swapcontext (ucontext_t *oucp, const ucontext_t *ucp) */
+
+ENTRY(__swapcontext)
+
+	/* save context into @oucp pointed to by r0 */
+
+	SAVE_REG(r13,   r0, 37)
+	SAVE_REG(r14,   r0, 36)
+	SAVE_REG(r15,   r0, 35)
+	SAVE_REG(r16,   r0, 34)
+	SAVE_REG(r17,   r0, 33)
+	SAVE_REG(r18,   r0, 32)
+	SAVE_REG(r19,   r0, 31)
+	SAVE_REG(r20,   r0, 30)
+	SAVE_REG(r21,   r0, 29)
+	SAVE_REG(r22,   r0, 28)
+	SAVE_REG(r23,   r0, 27)
+	SAVE_REG(r24,   r0, 26)
+	SAVE_REG(r25,   r0, 25)
+
+	SAVE_REG(blink, r0,  7)
+	SAVE_REG(fp,    r0,  8)
+	SAVE_REG(sp,    r0, 23)
+
+	/* save 0 in r0 placeholder to return 0 when @oucp activated */
+	mov r9, 0
+	SAVE_REG(r9,    r0, 22)
+
+	/* load context from @ucp */
+
+	mov r9, r1	; safekeep @ucp across syscall
+
+	/* rt_sigprocmask (SIG_SETMASK, &ucp->uc_sigmask, &oucp->uc_sigmask, _NSIG8) */
+	mov r3, _NSIG8
+	add r2, r0, UCONTEXT_SIGMASK
+	add r1, r1, UCONTEXT_SIGMASK
+	mov r0, SIG_SETMASK
+	mov r8, __NR_rt_sigprocmask
+	ARC_TRAP_INSN
+	brhi r0, -1024, .Lcall_syscall_err
+
+	LOAD_REG(r0,    r9, 22)
+	LOAD_REG(r1,    r9, 21)
+	LOAD_REG(r2,    r9, 20)
+	LOAD_REG(r3,    r9, 19)
+	LOAD_REG(r4,    r9, 18)
+	LOAD_REG(r5,    r9, 17)
+	LOAD_REG(r6,    r9, 16)
+	LOAD_REG(r7,    r9, 15)
+
+	LOAD_REG(r13,   r9, 37)
+	LOAD_REG(r14,   r9, 36)
+	LOAD_REG(r15,   r9, 35)
+	LOAD_REG(r16,   r9, 34)
+	LOAD_REG(r17,   r9, 33)
+	LOAD_REG(r18,   r9, 32)
+	LOAD_REG(r19,   r9, 31)
+	LOAD_REG(r20,   r9, 30)
+	LOAD_REG(r21,   r9, 29)
+	LOAD_REG(r22,   r9, 28)
+	LOAD_REG(r23,   r9, 27)
+	LOAD_REG(r24,   r9, 26)
+	LOAD_REG(r25,   r9, 25)
+
+	LOAD_REG(blink, r9,  7)
+	LOAD_REG(fp,    r9,  8)
+	LOAD_REG(sp,    r9, 23)
+
+	j    [blink]
+
+PSEUDO_END(__swapcontext)
+weak_alias(__swapcontext, swapcontext)
diff --git a/sysdeps/unix/sysv/linux/arc/sys/cachectl.h b/sysdeps/unix/sysv/linux/arc/sys/cachectl.h
new file mode 100644
index 000000000000..c2ba820e50b7
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sys/cachectl.h
@@ -0,0 +1,36 @@
+/* cacheflush - flush contents of instruction and/or data cache.
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
+#ifndef _SYS_CACHECTL_H
+#define _SYS_CACHECTL_H 1
+
+#include <features.h>
+
+/* Get the kernel definition for the op bits.  */
+#include <asm/cachectl.h>
+
+__BEGIN_DECLS
+
+#ifdef __USE_MISC
+extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
+#endif
+extern int _flush_cache (char *__addr, const int __nbytes, const int __op) __THROW;
+
+__END_DECLS
+
+#endif /* sys/cachectl.h */
diff --git a/sysdeps/unix/sysv/linux/arc/sys/ucontext.h b/sysdeps/unix/sysv/linux/arc/sys/ucontext.h
new file mode 100644
index 000000000000..e91abc3d9fba
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sys/ucontext.h
@@ -0,0 +1,71 @@
+/* struct ucontext definition, ARC version.
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
+/* System V/ARC ABI compliant context switching support.  */
+
+#ifndef _SYS_UCONTEXT_H
+#define _SYS_UCONTEXT_H	1
+
+#include <features.h>
+
+#include <bits/types/sigset_t.h>
+#include <bits/types/stack_t.h>
+
+#ifdef __USE_MISC
+# define __ctx(fld) fld
+#else
+# define __ctx(fld) __ ## fld
+#endif
+
+typedef struct
+  {
+    unsigned long __ctx(pad);
+    struct {
+      unsigned long __ctx(bta);
+      unsigned long __ctx(lp_start), __ctx(lp_end), __ctx(lp_count);
+      unsigned long __ctx(status32), __ctx(ret), __ctx(blink);
+      unsigned long __ctx(fp), __ctx(gp);
+      unsigned long __ctx(r12), __ctx(r11), __ctx(r10), __ctx(r9), __ctx(r8);
+      unsigned long __ctx(r7), __ctx(r6), __ctx(r5), __ctx(r4), __ctx(r3);
+      unsigned long __ctx(r2), __ctx(r1), __ctx(r0);
+      unsigned long __ctx(sp);
+    } __ctx(scratch);
+    unsigned long __ctx(pad2);
+    struct {
+      unsigned long __ctx(r25), __ctx(r24), __ctx(r23), __ctx(r22), __ctx(r21);
+      unsigned long __ctx(r20), __ctx(r19), __ctx(r18), __ctx(r17), __ctx(r16);
+      unsigned long __ctx(r15), __ctx(r14), __ctx(r13);
+    } __ctx(callee);
+    unsigned long __ctx(efa);
+    unsigned long __ctx(stop_pc);
+    unsigned long __ctx(r30), __ctx(r58), __ctx(r59);
+  } mcontext_t;
+
+/* Userlevel context.  */
+typedef struct ucontext_t
+  {
+    unsigned long __ctx(uc_flags);
+    struct ucontext_t *uc_link;
+    stack_t uc_stack;
+    mcontext_t uc_mcontext;
+    sigset_t uc_sigmask;
+  } ucontext_t;
+
+#undef __ctx
+
+#endif /* sys/ucontext.h */
diff --git a/sysdeps/unix/sysv/linux/arc/sys/user.h b/sysdeps/unix/sysv/linux/arc/sys/user.h
new file mode 100644
index 000000000000..1f7129799bf6
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sys/user.h
@@ -0,0 +1,32 @@
+/* ptrace register data format definitions.
+   Copyright (C) 1998-2018 Free Software Foundation, Inc.
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
+#ifndef _SYS_USER_H
+#define _SYS_USER_H	1
+
+/* struct user_regs_struct is exported by kernel header
+ * However apps like strace also expect a struct user, so it's better to
+ * have a dummy implementation
+ */
+#include <asm/ptrace.h>
+
+struct user {
+	int dummy;
+};
+
+#endif  /* sys/user.h */
diff --git a/sysdeps/unix/sysv/linux/arc/ucontext-macros.h b/sysdeps/unix/sysv/linux/arc/ucontext-macros.h
new file mode 100644
index 000000000000..a5d861476f3c
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/ucontext-macros.h
@@ -0,0 +1,29 @@
+/* Macros for ucontext routines - ARC
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
+#ifndef _LINUX_ARC_UCONTEXT_MACROS_H
+#define _LINUX_ARC_UCONTEXT_MACROS_H
+
+#include <sysdep.h>
+
+#include "ucontext_i.h"
+
+#define SAVE_REG(reg, rbase, off)	st  reg, [rbase, UCONTEXT_MCONTEXT + off * 4]
+#define LOAD_REG(reg, rbase, off)	ld  reg, [rbase, UCONTEXT_MCONTEXT + off * 4]
+
+#endif
diff --git a/sysdeps/unix/sysv/linux/arc/ucontext_i.sym b/sysdeps/unix/sysv/linux/arc/ucontext_i.sym
new file mode 100644
index 000000000000..f0a209e581ab
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/ucontext_i.sym
@@ -0,0 +1,20 @@
+#include <inttypes.h>
+#include <signal.h>
+#include <stddef.h>
+#include <sys/ucontext.h>
+
+SIG_BLOCK
+SIG_SETMASK
+
+-- sizeof(sigset_t) expected by kernel: see comment in ARC sigaction.c for details
+_NSIG8				(_NSIG / 8)
+
+-- Offsets of the fields in the ucontext_t structure.
+#define ucontext(member)	offsetof (ucontext_t, member)
+
+UCONTEXT_FLAGS			ucontext (uc_flags)
+UCONTEXT_LINK			ucontext (uc_link)
+UCONTEXT_STACK			ucontext (uc_stack)
+UCONTEXT_MCONTEXT		ucontext (uc_mcontext)
+UCONTEXT_SIGMASK		ucontext (uc_sigmask)
+UCONTEXT_SIZE			sizeof (ucontext_t)
-- 
2.7.4
