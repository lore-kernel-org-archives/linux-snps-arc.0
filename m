From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Jun 2017 11:00:52 +0300
Subject: [RFC 4/6] ARC: Initial port to glibc
In-Reply-To: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The starting point for the code was Nios2 port, thanks to them.

Big shout out to Cupertino who spent many weeks / nights debugging
the initial bringup of init, sh, running into pesky issues in ARC port
of dynamic loader, syscall wrappers, binutils, gcc...

Signed-off-by: Cupertino Miranda <cmiranda at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 .gitignore                                         |    1 +
 elf/elf.h                                          |    1 +
 sysdeps/arc/Implies                                |    3 +
 sysdeps/arc/Makefile                               |   26 +
 sysdeps/arc/Subdirs                                |    1 +
 sysdeps/arc/Versions                               |   13 +
 sysdeps/arc/__longjmp.S                            |   50 +
 sysdeps/arc/abort-instr.h                          |    2 +
 sysdeps/arc/atomic-machine.h                       |   85 +
 sysdeps/arc/backtrace.c                            |    1 +
 sysdeps/arc/bits/endian.h                          |   12 +
 sysdeps/arc/bits/fenv.h                            |   52 +
 sysdeps/arc/bits/link.h                            |   52 +
 sysdeps/arc/bits/setjmp.h                          |   33 +
 sysdeps/arc/bsd-_setjmp.S                          |    1 +
 sysdeps/arc/bsd-setjmp.S                           |    1 +
 sysdeps/arc/configure                              |   17 +
 sysdeps/arc/configure.ac                           |   13 +
 sysdeps/arc/crti.S                                 |   77 +
 sysdeps/arc/crtn.S                                 |   56 +
 sysdeps/arc/dl-machine.h                           |  332 +++
 sysdeps/arc/dl-runtime.c                           |   21 +
 sysdeps/arc/dl-sysdep.h                            |   25 +
 sysdeps/arc/dl-tls.h                               |   30 +
 sysdeps/arc/dl-trampoline.S                        |   72 +
 sysdeps/arc/gccframe.h                             |   21 +
 sysdeps/arc/gmp-mparam.h                           |   23 +
 sysdeps/arc/jmpbuf-offsets.h                       |   46 +
 sysdeps/arc/jmpbuf-unwind.h                        |   47 +
 sysdeps/arc/ldsodefs.h                             |   43 +
 sysdeps/arc/libc-tls.c                             |   27 +
 sysdeps/arc/libm-test-ulps                         |  394 ++++
 sysdeps/arc/libm-test-ulps-name                    |    1 +
 sysdeps/arc/machine-gmon.h                         |   30 +
 sysdeps/arc/math-tests.h                           |   28 +
 sysdeps/arc/math_private.h                         |   33 +
 sysdeps/arc/memusage.h                             |   23 +
 sysdeps/arc/nptl/Makefile                          |   22 +
 sysdeps/arc/nptl/bits/pthreadtypes-arch.h          |   70 +
 sysdeps/arc/nptl/bits/semaphore.h                  |   32 +
 sysdeps/arc/nptl/pthread_spin_lock.c               |   24 +
 sysdeps/arc/nptl/pthreaddef.h                      |   32 +
 sysdeps/arc/nptl/tcb-offsets.sym                   |   11 +
 sysdeps/arc/nptl/tls.h                             |  151 ++
 sysdeps/arc/preconfigure                           |    6 +
 sysdeps/arc/s_fma.c                                |    1 +
 sysdeps/arc/s_fmaf.c                               |    1 +
 sysdeps/arc/setjmp.S                               |   64 +
 sysdeps/arc/sfp-machine.h                          |   51 +
 sysdeps/arc/sotruss-lib.c                          |   51 +
 sysdeps/arc/stackinfo.h                            |   33 +
 sysdeps/arc/start.S                                |   81 +
 sysdeps/arc/sysdep.h                               |   49 +
 sysdeps/arc/tls-macros.h                           |   29 +
 sysdeps/arc/tst-audit.h                            |   23 +
 sysdeps/unix/sysv/linux/arc/Implies                |    3 +
 sysdeps/unix/sysv/linux/arc/Makefile               |    9 +
 sysdeps/unix/sysv/linux/arc/Versions               |    6 +
 sysdeps/unix/sysv/linux/arc/arch-fork.h            |   35 +
 sysdeps/unix/sysv/linux/arc/bits/mman.h            |   42 +
 sysdeps/unix/sysv/linux/arc/bits/sigaction.h       |   78 +
 sysdeps/unix/sysv/linux/arc/c++-types.data         |   67 +
 sysdeps/unix/sysv/linux/arc/cacheflush.c           |   29 +
 sysdeps/unix/sysv/linux/arc/clone.S                |   97 +
 sysdeps/unix/sysv/linux/arc/configure              |    4 +
 sysdeps/unix/sysv/linux/arc/configure.ac           |    4 +
 sysdeps/unix/sysv/linux/arc/kernel-features.h      |   31 +
 sysdeps/unix/sysv/linux/arc/ld.abilist             |   12 +
 sysdeps/unix/sysv/linux/arc/ldconfig.h             |   24 +
 .../unix/sysv/linux/arc/libBrokenLocale.abilist    |    3 +
 sysdeps/unix/sysv/linux/arc/libanl.abilist         |    6 +
 sysdeps/unix/sysv/linux/arc/libc.abilist           | 2123 ++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/libcrypt.abilist       |    9 +
 sysdeps/unix/sysv/linux/arc/libdl.abilist          |   11 +
 sysdeps/unix/sysv/linux/arc/libm.abilist           |  370 ++++
 sysdeps/unix/sysv/linux/arc/libnsl.abilist         |  123 ++
 sysdeps/unix/sysv/linux/arc/libpthread.abilist     |  224 +++
 sysdeps/unix/sysv/linux/arc/libresolv.abilist      |   93 +
 sysdeps/unix/sysv/linux/arc/librt.abilist          |   37 +
 sysdeps/unix/sysv/linux/arc/libthread_db.abilist   |   42 +
 sysdeps/unix/sysv/linux/arc/libutil.abilist        |    8 +
 sysdeps/unix/sysv/linux/arc/localplt.data          |   35 +
 sysdeps/unix/sysv/linux/arc/mmap_internal.h        |   26 +
 sysdeps/unix/sysv/linux/arc/profil-counter.h       |    2 +
 sysdeps/unix/sysv/linux/arc/pt-vfork.S             |    1 +
 sysdeps/unix/sysv/linux/arc/shlib-versions         |    2 +
 sysdeps/unix/sysv/linux/arc/sigaction.c            |   64 +
 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h       |   28 +
 sysdeps/unix/sysv/linux/arc/sys/cachectl.h         |   36 +
 sysdeps/unix/sysv/linux/arc/sys/procfs.h           |  123 ++
 sysdeps/unix/sysv/linux/arc/sys/ucontext.h         |   40 +
 sysdeps/unix/sysv/linux/arc/sys/user.h             |   32 +
 sysdeps/unix/sysv/linux/arc/syscall.S              |   33 +
 sysdeps/unix/sysv/linux/arc/sysdep-cancel.h        |  140 ++
 sysdeps/unix/sysv/linux/arc/sysdep.c               |   22 +
 sysdeps/unix/sysv/linux/arc/sysdep.h               |  253 +++
 sysdeps/unix/sysv/linux/arc/ucontext_i.sym         |   17 +
 sysdeps/unix/sysv/linux/arc/vfork.S                |   42 +
 98 files changed, 6810 insertions(+)
 create mode 100644 sysdeps/arc/Implies
 create mode 100644 sysdeps/arc/Makefile
 create mode 100644 sysdeps/arc/Subdirs
 create mode 100644 sysdeps/arc/Versions
 create mode 100644 sysdeps/arc/__longjmp.S
 create mode 100644 sysdeps/arc/abort-instr.h
 create mode 100644 sysdeps/arc/atomic-machine.h
 create mode 100644 sysdeps/arc/backtrace.c
 create mode 100644 sysdeps/arc/bits/endian.h
 create mode 100644 sysdeps/arc/bits/fenv.h
 create mode 100644 sysdeps/arc/bits/link.h
 create mode 100644 sysdeps/arc/bits/setjmp.h
 create mode 100644 sysdeps/arc/bsd-_setjmp.S
 create mode 100644 sysdeps/arc/bsd-setjmp.S
 create mode 100644 sysdeps/arc/configure
 create mode 100644 sysdeps/arc/configure.ac
 create mode 100644 sysdeps/arc/crti.S
 create mode 100644 sysdeps/arc/crtn.S
 create mode 100644 sysdeps/arc/dl-machine.h
 create mode 100644 sysdeps/arc/dl-runtime.c
 create mode 100644 sysdeps/arc/dl-sysdep.h
 create mode 100644 sysdeps/arc/dl-tls.h
 create mode 100644 sysdeps/arc/dl-trampoline.S
 create mode 100644 sysdeps/arc/gccframe.h
 create mode 100644 sysdeps/arc/gmp-mparam.h
 create mode 100644 sysdeps/arc/jmpbuf-offsets.h
 create mode 100644 sysdeps/arc/jmpbuf-unwind.h
 create mode 100644 sysdeps/arc/ldsodefs.h
 create mode 100644 sysdeps/arc/libc-tls.c
 create mode 100644 sysdeps/arc/libm-test-ulps
 create mode 100644 sysdeps/arc/libm-test-ulps-name
 create mode 100644 sysdeps/arc/machine-gmon.h
 create mode 100644 sysdeps/arc/math-tests.h
 create mode 100644 sysdeps/arc/math_private.h
 create mode 100644 sysdeps/arc/memusage.h
 create mode 100644 sysdeps/arc/nptl/Makefile
 create mode 100644 sysdeps/arc/nptl/bits/pthreadtypes-arch.h
 create mode 100644 sysdeps/arc/nptl/bits/semaphore.h
 create mode 100644 sysdeps/arc/nptl/pthread_spin_lock.c
 create mode 100644 sysdeps/arc/nptl/pthreaddef.h
 create mode 100644 sysdeps/arc/nptl/tcb-offsets.sym
 create mode 100644 sysdeps/arc/nptl/tls.h
 create mode 100644 sysdeps/arc/preconfigure
 create mode 100644 sysdeps/arc/s_fma.c
 create mode 100644 sysdeps/arc/s_fmaf.c
 create mode 100644 sysdeps/arc/setjmp.S
 create mode 100644 sysdeps/arc/sfp-machine.h
 create mode 100644 sysdeps/arc/sotruss-lib.c
 create mode 100644 sysdeps/arc/stackinfo.h
 create mode 100644 sysdeps/arc/start.S
 create mode 100644 sysdeps/arc/sysdep.h
 create mode 100644 sysdeps/arc/tls-macros.h
 create mode 100644 sysdeps/arc/tst-audit.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/Implies
 create mode 100644 sysdeps/unix/sysv/linux/arc/Makefile
 create mode 100644 sysdeps/unix/sysv/linux/arc/Versions
 create mode 100644 sysdeps/unix/sysv/linux/arc/arch-fork.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/mman.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/sigaction.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/c++-types.data
 create mode 100644 sysdeps/unix/sysv/linux/arc/cacheflush.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/clone.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure.ac
 create mode 100644 sysdeps/unix/sysv/linux/arc/kernel-features.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ld.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/ldconfig.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libanl.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libc.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libcrypt.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libdl.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libm.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libnsl.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libpthread.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libresolv.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/librt.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libthread_db.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libutil.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/localplt.data
 create mode 100644 sysdeps/unix/sysv/linux/arc/mmap_internal.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/profil-counter.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/pt-vfork.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/shlib-versions
 create mode 100644 sysdeps/unix/sysv/linux/arc/sigaction.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/cachectl.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/procfs.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/ucontext.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/user.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/syscall.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext_i.sym
 create mode 100644 sysdeps/unix/sysv/linux/arc/vfork.S

diff --git a/.gitignore b/.gitignore
index 07d4a129e5dc..969dabc873d6 100644
--- a/.gitignore
+++ b/.gitignore
@@ -6,6 +6,7 @@
 *.bz2
 *.rej
 *.orig
+*.sw*
 =*
 TAGS
 TODO
diff --git a/elf/elf.h b/elf/elf.h
index 8b58818228ba..dff23c2d2a19 100644
--- a/elf/elf.h
+++ b/elf/elf.h
@@ -366,6 +366,7 @@ typedef struct
 /* Old spellings/synonyms.  */
 
 #define EM_ARC_A5	EM_ARC_COMPACT
+#define EM_ARCV2	EM_ARC_COMPACT2
 
 /* If it is necessary to assign new unofficial EM_* values, please
    pick large random numbers (0x8523, 0xa7f2, etc.) to minimize the
diff --git a/sysdeps/arc/Implies b/sysdeps/arc/Implies
new file mode 100644
index 000000000000..387a0ca05204
--- /dev/null
+++ b/sysdeps/arc/Implies
@@ -0,0 +1,3 @@
+wordsize-32
+ieee754/dbl-64
+ieee754/flt-32
diff --git a/sysdeps/arc/Makefile b/sysdeps/arc/Makefile
new file mode 100644
index 000000000000..b43ae0d0dedf
--- /dev/null
+++ b/sysdeps/arc/Makefile
@@ -0,0 +1,26 @@
+# Copyright (C) 1993-2015 Free Software Foundation, Inc.
+# This file is part of the GNU C Library.
+
+# The GNU C Library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+
+# The GNU C Library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+
+# You should have received a copy of the GNU Lesser General Public
+# License along with the GNU C Library.  If not, see
+# <http://www.gnu.org/licenses/>.
+
+pic-ccflag = -fpic
+
+# We don't support long doubles as a distinct type.  We don't need to set
+# this variable; it's here mostly for documentational purposes.
+long-double-fcts = no
+
+ifeq ($(subdir),debug)
+CFLAGS-backtrace.c += -funwind-tables
+endif
diff --git a/sysdeps/arc/Subdirs b/sysdeps/arc/Subdirs
new file mode 100644
index 000000000000..87eadf302430
--- /dev/null
+++ b/sysdeps/arc/Subdirs
@@ -0,0 +1 @@
+soft-fp
diff --git a/sysdeps/arc/Versions b/sysdeps/arc/Versions
new file mode 100644
index 000000000000..54ac5e7d1b5f
--- /dev/null
+++ b/sysdeps/arc/Versions
@@ -0,0 +1,13 @@
+libc {
+  GLIBC_2.24 {
+    __adddf3; __addsf3; __divdf3; __divsf3; __eqdf2; __eqsf2; __extendsfdf2;
+    __fixdfdi; __fixdfsi; __fixsfdi; __fixsfsi;
+    __fixunsdfdi; __fixunsdfsi; __fixunssfdi; __fixunssfsi;
+    __floatdidf; __floatdisf; __floatsidf; __floatsisf;
+    __floatundidf; __floatundisf; __floatunsidf; __floatunsisf;
+    __gedf2; __gesf2; __gtdf2; __gtsf2; __ledf2; __lesf2; __ltdf2; __ltsf2;
+    __muldf3; __mulsf3; __nedf2; __nesf2; __negdf2; __negsf2;
+    __subdf3; __subsf3; __truncdfsf2; __unorddf2; __unordsf2;
+    __syscall_error;
+  }
+}
diff --git a/sysdeps/arc/__longjmp.S b/sysdeps/arc/__longjmp.S
new file mode 100644
index 000000000000..6abb4412f104
--- /dev/null
+++ b/sysdeps/arc/__longjmp.S
@@ -0,0 +1,50 @@
+/* longjmp for ARC.
+   Copyright (C) 2015 Free Software Foundation, Inc.
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
+ENTRY(__longjmp)
+
+	ld_s r13, [r0]
+	ld_s r14, [r0,4]
+	ld   r15, [r0,8]
+	ld   r16, [r0,12]
+	ld   r17, [r0,16]
+	ld   r18, [r0,20]
+	ld   r19, [r0,24]
+	ld   r20, [r0,28]
+	ld   r21, [r0,32]
+	ld   r22, [r0,36]
+	ld   r23, [r0,40]
+	ld   r24, [r0,44]
+	ld   r25, [r0,48]
+
+	ld   blink, [r0,60]	; load it early enough to not stall the pipeline
+	ld   fp,    [r0,52]
+	ld   sp,    [r0,56]
+
+	mov.f  r0, r1	; get the setjmp return value(due to longjmp) in place
+
+	j.d    [blink]	; to caller of setjmp location, right after the call
+	mov.z  r0, 1	; can't let setjmp return 0 when it is due to longjmp
+
+END(__longjmp)
diff --git a/sysdeps/arc/abort-instr.h b/sysdeps/arc/abort-instr.h
new file mode 100644
index 000000000000..474098e9a819
--- /dev/null
+++ b/sysdeps/arc/abort-instr.h
@@ -0,0 +1,2 @@
+/* FLAG 1 is privilege mode only instruction, hence will crash any program */
+#define ABORT_INSTRUCTION asm ("flag 1")
diff --git a/sysdeps/arc/atomic-machine.h b/sysdeps/arc/atomic-machine.h
new file mode 100644
index 000000000000..330ff2524f92
--- /dev/null
+++ b/sysdeps/arc/atomic-machine.h
@@ -0,0 +1,85 @@
+/* Low-level functions for atomic operations. ARC version.
+   Copyright (C) 2012-2015 Free Software Foundation, Inc.
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
+#ifndef _ARC_BITS_ATOMIC_H
+#define _ARC_BITS_ATOMIC_H 1
+
+#include <stdint.h>
+
+typedef int32_t atomic32_t;
+typedef uint32_t uatomic32_t;
+typedef int_fast32_t atomic_fast32_t;
+typedef uint_fast32_t uatomic_fast32_t;
+
+typedef intptr_t atomicptr_t;
+typedef uintptr_t uatomicptr_t;
+typedef intmax_t atomic_max_t;
+typedef uintmax_t uatomic_max_t;
+
+#define __HAVE_64B_ATOMICS 0
+#define USE_ATOMIC_COMPILER_BUILTINS 0
+#define ATOMIC_EXCHANGE_USES_CAS 1
+
+#define __arch_compare_and_exchange_val_8_acq(mem, newval, oldval)	\
+  (abort (), (__typeof (*mem)) 0)
+#define __arch_compare_and_exchange_val_16_acq(mem, newval, oldval)	\
+  (abort (), (__typeof (*mem)) 0)
+#define __arch_compare_and_exchange_val_64_acq(mem, newval, oldval)	\
+  (abort (), (__typeof (*mem)) 0)
+
+#define __arch_compare_and_exchange_bool_8_acq(mem, newval, oldval)	\
+  (abort (), 0)
+#define __arch_compare_and_exchange_bool_16_acq(mem, newval, oldval)	\
+  (abort (), 0)
+#define __arch_compare_and_exchange_bool_64_acq(mem, newval, oldval)	\
+  (abort (), 0)
+
+#define __arch_compare_and_exchange_val_32_acq(mem, newval, oldval)	\
+  ({									\
+	__typeof(*(mem)) prev;						\
+									\
+	__asm__ __volatile__(						\
+	"1:	llock   %0, [%1]	\n"				\
+	"	brne    %0, %2, 2f	\n"				\
+	"	scond   %3, [%1]	\n"				\
+	"	bnz     1b		\n"				\
+	"2:				\n"				\
+	: "=&r"(prev)							\
+	: "r"(mem), "ir"(oldval),					\
+	  "r"(newval) /* can't be "ir". scond can't take limm for "b" */\
+	: "cc", "memory");						\
+									\
+	prev;								\
+  })
+
+# define atomic_exchange_acq(mem, newvalue) \
+  ({									\
+	__typeof(*(mem)) __val = (newvalue);				\
+									\
+	__asm__ __volatile__(						\
+	"1:	ex   %0, [%1]	\n"					\
+	: "+r"(__val)							\
+	: "r"(mem)							\
+	: "memory");							\
+									\
+	__val;								\
+  })
+
+#define atomic_full_barrier()  ({ asm volatile ("dmb 3":::"memory"); })
+
+#endif /* _ARC_BITS_ATOMIC_H */
diff --git a/sysdeps/arc/backtrace.c b/sysdeps/arc/backtrace.c
new file mode 100644
index 000000000000..27ce597b3950
--- /dev/null
+++ b/sysdeps/arc/backtrace.c
@@ -0,0 +1 @@
+#include <sysdeps/x86_64/backtrace.c>
diff --git a/sysdeps/arc/bits/endian.h b/sysdeps/arc/bits/endian.h
new file mode 100644
index 000000000000..88fbcf39a58a
--- /dev/null
+++ b/sysdeps/arc/bits/endian.h
@@ -0,0 +1,12 @@
+/* The ARC architecture has selectable endianness.  */
+
+#ifndef _ENDIAN_H
+# error "Never use <bits/endian.h> directly; include <endian.h> instead."
+#endif
+
+#ifdef __BIG_ENDIAN__
+# define __BYTE_ORDER __BIG_ENDIAN
+#endif
+#ifdef __LITTLE_ENDIAN__
+# define __BYTE_ORDER __LITTLE_ENDIAN
+#endif
diff --git a/sysdeps/arc/bits/fenv.h b/sysdeps/arc/bits/fenv.h
new file mode 100644
index 000000000000..49f90ade25ad
--- /dev/null
+++ b/sysdeps/arc/bits/fenv.h
@@ -0,0 +1,52 @@
+/* Copyright (C) 2012-2015 Free Software Foundation, Inc.
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
+#ifndef _FENV_H
+# error "Never use <bits/fenv.h> directly; include <fenv.h> instead."
+#endif
+
+/* ARC hardware FPU does not support exceptions,
+   nor does the software floating-point support.  */
+#define FE_ALL_EXCEPT	0
+
+/* ARC supports only round-to-nearest.  The software
+   floating-point support also acts this way.  */
+enum
+  {
+    __FE_UNDEFINED = 0,
+
+    FE_TONEAREST =
+#define FE_TONEAREST	1
+      FE_TONEAREST,
+  };
+
+/* Type representing exception flags. */
+typedef unsigned int fexcept_t;
+
+/* Type representing floating-point environment.  */
+typedef unsigned int fenv_t;
+
+/* If the default argument is used we use this value.  */
+#define FE_DFL_ENV	((const fenv_t *) -1)
+
+#if __GLIBC_USE (IEC_60559_BFP_EXT)
+/* Type representing floating-point control modes.  */
+typedef unsigned int femode_t;
+
+/* Default floating-point control modes.  */
+# define FE_DFL_MODE	((const femode_t *) -1L)
+#endif
diff --git a/sysdeps/arc/bits/link.h b/sysdeps/arc/bits/link.h
new file mode 100644
index 000000000000..d8263f084974
--- /dev/null
+++ b/sysdeps/arc/bits/link.h
@@ -0,0 +1,52 @@
+/* Machine-specific declarations for dynamic linker interface, ARC version.
+   Copyright (C) 2009-2015 Free Software Foundation, Inc.
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
+#ifndef	_LINK_H
+# error "Never include <bits/link.h> directly; use <link.h> instead."
+#endif
+
+/* Registers for entry into PLT on ARC.  */
+typedef struct La_arc_regs
+{
+  uint32_t lr_reg[8]; /* r0 through r7 (upto 8 args) */
+} La_arc_regs;
+
+/* Return values for calls from PLT on ARC.  */
+typedef struct La_arc_retval
+{
+  /* For ARCv2, a 64-bit integer return value can use 2 regs */
+  uint32_t lrv_reg[2];
+} La_arc_retval;
+
+__BEGIN_DECLS
+
+extern Elf32_Addr la_arc_gnu_pltenter (Elf32_Sym *__sym, unsigned int __ndx,
+					 uintptr_t *__refcook,
+					 uintptr_t *__defcook,
+					 La_arc_regs *__regs,
+					 unsigned int *__flags,
+					 const char *__symname,
+					 long int *__framesizep);
+extern unsigned int la_arc_gnu_pltexit (Elf32_Sym *__sym, unsigned int __ndx,
+					  uintptr_t *__refcook,
+					  uintptr_t *__defcook,
+					  const La_arc_regs *__inregs,
+					  La_arc_retval *__outregs,
+					  const char *symname);
+
+__END_DECLS
diff --git a/sysdeps/arc/bits/setjmp.h b/sysdeps/arc/bits/setjmp.h
new file mode 100644
index 000000000000..6fe5cbf1f86d
--- /dev/null
+++ b/sysdeps/arc/bits/setjmp.h
@@ -0,0 +1,33 @@
+/* Define the machine-dependent type `jmp_buf'.  ARC version.
+   Copyright (C) 1992-2015 Free Software Foundation, Inc.
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
+#ifndef _BITS_SETJMP_H
+#define _BITS_SETJMP_H 1
+
+#if !defined(_SETJMP_H) && !defined(_PTHREAD_H)
+# error "Never include <bits/setjmp.h> directly; use <setjmp.h> instead."
+#endif
+
+#ifndef __ASSEMBLER__
+
+/* Saves r13-r25 (callee-saved), fp (frame pointer), sp (stack pointer),
+ * blink (branch-n-link) */
+typedef int __jmp_buf[32];
+#endif
+
+#endif
diff --git a/sysdeps/arc/bsd-_setjmp.S b/sysdeps/arc/bsd-_setjmp.S
new file mode 100644
index 000000000000..4e6a2da560c4
--- /dev/null
+++ b/sysdeps/arc/bsd-_setjmp.S
@@ -0,0 +1 @@
+/* _setjmp is in setjmp.S  */
diff --git a/sysdeps/arc/bsd-setjmp.S b/sysdeps/arc/bsd-setjmp.S
new file mode 100644
index 000000000000..1da848d2f1ee
--- /dev/null
+++ b/sysdeps/arc/bsd-setjmp.S
@@ -0,0 +1 @@
+/* setjmp is in setjmp.S  */
diff --git a/sysdeps/arc/configure b/sysdeps/arc/configure
new file mode 100644
index 000000000000..2033957d0d9f
--- /dev/null
+++ b/sysdeps/arc/configure
@@ -0,0 +1,17 @@
+# This file is generated from configure.ac by Autoconf.  DO NOT EDIT!
+ # Local configure fragment for sysdeps/arc.
+
+$as_echo "#define PI_STATIC_AND_HIDDEN 1" >>confdefs.h
+
+libc_cv_have_sdata_section=no
+
+# For ARC, historically ; was used for comments and not newline
+# Later # also got added to comment list, but ; couldn't be switched to
+# canonical newline as there's lots of code out there which will break
+libc_cv_asm_line_sep='`'
+cat >>confdefs.h <<_ACEOF
+#define ASM_LINE_SEP $libc_cv_asm_line_sep
+_ACEOF
+
+
+libc_cv_fpie=no
diff --git a/sysdeps/arc/configure.ac b/sysdeps/arc/configure.ac
new file mode 100644
index 000000000000..91e58efb35c8
--- /dev/null
+++ b/sysdeps/arc/configure.ac
@@ -0,0 +1,13 @@
+GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
+# Local configure fragment for sysdeps/arc.
+
+AC_DEFINE(PI_STATIC_AND_HIDDEN)
+libc_cv_have_sdata_section=no
+
+# For ARC, historically ; was used for comments and not newline
+# Later # also got added to comment list, but ; couldn't be switched to
+# canonical newline as there's lots of code out there which will break
+libc_cv_asm_line_sep='`'
+AC_DEFINE_UNQUOTED(ASM_LINE_SEP, $libc_cv_asm_line_sep)
+
+libc_cv_fpie=no
diff --git a/sysdeps/arc/crti.S b/sysdeps/arc/crti.S
new file mode 100644
index 000000000000..d9f3fb65460a
--- /dev/null
+++ b/sysdeps/arc/crti.S
@@ -0,0 +1,77 @@
+/* Special .init and .fini section support for ARC.
+   Copyright (C) 2012-2015 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   In addition to the permissions in the GNU Lesser General Public
+   License, the Free Software Foundation gives you unlimited
+   permission to link the compiled version of this file with other
+   programs, and to distribute those programs without any restriction
+   coming from the use of this file. (The GNU Lesser General Public
+   License restrictions do apply in other respects; for example, they
+   cover modification of the file, and distribution when not linked
+   into another program.)
+
+   Note that people who make modified versions of this file are not
+   obligated to grant this special exception for their modified
+   versions; it is their choice whether to do so. The GNU Lesser
+   General Public License gives permission to release a modified
+   version without this exception; this exception also makes it
+   possible to release a modified version which carries forward this
+   exception.
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
+#include <libc-symbols.h>
+#include <sysdep.h>
+
+#ifndef PREINIT_FUNCTION
+# define PREINIT_FUNCTION __gmon_start__
+#endif
+
+#ifndef PREINIT_FUNCTION_WEAK
+# define PREINIT_FUNCTION_WEAK 1
+#endif
+
+#if PREINIT_FUNCTION_WEAK
+	weak_extern (PREINIT_FUNCTION)
+#else
+	.hidden PREINIT_FUNCTION
+#endif
+
+	.section .init
+	.align 4
+	.global	_init
+	.type	 _init, at function
+_init:
+	st.a	blink, [sp,-4]
+	st.a	fp, [sp,-4]
+	mov	fp, sp
+#if PREINIT_FUNCTION_WEAK
+	ld	r0, [pcl, @PREINIT_FUNCTION at gotpc]
+	tst	r0, r0
+	jlnz	[r0]
+#else
+	bl	PREINIT_FUNCTION
+#endif
+
+	.section .fini
+	.align 4
+	.global	_fini
+	.type	 _fini, at function
+_fini:
+	st.a blink,[sp,-4]
+	st.a fp,[sp,-4]
+	mov fp,sp
+	.align 4
diff --git a/sysdeps/arc/crtn.S b/sysdeps/arc/crtn.S
new file mode 100644
index 000000000000..e3e86a89e1cf
--- /dev/null
+++ b/sysdeps/arc/crtn.S
@@ -0,0 +1,56 @@
+/* Special .init and .fini section support for ARC.
+   Copyright (C) 2012-2015 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   In addition to the permissions in the GNU Lesser General Public
+   License, the Free Software Foundation gives you unlimited
+   permission to link the compiled version of this file with other
+   programs, and to distribute those programs without any restriction
+   coming from the use of this file. (The GNU Lesser General Public
+   License restrictions do apply in other respects; for example, they
+   cover modification of the file, and distribution when not linked
+   into another program.)
+
+   Note that people who make modified versions of this file are not
+   obligated to grant this special exception for their modified
+   versions; it is their choice whether to do so. The GNU Lesser
+   General Public License gives permission to release a modified
+   version without this exception; this exception also makes it
+   possible to release a modified version which carries forward this
+   exception.
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
+	.section .init
+	.align 4
+	.global	_init
+	.type	 _init, at function
+	; EPILOGUE
+	ld.ab fp,[sp,4]
+	ld blink,[sp,0]
+	j.d [blink]
+	add sp,sp,4
+;	.size	 _init,.-_init
+
+	.section .fini
+	.align 4
+	.global	_fini
+	.type	 _fini, at function
+	; EPILOGUE
+	ld.ab fp,[sp,4]
+	ld blink,[sp,0]
+	j.d [blink]
+	add sp,sp,4
+;	.size	 _fini,.-_fini
diff --git a/sysdeps/arc/dl-machine.h b/sysdeps/arc/dl-machine.h
new file mode 100644
index 000000000000..3f985702649d
--- /dev/null
+++ b/sysdeps/arc/dl-machine.h
@@ -0,0 +1,332 @@
+/* Machine-dependent ELF dynamic relocation inline functions.  ARC version.
+   Copyright (C) 1995-2015 Free Software Foundation, Inc.
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
+#ifndef dl_machine_h
+#define dl_machine_h
+
+#define ELF_MACHINE_NAME "arc"
+
+#include <string.h>
+#include <link.h>
+#include <dl-tls.h>
+
+/*
+ * Dynamic Linking ABI for ARCv2 ISA
+ *
+ *                      PLT
+ *        --------------------------------	<---- DT_PLTGOT
+ *        |  ld r11, [pcl, off-to-GOT[1] |  0
+ *        |                              |  4
+ * plt0   |  ld r10, [pcl, off-to-GOT[2] |  8
+ *        |                              | 12
+ *        |  j [r10]                     | 16
+ *        --------------------------------
+ *        |    Base address of GOT       | 20
+ *        --------------------------------
+ *        |  ld r12, [pcl, off-to-GOT[3] | 24
+ * plt1   |                              |
+ *        |  j.d    [r12]                | 32
+ *        |  mov    r12, pcl             | 36
+ *        --------------------------------
+ *        |                              | 40
+ *        ~                              ~
+ *        ~                              ~
+ *        |                              |
+ *        --------------------------------
+ *
+ *             .got
+ *        --------------
+ *        |    [0]     |
+ *        |    ...     |  Runtime address for data symbols
+ *        |    [n]     |
+ *        --------------
+ *
+ * 	     .got.plt
+ *        --------------
+ *        |    [0]     |  Build address of .dynamic
+ *        --------------
+ *        |    [1]     |  Module info - setup by ld.so
+ *        --------------
+ *        |    [2]     |  resolver entry point
+ *        --------------
+ *        |    [3]     |
+ *        |    ...     |  Runtime address for function symbols
+ *        |    [f]     |
+ *        --------------
+ *
+ * For ARCompact, the PLT is 12 bytes due to short instructions
+ *
+ *        --------------------------------
+ *        |  ld r12, [pcl, off-to-GOT[3] | 24   (12 bytes each)
+ * plt1   |                              |
+ *        |  j_s.d  [r12]                | 32
+ *        |  mov_s  r12, pcl             | 34
+ *        --------------------------------
+ *        |                              | 36
+ *
+ */
+
+/* Return nonzero iff ELF header is compatible with the running host.  */
+static inline int
+elf_machine_matches_host (const Elf32_Ehdr *ehdr)
+{
+  return ehdr->e_machine == EM_ARCV2;
+}
+
+/*
+ * Get build time address of .dynamic as setup in GOT[0]
+ * This is called very early in _dl_start() so it has not been relocated to
+ * runtime value
+ */
+static inline Elf32_Addr
+elf_machine_dynamic (void)
+{
+  extern const Elf32_Addr _GLOBAL_OFFSET_TABLE_[] attribute_hidden;
+  return _GLOBAL_OFFSET_TABLE_[0];
+}
+
+
+/* Return the run-time load address of the shared object.  */
+static inline Elf32_Addr
+elf_machine_load_address (void)
+{
+  Elf32_Addr build_addr, run_addr;
+
+  /* For build address, below generates
+   * ld  r0, [pcl, _GLOBAL_OFFSET_TABLE_ at pcl]
+   */
+  build_addr = elf_machine_dynamic();
+  __asm__ ("add %0, pcl, _DYNAMIC at pcl	\n" : "=r" (run_addr));
+
+  return run_addr - build_addr;
+}
+
+/* Set up the loaded object described by L so its unrelocated PLT
+   entries will jump to the on-demand fixup code in dl-runtime.c.  */
+
+static inline int __attribute__ ((always_inline))
+elf_machine_runtime_setup (struct link_map *l, int lazy, int profile)
+{
+  extern void _dl_runtime_resolve (Elf32_Word);
+
+  if (l->l_info[DT_JMPREL] && lazy)
+    {
+      /* On ARC DT_PLTGOT point to .plt whose 5th word (after the PLT header)
+       * contains the address of .got */
+      Elf32_Addr *plt_base = (Elf32_Addr *) D_PTR (l, l_info[DT_PLTGOT]);
+      Elf32_Addr *got = (Elf32_Addr *) (plt_base[5] + l->l_addr);
+
+      got[1] = (Elf32_Addr) l;	/* Identify this shared object.  */
+
+      /* This function will get called to fix up the GOT entry indicated by
+	 the offset on the stack, and then jump to the resolved address.  */
+      got[2] = (Elf32_Addr) &_dl_runtime_resolve;
+    }
+
+  return lazy;
+}
+
+/* What this code does:
+    -ldso starts execution here when kernel returns from execve()
+    -calls into generic ldso entry point _dl_start( )
+    -optionally adjusts argc for executable if exec passed as cmd
+    -calls into app main with address of finaliser */
+
+#define RTLD_START asm ("\
+.text								\n\
+.globl _start							\n\
+.type _start, @function						\n\
+_start:								\n\
+	; (1). bootstrap ld.so					\n\
+	bl.d    _dl_start                                       \n\
+	mov_s   r0, sp          ; pass ptr to aux vector tbl    \n\
+	mov r13, r0		; safekeep app elf entry point	\n\
+								\n\
+	; (2). If ldso ran with executable as arg		\n\
+	;      skip the extra args calc by dl_start()		\n\
+	ld_s    r1, [sp]       ; orig argc			\n\
+	ld      r12, [pcl, _dl_skip_args at pcl]                   \n\
+	breq	r12, 0, 1f					\n\
+								\n\
+	add2    sp, sp, r12    ; discard argv entries from stack\n\
+	sub_s   r1, r1, r12    ; adjusted argc, on stack        \n\
+	st_s    r1, [sp]                                        \n\
+	add	r2, sp, 4					\n\
+	ld	r3, [pcl, _dl_argv at gotpc]    ; ST doesn't support this addressing mode	\n\
+	st	r2, [r3]					\n\
+1:								\n\
+	; (3). call preinit stuff				\n\
+	ld	r0, [pcl, _rtld_local at pcl]			\n\
+	add	r2, sp, 4	; argv				\n\
+	add2	r3, r2, r1					\n\
+	add	r3, r3, 4	; env				\n\
+	bl	_dl_init at plt					\n\
+								\n\
+	; (4) call app elf entry point				\n\
+	add     r0, pcl, _dl_fini at pcl				\n\
+	j	[r13]						\n\
+								\n\
+	.size  _start,.-_start                                  \n\
+	.previous                                               \n\
+");
+
+/* ELF_RTYPE_CLASS_PLT iff TYPE describes relocation of a PLT entry, so
+   PLT entries should not be allowed to define the value.
+   ELF_RTYPE_CLASS_NOCOPY iff TYPE should not be allowed to resolve to one
+   of the main executable's symbols, as for a COPY reloc.  */
+#define elf_machine_type_class(type)				\
+  ((((type) == R_ARC_JUMP_SLOT					\
+     || (type) == R_ARC_TLS_DTPMOD				\
+     || (type) == R_ARC_TLS_DTPOFF				\
+     || (type) == R_ARC_TLS_TPOFF) * ELF_RTYPE_CLASS_PLT)	\
+   | (((type) == R_ARC_COPY) * ELF_RTYPE_CLASS_COPY))
+
+/* A reloc type used for ld.so cmdline arg lookups to reject PLT entries.  */
+#define ELF_MACHINE_JMP_SLOT  R_ARC_JUMP_SLOT
+
+/* ARC uses Elf32_Rela relocations.  */
+#define ELF_MACHINE_NO_REL 1
+#define ELF_MACHINE_NO_RELA 0
+
+/* Fixup a PLT entry to bounce directly to the function at VALUE.  */
+
+static inline Elf32_Addr
+elf_machine_fixup_plt (struct link_map *map, lookup_t t,
+		       const ElfW(Sym) *refsym, const ElfW(Sym) *sym,
+		       const Elf32_Rela *reloc,
+		       Elf32_Addr *reloc_addr, Elf32_Addr value)
+{
+  return *reloc_addr = value;
+}
+
+/* Return the final value of a plt relocation.  */
+static inline Elf32_Addr
+elf_machine_plt_value (struct link_map *map, const Elf32_Rela *reloc,
+                       Elf32_Addr value)
+{
+  return value;
+}
+
+/* Names of the architecture-specific auditing callback functions.  */
+#define ARCH_LA_PLTENTER arc_gnu_pltenter
+#define ARCH_LA_PLTEXIT arc_gnu_pltexit
+
+#endif /* dl_machine_h */
+
+#ifdef RESOLVE_MAP
+
+auto inline void __attribute__ ((always_inline))
+elf_machine_rela (struct link_map *map, const ElfW(Rela) *reloc,
+                  const ElfW(Sym) *sym, const struct r_found_version *version,
+                  void *const reloc_addr_arg, int skip_ifunc)
+{
+  Elf32_Addr *const reloc_addr = reloc_addr_arg;
+  const unsigned int r_type = ELF32_R_TYPE (reloc->r_info);
+
+  if (__glibc_unlikely (r_type == R_ARC_RELATIVE))
+    *reloc_addr += map->l_addr;
+  else if (__glibc_unlikely (r_type == R_ARC_NONE))
+    return;
+  else
+    {
+      const Elf32_Sym *const refsym = sym;
+      struct link_map *sym_map = RESOLVE_MAP (&sym, version, r_type);
+      Elf32_Addr value = sym == NULL ? 0 : sym_map->l_addr + sym->st_value;
+
+      switch (r_type)
+	{
+        case R_ARC_COPY:
+          if (sym == NULL)
+            /* This can happen in trace mode if an object could not be
+               found.  */
+            break;
+          if (sym->st_size > refsym->st_size
+              || (sym->st_size < refsym->st_size && GLRO(dl_verbose)))
+            {
+              const char *strtab;
+
+              strtab = (const void *) D_PTR (map, l_info[DT_STRTAB]);
+              _dl_error_printf ("\
+%s: Symbol `%s' has different size in shared object, consider re-linking\n",
+				rtld_progname ?: "<program name unknown>",
+				strtab + refsym->st_name);
+            }
+          memcpy (reloc_addr_arg, (void *) value,
+                  MIN (sym->st_size, refsym->st_size));
+          break;
+	case R_ARC_GLOB_DAT:
+	case R_ARC_JUMP_SLOT:
+            *reloc_addr = value;
+          break;
+        case R_ARC_TLS_DTPMOD:
+          /* Get the information from the link map returned by the
+             resolv function.  */
+          if (sym_map != NULL)
+            *reloc_addr = sym_map->l_tls_modid;
+          break;
+
+        case R_ARC_TLS_DTPOFF:
+          if (sym != NULL)
+            {
+              *reloc_addr = sym->st_value;
+            }
+          break;
+
+        case R_ARC_TLS_TPOFF:
+          if (sym != NULL)
+            {
+              CHECK_STATIC_TLS (map, sym_map);
+              *reloc_addr = sym_map->l_tls_offset + sym->st_value + reloc->r_addend;
+            }
+          break;
+        case R_ARC_32:
+          *reloc_addr += value + reloc->r_addend;
+          break;
+
+        case R_ARC_PC32:
+          *reloc_addr += value + reloc->r_addend - (unsigned long) reloc_addr;
+          break;
+
+	default:
+          _dl_reloc_bad_type (map, r_type, 0);
+          break;
+	}
+    }
+}
+
+auto inline void __attribute__((always_inline))
+elf_machine_rela_relative (ElfW(Addr) l_addr, const ElfW(Rela) *reloc,
+			   void *const reloc_addr_arg)
+{
+  Elf32_Addr *const reloc_addr = reloc_addr_arg;
+  *reloc_addr += l_addr; // + reloc->r_addend;
+}
+
+auto inline void __attribute__((always_inline))
+elf_machine_lazy_rel (struct link_map *map,
+		      ElfW(Addr) l_addr, const ElfW(Rela) *reloc,
+		      int skip_ifunc)
+{
+  Elf32_Addr *const reloc_addr = (void *) (l_addr + reloc->r_offset);
+  if (ELF32_R_TYPE (reloc->r_info) == R_ARC_JUMP_SLOT)
+    *reloc_addr += l_addr;
+  else
+    _dl_reloc_bad_type (map, ELF32_R_TYPE (reloc->r_info), 1);
+}
+
+#endif /* RESOLVE_MAP */
diff --git a/sysdeps/arc/dl-runtime.c b/sysdeps/arc/dl-runtime.c
new file mode 100644
index 000000000000..76d39fab5ab8
--- /dev/null
+++ b/sysdeps/arc/dl-runtime.c
@@ -0,0 +1,21 @@
+/* PLT jump into resolver passes PC of PLTn, while _dl_fixup expects the
+   address of corresponding .rela.plt entry */
+
+#ifdef __A7__
+#define ARC_PLT_SIZE	12
+#else
+#define ARC_PLT_SIZE	16
+#endif
+
+#define reloc_index					\
+({							\
+  unsigned long plt0 = D_PTR (l, l_info[DT_PLTGOT]);	\
+  unsigned long pltn = reloc_arg;			\
+  /* exclude PL0 and PLT1 */				\
+  unsigned long idx = (pltn - plt0)/ARC_PLT_SIZE - 2;	\
+  idx;							\
+})
+
+#define reloc_offset reloc_index * sizeof (PLTREL)
+
+#include <elf/dl-runtime.c>
diff --git a/sysdeps/arc/dl-sysdep.h b/sysdeps/arc/dl-sysdep.h
new file mode 100644
index 000000000000..80a6f58a8eca
--- /dev/null
+++ b/sysdeps/arc/dl-sysdep.h
@@ -0,0 +1,25 @@
+/* System-specific settings for dynamic linker code.  ARC version.
+   Copyright (C) 2009-2015 Free Software Foundation, Inc.
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
diff --git a/sysdeps/arc/dl-tls.h b/sysdeps/arc/dl-tls.h
new file mode 100644
index 000000000000..8ad07bfc1318
--- /dev/null
+++ b/sysdeps/arc/dl-tls.h
@@ -0,0 +1,30 @@
+/* Thread-local storage handling in the ELF dynamic linker.  ARC version.
+   Copyright (C) 2012-2015 Free Software Foundation, Inc.
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
+/* Type used for the representation of TLS information in the GOT.  */
+typedef struct
+{
+  unsigned long int ti_module;
+  unsigned long int ti_offset;
+} tls_index;
+
+extern void *__tls_get_addr (tls_index *ti);
+
+/* Value used for dtv entries for which the allocation is delayed.  */
+#define TLS_DTV_UNALLOCATED	((void *) -1l)
diff --git a/sysdeps/arc/dl-trampoline.S b/sysdeps/arc/dl-trampoline.S
new file mode 100644
index 000000000000..0e781af8380e
--- /dev/null
+++ b/sysdeps/arc/dl-trampoline.S
@@ -0,0 +1,72 @@
+/* PLT trampolines.  ARC version.
+   Copyright (C) 2005-2015 Free Software Foundation, Inc.
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
+; Save the registers which resolver could possibly clobber
+; 	r0-r9: args to the function - symbol being resolved
+; 	r10-r12 are already clobbered by PLTn, PLT0 thus neednot be saved
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
+	push_s	blink
+.endm
+
+.macro RESTORE_CALLER_SAVED_BUT_R0
+	ld.ab	blink,[sp, 4]
+	ld.ab	r9, [sp, 4]
+	ld.ab	r8, [sp, 4]
+	ld.ab	r7, [sp, 4]
+	ld.ab	r6, [sp, 4]
+	ld.ab	r5, [sp, 4]
+	ld.ab	r4, [sp, 4]
+	pop_s   r3
+	pop_s   r2
+	pop_s   r1
+.endm
+
+; Upon entry, PLTn, which led us here, sets up the following regs
+; 	r11 = Module info (tpnt pointer as expected by resolver)
+;	r12 = PC of the PLTn itself - needed by resolver to find
+;	      corresponding .rela.plt entry
+
+ENTRY(_dl_runtime_resolve)
+	; args to func being resolved, which resolver might clobber
+	SAVE_CALLER_SAVED
+
+	mov_s 	r1, r12
+	bl.d  	_dl_fixup
+	mov   	r0, r11
+
+	RESTORE_CALLER_SAVED_BUT_R0
+	j_s.d   [r0]    ; r0 has resolved function addr
+	pop_s   r0      ; restore first arg to resolved call
+END(_dl_runtime_resolve)
diff --git a/sysdeps/arc/gccframe.h b/sysdeps/arc/gccframe.h
new file mode 100644
index 000000000000..df7562571dbe
--- /dev/null
+++ b/sysdeps/arc/gccframe.h
@@ -0,0 +1,21 @@
+/* Definition of object in frame unwind info.  ARC version.
+   Copyright (C) 2015 Free Software Foundation, Inc.
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
index 000000000000..67d25d342c0e
--- /dev/null
+++ b/sysdeps/arc/gmp-mparam.h
@@ -0,0 +1,23 @@
+/* gmp-mparam.h -- Compiler/machine parameter header file.
+
+Copyright (C) 2015 Free Software Foundation, Inc.
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
index 000000000000..84010cb6c428
--- /dev/null
+++ b/sysdeps/arc/jmpbuf-offsets.h
@@ -0,0 +1,46 @@
+/* Private macros for accessing __jmp_buf contents.  ARC version.
+   Copyright (C) 2006-2015 Free Software Foundation, Inc.
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
+/* Save offsets within __jmp_buf.  */
+/* We don't use most of these symbols; they are here for documentation. */
+
+/* Callee Regs */
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
+/* Frame Pointer, Stack Pointer, Branch-n-link */
+#define JB_FP  13
+#define JB_SP  14
+#define JB_BLINK  15
+
+/* We save space for some extra state to accommodate future changes.  */
+#define JB_NUM	32	/* words */
+
+/* Helper for generic ____longjmp_chk(). */
+#define JB_FRAME_ADDRESS(buf) ((void *) (unsigned long) (buf[JB_SP]))
diff --git a/sysdeps/arc/jmpbuf-unwind.h b/sysdeps/arc/jmpbuf-unwind.h
new file mode 100644
index 000000000000..c7ebfb7752d4
--- /dev/null
+++ b/sysdeps/arc/jmpbuf-unwind.h
@@ -0,0 +1,47 @@
+/* Examine __jmp_buf for unwinding frames.  ARC version.
+   Copyright (C) 2005-2015 Free Software Foundation, Inc.
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
diff --git a/sysdeps/arc/ldsodefs.h b/sysdeps/arc/ldsodefs.h
new file mode 100644
index 000000000000..66b9f5031b5c
--- /dev/null
+++ b/sysdeps/arc/ldsodefs.h
@@ -0,0 +1,43 @@
+/* Run-time dynamic linker data structures for loaded ELF shared objects.
+   Copyright (C) 2000-2015 Free Software Foundation, Inc.
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
+#ifndef _ARC_LDSODEFS_H
+#define _ARC_LDSODEFS_H 1
+
+#include <elf.h>
+
+struct La_arc_regs;
+struct La_arc_retval;
+
+#define ARCH_PLTENTER_MEMBERS						\
+    ElfW(Addr) (*arc_gnu_pltenter) (ElfW(Sym) *, unsigned int,	\
+				      uintptr_t *, uintptr_t *,		\
+				      const struct La_arc_regs *,	\
+				      unsigned int *, const char *,	\
+				      long int *);
+
+#define ARCH_PLTEXIT_MEMBERS						\
+    unsigned int (*arc_gnu_pltexit) (ElfW(Sym) *, unsigned int,	\
+				       uintptr_t *, uintptr_t *,	\
+				       const struct La_arc_regs *,	\
+				       struct La_arc_retval *,	\
+				       const char *);
+
+#include_next <ldsodefs.h>
+
+#endif
diff --git a/sysdeps/arc/libc-tls.c b/sysdeps/arc/libc-tls.c
new file mode 100644
index 000000000000..160dacfe6f3c
--- /dev/null
+++ b/sysdeps/arc/libc-tls.c
@@ -0,0 +1,27 @@
+/* Thread-local storage handling in the ELF dynamic linker.  ARC version.
+   Copyright (C) 2005-2015 Free Software Foundation, Inc.
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
+#include <csu/libc-tls.c>
+#include <dl-tls.h>
+
+void *
+__tls_get_addr (tls_index *ti)
+{
+  dtv_t *dtv = THREAD_DTV ();
+  return (char *) dtv[1].pointer.val + ti->ti_offset;
+}
diff --git a/sysdeps/arc/libm-test-ulps b/sysdeps/arc/libm-test-ulps
new file mode 100644
index 000000000000..f1a01fdb30ac
--- /dev/null
+++ b/sysdeps/arc/libm-test-ulps
@@ -0,0 +1,394 @@
+# Begin of automatic generation
+
+# Maximal error of functions:
+Function: "acos":
+float: 1
+ifloat: 1
+
+Function: "acosh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "asin":
+float: 1
+ifloat: 1
+
+Function: "asinh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "atan":
+float: 1
+ifloat: 1
+
+Function: "atan2":
+float: 1
+ifloat: 1
+
+Function: "atanh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "cabs":
+double: 1
+idouble: 1
+
+Function: Real part of "cacos":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: Imaginary part of "cacos":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: Real part of "cacosh":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: Imaginary part of "cacosh":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: "carg":
+float: 1
+ifloat: 1
+
+Function: Real part of "casin":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Imaginary part of "casin":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: Real part of "casinh":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: Imaginary part of "casinh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "catan":
+float: 1
+ifloat: 1
+
+Function: Imaginary part of "catan":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "catanh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Imaginary part of "catanh":
+float: 1
+ifloat: 1
+
+Function: "cbrt":
+double: 3
+float: 1
+idouble: 3
+ifloat: 1
+
+Function: Real part of "ccos":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Imaginary part of "ccos":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "ccosh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Imaginary part of "ccosh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "cexp":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: Imaginary part of "cexp":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: Real part of "clog":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Imaginary part of "clog":
+float: 1
+ifloat: 1
+
+Function: Real part of "clog10":
+double: 3
+float: 4
+idouble: 3
+ifloat: 4
+
+Function: Imaginary part of "clog10":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "cos":
+float: 1
+ifloat: 1
+
+Function: "cosh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "cpow":
+double: 2
+float: 4
+idouble: 2
+ifloat: 4
+
+Function: Imaginary part of "cpow":
+float: 2
+ifloat: 2
+
+Function: Real part of "csin":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "csinh":
+float: 1
+ifloat: 1
+
+Function: Imaginary part of "csinh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "csqrt":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Imaginary part of "csqrt":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Real part of "ctan":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Imaginary part of "ctan":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: Real part of "ctanh":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: Imaginary part of "ctanh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "erf":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "erfc":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: "exp":
+float: 1
+ifloat: 1
+
+Function: "exp10":
+double: 2
+idouble: 2
+
+Function: "exp2":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "expm1":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "gamma":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: "hypot":
+double: 1
+idouble: 1
+
+Function: "j0":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "j1":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: "jn":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: "lgamma":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: "log":
+float: 1
+ifloat: 1
+
+Function: "log10":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "log1p":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "log2":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: "pow":
+float: 3
+ifloat: 3
+
+Function: "pow10":
+double: 2
+idouble: 2
+
+Function: "sin":
+float: 1
+ifloat: 1
+
+Function: "sincos":
+float: 1
+ifloat: 1
+
+Function: "sinh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "tan":
+float: 1
+ifloat: 1
+
+Function: "tanh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "tgamma":
+double: 5
+float: 5
+idouble: 5
+ifloat: 5
+
+Function: "y0":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: "y1":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: "yn":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+# end of automatic generation
diff --git a/sysdeps/arc/libm-test-ulps-name b/sysdeps/arc/libm-test-ulps-name
new file mode 100644
index 000000000000..8c4fba4f9ae0
--- /dev/null
+++ b/sysdeps/arc/libm-test-ulps-name
@@ -0,0 +1 @@
+ARC
diff --git a/sysdeps/arc/machine-gmon.h b/sysdeps/arc/machine-gmon.h
new file mode 100644
index 000000000000..b9bdd2c6d43a
--- /dev/null
+++ b/sysdeps/arc/machine-gmon.h
@@ -0,0 +1,30 @@
+/* Machine-dependent definitions for profiling support.  ARC version.
+   Copyright (C) 1996-2015 Free Software Foundation, Inc.
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
+#define _MCOUNT_DECL(frompc, selfpc) \
+static void __attribute_used__ __mcount_internal (u_long frompc, u_long selfpc)
+
+#define MCOUNT						\
+  asm (".globl _mcount\n\t"				\
+       ".type _mcount, at function\n\t"			\
+       "_mcount:\n\t"					\
+       "flag 1	\n\t"					\
+       ".size _mcount, . - _mcount\n\t"			\
+       );
diff --git a/sysdeps/arc/math-tests.h b/sysdeps/arc/math-tests.h
new file mode 100644
index 000000000000..2029c963b6e3
--- /dev/null
+++ b/sysdeps/arc/math-tests.h
@@ -0,0 +1,28 @@
+/* Configuration for math tests.  ARC version.
+   Copyright (C) 2015 Free Software Foundation, Inc.
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
+/* Current ARC soft-float does not support exceptions or rounding
+   modes.  */
+#define ROUNDING_TESTS_float(MODE)	((MODE) == FE_TONEAREST)
+#define ROUNDING_TESTS_double(MODE)	((MODE) == FE_TONEAREST)
+#define ROUNDING_TESTS_long_double(MODE)	((MODE) == FE_TONEAREST)
+#define EXCEPTION_TESTS_float	0
+#define EXCEPTION_TESTS_double	0
+#define EXCEPTION_TESTS_long_double	0
+
+#include_next <math-tests.h>
diff --git a/sysdeps/arc/math_private.h b/sysdeps/arc/math_private.h
new file mode 100644
index 000000000000..77416da20387
--- /dev/null
+++ b/sysdeps/arc/math_private.h
@@ -0,0 +1,33 @@
+#ifndef _MATH_PRIVATE_H
+
+/* Suppress use of exceptions here to avoid build errors if the FE_*
+   macros aren't defined. Only allow rounding modes implemented for ARC.
+
+   This does mean that some code will silently fail to report exceptions,
+   set rounding mode as expected, etc., but it allows math code to compile
+   that otherwise wouldn't (such as math/s_fma.c) and so is valuable.
+
+   We intentionally ignore the "exception" arguments of functions that
+   take an exception, since we can't even evaluate the argument
+   without causing a build failure.  The extra level of statement
+   expression wrapping avoids "statement with no effect" warnings.
+   Since the callers don't check for errors anyway, we just claim
+   success in every case.
+
+   The overrides for libc_ functions must happen before we include
+   the generic math_private.h, and the overrides for regular
+   <fenv.h> functions must happen afterwards, to avoid clashing with
+   the declarations of those functions.  */
+
+#define libc_fesetround(rnd)                   ({ 0; })
+#define libc_fetestexcept(exc)                 ({ 0; })
+#define libc_feholdexcept_setround(env, exc)   ({ (void) (env); 0; })
+#define libc_feupdateenv_test(env, exc)        ({ (void) (env); 0; })
+
+#include_next <math_private.h>
+
+#define feraiseexcept(excepts)                 ({ 0; })
+#define __feraiseexcept(excepts)               ({ 0; })
+#define feclearexcept(exc)                     ({ 0; })
+
+#endif
diff --git a/sysdeps/arc/memusage.h b/sysdeps/arc/memusage.h
new file mode 100644
index 000000000000..833545084c2f
--- /dev/null
+++ b/sysdeps/arc/memusage.h
@@ -0,0 +1,23 @@
+/* Machine-specific definitions for memory usage profiling, ARC version.
+   Copyright (C) 2000-2015 Free Software Foundation, Inc.
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
diff --git a/sysdeps/arc/nptl/Makefile b/sysdeps/arc/nptl/Makefile
new file mode 100644
index 000000000000..2b7fa79a0ce1
--- /dev/null
+++ b/sysdeps/arc/nptl/Makefile
@@ -0,0 +1,22 @@
+# NPTL makefile fragment for ARC.
+# Copyright (C) 2005-2015 Free Software Foundation, Inc.
+#
+# This file is part of the GNU C Library.
+#
+# The GNU C Library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# The GNU C Library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with the GNU C Library.  If not, see
+# <http://www.gnu.org/licenses/>.
+
+ifeq ($(subdir),csu)
+gen-as-const-headers += tcb-offsets.sym
+endif
diff --git a/sysdeps/arc/nptl/bits/pthreadtypes-arch.h b/sysdeps/arc/nptl/bits/pthreadtypes-arch.h
new file mode 100644
index 000000000000..f125f25c2a93
--- /dev/null
+++ b/sysdeps/arc/nptl/bits/pthreadtypes-arch.h
@@ -0,0 +1,70 @@
+/* Machine-specific pthread type layouts.  ARC version.
+   Copyright (C) 2012-2015 Free Software Foundation, Inc.
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
+#ifndef _BITS_PTHREADTYPES_ARCH_H
+#define _BITS_PTHREADTYPES_ARCH_H	1
+
+#include <endian.h>
+
+#define __SIZEOF_PTHREAD_ATTR_T 36
+#define __SIZEOF_PTHREAD_MUTEX_T 24
+#define __SIZEOF_PTHREAD_MUTEXATTR_T 4
+#define __SIZEOF_PTHREAD_COND_T 48
+#define __SIZEOF_PTHREAD_CONDATTR_T 4
+#define __SIZEOF_PTHREAD_RWLOCK_T 32
+#define __SIZEOF_PTHREAD_RWLOCKATTR_T 8
+#define __SIZEOF_PTHREAD_BARRIER_T 20
+#define __SIZEOF_PTHREAD_BARRIERATTR_T 4
+
+/* Data structure for mutex handling. */
+#define __PTHREAD_COMPAT_PADDING_MID
+#define __PTHREAD_COMPAT_PADDING_END
+#define __PTHREAD_MUTEX_LOCK_ELISION    0
+
+#define __LOCK_ALIGNMENT
+#define __ONCE_ALIGNMENT
+
+struct __pthread_rwlock_arch_t
+{
+  unsigned int __readers;
+  unsigned int __writers;
+  unsigned int __wrphase_futex;
+  unsigned int __writers_futex;
+  unsigned int __pad3;
+  unsigned int __pad4;
+#if __BYTE_ORDER == __BIG_ENDIAN
+  unsigned char __pad1;
+  unsigned char __pad2;
+  unsigned char __shared;
+  /* FLAGS must stay at this position in the structure to maintain
+     binary compatibility.  */
+  unsigned char __flags;
+#else
+  /* FLAGS must stay at this position in the structure to maintain
+     binary compatibility.  */
+  unsigned char __flags;
+  unsigned char __shared;
+  unsigned char __pad1;
+  unsigned char __pad2;
+#endif
+  int __cur_writer;
+};
+
+#define __PTHREAD_RWLOCK_ELISION_EXTRA 0
+
+#endif	/* bits/pthreadtypes-arch.h */
diff --git a/sysdeps/arc/nptl/bits/semaphore.h b/sysdeps/arc/nptl/bits/semaphore.h
new file mode 100644
index 000000000000..588b957b4dcd
--- /dev/null
+++ b/sysdeps/arc/nptl/bits/semaphore.h
@@ -0,0 +1,32 @@
+/* Machine-specific POSIX semaphore type layouts.  ARC version.
+   Copyright (C) 2002-2015 Free Software Foundation, Inc.
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
+#ifndef _SEMAPHORE_H
+# error "Never use <bits/semaphore.h> directly; include <semaphore.h> instead."
+#endif
+
+#define __SIZEOF_SEM_T	16
+
+/* Value returned if `sem_open' failed.  */
+#define SEM_FAILED      ((sem_t *) 0)
+
+typedef union
+{
+  char __size[__SIZEOF_SEM_T];
+  long int __align;
+} sem_t;
diff --git a/sysdeps/arc/nptl/pthread_spin_lock.c b/sysdeps/arc/nptl/pthread_spin_lock.c
new file mode 100644
index 000000000000..e9b723c37ff6
--- /dev/null
+++ b/sysdeps/arc/nptl/pthread_spin_lock.c
@@ -0,0 +1,24 @@
+/* pthread spin-lock implementation for ARC.
+   Copyright (C) 2005-2015 Free Software Foundation, Inc.
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
+#define SPIN_LOCK_READS_BETWEEN_CMPXCHG 1000
+
+/* We can't use the normal "#include <nptl/pthread_spin_lock.c>" because
+   it will resolve to this very file.  Using "sysdeps/.." as reference to the
+   top level directory does the job.  */
+#include <sysdeps/../nptl/pthread_spin_lock.c>
diff --git a/sysdeps/arc/nptl/pthreaddef.h b/sysdeps/arc/nptl/pthreaddef.h
new file mode 100644
index 000000000000..af0a8daa4f92
--- /dev/null
+++ b/sysdeps/arc/nptl/pthreaddef.h
@@ -0,0 +1,32 @@
+/* pthread machine parameter definitions, ARC version.
+   Copyright (C) 2002-2015 Free Software Foundation, Inc.
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
diff --git a/sysdeps/arc/nptl/tcb-offsets.sym b/sysdeps/arc/nptl/tcb-offsets.sym
new file mode 100644
index 000000000000..56950e0676ed
--- /dev/null
+++ b/sysdeps/arc/nptl/tcb-offsets.sym
@@ -0,0 +1,11 @@
+#include <sysdep.h>
+#include <tls.h>
+
+-- Derive offsets relative to the thread register.
+#define thread_offsetof(mem)	(long)(offsetof(struct pthread, mem) - sizeof(struct pthread))
+
+MULTIPLE_THREADS_OFFSET		offsetof (struct pthread, header.multiple_threads)
+TLS_PRE_TCB_SIZE		sizeof (struct pthread)
+TLS_TCB_SIZE            	sizeof(tcbhead_t)
+
+PTHREAD_TID			offsetof(struct pthread, tid)
diff --git a/sysdeps/arc/nptl/tls.h b/sysdeps/arc/nptl/tls.h
new file mode 100644
index 000000000000..0fa52b4afe37
--- /dev/null
+++ b/sysdeps/arc/nptl/tls.h
@@ -0,0 +1,151 @@
+/* Definition for thread-local data handling.  NPTL/ARC version.
+   Copyright (C) 2012-2015 Free Software Foundation, Inc.
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
+#ifndef _ARC_NPTL_TLS_H
+#define _ARC_NPTL_TLS_H	1
+
+#include <dl-sysdep.h>
+
+#ifndef __ASSEMBLER__
+# include <stdbool.h>
+# include <stddef.h>
+# include <stdint.h>
+
+#include <dl-dtv.h>
+
+/* Get system call information.  */
+# include <sysdep.h>
+
+/* The TLS blocks start right after the TCB.  */
+# define TLS_DTV_AT_TP	1
+# define TLS_TCB_AT_TP	0
+
+/* Get the thread descriptor definition.  */
+# include <nptl/descr.h>
+
+typedef struct
+{
+  dtv_t *dtv;
+  uintptr_t pointer_guard;
+} tcbhead_t;
+
+register struct pthread *__thread_self __asm__("r25");
+
+#define READ_THREAD_POINTER() ((void *) __thread_self)
+
+/* This is the size of the initial TCB.  */
+# define TLS_INIT_TCB_SIZE	sizeof (tcbhead_t)
+
+/* Alignment requirements for the initial TCB.  */
+# define TLS_INIT_TCB_ALIGN	__alignof__ (struct pthread)
+
+/* This is the size of the TCB.  */
+#ifndef TLS_TCB_SIZE
+# define TLS_TCB_SIZE		sizeof (tcbhead_t)
+#endif
+
+/* Alignment requirements for the TCB.  */
+# define TLS_TCB_ALIGN		__alignof__ (struct pthread)
+
+/* This is the size we need before TCB.  */
+# define TLS_PRE_TCB_SIZE	sizeof (struct pthread)
+
+/* Install the dtv pointer.  The pointer passed is to the element with
+   index -1 which contain the length.  */
+# define INSTALL_DTV(tcbp, dtvp) \
+  (((tcbhead_t *) (tcbp))->dtv = (dtvp) + 1)
+
+/* Install new dtv for current thread.  */
+# define INSTALL_NEW_DTV(dtv) \
+  (THREAD_DTV() = (dtv))
+
+/* Return dtv of given thread descriptor.  */
+# define GET_DTV(tcbp) \
+  (((tcbhead_t *) (tcbp))->dtv)
+
+/* Code to initially initialize the thread pointer.  */
+# define TLS_INIT_TP(tcbp)			\
+  ({                                            \
+	long result_var;			\
+	__builtin_set_thread_pointer(tcbp);     \
+	result_var = INTERNAL_SYSCALL (arc_settls, err, 1, (tcbp));	\
+	INTERNAL_SYSCALL_ERROR_P (result_var, err)			\
+	? "unknown error" : NULL;		\
+   })
+
+/* Value passed to 'clone' for initialization of the thread register.  */
+# define TLS_DEFINE_INIT_TP(tp, pd) void *tp = (pd) + 1
+
+/* Return the address of the dtv for the current thread.  */
+# define THREAD_DTV() \
+  (((tcbhead_t *) __builtin_thread_pointer ())->dtv)
+
+/* Return the thread descriptor for the current thread.  */
+# define THREAD_SELF \
+ ((struct pthread *)__builtin_thread_pointer () - 1)
+
+/* Magic for libthread_db to know how to do THREAD_SELF.  */
+# define DB_THREAD_SELF \
+  CONST_THREAD_AREA (32, sizeof (struct pthread))
+
+/* Access to data in the thread descriptor is easy.  */
+# define THREAD_GETMEM(descr, member) \
+  descr->member
+# define THREAD_GETMEM_NC(descr, member, idx) \
+  descr->member[idx]
+# define THREAD_SETMEM(descr, member, value) \
+  descr->member = (value)
+# define THREAD_SETMEM_NC(descr, member, idx, value) \
+  descr->member[idx] = (value)
+
+/* Get and set the global scope generation counter in struct pthread.  */
+#define THREAD_GSCOPE_FLAG_UNUSED 0
+#define THREAD_GSCOPE_FLAG_USED   1
+#define THREAD_GSCOPE_FLAG_WAIT   2
+#define THREAD_GSCOPE_RESET_FLAG() \
+  do									     \
+    { int __res								     \
+	= atomic_exchange_rel (&THREAD_SELF->header.gscope_flag,	     \
+			       THREAD_GSCOPE_FLAG_UNUSED);		     \
+      if (__res == THREAD_GSCOPE_FLAG_WAIT)				     \
+	lll_futex_wake (&THREAD_SELF->header.gscope_flag, 1, LLL_PRIVATE);   \
+    }									     \
+  while (0)
+#define THREAD_GSCOPE_SET_FLAG() \
+  do									     \
+    {									     \
+      THREAD_SELF->header.gscope_flag = THREAD_GSCOPE_FLAG_USED;	     \
+      atomic_write_barrier ();						     \
+    }									     \
+  while (0)
+#define THREAD_GSCOPE_WAIT() \
+  GL(dl_wait_lookup_done) ()
+
+#else
+
+# include <tcb-offsets.h>
+
+# r25 is dedicated TLS register for ARC
+.macro THREAD_SELF reg
+	# struct pthread is just ahead of TCB
+	sub     \reg, r25, TLS_PRE_TCB_SIZE
+.endm
+
+#endif /* __ASSEMBLER__ */
+
+#endif	/* tls.h */
diff --git a/sysdeps/arc/preconfigure b/sysdeps/arc/preconfigure
new file mode 100644
index 000000000000..8a24fcb18319
--- /dev/null
+++ b/sysdeps/arc/preconfigure
@@ -0,0 +1,6 @@
+case "$machine" in
+arc*)
+	base_machine=arc
+	machine=arc
+	;;
+esac
diff --git a/sysdeps/arc/s_fma.c b/sysdeps/arc/s_fma.c
new file mode 100644
index 000000000000..d9613fa67cef
--- /dev/null
+++ b/sysdeps/arc/s_fma.c
@@ -0,0 +1 @@
+#include <soft-fp/fmadf4.c>
diff --git a/sysdeps/arc/s_fmaf.c b/sysdeps/arc/s_fmaf.c
new file mode 100644
index 000000000000..aa5c9b2d9136
--- /dev/null
+++ b/sysdeps/arc/s_fmaf.c
@@ -0,0 +1 @@
+#include <soft-fp/fmasf4.c>
diff --git a/sysdeps/arc/setjmp.S b/sysdeps/arc/setjmp.S
new file mode 100644
index 000000000000..c05b5ff0cfaa
--- /dev/null
+++ b/sysdeps/arc/setjmp.S
@@ -0,0 +1,64 @@
+/* setjmp for ARC.
+   Copyright (C) 1991-2015 Free Software Foundation, Inc.
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
+;@ r0 = jump buffer into which regs will be saved
+ENTRY(setjmp)
+	b.d	__sigsetjmp
+	mov	r1, 1		; save signals
+END(setjmp)
+
+;@ r0 = jump buffer into which regs will be saved
+ENTRY(_setjmp)
+	b.d	__sigsetjmp
+	mov	r1, 0		; don't save signals
+END(_setjmp)
+libc_hidden_def(_setjmp)
+
+;@ r0 = jump buffer into which regs will be saved
+;@ r1 = do we need to save signals
+ENTRY(__sigsetjmp)
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
+	; make a note of where longjmp will return to.
+	; that will be right next to this setjmp call-site which will be
+	; contained in blink, since "C" caller of this routine will do
+	; a branch-n-link
+
+	st   blink, [r0,60]
+	b    __sigjmp_save
+
+END(__sigsetjmp)
+libc_hidden_def(__sigsetjmp)
diff --git a/sysdeps/arc/sfp-machine.h b/sysdeps/arc/sfp-machine.h
new file mode 100644
index 000000000000..95eefc187430
--- /dev/null
+++ b/sysdeps/arc/sfp-machine.h
@@ -0,0 +1,51 @@
+#define _FP_W_TYPE_SIZE		32
+#define _FP_W_TYPE		unsigned long
+#define _FP_WS_TYPE		signed long
+#define _FP_I_TYPE		long
+
+#define _FP_MUL_MEAT_S(R,X,Y)				\
+  _FP_MUL_MEAT_1_wide(_FP_WFRACBITS_S,R,X,Y,umul_ppmm)
+#define _FP_MUL_MEAT_D(R,X,Y)				\
+  _FP_MUL_MEAT_2_wide(_FP_WFRACBITS_D,R,X,Y,umul_ppmm)
+#define _FP_MUL_MEAT_Q(R,X,Y)				\
+  _FP_MUL_MEAT_4_wide(_FP_WFRACBITS_Q,R,X,Y,umul_ppmm)
+
+#define _FP_MUL_MEAT_DW_S(R,X,Y)				\
+  _FP_MUL_MEAT_DW_1_wide(_FP_WFRACBITS_S,R,X,Y,umul_ppmm)
+#define _FP_MUL_MEAT_DW_D(R,X,Y)				\
+  _FP_MUL_MEAT_DW_2_wide(_FP_WFRACBITS_D,R,X,Y,umul_ppmm)
+#define _FP_MUL_MEAT_DW_Q(R,X,Y)				\
+  _FP_MUL_MEAT_DW_4_wide(_FP_WFRACBITS_Q,R,X,Y,umul_ppmm)
+
+#define _FP_DIV_MEAT_S(R,X,Y)	_FP_DIV_MEAT_1_loop(S,R,X,Y)
+#define _FP_DIV_MEAT_D(R,X,Y)	_FP_DIV_MEAT_2_udiv(D,R,X,Y)
+#define _FP_DIV_MEAT_Q(R,X,Y)	_FP_DIV_MEAT_4_udiv(Q,R,X,Y)
+
+#define _FP_NANFRAC_S		((_FP_QNANBIT_S << 1) - 1)
+#define _FP_NANFRAC_D		((_FP_QNANBIT_D << 1) - 1), -1
+#define _FP_NANFRAC_Q		((_FP_QNANBIT_Q << 1) - 1), -1, -1, -1
+#define _FP_NANSIGN_S		0
+#define _FP_NANSIGN_D		0
+#define _FP_NANSIGN_Q		0
+
+#define _FP_KEEPNANFRACP 1
+#define _FP_QNANNEGATEDP 0
+
+/* This is arbitrarily taken from the PowerPC version.  */
+#define _FP_CHOOSENAN(fs, wc, R, X, Y, OP)			\
+  do {								\
+    if ((_FP_FRAC_HIGH_RAW_##fs(X) & _FP_QNANBIT_##fs)		\
+	&& !(_FP_FRAC_HIGH_RAW_##fs(Y) & _FP_QNANBIT_##fs))	\
+      {								\
+	R##_s = Y##_s;						\
+	_FP_FRAC_COPY_##wc(R,Y);				\
+      }								\
+    else							\
+      {								\
+	R##_s = X##_s;						\
+	_FP_FRAC_COPY_##wc(R,X);				\
+      }								\
+    R##_c = FP_CLS_NAN;						\
+  } while (0)
+
+#define _FP_TININESS_AFTER_ROUNDING 0
diff --git a/sysdeps/arc/sotruss-lib.c b/sysdeps/arc/sotruss-lib.c
new file mode 100644
index 000000000000..0c03bb7953d9
--- /dev/null
+++ b/sysdeps/arc/sotruss-lib.c
@@ -0,0 +1,51 @@
+/* Override generic sotruss-lib.c to define actual functions for ARC.
+   Copyright (C) 2015 Free Software Foundation, Inc.
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
+#define HAVE_ARCH_PLTENTER
+#define HAVE_ARCH_PLTEXIT
+
+#include <elf/sotruss-lib.c>
+
+ElfW(Addr)
+la_arc_gnu_pltenter (ElfW(Sym) *sym __attribute__ ((unused)),
+		       unsigned int ndx __attribute__ ((unused)),
+		       uintptr_t *refcook, uintptr_t *defcook,
+		       La_arc_regs *regs, unsigned int *flags,
+		       const char *symname, long int *framesizep)
+{
+  print_enter (refcook, defcook, symname,
+	       regs->lr_reg[0], regs->lr_reg[1], regs->lr_reg[2],
+	       *flags);
+
+  /* No need to copy anything, we will not need the parameters in any case.  */
+  *framesizep = 0;
+
+  return sym->st_value;
+}
+
+unsigned int
+la_arc_gnu_pltexit (ElfW(Sym) *sym, unsigned int ndx, uintptr_t *refcook,
+		      uintptr_t *defcook,
+		      const struct La_arc_regs *inregs,
+		      struct La_arc_retval *outregs, const char *symname)
+{
+  print_exit (refcook, defcook, symname, outregs->lrv_reg[0]);
+
+  return 0;
+}
diff --git a/sysdeps/arc/stackinfo.h b/sysdeps/arc/stackinfo.h
new file mode 100644
index 000000000000..7d8c38715bbf
--- /dev/null
+++ b/sysdeps/arc/stackinfo.h
@@ -0,0 +1,33 @@
+/* Stack environment definitions for ARC.
+   Copyright (C) 2012-2015 Free Software Foundation, Inc.
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
+/* This file contains a bit of information about the stack allocation
+   of the processor.  */
+
+#ifndef _STACKINFO_H
+#define _STACKINFO_H	1
+
+#include <elf.h>
+
+/* On ARC the stack grows down.  */
+#define _STACK_GROWS_DOWN	1
+
+/* Default to a non-executable stack.  */
+#define DEFAULT_STACK_PERMS (PF_R|PF_W)
+
+#endif	/* stackinfo.h */
diff --git a/sysdeps/arc/start.S b/sysdeps/arc/start.S
new file mode 100644
index 000000000000..911f7cd3b056
--- /dev/null
+++ b/sysdeps/arc/start.S
@@ -0,0 +1,81 @@
+/* Startup code for ARC
+   Copyright (C) 1995-2015 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   In addition to the permissions in the GNU Lesser General Public
+   License, the Free Software Foundation gives you unlimited
+   permission to link the compiled version of this file with other
+   programs, and to distribute those programs without any restriction
+   coming from the use of this file. (The GNU Lesser General Public
+   License restrictions do apply in other respects; for example, they
+   cover modification of the file, and distribution when not linked
+   into another program.)
+
+   Note that people who make modified versions of this file are not
+   obligated to grant this special exception for their modified
+   versions; it is their choice whether to do so. The GNU Lesser
+   General Public License gives permission to release a modified
+   version without this exception; this exception also makes it
+   possible to release a modified version which carries forward this
+   exception.
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
+/* When we enter this piece of code, the program stack looks like this:
+        argc            argument counter (integer)
+        argv[0]         program name (pointer)
+        argv[1...N]     program args (pointers)
+        argv[argc-1]    end of args (integer)
+	NULL
+        env[0...N]      environment variables (pointers)
+        NULL
+*/
+	.text
+	.align 4
+	.global _start
+	.type _start, at function
+_start:
+	mov	fp, 0
+	ld_s	r1, [sp]	; argc
+
+	mov_s	r5, r0		; rltd_fini
+	add_s	r2, sp, 4	; argv
+	and	sp, sp, -8
+	mov	r6, sp
+
+#ifdef SHARED
+	ld	r0, [pcl, @main at gotpc]
+	ld	r3, [pcl, @__libc_csu_init at gotpc]
+	ld	r4, [pcl, @__libc_csu_fini at gotpc]
+	bl	__libc_start_main at plt
+#else
+	mov_s	r0, main
+	mov_s	r3, __libc_csu_init
+	mov	r4, __libc_csu_fini
+	bl	__libc_start_main
+#endif
+	/* __libc_start_main (main, argc, argv, init, fini, rtld_fini, stack_end) */
+
+	/* Should never get here....  */
+	flag    1
+
+/* Define a symbol for the first piece of initialized data.  */
+	.data
+	.globl __data_start
+__data_start:
+	.long 0
+	.weak data_start
+	data_start = __data_start
diff --git a/sysdeps/arc/sysdep.h b/sysdeps/arc/sysdep.h
new file mode 100644
index 000000000000..d57f1c0c60a4
--- /dev/null
+++ b/sysdeps/arc/sysdep.h
@@ -0,0 +1,49 @@
+/* Assembler macros for ARC.
+   Copyright (C) 2015 Free Software Foundation, Inc.
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
+ * One weirness is ; is not newline but comment
+ * Although # is also for comment
+ */
+
+#define ASM_SIZE_DIRECTIVE(name) .size name,.-name
+
+#define ENTRY(name)						\
+    .align 4					ASM_LINE_SEP	\
+    .globl C_SYMBOL_NAME(name)			ASM_LINE_SEP	\
+    .type C_SYMBOL_NAME(name),%function		ASM_LINE_SEP	\
+  C_LABEL(name)					ASM_LINE_SEP	\
+    CALL_MCOUNT
+
+#undef  END
+#define END(name)						\
+  ASM_SIZE_DIRECTIVE(name)
+
+#ifdef SHARED
+#define PLTJMP(_x)	_x##@plt
+#else
+#define PLTJMP(_x)	_x
+#endif
+
+# define CALL_MCOUNT		/* Do nothing for now.  */
+
+#endif	/* __ASSEMBLER__ */
diff --git a/sysdeps/arc/tls-macros.h b/sysdeps/arc/tls-macros.h
new file mode 100644
index 000000000000..51855edef6e7
--- /dev/null
+++ b/sysdeps/arc/tls-macros.h
@@ -0,0 +1,29 @@
+/* Macros to support TLS testing in times of missing compiler support.  */
+
+/* For now */
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
diff --git a/sysdeps/arc/tst-audit.h b/sysdeps/arc/tst-audit.h
new file mode 100644
index 000000000000..16c7028529b4
--- /dev/null
+++ b/sysdeps/arc/tst-audit.h
@@ -0,0 +1,23 @@
+/* Definitions for testing PLT entry/exit auditing.  ARC version.
+   Copyright (C) 2009-2015 Free Software Foundation, Inc.
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
+#define pltenter la_arc_gnu_pltenter
+#define pltexit la_arc_gnu_pltexit
+#define La_regs La_arc_regs
+#define La_retval La_arc_retval
+#define int_retval lrv_reg[0]
diff --git a/sysdeps/unix/sysv/linux/arc/Implies b/sysdeps/unix/sysv/linux/arc/Implies
new file mode 100644
index 000000000000..7f739a0340b6
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/Implies
@@ -0,0 +1,3 @@
+arc/nptl
+unix/sysv/linux/generic/wordsize-32
+unix/sysv/linux/generic
diff --git a/sysdeps/unix/sysv/linux/arc/Makefile b/sysdeps/unix/sysv/linux/arc/Makefile
new file mode 100644
index 000000000000..c22425f08744
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/Makefile
@@ -0,0 +1,9 @@
+ifeq ($(subdir),stdlib)
+gen-as-const-headers += ucontext_i.sym
+endif
+
+ifeq ($(subdir),misc)
+# MIPS/Tile-style cacheflush routine
+sysdep_headers += sys/cachectl.h
+sysdep_routines += cacheflush
+endif
diff --git a/sysdeps/unix/sysv/linux/arc/Versions b/sysdeps/unix/sysv/linux/arc/Versions
new file mode 100644
index 000000000000..e42c85f57594
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/Versions
@@ -0,0 +1,6 @@
+libc {
+  GLIBC_2.21 {
+    _flush_cache;
+    cacheflush;
+  }
+}
diff --git a/sysdeps/unix/sysv/linux/arc/arch-fork.h b/sysdeps/unix/sysv/linux/arc/arch-fork.h
new file mode 100644
index 000000000000..3ab83156f5a5
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/arch-fork.h
@@ -0,0 +1,35 @@
+/* ARCH_FORK definition for Linux fork implementation.  ARC version.
+   Copyright (C) 2005-2015 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#include <sched.h>
+#include <signal.h>
+#include <sysdep.h>
+#include <tls.h>
+
+/* Argument 1 - Clone flags.
+            2 - Child stack pointer.
+	    3 - Parent tid pointer.
+	    4 - New TLS area pointer.
+	    5 - Child tid pointer. */
+
+/* clone syscall in kernel (ABI: CONFIG_CLONE_BACKWARDS) */
+
+#define ARCH_FORK() \
+  INLINE_SYSCALL (clone, 5,						\
+		  CLONE_CHILD_SETTID | CLONE_CHILD_CLEARTID | SIGCHLD,	\
+                  NULL, NULL, NULL, &THREAD_SELF->tid)
diff --git a/sysdeps/unix/sysv/linux/arc/bits/mman.h b/sysdeps/unix/sysv/linux/arc/bits/mman.h
new file mode 100644
index 000000000000..fa43ea427a5f
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/bits/mman.h
@@ -0,0 +1,42 @@
+/* Definitions for POSIX memory map interface.  Linux/ARC version.
+
+   Copyright (C) 1997-2015 Free Software Foundation, Inc.
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
+#ifndef _SYS_MMAN_H
+# error "Never use <bits/mman.h> directly; include <sys/mman.h> instead."
+#endif
+
+/* The following definitions basically come from the kernel headers.
+   But the kernel header is not namespace clean.  */
+
+/* These are Linux-specific.  */
+#ifdef __USE_MISC
+# define MAP_GROWSDOWN	0x00100		/* Stack-like segment.  */
+# define MAP_DENYWRITE	0x00800		/* ETXTBSY */
+# define MAP_EXECUTABLE	0x01000		/* Mark it as an executable.  */
+# define MAP_LOCKED	0x02000		/* Lock the mapping.  */
+# define MAP_NORESERVE	0x04000		/* Don't check for reservations.  */
+# define MAP_POPULATE	0x08000		/* Populate (prefault) pagetables.  */
+# define MAP_NONBLOCK	0x10000		/* Do not block on IO.  */
+# define MAP_STACK	0x20000		/* Allocation is for a stack.  */
+# define MAP_HUGETLB	0x40000		/* Create huge page mapping.  */
+#endif
+
+/* Include generic Linux declarations.  */
+#include <bits/mman-linux.h>
diff --git a/sysdeps/unix/sysv/linux/arc/bits/sigaction.h b/sysdeps/unix/sysv/linux/arc/bits/sigaction.h
new file mode 100644
index 000000000000..9795e9998855
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/bits/sigaction.h
@@ -0,0 +1,78 @@
+/* The proper definitions for Linux's sigaction.
+   Copyright (C) 1993-2016 Free Software Foundation, Inc.
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
+#ifndef _SIGNAL_H
+# error "Never include <bits/sigaction.h> directly; use <signal.h> instead."
+#endif
+
+/* Structure describing the action to be taken when a signal arrives.  */
+struct sigaction
+  {
+    /* Signal handler.  */
+#ifdef __USE_POSIX199309
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
+    unsigned long sa_flags;
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
+#if defined __USE_UNIX98 || defined __USE_MISC
+# define SA_ONSTACK   0x08000000 /* Use signal stack by using `sa_restorer'. */
+#endif
+#if defined __USE_UNIX98 || defined __USE_XOPEN2K8
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
diff --git a/sysdeps/unix/sysv/linux/arc/c++-types.data b/sysdeps/unix/sysv/linux/arc/c++-types.data
new file mode 100644
index 000000000000..303f4570c8ee
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/c++-types.data
@@ -0,0 +1,67 @@
+blkcnt64_t:x
+blkcnt_t:l
+blksize_t:i
+caddr_t:Pc
+clockid_t:i
+clock_t:l
+daddr_t:i
+dev_t:y
+fd_mask:l
+fsblkcnt64_t:y
+fsblkcnt_t:m
+fsfilcnt64_t:y
+fsfilcnt_t:m
+fsid_t:8__fsid_t
+gid_t:j
+id_t:j
+ino64_t:y
+ino_t:m
+int16_t:s
+int32_t:i
+int64_t:x
+int8_t:a
+intptr_t:i
+key_t:i
+loff_t:x
+mode_t:j
+nlink_t:j
+off64_t:x
+off_t:l
+pid_t:i
+pthread_attr_t:14pthread_attr_t
+pthread_barrier_t:17pthread_barrier_t
+pthread_barrierattr_t:21pthread_barrierattr_t
+pthread_cond_t:14pthread_cond_t
+pthread_condattr_t:18pthread_condattr_t
+pthread_key_t:j
+pthread_mutex_t:15pthread_mutex_t
+pthread_mutexattr_t:19pthread_mutexattr_t
+pthread_once_t:i
+pthread_rwlock_t:16pthread_rwlock_t
+pthread_rwlockattr_t:20pthread_rwlockattr_t
+pthread_spinlock_t:i
+pthread_t:m
+quad_t:x
+register_t:i
+rlim64_t:y
+rlim_t:m
+sigset_t:10__sigset_t
+size_t:j
+socklen_t:j
+ssize_t:i
+suseconds_t:l
+time_t:l
+u_char:h
+uid_t:j
+uint:j
+u_int:j
+u_int16_t:t
+u_int32_t:j
+u_int64_t:y
+u_int8_t:h
+ulong:m
+u_long:m
+u_quad_t:y
+useconds_t:j
+ushort:t
+u_short:t
diff --git a/sysdeps/unix/sysv/linux/arc/cacheflush.c b/sysdeps/unix/sysv/linux/arc/cacheflush.c
new file mode 100644
index 000000000000..9ea072a28650
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/cacheflush.c
@@ -0,0 +1,29 @@
+/* cacheflush system call for ARC Linux.
+   Copyright (C) 2015 Free Software Foundation, Inc.
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
index 000000000000..61c889bfbd60
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/clone.S
@@ -0,0 +1,97 @@
+/* clone() implementation for ARC.
+   Copyright (C) 2008-2015 Free Software Foundation, Inc.
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
+	; Setup TP register (since kernel doesn't do that)
+	and.f	0, r12, CLONE_SETTLS
+	mov.nz	r25, r9
+
+	; child jumps off to @fn with @arg as argument, and returns here
+	jl.d	[r10]
+	mov	r0, r11
+
+	; falls thru to _exit() with result from @fn (already in r0)
+	b	HIDDEN_JUMPTARGET(_exit)
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
diff --git a/sysdeps/unix/sysv/linux/arc/configure b/sysdeps/unix/sysv/linux/arc/configure
new file mode 100644
index 000000000000..f74fa7cb0259
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/configure
@@ -0,0 +1,4 @@
+# This file is generated from configure.in by Autoconf.  DO NOT EDIT!
+ # Local configure fragment for sysdeps/unix/sysv/linux/arc.
+
+arch_minimum_kernel=3.9.0
diff --git a/sysdeps/unix/sysv/linux/arc/configure.ac b/sysdeps/unix/sysv/linux/arc/configure.ac
new file mode 100644
index 000000000000..a9528032d32a
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/configure.ac
@@ -0,0 +1,4 @@
+GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
+# Local configure fragment for sysdeps/unix/sysv/linux/arc.
+
+arch_minimum_kernel=3.9.0
diff --git a/sysdeps/unix/sysv/linux/arc/kernel-features.h b/sysdeps/unix/sysv/linux/arc/kernel-features.h
new file mode 100644
index 000000000000..e78ee9dacbd2
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/kernel-features.h
@@ -0,0 +1,31 @@
+/* Set flags signalling availability of kernel features based on given
+   kernel version number.
+
+   Copyright (C) 2009-2015 Free Software Foundation, Inc.
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
+#include <linux/version.h>
+
+/* The minimum supported kernel version for ARC is 3.9,
+   guaranteeing many kernel features.  */
+
+#define __ASSUME_ACCEPT4_SYSCALL        1
+#define __ASSUME_RECVMMSG_SYSCALL       1
+#define __ASSUME_SENDMMSG_SYSCALL       1
+
+#include_next <kernel-features.h>
diff --git a/sysdeps/unix/sysv/linux/arc/ld.abilist b/sysdeps/unix/sysv/linux/arc/ld.abilist
new file mode 100644
index 000000000000..6001f2e98402
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/ld.abilist
@@ -0,0 +1,12 @@
+GLIBC_2.24
+ GLIBC_2.24 A
+ __libc_memalign F
+ __libc_stack_end D 0x4
+ __stack_chk_guard D 0x4
+ __tls_get_addr F
+ _dl_mcount F
+ _r_debug D 0x14
+ calloc F
+ free F
+ malloc F
+ realloc F
diff --git a/sysdeps/unix/sysv/linux/arc/ldconfig.h b/sysdeps/unix/sysv/linux/arc/ldconfig.h
new file mode 100644
index 000000000000..d5d3646f5b1d
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/ldconfig.h
@@ -0,0 +1,24 @@
+/* Copyright (C) 2001-2016 Free Software Foundation, Inc.
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
+#include <sysdeps/generic/ldconfig.h>
+
+#define SYSDEP_KNOWN_INTERPRETER_NAMES \
+  { "/lib/ld-linux.so.2", FLAG_ELF_LIBC6 },
+#define SYSDEP_KNOWN_LIBRARY_NAMES \
+  { "libc.so.6", FLAG_ELF_LIBC6 },	\
+  { "libm.so.6", FLAG_ELF_LIBC6 },
diff --git a/sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist b/sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
new file mode 100644
index 000000000000..0562003fff3c
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
@@ -0,0 +1,3 @@
+GLIBC_2.24
+ GLIBC_2.24 A
+ __ctype_get_mb_cur_max F
diff --git a/sysdeps/unix/sysv/linux/arc/libanl.abilist b/sysdeps/unix/sysv/linux/arc/libanl.abilist
new file mode 100644
index 000000000000..070f45aeac08
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libanl.abilist
@@ -0,0 +1,6 @@
+GLIBC_2.24
+ GLIBC_2.24 A
+ gai_cancel F
+ gai_error F
+ gai_suspend F
+ getaddrinfo_a F
diff --git a/sysdeps/unix/sysv/linux/arc/libc.abilist b/sysdeps/unix/sysv/linux/arc/libc.abilist
new file mode 100644
index 000000000000..2d8539f9aaf7
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libc.abilist
@@ -0,0 +1,2123 @@
+GLIBC_2.24
+ GLIBC_2.24 A
+ _Exit F
+ _IO_2_1_stderr_ D 0x98
+ _IO_2_1_stdin_ D 0x98
+ _IO_2_1_stdout_ D 0x98
+ _IO_adjust_column F
+ _IO_adjust_wcolumn F
+ _IO_default_doallocate F
+ _IO_default_finish F
+ _IO_default_pbackfail F
+ _IO_default_uflow F
+ _IO_default_xsgetn F
+ _IO_default_xsputn F
+ _IO_do_write F
+ _IO_doallocbuf F
+ _IO_fclose F
+ _IO_fdopen F
+ _IO_feof F
+ _IO_ferror F
+ _IO_fflush F
+ _IO_fgetpos F
+ _IO_fgetpos64 F
+ _IO_fgets F
+ _IO_file_attach F
+ _IO_file_close F
+ _IO_file_close_it F
+ _IO_file_doallocate F
+ _IO_file_finish F
+ _IO_file_fopen F
+ _IO_file_init F
+ _IO_file_jumps D 0x54
+ _IO_file_open F
+ _IO_file_overflow F
+ _IO_file_read F
+ _IO_file_seek F
+ _IO_file_seekoff F
+ _IO_file_setbuf F
+ _IO_file_stat F
+ _IO_file_sync F
+ _IO_file_underflow F
+ _IO_file_write F
+ _IO_file_xsputn F
+ _IO_flockfile F
+ _IO_flush_all F
+ _IO_flush_all_linebuffered F
+ _IO_fopen F
+ _IO_fprintf F
+ _IO_fputs F
+ _IO_fread F
+ _IO_free_backup_area F
+ _IO_free_wbackup_area F
+ _IO_fsetpos F
+ _IO_fsetpos64 F
+ _IO_ftell F
+ _IO_ftrylockfile F
+ _IO_funlockfile F
+ _IO_fwrite F
+ _IO_getc F
+ _IO_getline F
+ _IO_getline_info F
+ _IO_gets F
+ _IO_init F
+ _IO_init_marker F
+ _IO_init_wmarker F
+ _IO_iter_begin F
+ _IO_iter_end F
+ _IO_iter_file F
+ _IO_iter_next F
+ _IO_least_wmarker F
+ _IO_link_in F
+ _IO_list_all D 0x4
+ _IO_list_lock F
+ _IO_list_resetlock F
+ _IO_list_unlock F
+ _IO_marker_delta F
+ _IO_marker_difference F
+ _IO_padn F
+ _IO_peekc_locked F
+ _IO_popen F
+ _IO_printf F
+ _IO_proc_close F
+ _IO_proc_open F
+ _IO_putc F
+ _IO_puts F
+ _IO_remove_marker F
+ _IO_seekmark F
+ _IO_seekoff F
+ _IO_seekpos F
+ _IO_seekwmark F
+ _IO_setb F
+ _IO_setbuffer F
+ _IO_setvbuf F
+ _IO_sgetn F
+ _IO_sprintf F
+ _IO_sputbackc F
+ _IO_sputbackwc F
+ _IO_sscanf F
+ _IO_str_init_readonly F
+ _IO_str_init_static F
+ _IO_str_overflow F
+ _IO_str_pbackfail F
+ _IO_str_seekoff F
+ _IO_str_underflow F
+ _IO_sungetc F
+ _IO_sungetwc F
+ _IO_switch_to_get_mode F
+ _IO_switch_to_main_wget_area F
+ _IO_switch_to_wbackup_area F
+ _IO_switch_to_wget_mode F
+ _IO_un_link F
+ _IO_ungetc F
+ _IO_unsave_markers F
+ _IO_unsave_wmarkers F
+ _IO_vfprintf F
+ _IO_vfscanf F
+ _IO_vsprintf F
+ _IO_wdefault_doallocate F
+ _IO_wdefault_finish F
+ _IO_wdefault_pbackfail F
+ _IO_wdefault_uflow F
+ _IO_wdefault_xsgetn F
+ _IO_wdefault_xsputn F
+ _IO_wdo_write F
+ _IO_wdoallocbuf F
+ _IO_wfile_jumps D 0x54
+ _IO_wfile_overflow F
+ _IO_wfile_seekoff F
+ _IO_wfile_sync F
+ _IO_wfile_underflow F
+ _IO_wfile_xsputn F
+ _IO_wmarker_delta F
+ _IO_wsetb F
+ ___brk_addr D 0x4
+ __adddf3 F
+ __addsf3 F
+ __adjtimex F
+ __after_morecore_hook D 0x4
+ __argz_count F
+ __argz_next F
+ __argz_stringify F
+ __asprintf F
+ __asprintf_chk F
+ __assert F
+ __assert_fail F
+ __assert_perror_fail F
+ __backtrace F
+ __backtrace_symbols F
+ __backtrace_symbols_fd F
+ __bsd_getpgrp F
+ __bzero F
+ __check_rhosts_file D 0x4
+ __chk_fail F
+ __clone F
+ __close F
+ __cmsg_nxthdr F
+ __confstr_chk F
+ __connect F
+ __ctype_b_loc F
+ __ctype_get_mb_cur_max F
+ __ctype_tolower_loc F
+ __ctype_toupper_loc F
+ __curbrk D 0x4
+ __cxa_at_quick_exit F
+ __cxa_atexit F
+ __cxa_finalize F
+ __cxa_thread_atexit_impl F
+ __cyg_profile_func_enter F
+ __cyg_profile_func_exit F
+ __daylight D 0x4
+ __dcgettext F
+ __default_morecore F
+ __dgettext F
+ __divdf3 F
+ __divsf3 F
+ __dprintf_chk F
+ __dup2 F
+ __duplocale F
+ __endmntent F
+ __environ D 0x4
+ __eqdf2 F
+ __eqsf2 F
+ __errno_location F
+ __extendsfdf2 F
+ __fbufsize F
+ __fcntl F
+ __fdelt_chk F
+ __fdelt_warn F
+ __ffs F
+ __fgets_chk F
+ __fgets_unlocked_chk F
+ __fgetws_chk F
+ __fgetws_unlocked_chk F
+ __finite F
+ __finitef F
+ __finitel F
+ __fixdfdi F
+ __fixdfsi F
+ __fixsfdi F
+ __fixsfsi F
+ __fixunsdfdi F
+ __fixunsdfsi F
+ __fixunssfdi F
+ __fixunssfsi F
+ __flbf F
+ __floatdidf F
+ __floatdisf F
+ __floatsidf F
+ __floatsisf F
+ __floatundidf F
+ __floatundisf F
+ __floatunsidf F
+ __floatunsisf F
+ __fork F
+ __fpending F
+ __fprintf_chk F
+ __fpu_control D 0x4
+ __fpurge F
+ __fread_chk F
+ __fread_unlocked_chk F
+ __freadable F
+ __freading F
+ __free_hook D 0x4
+ __freelocale F
+ __fsetlocking F
+ __fwprintf_chk F
+ __fwritable F
+ __fwriting F
+ __fxstat F
+ __fxstat64 F
+ __fxstatat F
+ __fxstatat64 F
+ __gedf2 F
+ __gesf2 F
+ __getauxval F
+ __getcwd_chk F
+ __getdelim F
+ __getdomainname_chk F
+ __getgroups_chk F
+ __gethostname_chk F
+ __getlogin_r_chk F
+ __getmntent_r F
+ __getpagesize F
+ __getpgid F
+ __getpid F
+ __gets_chk F
+ __gettimeofday F
+ __getwd_chk F
+ __gmtime_r F
+ __gtdf2 F
+ __gtsf2 F
+ __h_errno_location F
+ __isalnum_l F
+ __isalpha_l F
+ __isascii_l F
+ __isblank_l F
+ __iscntrl_l F
+ __isctype F
+ __isdigit_l F
+ __isgraph_l F
+ __isinf F
+ __isinff F
+ __isinfl F
+ __islower_l F
+ __isnan F
+ __isnanf F
+ __isnanl F
+ __isoc99_fscanf F
+ __isoc99_fwscanf F
+ __isoc99_scanf F
+ __isoc99_sscanf F
+ __isoc99_swscanf F
+ __isoc99_vfscanf F
+ __isoc99_vfwscanf F
+ __isoc99_vscanf F
+ __isoc99_vsscanf F
+ __isoc99_vswscanf F
+ __isoc99_vwscanf F
+ __isoc99_wscanf F
+ __isprint_l F
+ __ispunct_l F
+ __isspace_l F
+ __isupper_l F
+ __iswalnum_l F
+ __iswalpha_l F
+ __iswblank_l F
+ __iswcntrl_l F
+ __iswctype F
+ __iswctype_l F
+ __iswdigit_l F
+ __iswgraph_l F
+ __iswlower_l F
+ __iswprint_l F
+ __iswpunct_l F
+ __iswspace_l F
+ __iswupper_l F
+ __iswxdigit_l F
+ __isxdigit_l F
+ __ivaliduser F
+ __key_decryptsession_pk_LOCAL D 0x4
+ __key_encryptsession_pk_LOCAL D 0x4
+ __key_gendes_LOCAL D 0x4
+ __ledf2 F
+ __lesf2 F
+ __libc_allocate_rtsig F
+ __libc_calloc F
+ __libc_current_sigrtmax F
+ __libc_current_sigrtmin F
+ __libc_free F
+ __libc_freeres F
+ __libc_init_first F
+ __libc_mallinfo F
+ __libc_malloc F
+ __libc_mallopt F
+ __libc_memalign F
+ __libc_pvalloc F
+ __libc_realloc F
+ __libc_sa_len F
+ __libc_start_main F
+ __libc_valloc F
+ __longjmp_chk F
+ __lseek F
+ __ltdf2 F
+ __ltsf2 F
+ __lxstat F
+ __lxstat64 F
+ __malloc_hook D 0x4
+ __malloc_initialize_hook D 0x4
+ __mbrlen F
+ __mbrtowc F
+ __mbsnrtowcs_chk F
+ __mbsrtowcs_chk F
+ __mbstowcs_chk F
+ __memalign_hook D 0x4
+ __memcpy_chk F
+ __memmove_chk F
+ __mempcpy F
+ __mempcpy_chk F
+ __mempcpy_small F
+ __memset_chk F
+ __monstartup F
+ __morecore D 0x4
+ __muldf3 F
+ __mulsf3 F
+ __nanosleep F
+ __nedf2 F
+ __negdf2 F
+ __negsf2 F
+ __nesf2 F
+ __newlocale F
+ __nl_langinfo_l F
+ __nss_configure_lookup F
+ __nss_database_lookup F
+ __nss_group_lookup F
+ __nss_hostname_digits_dots F
+ __nss_hosts_lookup F
+ __nss_next F
+ __nss_passwd_lookup F
+ __obstack_printf_chk F
+ __obstack_vprintf_chk F
+ __open F
+ __open64 F
+ __open64_2 F
+ __open_2 F
+ __openat64_2 F
+ __openat_2 F
+ __overflow F
+ __pipe F
+ __poll F
+ __poll_chk F
+ __posix_getopt F
+ __ppoll_chk F
+ __pread64 F
+ __pread64_chk F
+ __pread_chk F
+ __printf_chk F
+ __printf_fp F
+ __profile_frequency F
+ __progname D 0x4
+ __progname_full D 0x4
+ __ptsname_r_chk F
+ __pwrite64 F
+ __rawmemchr F
+ __rcmd_errstr D 0x4
+ __read F
+ __read_chk F
+ __readlink_chk F
+ __readlinkat_chk F
+ __realloc_hook D 0x4
+ __realpath_chk F
+ __recv_chk F
+ __recvfrom_chk F
+ __register_atfork F
+ __res_init F
+ __res_nclose F
+ __res_ninit F
+ __res_randomid F
+ __res_state F
+ __rpc_thread_createerr F
+ __rpc_thread_svc_fdset F
+ __rpc_thread_svc_max_pollfd F
+ __rpc_thread_svc_pollfd F
+ __sbrk F
+ __sched_cpualloc F
+ __sched_cpucount F
+ __sched_cpufree F
+ __sched_get_priority_max F
+ __sched_get_priority_min F
+ __sched_getparam F
+ __sched_getscheduler F
+ __sched_setscheduler F
+ __sched_yield F
+ __select F
+ __setmntent F
+ __setpgid F
+ __sigaction F
+ __sigaddset F
+ __sigdelset F
+ __sigismember F
+ __signbit F
+ __signbitf F
+ __sigpause F
+ __sigsetjmp F
+ __sigsuspend F
+ __snprintf_chk F
+ __sprintf_chk F
+ __stack_chk_fail F
+ __statfs F
+ __stpcpy F
+ __stpcpy_chk F
+ __stpcpy_small F
+ __stpncpy F
+ __stpncpy_chk F
+ __strcasecmp F
+ __strcasecmp_l F
+ __strcasestr F
+ __strcat_chk F
+ __strcoll_l F
+ __strcpy_chk F
+ __strcpy_small F
+ __strcspn_c1 F
+ __strcspn_c2 F
+ __strcspn_c3 F
+ __strdup F
+ __strerror_r F
+ __strfmon_l F
+ __strftime_l F
+ __strncasecmp_l F
+ __strncat_chk F
+ __strncpy_chk F
+ __strndup F
+ __strpbrk_c2 F
+ __strpbrk_c3 F
+ __strsep_1c F
+ __strsep_2c F
+ __strsep_3c F
+ __strsep_g F
+ __strspn_c1 F
+ __strspn_c2 F
+ __strspn_c3 F
+ __strtod_internal F
+ __strtod_l F
+ __strtof_internal F
+ __strtof_l F
+ __strtok_r F
+ __strtok_r_1c F
+ __strtol_internal F
+ __strtol_l F
+ __strtold_internal F
+ __strtold_l F
+ __strtoll_internal F
+ __strtoll_l F
+ __strtoul_internal F
+ __strtoul_l F
+ __strtoull_internal F
+ __strtoull_l F
+ __strverscmp F
+ __strxfrm_l F
+ __subdf3 F
+ __subsf3 F
+ __swprintf_chk F
+ __sysconf F
+ __syslog_chk F
+ __sysv_signal F
+ __timezone D 0x4
+ __toascii_l F
+ __tolower_l F
+ __toupper_l F
+ __towctrans F
+ __towctrans_l F
+ __towlower_l F
+ __towupper_l F
+ __truncdfsf2 F
+ __ttyname_r_chk F
+ __tzname D 0x8
+ __uflow F
+ __underflow F
+ __unorddf2 F
+ __unordsf2 F
+ __uselocale F
+ __vasprintf_chk F
+ __vdprintf_chk F
+ __vfork F
+ __vfprintf_chk F
+ __vfscanf F
+ __vfwprintf_chk F
+ __vprintf_chk F
+ __vsnprintf F
+ __vsnprintf_chk F
+ __vsprintf_chk F
+ __vsscanf F
+ __vswprintf_chk F
+ __vsyslog_chk F
+ __vwprintf_chk F
+ __wait F
+ __waitpid F
+ __wcpcpy_chk F
+ __wcpncpy_chk F
+ __wcrtomb_chk F
+ __wcscasecmp_l F
+ __wcscat_chk F
+ __wcscoll_l F
+ __wcscpy_chk F
+ __wcsftime_l F
+ __wcsncasecmp_l F
+ __wcsncat_chk F
+ __wcsncpy_chk F
+ __wcsnrtombs_chk F
+ __wcsrtombs_chk F
+ __wcstod_internal F
+ __wcstod_l F
+ __wcstof_internal F
+ __wcstof_l F
+ __wcstol_internal F
+ __wcstol_l F
+ __wcstold_internal F
+ __wcstold_l F
+ __wcstoll_internal F
+ __wcstoll_l F
+ __wcstombs_chk F
+ __wcstoul_internal F
+ __wcstoul_l F
+ __wcstoull_internal F
+ __wcstoull_l F
+ __wcsxfrm_l F
+ __wctomb_chk F
+ __wctrans_l F
+ __wctype_l F
+ __wmemcpy_chk F
+ __wmemmove_chk F
+ __wmempcpy_chk F
+ __wmemset_chk F
+ __woverflow F
+ __wprintf_chk F
+ __write F
+ __wuflow F
+ __wunderflow F
+ __xmknod F
+ __xmknodat F
+ __xpg_basename F
+ __xpg_sigpause F
+ __xpg_strerror_r F
+ __xstat F
+ __xstat64 F
+ _authenticate F
+ _dl_mcount_wrapper F
+ _dl_mcount_wrapper_check F
+ _environ D 0x4
+ _exit F
+ _flush_cache F
+ _flushlbf F
+ _libc_intl_domainname D 0x5
+ _longjmp F
+ _mcleanup F
+ _mcount F
+ _nl_default_dirname D 0x12
+ _nl_domain_bindings D 0x4
+ _nl_msg_cat_cntr D 0x4
+ _null_auth D 0xc
+ _obstack_allocated_p F
+ _obstack_begin F
+ _obstack_begin_1 F
+ _obstack_free F
+ _obstack_memory_used F
+ _obstack_newchunk F
+ _res D 0x200
+ _res_hconf D 0x30
+ _rpc_dtablesize F
+ _seterr_reply F
+ _setjmp F
+ _sys_errlist D 0x21c
+ _sys_nerr D 0x4
+ _sys_siglist D 0x104
+ _tolower F
+ _toupper F
+ a64l F
+ abort F
+ abs F
+ accept F
+ accept4 F
+ access F
+ acct F
+ addmntent F
+ addseverity F
+ adjtime F
+ adjtimex F
+ advance F
+ alarm F
+ aligned_alloc F
+ alphasort F
+ alphasort64 F
+ argp_err_exit_status D 0x4
+ argp_error F
+ argp_failure F
+ argp_help F
+ argp_parse F
+ argp_program_bug_address D 0x4
+ argp_program_version D 0x4
+ argp_program_version_hook D 0x4
+ argp_state_help F
+ argp_usage F
+ argz_add F
+ argz_add_sep F
+ argz_append F
+ argz_count F
+ argz_create F
+ argz_create_sep F
+ argz_delete F
+ argz_extract F
+ argz_insert F
+ argz_next F
+ argz_replace F
+ argz_stringify F
+ asctime F
+ asctime_r F
+ asprintf F
+ atof F
+ atoi F
+ atol F
+ atoll F
+ authdes_create F
+ authdes_getucred F
+ authdes_pk_create F
+ authnone_create F
+ authunix_create F
+ authunix_create_default F
+ backtrace F
+ backtrace_symbols F
+ backtrace_symbols_fd F
+ basename F
+ bcmp F
+ bcopy F
+ bdflush F
+ bind F
+ bind_textdomain_codeset F
+ bindresvport F
+ bindtextdomain F
+ brk F
+ bsd_signal F
+ bsearch F
+ btowc F
+ bzero F
+ c16rtomb F
+ c32rtomb F
+ cacheflush F
+ calloc F
+ callrpc F
+ canonicalize_file_name F
+ capget F
+ capset F
+ catclose F
+ catgets F
+ catopen F
+ cbc_crypt F
+ cfgetispeed F
+ cfgetospeed F
+ cfmakeraw F
+ cfree F
+ cfsetispeed F
+ cfsetospeed F
+ cfsetspeed F
+ chdir F
+ chflags F
+ chmod F
+ chown F
+ chroot F
+ clearenv F
+ clearerr F
+ clearerr_unlocked F
+ clnt_broadcast F
+ clnt_create F
+ clnt_pcreateerror F
+ clnt_perrno F
+ clnt_perror F
+ clnt_spcreateerror F
+ clnt_sperrno F
+ clnt_sperror F
+ clntraw_create F
+ clnttcp_create F
+ clntudp_bufcreate F
+ clntudp_create F
+ clntunix_create F
+ clock F
+ clock_adjtime F
+ clock_getcpuclockid F
+ clock_getres F
+ clock_gettime F
+ clock_nanosleep F
+ clock_settime F
+ clone F
+ close F
+ closedir F
+ closelog F
+ confstr F
+ connect F
+ copysign F
+ copysignf F
+ copysignl F
+ creat F
+ creat64 F
+ create_module F
+ ctermid F
+ ctime F
+ ctime_r F
+ cuserid F
+ daemon F
+ daylight D 0x4
+ dcgettext F
+ dcngettext F
+ delete_module F
+ des_setparity F
+ dgettext F
+ difftime F
+ dirfd F
+ dirname F
+ div F
+ dl_iterate_phdr F
+ dngettext F
+ dprintf F
+ drand48 F
+ drand48_r F
+ dup F
+ dup2 F
+ dup3 F
+ duplocale F
+ dysize F
+ eaccess F
+ ecb_crypt F
+ ecvt F
+ ecvt_r F
+ endaliasent F
+ endfsent F
+ endgrent F
+ endhostent F
+ endmntent F
+ endnetent F
+ endnetgrent F
+ endprotoent F
+ endpwent F
+ endrpcent F
+ endservent F
+ endsgent F
+ endspent F
+ endttyent F
+ endusershell F
+ endutent F
+ endutxent F
+ environ D 0x4
+ envz_add F
+ envz_entry F
+ envz_get F
+ envz_merge F
+ envz_remove F
+ envz_strip F
+ epoll_create F
+ epoll_create1 F
+ epoll_ctl F
+ epoll_pwait F
+ epoll_wait F
+ erand48 F
+ erand48_r F
+ err F
+ error F
+ error_at_line F
+ error_message_count D 0x4
+ error_one_per_line D 0x4
+ error_print_progname D 0x4
+ errx F
+ ether_aton F
+ ether_aton_r F
+ ether_hostton F
+ ether_line F
+ ether_ntoa F
+ ether_ntoa_r F
+ ether_ntohost F
+ euidaccess F
+ eventfd F
+ eventfd_read F
+ eventfd_write F
+ execl F
+ execle F
+ execlp F
+ execv F
+ execve F
+ execvp F
+ execvpe F
+ exit F
+ faccessat F
+ fallocate F
+ fallocate64 F
+ fanotify_init F
+ fanotify_mark F
+ fattach F
+ fchdir F
+ fchflags F
+ fchmod F
+ fchmodat F
+ fchown F
+ fchownat F
+ fclose F
+ fcloseall F
+ fcntl F
+ fcvt F
+ fcvt_r F
+ fdatasync F
+ fdetach F
+ fdopen F
+ fdopendir F
+ feof F
+ feof_unlocked F
+ ferror F
+ ferror_unlocked F
+ fexecve F
+ fflush F
+ fflush_unlocked F
+ ffs F
+ ffsl F
+ ffsll F
+ fgetc F
+ fgetc_unlocked F
+ fgetgrent F
+ fgetgrent_r F
+ fgetpos F
+ fgetpos64 F
+ fgetpwent F
+ fgetpwent_r F
+ fgets F
+ fgets_unlocked F
+ fgetsgent F
+ fgetsgent_r F
+ fgetspent F
+ fgetspent_r F
+ fgetwc F
+ fgetwc_unlocked F
+ fgetws F
+ fgetws_unlocked F
+ fgetxattr F
+ fileno F
+ fileno_unlocked F
+ finite F
+ finitef F
+ finitel F
+ flistxattr F
+ flock F
+ flockfile F
+ fmemopen F
+ fmtmsg F
+ fnmatch F
+ fopen F
+ fopen64 F
+ fopencookie F
+ fork F
+ fpathconf F
+ fprintf F
+ fputc F
+ fputc_unlocked F
+ fputs F
+ fputs_unlocked F
+ fputwc F
+ fputwc_unlocked F
+ fputws F
+ fputws_unlocked F
+ fread F
+ fread_unlocked F
+ free F
+ freeaddrinfo F
+ freeifaddrs F
+ freelocale F
+ fremovexattr F
+ freopen F
+ freopen64 F
+ frexp F
+ frexpf F
+ frexpl F
+ fscanf F
+ fseek F
+ fseeko F
+ fseeko64 F
+ fsetpos F
+ fsetpos64 F
+ fsetxattr F
+ fstatfs F
+ fstatfs64 F
+ fstatvfs F
+ fstatvfs64 F
+ fsync F
+ ftell F
+ ftello F
+ ftello64 F
+ ftime F
+ ftok F
+ ftruncate F
+ ftruncate64 F
+ ftrylockfile F
+ fts_children F
+ fts_close F
+ fts_open F
+ fts_read F
+ fts_set F
+ ftw F
+ ftw64 F
+ funlockfile F
+ futimens F
+ futimes F
+ futimesat F
+ fwide F
+ fwprintf F
+ fwrite F
+ fwrite_unlocked F
+ fwscanf F
+ gai_strerror F
+ gcvt F
+ get_avphys_pages F
+ get_current_dir_name F
+ get_kernel_syms F
+ get_myaddress F
+ get_nprocs F
+ get_nprocs_conf F
+ get_phys_pages F
+ getaddrinfo F
+ getaliasbyname F
+ getaliasbyname_r F
+ getaliasent F
+ getaliasent_r F
+ getauxval F
+ getc F
+ getc_unlocked F
+ getchar F
+ getchar_unlocked F
+ getcontext F
+ getcwd F
+ getdate F
+ getdate_err D 0x4
+ getdate_r F
+ getdelim F
+ getdirentries F
+ getdirentries64 F
+ getdomainname F
+ getdtablesize F
+ getegid F
+ getenv F
+ geteuid F
+ getfsent F
+ getfsfile F
+ getfsspec F
+ getgid F
+ getgrent F
+ getgrent_r F
+ getgrgid F
+ getgrgid_r F
+ getgrnam F
+ getgrnam_r F
+ getgrouplist F
+ getgroups F
+ gethostbyaddr F
+ gethostbyaddr_r F
+ gethostbyname F
+ gethostbyname2 F
+ gethostbyname2_r F
+ gethostbyname_r F
+ gethostent F
+ gethostent_r F
+ gethostid F
+ gethostname F
+ getifaddrs F
+ getipv4sourcefilter F
+ getitimer F
+ getline F
+ getloadavg F
+ getlogin F
+ getlogin_r F
+ getmntent F
+ getmntent_r F
+ getmsg F
+ getnameinfo F
+ getnetbyaddr F
+ getnetbyaddr_r F
+ getnetbyname F
+ getnetbyname_r F
+ getnetent F
+ getnetent_r F
+ getnetgrent F
+ getnetgrent_r F
+ getnetname F
+ getopt F
+ getopt_long F
+ getopt_long_only F
+ getpagesize F
+ getpass F
+ getpeername F
+ getpgid F
+ getpgrp F
+ getpid F
+ getpmsg F
+ getppid F
+ getpriority F
+ getprotobyname F
+ getprotobyname_r F
+ getprotobynumber F
+ getprotobynumber_r F
+ getprotoent F
+ getprotoent_r F
+ getpt F
+ getpublickey F
+ getpw F
+ getpwent F
+ getpwent_r F
+ getpwnam F
+ getpwnam_r F
+ getpwuid F
+ getpwuid_r F
+ getresgid F
+ getresuid F
+ getrlimit F
+ getrlimit64 F
+ getrpcbyname F
+ getrpcbyname_r F
+ getrpcbynumber F
+ getrpcbynumber_r F
+ getrpcent F
+ getrpcent_r F
+ getrpcport F
+ getrusage F
+ gets F
+ getsecretkey F
+ getservbyname F
+ getservbyname_r F
+ getservbyport F
+ getservbyport_r F
+ getservent F
+ getservent_r F
+ getsgent F
+ getsgent_r F
+ getsgnam F
+ getsgnam_r F
+ getsid F
+ getsockname F
+ getsockopt F
+ getsourcefilter F
+ getspent F
+ getspent_r F
+ getspnam F
+ getspnam_r F
+ getsubopt F
+ gettext F
+ gettimeofday F
+ getttyent F
+ getttynam F
+ getuid F
+ getusershell F
+ getutent F
+ getutent_r F
+ getutid F
+ getutid_r F
+ getutline F
+ getutline_r F
+ getutmp F
+ getutmpx F
+ getutxent F
+ getutxid F
+ getutxline F
+ getw F
+ getwc F
+ getwc_unlocked F
+ getwchar F
+ getwchar_unlocked F
+ getwd F
+ getxattr F
+ glob F
+ glob64 F
+ glob_pattern_p F
+ globfree F
+ globfree64 F
+ gmtime F
+ gmtime_r F
+ gnu_dev_major F
+ gnu_dev_makedev F
+ gnu_dev_minor F
+ gnu_get_libc_release F
+ gnu_get_libc_version F
+ grantpt F
+ group_member F
+ gsignal F
+ gtty F
+ h_errlist D 0x14
+ h_nerr D 0x4
+ hasmntopt F
+ hcreate F
+ hcreate_r F
+ hdestroy F
+ hdestroy_r F
+ herror F
+ host2netname F
+ hsearch F
+ hsearch_r F
+ hstrerror F
+ htonl F
+ htons F
+ iconv F
+ iconv_close F
+ iconv_open F
+ if_freenameindex F
+ if_indextoname F
+ if_nameindex F
+ if_nametoindex F
+ imaxabs F
+ imaxdiv F
+ in6addr_any D 0x10
+ in6addr_loopback D 0x10
+ index F
+ inet6_opt_append F
+ inet6_opt_find F
+ inet6_opt_finish F
+ inet6_opt_get_val F
+ inet6_opt_init F
+ inet6_opt_next F
+ inet6_opt_set_val F
+ inet6_option_alloc F
+ inet6_option_append F
+ inet6_option_find F
+ inet6_option_init F
+ inet6_option_next F
+ inet6_option_space F
+ inet6_rth_add F
+ inet6_rth_getaddr F
+ inet6_rth_init F
+ inet6_rth_reverse F
+ inet6_rth_segments F
+ inet6_rth_space F
+ inet_addr F
+ inet_aton F
+ inet_lnaof F
+ inet_makeaddr F
+ inet_netof F
+ inet_network F
+ inet_nsap_addr F
+ inet_nsap_ntoa F
+ inet_ntoa F
+ inet_ntop F
+ inet_pton F
+ init_module F
+ initgroups F
+ initstate F
+ initstate_r F
+ innetgr F
+ inotify_add_watch F
+ inotify_init F
+ inotify_init1 F
+ inotify_rm_watch F
+ insque F
+ ioctl F
+ iruserok F
+ iruserok_af F
+ isalnum F
+ isalnum_l F
+ isalpha F
+ isalpha_l F
+ isascii F
+ isastream F
+ isatty F
+ isblank F
+ isblank_l F
+ iscntrl F
+ iscntrl_l F
+ isctype F
+ isdigit F
+ isdigit_l F
+ isfdtype F
+ isgraph F
+ isgraph_l F
+ isinf F
+ isinff F
+ isinfl F
+ islower F
+ islower_l F
+ isnan F
+ isnanf F
+ isnanl F
+ isprint F
+ isprint_l F
+ ispunct F
+ ispunct_l F
+ isspace F
+ isspace_l F
+ isupper F
+ isupper_l F
+ iswalnum F
+ iswalnum_l F
+ iswalpha F
+ iswalpha_l F
+ iswblank F
+ iswblank_l F
+ iswcntrl F
+ iswcntrl_l F
+ iswctype F
+ iswctype_l F
+ iswdigit F
+ iswdigit_l F
+ iswgraph F
+ iswgraph_l F
+ iswlower F
+ iswlower_l F
+ iswprint F
+ iswprint_l F
+ iswpunct F
+ iswpunct_l F
+ iswspace F
+ iswspace_l F
+ iswupper F
+ iswupper_l F
+ iswxdigit F
+ iswxdigit_l F
+ isxdigit F
+ isxdigit_l F
+ jrand48 F
+ jrand48_r F
+ key_decryptsession F
+ key_decryptsession_pk F
+ key_encryptsession F
+ key_encryptsession_pk F
+ key_gendes F
+ key_get_conv F
+ key_secretkey_is_set F
+ key_setnet F
+ key_setsecret F
+ kill F
+ killpg F
+ klogctl F
+ l64a F
+ labs F
+ lchmod F
+ lchown F
+ lckpwdf F
+ lcong48 F
+ lcong48_r F
+ ldexp F
+ ldexpf F
+ ldexpl F
+ ldiv F
+ lfind F
+ lgetxattr F
+ link F
+ linkat F
+ listen F
+ listxattr F
+ llabs F
+ lldiv F
+ llistxattr F
+ llseek F
+ loc1 D 0x4
+ loc2 D 0x4
+ localeconv F
+ localtime F
+ localtime_r F
+ lockf F
+ lockf64 F
+ locs D 0x4
+ longjmp F
+ lrand48 F
+ lrand48_r F
+ lremovexattr F
+ lsearch F
+ lseek F
+ lseek64 F
+ lsetxattr F
+ lutimes F
+ madvise F
+ makecontext F
+ mallinfo F
+ malloc F
+ malloc_get_state F
+ malloc_info F
+ malloc_set_state F
+ malloc_stats F
+ malloc_trim F
+ malloc_usable_size F
+ mallopt F
+ mallwatch D 0x4
+ mblen F
+ mbrlen F
+ mbrtoc16 F
+ mbrtoc32 F
+ mbrtowc F
+ mbsinit F
+ mbsnrtowcs F
+ mbsrtowcs F
+ mbstowcs F
+ mbtowc F
+ mcheck F
+ mcheck_check_all F
+ mcheck_pedantic F
+ memalign F
+ memccpy F
+ memchr F
+ memcmp F
+ memcpy F
+ memfrob F
+ memmem F
+ memmove F
+ mempcpy F
+ memrchr F
+ memset F
+ mincore F
+ mkdir F
+ mkdirat F
+ mkdtemp F
+ mkfifo F
+ mkfifoat F
+ mkostemp F
+ mkostemp64 F
+ mkostemps F
+ mkostemps64 F
+ mkstemp F
+ mkstemp64 F
+ mkstemps F
+ mkstemps64 F
+ mktemp F
+ mktime F
+ mlock F
+ mlockall F
+ mmap F
+ mmap64 F
+ modf F
+ modff F
+ modfl F
+ moncontrol F
+ monstartup F
+ mount F
+ mprobe F
+ mprotect F
+ mrand48 F
+ mrand48_r F
+ mremap F
+ msgctl F
+ msgget F
+ msgrcv F
+ msgsnd F
+ msync F
+ mtrace F
+ munlock F
+ munlockall F
+ munmap F
+ muntrace F
+ name_to_handle_at F
+ nanosleep F
+ netname2host F
+ netname2user F
+ newlocale F
+ nfsservctl F
+ nftw F
+ nftw64 F
+ ngettext F
+ nice F
+ nl_langinfo F
+ nl_langinfo_l F
+ nrand48 F
+ nrand48_r F
+ ntohl F
+ ntohs F
+ ntp_adjtime F
+ ntp_gettime F
+ ntp_gettimex F
+ obstack_alloc_failed_handler D 0x4
+ obstack_exit_failure D 0x4
+ obstack_free F
+ obstack_printf F
+ obstack_vprintf F
+ on_exit F
+ open F
+ open64 F
+ open_by_handle_at F
+ open_memstream F
+ open_wmemstream F
+ openat F
+ openat64 F
+ opendir F
+ openlog F
+ optarg D 0x4
+ opterr D 0x4
+ optind D 0x4
+ optopt D 0x4
+ parse_printf_format F
+ passwd2des F
+ pathconf F
+ pause F
+ pclose F
+ perror F
+ personality F
+ pipe F
+ pipe2 F
+ pivot_root F
+ pmap_getmaps F
+ pmap_getport F
+ pmap_rmtcall F
+ pmap_set F
+ pmap_unset F
+ poll F
+ popen F
+ posix_fadvise F
+ posix_fadvise64 F
+ posix_fallocate F
+ posix_fallocate64 F
+ posix_madvise F
+ posix_memalign F
+ posix_openpt F
+ posix_spawn F
+ posix_spawn_file_actions_addclose F
+ posix_spawn_file_actions_adddup2 F
+ posix_spawn_file_actions_addopen F
+ posix_spawn_file_actions_destroy F
+ posix_spawn_file_actions_init F
+ posix_spawnattr_destroy F
+ posix_spawnattr_getflags F
+ posix_spawnattr_getpgroup F
+ posix_spawnattr_getschedparam F
+ posix_spawnattr_getschedpolicy F
+ posix_spawnattr_getsigdefault F
+ posix_spawnattr_getsigmask F
+ posix_spawnattr_init F
+ posix_spawnattr_setflags F
+ posix_spawnattr_setpgroup F
+ posix_spawnattr_setschedparam F
+ posix_spawnattr_setschedpolicy F
+ posix_spawnattr_setsigdefault F
+ posix_spawnattr_setsigmask F
+ posix_spawnp F
+ ppoll F
+ prctl F
+ pread F
+ pread64 F
+ preadv F
+ preadv64 F
+ printf F
+ printf_size F
+ printf_size_info F
+ prlimit F
+ prlimit64 F
+ process_vm_readv F
+ process_vm_writev F
+ profil F
+ program_invocation_name D 0x4
+ program_invocation_short_name D 0x4
+ pselect F
+ psiginfo F
+ psignal F
+ pthread_attr_destroy F
+ pthread_attr_getdetachstate F
+ pthread_attr_getinheritsched F
+ pthread_attr_getschedparam F
+ pthread_attr_getschedpolicy F
+ pthread_attr_getscope F
+ pthread_attr_init F
+ pthread_attr_setdetachstate F
+ pthread_attr_setinheritsched F
+ pthread_attr_setschedparam F
+ pthread_attr_setschedpolicy F
+ pthread_attr_setscope F
+ pthread_cond_broadcast F
+ pthread_cond_destroy F
+ pthread_cond_init F
+ pthread_cond_signal F
+ pthread_cond_timedwait F
+ pthread_cond_wait F
+ pthread_condattr_destroy F
+ pthread_condattr_init F
+ pthread_equal F
+ pthread_exit F
+ pthread_getschedparam F
+ pthread_mutex_destroy F
+ pthread_mutex_init F
+ pthread_mutex_lock F
+ pthread_mutex_unlock F
+ pthread_self F
+ pthread_setcancelstate F
+ pthread_setcanceltype F
+ pthread_setschedparam F
+ ptrace F
+ ptsname F
+ ptsname_r F
+ putc F
+ putc_unlocked F
+ putchar F
+ putchar_unlocked F
+ putenv F
+ putgrent F
+ putmsg F
+ putpmsg F
+ putpwent F
+ puts F
+ putsgent F
+ putspent F
+ pututline F
+ pututxline F
+ putw F
+ putwc F
+ putwc_unlocked F
+ putwchar F
+ putwchar_unlocked F
+ pvalloc F
+ pwrite F
+ pwrite64 F
+ pwritev F
+ pwritev64 F
+ qecvt F
+ qecvt_r F
+ qfcvt F
+ qfcvt_r F
+ qgcvt F
+ qsort F
+ qsort_r F
+ query_module F
+ quick_exit F
+ quotactl F
+ raise F
+ rand F
+ rand_r F
+ random F
+ random_r F
+ rawmemchr F
+ rcmd F
+ rcmd_af F
+ re_comp F
+ re_compile_fastmap F
+ re_compile_pattern F
+ re_exec F
+ re_match F
+ re_match_2 F
+ re_search F
+ re_search_2 F
+ re_set_registers F
+ re_set_syntax F
+ re_syntax_options D 0x4
+ read F
+ readahead F
+ readdir F
+ readdir64 F
+ readdir64_r F
+ readdir_r F
+ readlink F
+ readlinkat F
+ readv F
+ realloc F
+ realpath F
+ reboot F
+ recv F
+ recvfrom F
+ recvmmsg F
+ recvmsg F
+ regcomp F
+ regerror F
+ regexec F
+ regfree F
+ register_printf_function F
+ register_printf_modifier F
+ register_printf_specifier F
+ register_printf_type F
+ registerrpc F
+ remap_file_pages F
+ remove F
+ removexattr F
+ remque F
+ rename F
+ renameat F
+ revoke F
+ rewind F
+ rewinddir F
+ rexec F
+ rexec_af F
+ rexecoptions D 0x4
+ rindex F
+ rmdir F
+ rpc_createerr D 0x10
+ rpmatch F
+ rresvport F
+ rresvport_af F
+ rtime F
+ ruserok F
+ ruserok_af F
+ ruserpass F
+ sbrk F
+ scalbn F
+ scalbnf F
+ scalbnl F
+ scandir F
+ scandir64 F
+ scandirat F
+ scandirat64 F
+ scanf F
+ sched_get_priority_max F
+ sched_get_priority_min F
+ sched_getaffinity F
+ sched_getcpu F
+ sched_getparam F
+ sched_getscheduler F
+ sched_rr_get_interval F
+ sched_setaffinity F
+ sched_setparam F
+ sched_setscheduler F
+ sched_yield F
+ secure_getenv F
+ seed48 F
+ seed48_r F
+ seekdir F
+ select F
+ semctl F
+ semget F
+ semop F
+ semtimedop F
+ send F
+ sendfile F
+ sendfile64 F
+ sendmmsg F
+ sendmsg F
+ sendto F
+ setaliasent F
+ setbuf F
+ setbuffer F
+ setcontext F
+ setdomainname F
+ setegid F
+ setenv F
+ seteuid F
+ setfsent F
+ setfsgid F
+ setfsuid F
+ setgid F
+ setgrent F
+ setgroups F
+ sethostent F
+ sethostid F
+ sethostname F
+ setipv4sourcefilter F
+ setitimer F
+ setjmp F
+ setlinebuf F
+ setlocale F
+ setlogin F
+ setlogmask F
+ setmntent F
+ setnetent F
+ setnetgrent F
+ setns F
+ setpgid F
+ setpgrp F
+ setpriority F
+ setprotoent F
+ setpwent F
+ setregid F
+ setresgid F
+ setresuid F
+ setreuid F
+ setrlimit F
+ setrlimit64 F
+ setrpcent F
+ setservent F
+ setsgent F
+ setsid F
+ setsockopt F
+ setsourcefilter F
+ setspent F
+ setstate F
+ setstate_r F
+ settimeofday F
+ setttyent F
+ setuid F
+ setusershell F
+ setutent F
+ setutxent F
+ setvbuf F
+ setxattr F
+ sgetsgent F
+ sgetsgent_r F
+ sgetspent F
+ sgetspent_r F
+ shmat F
+ shmctl F
+ shmdt F
+ shmget F
+ shutdown F
+ sigaction F
+ sigaddset F
+ sigaltstack F
+ sigandset F
+ sigblock F
+ sigdelset F
+ sigemptyset F
+ sigfillset F
+ siggetmask F
+ sighold F
+ sigignore F
+ siginterrupt F
+ sigisemptyset F
+ sigismember F
+ siglongjmp F
+ signal F
+ signalfd F
+ sigorset F
+ sigpause F
+ sigpending F
+ sigprocmask F
+ sigqueue F
+ sigrelse F
+ sigreturn F
+ sigset F
+ sigsetmask F
+ sigstack F
+ sigsuspend F
+ sigtimedwait F
+ sigwait F
+ sigwaitinfo F
+ sleep F
+ snprintf F
+ sockatmark F
+ socket F
+ socketpair F
+ splice F
+ sprintf F
+ sprofil F
+ srand F
+ srand48 F
+ srand48_r F
+ srandom F
+ srandom_r F
+ sscanf F
+ ssignal F
+ sstk F
+ statfs F
+ statfs64 F
+ statvfs F
+ statvfs64 F
+ stderr D 0x4
+ stdin D 0x4
+ stdout D 0x4
+ step F
+ stime F
+ stpcpy F
+ stpncpy F
+ strcasecmp F
+ strcasecmp_l F
+ strcasestr F
+ strcat F
+ strchr F
+ strchrnul F
+ strcmp F
+ strcoll F
+ strcoll_l F
+ strcpy F
+ strcspn F
+ strdup F
+ strerror F
+ strerror_l F
+ strerror_r F
+ strfmon F
+ strfmon_l F
+ strfry F
+ strftime F
+ strftime_l F
+ strlen F
+ strncasecmp F
+ strncasecmp_l F
+ strncat F
+ strncmp F
+ strncpy F
+ strndup F
+ strnlen F
+ strpbrk F
+ strptime F
+ strptime_l F
+ strrchr F
+ strsep F
+ strsignal F
+ strspn F
+ strstr F
+ strtod F
+ strtod_l F
+ strtof F
+ strtof_l F
+ strtoimax F
+ strtok F
+ strtok_r F
+ strtol F
+ strtol_l F
+ strtold F
+ strtold_l F
+ strtoll F
+ strtoll_l F
+ strtoq F
+ strtoul F
+ strtoul_l F
+ strtoull F
+ strtoull_l F
+ strtoumax F
+ strtouq F
+ strverscmp F
+ strxfrm F
+ strxfrm_l F
+ stty F
+ svc_exit F
+ svc_fdset D 0x80
+ svc_getreq F
+ svc_getreq_common F
+ svc_getreq_poll F
+ svc_getreqset F
+ svc_max_pollfd D 0x4
+ svc_pollfd D 0x4
+ svc_register F
+ svc_run F
+ svc_sendreply F
+ svc_unregister F
+ svcauthdes_stats D 0xc
+ svcerr_auth F
+ svcerr_decode F
+ svcerr_noproc F
+ svcerr_noprog F
+ svcerr_progvers F
+ svcerr_systemerr F
+ svcerr_weakauth F
+ svcfd_create F
+ svcraw_create F
+ svctcp_create F
+ svcudp_bufcreate F
+ svcudp_create F
+ svcudp_enablecache F
+ svcunix_create F
+ svcunixfd_create F
+ swab F
+ swapcontext F
+ swapoff F
+ swapon F
+ swprintf F
+ swscanf F
+ symlink F
+ symlinkat F
+ sync F
+ sync_file_range F
+ syncfs F
+ sys_errlist D 0x21c
+ sys_nerr D 0x4
+ sys_sigabbrev D 0x104
+ sys_siglist D 0x104
+ syscall F
+ sysconf F
+ sysctl F
+ sysinfo F
+ syslog F
+ system F
+ sysv_signal F
+ tcdrain F
+ tcflow F
+ tcflush F
+ tcgetattr F
+ tcgetpgrp F
+ tcgetsid F
+ tcsendbreak F
+ tcsetattr F
+ tcsetpgrp F
+ tdelete F
+ tdestroy F
+ tee F
+ telldir F
+ tempnam F
+ textdomain F
+ tfind F
+ time F
+ timegm F
+ timelocal F
+ timerfd_create F
+ timerfd_gettime F
+ timerfd_settime F
+ times F
+ timespec_get F
+ timezone D 0x4
+ tmpfile F
+ tmpfile64 F
+ tmpnam F
+ tmpnam_r F
+ toascii F
+ tolower F
+ tolower_l F
+ toupper F
+ toupper_l F
+ towctrans F
+ towctrans_l F
+ towlower F
+ towlower_l F
+ towupper F
+ towupper_l F
+ tr_break F
+ truncate F
+ truncate64 F
+ tsearch F
+ ttyname F
+ ttyname_r F
+ ttyslot F
+ twalk F
+ tzname D 0x8
+ tzset F
+ ualarm F
+ ulckpwdf F
+ ulimit F
+ umask F
+ umount F
+ umount2 F
+ uname F
+ ungetc F
+ ungetwc F
+ unlink F
+ unlinkat F
+ unlockpt F
+ unsetenv F
+ unshare F
+ updwtmp F
+ updwtmpx F
+ uselib F
+ uselocale F
+ user2netname F
+ usleep F
+ ustat F
+ utime F
+ utimensat F
+ utimes F
+ utmpname F
+ utmpxname F
+ valloc F
+ vasprintf F
+ vdprintf F
+ verr F
+ verrx F
+ versionsort F
+ versionsort64 F
+ vfork F
+ vfprintf F
+ vfscanf F
+ vfwprintf F
+ vfwscanf F
+ vhangup F
+ vlimit F
+ vmsplice F
+ vprintf F
+ vscanf F
+ vsnprintf F
+ vsprintf F
+ vsscanf F
+ vswprintf F
+ vswscanf F
+ vsyslog F
+ vtimes F
+ vwarn F
+ vwarnx F
+ vwprintf F
+ vwscanf F
+ wait F
+ wait3 F
+ wait4 F
+ waitid F
+ waitpid F
+ warn F
+ warnx F
+ wcpcpy F
+ wcpncpy F
+ wcrtomb F
+ wcscasecmp F
+ wcscasecmp_l F
+ wcscat F
+ wcschr F
+ wcschrnul F
+ wcscmp F
+ wcscoll F
+ wcscoll_l F
+ wcscpy F
+ wcscspn F
+ wcsdup F
+ wcsftime F
+ wcsftime_l F
+ wcslen F
+ wcsncasecmp F
+ wcsncasecmp_l F
+ wcsncat F
+ wcsncmp F
+ wcsncpy F
+ wcsnlen F
+ wcsnrtombs F
+ wcspbrk F
+ wcsrchr F
+ wcsrtombs F
+ wcsspn F
+ wcsstr F
+ wcstod F
+ wcstod_l F
+ wcstof F
+ wcstof_l F
+ wcstoimax F
+ wcstok F
+ wcstol F
+ wcstol_l F
+ wcstold F
+ wcstold_l F
+ wcstoll F
+ wcstoll_l F
+ wcstombs F
+ wcstoq F
+ wcstoul F
+ wcstoul_l F
+ wcstoull F
+ wcstoull_l F
+ wcstoumax F
+ wcstouq F
+ wcswcs F
+ wcswidth F
+ wcsxfrm F
+ wcsxfrm_l F
+ wctob F
+ wctomb F
+ wctrans F
+ wctrans_l F
+ wctype F
+ wctype_l F
+ wcwidth F
+ wmemchr F
+ wmemcmp F
+ wmemcpy F
+ wmemmove F
+ wmempcpy F
+ wmemset F
+ wordexp F
+ wordfree F
+ wprintf F
+ write F
+ writev F
+ wscanf F
+ xdecrypt F
+ xdr_accepted_reply F
+ xdr_array F
+ xdr_authdes_cred F
+ xdr_authdes_verf F
+ xdr_authunix_parms F
+ xdr_bool F
+ xdr_bytes F
+ xdr_callhdr F
+ xdr_callmsg F
+ xdr_char F
+ xdr_cryptkeyarg F
+ xdr_cryptkeyarg2 F
+ xdr_cryptkeyres F
+ xdr_des_block F
+ xdr_double F
+ xdr_enum F
+ xdr_float F
+ xdr_free F
+ xdr_getcredres F
+ xdr_hyper F
+ xdr_int F
+ xdr_int16_t F
+ xdr_int32_t F
+ xdr_int64_t F
+ xdr_int8_t F
+ xdr_key_netstarg F
+ xdr_key_netstres F
+ xdr_keybuf F
+ xdr_keystatus F
+ xdr_long F
+ xdr_longlong_t F
+ xdr_netnamestr F
+ xdr_netobj F
+ xdr_opaque F
+ xdr_opaque_auth F
+ xdr_pmap F
+ xdr_pmaplist F
+ xdr_pointer F
+ xdr_quad_t F
+ xdr_reference F
+ xdr_rejected_reply F
+ xdr_replymsg F
+ xdr_rmtcall_args F
+ xdr_rmtcallres F
+ xdr_short F
+ xdr_sizeof F
+ xdr_string F
+ xdr_u_char F
+ xdr_u_hyper F
+ xdr_u_int F
+ xdr_u_long F
+ xdr_u_longlong_t F
+ xdr_u_quad_t F
+ xdr_u_short F
+ xdr_uint16_t F
+ xdr_uint32_t F
+ xdr_uint64_t F
+ xdr_uint8_t F
+ xdr_union F
+ xdr_unixcred F
+ xdr_vector F
+ xdr_void F
+ xdr_wrapstring F
+ xdrmem_create F
+ xdrrec_create F
+ xdrrec_endofrecord F
+ xdrrec_eof F
+ xdrrec_skiprecord F
+ xdrstdio_create F
+ xencrypt F
+ xprt_register F
+ xprt_unregister F
diff --git a/sysdeps/unix/sysv/linux/arc/libcrypt.abilist b/sysdeps/unix/sysv/linux/arc/libcrypt.abilist
new file mode 100644
index 000000000000..835e081728ec
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libcrypt.abilist
@@ -0,0 +1,9 @@
+GLIBC_2.24
+ GLIBC_2.24 A
+ crypt F
+ crypt_r F
+ encrypt F
+ encrypt_r F
+ fcrypt F
+ setkey F
+ setkey_r F
diff --git a/sysdeps/unix/sysv/linux/arc/libdl.abilist b/sysdeps/unix/sysv/linux/arc/libdl.abilist
new file mode 100644
index 000000000000..ec7296aa7502
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libdl.abilist
@@ -0,0 +1,11 @@
+GLIBC_2.24
+ GLIBC_2.24 A
+ dladdr F
+ dladdr1 F
+ dlclose F
+ dlerror F
+ dlinfo F
+ dlmopen F
+ dlopen F
+ dlsym F
+ dlvsym F
diff --git a/sysdeps/unix/sysv/linux/arc/libm.abilist b/sysdeps/unix/sysv/linux/arc/libm.abilist
new file mode 100644
index 000000000000..bf2792093ba8
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libm.abilist
@@ -0,0 +1,370 @@
+GLIBC_2.24
+ GLIBC_2.24 A
+ _LIB_VERSION D 0x4
+ __acos_finite F
+ __acosf_finite F
+ __acosh_finite F
+ __acoshf_finite F
+ __asin_finite F
+ __asinf_finite F
+ __atan2_finite F
+ __atan2f_finite F
+ __atanh_finite F
+ __atanhf_finite F
+ __clog10 F
+ __clog10f F
+ __clog10l F
+ __cosh_finite F
+ __coshf_finite F
+ __exp10_finite F
+ __exp10f_finite F
+ __exp2_finite F
+ __exp2f_finite F
+ __exp_finite F
+ __expf_finite F
+ __finite F
+ __finitef F
+ __finitel F
+ __fmod_finite F
+ __fmodf_finite F
+ __fpclassify F
+ __fpclassifyf F
+ __gamma_r_finite F
+ __gammaf_r_finite F
+ __hypot_finite F
+ __hypotf_finite F
+ __issignaling F
+ __issignalingf F
+ __j0_finite F
+ __j0f_finite F
+ __j1_finite F
+ __j1f_finite F
+ __jn_finite F
+ __jnf_finite F
+ __lgamma_r_finite F
+ __lgammaf_r_finite F
+ __log10_finite F
+ __log10f_finite F
+ __log2_finite F
+ __log2f_finite F
+ __log_finite F
+ __logf_finite F
+ __pow_finite F
+ __powf_finite F
+ __remainder_finite F
+ __remainderf_finite F
+ __scalb_finite F
+ __scalbf_finite F
+ __signbit F
+ __signbitf F
+ __sinh_finite F
+ __sinhf_finite F
+ __sqrt_finite F
+ __sqrtf_finite F
+ __y0_finite F
+ __y0f_finite F
+ __y1_finite F
+ __y1f_finite F
+ __yn_finite F
+ __ynf_finite F
+ acos F
+ acosf F
+ acosh F
+ acoshf F
+ acoshl F
+ acosl F
+ asin F
+ asinf F
+ asinh F
+ asinhf F
+ asinhl F
+ asinl F
+ atan F
+ atan2 F
+ atan2f F
+ atan2l F
+ atanf F
+ atanh F
+ atanhf F
+ atanhl F
+ atanl F
+ cabs F
+ cabsf F
+ cabsl F
+ cacos F
+ cacosf F
+ cacosh F
+ cacoshf F
+ cacoshl F
+ cacosl F
+ carg F
+ cargf F
+ cargl F
+ casin F
+ casinf F
+ casinh F
+ casinhf F
+ casinhl F
+ casinl F
+ catan F
+ catanf F
+ catanh F
+ catanhf F
+ catanhl F
+ catanl F
+ cbrt F
+ cbrtf F
+ cbrtl F
+ ccos F
+ ccosf F
+ ccosh F
+ ccoshf F
+ ccoshl F
+ ccosl F
+ ceil F
+ ceilf F
+ ceill F
+ cexp F
+ cexpf F
+ cexpl F
+ cimag F
+ cimagf F
+ cimagl F
+ clog F
+ clog10 F
+ clog10f F
+ clog10l F
+ clogf F
+ clogl F
+ conj F
+ conjf F
+ conjl F
+ copysign F
+ copysignf F
+ copysignl F
+ cos F
+ cosf F
+ cosh F
+ coshf F
+ coshl F
+ cosl F
+ cpow F
+ cpowf F
+ cpowl F
+ cproj F
+ cprojf F
+ cprojl F
+ creal F
+ crealf F
+ creall F
+ csin F
+ csinf F
+ csinh F
+ csinhf F
+ csinhl F
+ csinl F
+ csqrt F
+ csqrtf F
+ csqrtl F
+ ctan F
+ ctanf F
+ ctanh F
+ ctanhf F
+ ctanhl F
+ ctanl F
+ drem F
+ dremf F
+ dreml F
+ erf F
+ erfc F
+ erfcf F
+ erfcl F
+ erff F
+ erfl F
+ exp F
+ exp10 F
+ exp10f F
+ exp10l F
+ exp2 F
+ exp2f F
+ exp2l F
+ expf F
+ expl F
+ expm1 F
+ expm1f F
+ expm1l F
+ fabs F
+ fabsf F
+ fabsl F
+ fdim F
+ fdimf F
+ fdiml F
+ feclearexcept F
+ fedisableexcept F
+ feenableexcept F
+ fegetenv F
+ fegetexcept F
+ fegetexceptflag F
+ fegetround F
+ feholdexcept F
+ feraiseexcept F
+ fesetenv F
+ fesetexceptflag F
+ fesetround F
+ fetestexcept F
+ feupdateenv F
+ finite F
+ finitef F
+ finitel F
+ floor F
+ floorf F
+ floorl F
+ fma F
+ fmaf F
+ fmal F
+ fmax F
+ fmaxf F
+ fmaxl F
+ fmin F
+ fminf F
+ fminl F
+ fmod F
+ fmodf F
+ fmodl F
+ frexp F
+ frexpf F
+ frexpl F
+ gamma F
+ gammaf F
+ gammal F
+ hypot F
+ hypotf F
+ hypotl F
+ ilogb F
+ ilogbf F
+ ilogbl F
+ j0 F
+ j0f F
+ j0l F
+ j1 F
+ j1f F
+ j1l F
+ jn F
+ jnf F
+ jnl F
+ ldexp F
+ ldexpf F
+ ldexpl F
+ lgamma F
+ lgamma_r F
+ lgammaf F
+ lgammaf_r F
+ lgammal F
+ lgammal_r F
+ llrint F
+ llrintf F
+ llrintl F
+ llround F
+ llroundf F
+ llroundl F
+ log F
+ log10 F
+ log10f F
+ log10l F
+ log1p F
+ log1pf F
+ log1pl F
+ log2 F
+ log2f F
+ log2l F
+ logb F
+ logbf F
+ logbl F
+ logf F
+ logl F
+ lrint F
+ lrintf F
+ lrintl F
+ lround F
+ lroundf F
+ lroundl F
+ matherr F
+ modf F
+ modff F
+ modfl F
+ nan F
+ nanf F
+ nanl F
+ nearbyint F
+ nearbyintf F
+ nearbyintl F
+ nextafter F
+ nextafterf F
+ nextafterl F
+ nexttoward F
+ nexttowardf F
+ nexttowardl F
+ pow F
+ pow10 F
+ pow10f F
+ pow10l F
+ powf F
+ powl F
+ remainder F
+ remainderf F
+ remainderl F
+ remquo F
+ remquof F
+ remquol F
+ rint F
+ rintf F
+ rintl F
+ round F
+ roundf F
+ roundl F
+ scalb F
+ scalbf F
+ scalbl F
+ scalbln F
+ scalblnf F
+ scalblnl F
+ scalbn F
+ scalbnf F
+ scalbnl F
+ signgam D 0x4
+ significand F
+ significandf F
+ significandl F
+ sin F
+ sincos F
+ sincosf F
+ sincosl F
+ sinf F
+ sinh F
+ sinhf F
+ sinhl F
+ sinl F
+ sqrt F
+ sqrtf F
+ sqrtl F
+ tan F
+ tanf F
+ tanh F
+ tanhf F
+ tanhl F
+ tanl F
+ tgamma F
+ tgammaf F
+ tgammal F
+ trunc F
+ truncf F
+ truncl F
+ y0 F
+ y0f F
+ y0l F
+ y1 F
+ y1f F
+ y1l F
+ yn F
+ ynf F
+ ynl F
diff --git a/sysdeps/unix/sysv/linux/arc/libnsl.abilist b/sysdeps/unix/sysv/linux/arc/libnsl.abilist
new file mode 100644
index 000000000000..f5cd34c15cf2
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libnsl.abilist
@@ -0,0 +1,123 @@
+GLIBC_2.24
+ GLIBC_2.24 A
+ __free_fdresult F
+ __nis_default_access F
+ __nis_default_group F
+ __nis_default_owner F
+ __nis_default_ttl F
+ __nis_finddirectory F
+ __nis_hash F
+ __nisbind_connect F
+ __nisbind_create F
+ __nisbind_destroy F
+ __nisbind_next F
+ __yp_check F
+ nis_add F
+ nis_add_entry F
+ nis_addmember F
+ nis_checkpoint F
+ nis_clone_directory F
+ nis_clone_object F
+ nis_clone_result F
+ nis_creategroup F
+ nis_destroy_object F
+ nis_destroygroup F
+ nis_dir_cmp F
+ nis_domain_of F
+ nis_domain_of_r F
+ nis_first_entry F
+ nis_free_directory F
+ nis_free_object F
+ nis_free_request F
+ nis_freenames F
+ nis_freeresult F
+ nis_freeservlist F
+ nis_freetags F
+ nis_getnames F
+ nis_getservlist F
+ nis_ismember F
+ nis_leaf_of F
+ nis_leaf_of_r F
+ nis_lerror F
+ nis_list F
+ nis_local_directory F
+ nis_local_group F
+ nis_local_host F
+ nis_local_principal F
+ nis_lookup F
+ nis_mkdir F
+ nis_modify F
+ nis_modify_entry F
+ nis_name_of F
+ nis_name_of_r F
+ nis_next_entry F
+ nis_perror F
+ nis_ping F
+ nis_print_directory F
+ nis_print_entry F
+ nis_print_group F
+ nis_print_group_entry F
+ nis_print_link F
+ nis_print_object F
+ nis_print_result F
+ nis_print_rights F
+ nis_print_table F
+ nis_read_obj F
+ nis_remove F
+ nis_remove_entry F
+ nis_removemember F
+ nis_rmdir F
+ nis_servstate F
+ nis_sperrno F
+ nis_sperror F
+ nis_sperror_r F
+ nis_stats F
+ nis_verifygroup F
+ nis_write_obj F
+ readColdStartFile F
+ writeColdStartFile F
+ xdr_cback_data F
+ xdr_domainname F
+ xdr_keydat F
+ xdr_mapname F
+ xdr_obj_p F
+ xdr_peername F
+ xdr_valdat F
+ xdr_yp_buf F
+ xdr_ypall F
+ xdr_ypbind_binding F
+ xdr_ypbind_resp F
+ xdr_ypbind_resptype F
+ xdr_ypbind_setdom F
+ xdr_ypdelete_args F
+ xdr_ypmap_parms F
+ xdr_ypmaplist F
+ xdr_yppush_status F
+ xdr_yppushresp_xfr F
+ xdr_ypreq_key F
+ xdr_ypreq_nokey F
+ xdr_ypreq_xfr F
+ xdr_ypresp_all F
+ xdr_ypresp_key_val F
+ xdr_ypresp_maplist F
+ xdr_ypresp_master F
+ xdr_ypresp_order F
+ xdr_ypresp_val F
+ xdr_ypresp_xfr F
+ xdr_ypstat F
+ xdr_ypupdate_args F
+ xdr_ypxfrstat F
+ yp_all F
+ yp_bind F
+ yp_first F
+ yp_get_default_domain F
+ yp_maplist F
+ yp_master F
+ yp_match F
+ yp_next F
+ yp_order F
+ yp_unbind F
+ yp_update F
+ ypbinderr_string F
+ yperr_string F
+ ypprot_err F
diff --git a/sysdeps/unix/sysv/linux/arc/libpthread.abilist b/sysdeps/unix/sysv/linux/arc/libpthread.abilist
new file mode 100644
index 000000000000..93b909906b92
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libpthread.abilist
@@ -0,0 +1,224 @@
+GLIBC_2.24
+ GLIBC_2.24 A
+ _IO_flockfile F
+ _IO_ftrylockfile F
+ _IO_funlockfile F
+ __close F
+ __connect F
+ __errno_location F
+ __fcntl F
+ __fork F
+ __h_errno_location F
+ __libc_allocate_rtsig F
+ __libc_current_sigrtmax F
+ __libc_current_sigrtmin F
+ __lseek F
+ __nanosleep F
+ __open F
+ __open64 F
+ __pread64 F
+ __pthread_cleanup_routine F
+ __pthread_getspecific F
+ __pthread_key_create F
+ __pthread_mutex_destroy F
+ __pthread_mutex_init F
+ __pthread_mutex_lock F
+ __pthread_mutex_trylock F
+ __pthread_mutex_unlock F
+ __pthread_mutexattr_destroy F
+ __pthread_mutexattr_init F
+ __pthread_mutexattr_settype F
+ __pthread_once F
+ __pthread_register_cancel F
+ __pthread_register_cancel_defer F
+ __pthread_rwlock_destroy F
+ __pthread_rwlock_init F
+ __pthread_rwlock_rdlock F
+ __pthread_rwlock_tryrdlock F
+ __pthread_rwlock_trywrlock F
+ __pthread_rwlock_unlock F
+ __pthread_rwlock_wrlock F
+ __pthread_setspecific F
+ __pthread_unregister_cancel F
+ __pthread_unregister_cancel_restore F
+ __pthread_unwind_next F
+ __pwrite64 F
+ __read F
+ __res_state F
+ __send F
+ __sigaction F
+ __wait F
+ __write F
+ _pthread_cleanup_pop F
+ _pthread_cleanup_pop_restore F
+ _pthread_cleanup_push F
+ _pthread_cleanup_push_defer F
+ accept F
+ close F
+ connect F
+ fcntl F
+ flockfile F
+ fork F
+ fsync F
+ ftrylockfile F
+ funlockfile F
+ longjmp F
+ lseek F
+ lseek64 F
+ msync F
+ nanosleep F
+ open F
+ open64 F
+ pause F
+ pread F
+ pread64 F
+ pthread_attr_destroy F
+ pthread_attr_getaffinity_np F
+ pthread_attr_getdetachstate F
+ pthread_attr_getguardsize F
+ pthread_attr_getinheritsched F
+ pthread_attr_getschedparam F
+ pthread_attr_getschedpolicy F
+ pthread_attr_getscope F
+ pthread_attr_getstack F
+ pthread_attr_getstackaddr F
+ pthread_attr_getstacksize F
+ pthread_attr_init F
+ pthread_attr_setaffinity_np F
+ pthread_attr_setdetachstate F
+ pthread_attr_setguardsize F
+ pthread_attr_setinheritsched F
+ pthread_attr_setschedparam F
+ pthread_attr_setschedpolicy F
+ pthread_attr_setscope F
+ pthread_attr_setstack F
+ pthread_attr_setstackaddr F
+ pthread_attr_setstacksize F
+ pthread_barrier_destroy F
+ pthread_barrier_init F
+ pthread_barrier_wait F
+ pthread_barrierattr_destroy F
+ pthread_barrierattr_getpshared F
+ pthread_barrierattr_init F
+ pthread_barrierattr_setpshared F
+ pthread_cancel F
+ pthread_cond_broadcast F
+ pthread_cond_destroy F
+ pthread_cond_init F
+ pthread_cond_signal F
+ pthread_cond_timedwait F
+ pthread_cond_wait F
+ pthread_condattr_destroy F
+ pthread_condattr_getclock F
+ pthread_condattr_getpshared F
+ pthread_condattr_init F
+ pthread_condattr_setclock F
+ pthread_condattr_setpshared F
+ pthread_create F
+ pthread_detach F
+ pthread_equal F
+ pthread_exit F
+ pthread_getaffinity_np F
+ pthread_getattr_default_np F
+ pthread_getattr_np F
+ pthread_getconcurrency F
+ pthread_getcpuclockid F
+ pthread_getname_np F
+ pthread_getschedparam F
+ pthread_getspecific F
+ pthread_join F
+ pthread_key_create F
+ pthread_key_delete F
+ pthread_kill F
+ pthread_kill_other_threads_np F
+ pthread_mutex_consistent F
+ pthread_mutex_consistent_np F
+ pthread_mutex_destroy F
+ pthread_mutex_getprioceiling F
+ pthread_mutex_init F
+ pthread_mutex_lock F
+ pthread_mutex_setprioceiling F
+ pthread_mutex_timedlock F
+ pthread_mutex_trylock F
+ pthread_mutex_unlock F
+ pthread_mutexattr_destroy F
+ pthread_mutexattr_getkind_np F
+ pthread_mutexattr_getprioceiling F
+ pthread_mutexattr_getprotocol F
+ pthread_mutexattr_getpshared F
+ pthread_mutexattr_getrobust F
+ pthread_mutexattr_getrobust_np F
+ pthread_mutexattr_gettype F
+ pthread_mutexattr_init F
+ pthread_mutexattr_setkind_np F
+ pthread_mutexattr_setprioceiling F
+ pthread_mutexattr_setprotocol F
+ pthread_mutexattr_setpshared F
+ pthread_mutexattr_setrobust F
+ pthread_mutexattr_setrobust_np F
+ pthread_mutexattr_settype F
+ pthread_once F
+ pthread_rwlock_destroy F
+ pthread_rwlock_init F
+ pthread_rwlock_rdlock F
+ pthread_rwlock_timedrdlock F
+ pthread_rwlock_timedwrlock F
+ pthread_rwlock_tryrdlock F
+ pthread_rwlock_trywrlock F
+ pthread_rwlock_unlock F
+ pthread_rwlock_wrlock F
+ pthread_rwlockattr_destroy F
+ pthread_rwlockattr_getkind_np F
+ pthread_rwlockattr_getpshared F
+ pthread_rwlockattr_init F
+ pthread_rwlockattr_setkind_np F
+ pthread_rwlockattr_setpshared F
+ pthread_self F
+ pthread_setaffinity_np F
+ pthread_setattr_default_np F
+ pthread_setcancelstate F
+ pthread_setcanceltype F
+ pthread_setconcurrency F
+ pthread_setname_np F
+ pthread_setschedparam F
+ pthread_setschedprio F
+ pthread_setspecific F
+ pthread_sigmask F
+ pthread_sigqueue F
+ pthread_spin_destroy F
+ pthread_spin_init F
+ pthread_spin_lock F
+ pthread_spin_trylock F
+ pthread_spin_unlock F
+ pthread_testcancel F
+ pthread_timedjoin_np F
+ pthread_tryjoin_np F
+ pthread_yield F
+ pwrite F
+ pwrite64 F
+ raise F
+ read F
+ recv F
+ recvfrom F
+ recvmsg F
+ sem_close F
+ sem_destroy F
+ sem_getvalue F
+ sem_init F
+ sem_open F
+ sem_post F
+ sem_timedwait F
+ sem_trywait F
+ sem_unlink F
+ sem_wait F
+ send F
+ sendmsg F
+ sendto F
+ sigaction F
+ siglongjmp F
+ sigwait F
+ system F
+ tcdrain F
+ wait F
+ waitpid F
+ write F
diff --git a/sysdeps/unix/sysv/linux/arc/libresolv.abilist b/sysdeps/unix/sysv/linux/arc/libresolv.abilist
new file mode 100644
index 000000000000..4c4a55a083b6
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libresolv.abilist
@@ -0,0 +1,93 @@
+GLIBC_2.24
+ GLIBC_2.24 A
+ __b64_ntop F
+ __b64_pton F
+ __dn_comp F
+ __dn_count_labels F
+ __dn_expand F
+ __dn_skipname F
+ __fp_nquery F
+ __fp_query F
+ __fp_resstat F
+ __hostalias F
+ __loc_aton F
+ __loc_ntoa F
+ __p_cdname F
+ __p_cdnname F
+ __p_class F
+ __p_class_syms D 0x54
+ __p_fqname F
+ __p_fqnname F
+ __p_option F
+ __p_query F
+ __p_rcode F
+ __p_secstodate F
+ __p_time F
+ __p_type F
+ __p_type_syms D 0x228
+ __putlong F
+ __putshort F
+ __res_close F
+ __res_dnok F
+ __res_hnok F
+ __res_hostalias F
+ __res_isourserver F
+ __res_mailok F
+ __res_mkquery F
+ __res_nameinquery F
+ __res_nmkquery F
+ __res_nquery F
+ __res_nquerydomain F
+ __res_nsearch F
+ __res_nsend F
+ __res_ownok F
+ __res_queriesmatch F
+ __res_query F
+ __res_querydomain F
+ __res_search F
+ __res_send F
+ __sym_ntop F
+ __sym_ntos F
+ __sym_ston F
+ _gethtbyaddr F
+ _gethtbyname F
+ _gethtbyname2 F
+ _gethtent F
+ _getlong F
+ _getshort F
+ _res_opcodes D 0x40
+ _sethtent F
+ inet_net_ntop F
+ inet_net_pton F
+ inet_neta F
+ ns_datetosecs F
+ ns_format_ttl F
+ ns_get16 F
+ ns_get32 F
+ ns_initparse F
+ ns_makecanon F
+ ns_msg_getflag F
+ ns_name_compress F
+ ns_name_ntol F
+ ns_name_ntop F
+ ns_name_pack F
+ ns_name_pton F
+ ns_name_rollback F
+ ns_name_skip F
+ ns_name_uncompress F
+ ns_name_unpack F
+ ns_parse_ttl F
+ ns_parserr F
+ ns_put16 F
+ ns_put32 F
+ ns_samedomain F
+ ns_samename F
+ ns_skiprr F
+ ns_sprintrr F
+ ns_sprintrrf F
+ ns_subdomain F
+ res_gethostbyaddr F
+ res_gethostbyname F
+ res_gethostbyname2 F
+ res_send_setqhook F
+ res_send_setrhook F
diff --git a/sysdeps/unix/sysv/linux/arc/librt.abilist b/sysdeps/unix/sysv/linux/arc/librt.abilist
new file mode 100644
index 000000000000..c1192b9eca07
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/librt.abilist
@@ -0,0 +1,37 @@
+GLIBC_2.24
+ GLIBC_2.24 A
+ __mq_open_2 F
+ aio_cancel F
+ aio_cancel64 F
+ aio_error F
+ aio_error64 F
+ aio_fsync F
+ aio_fsync64 F
+ aio_init F
+ aio_read F
+ aio_read64 F
+ aio_return F
+ aio_return64 F
+ aio_suspend F
+ aio_suspend64 F
+ aio_write F
+ aio_write64 F
+ lio_listio F
+ lio_listio64 F
+ mq_close F
+ mq_getattr F
+ mq_notify F
+ mq_open F
+ mq_receive F
+ mq_send F
+ mq_setattr F
+ mq_timedreceive F
+ mq_timedsend F
+ mq_unlink F
+ shm_open F
+ shm_unlink F
+ timer_create F
+ timer_delete F
+ timer_getoverrun F
+ timer_gettime F
+ timer_settime F
diff --git a/sysdeps/unix/sysv/linux/arc/libthread_db.abilist b/sysdeps/unix/sysv/linux/arc/libthread_db.abilist
new file mode 100644
index 000000000000..5e7883768dc7
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libthread_db.abilist
@@ -0,0 +1,42 @@
+GLIBC_2.24
+ GLIBC_2.24 A
+ td_init F
+ td_log F
+ td_symbol_list F
+ td_ta_clear_event F
+ td_ta_delete F
+ td_ta_enable_stats F
+ td_ta_event_addr F
+ td_ta_event_getmsg F
+ td_ta_get_nthreads F
+ td_ta_get_ph F
+ td_ta_get_stats F
+ td_ta_map_id2thr F
+ td_ta_map_lwp2thr F
+ td_ta_new F
+ td_ta_reset_stats F
+ td_ta_set_event F
+ td_ta_setconcurrency F
+ td_ta_thr_iter F
+ td_ta_tsd_iter F
+ td_thr_clear_event F
+ td_thr_dbresume F
+ td_thr_dbsuspend F
+ td_thr_event_enable F
+ td_thr_event_getmsg F
+ td_thr_get_info F
+ td_thr_getfpregs F
+ td_thr_getgregs F
+ td_thr_getxregs F
+ td_thr_getxregsize F
+ td_thr_set_event F
+ td_thr_setfpregs F
+ td_thr_setgregs F
+ td_thr_setprio F
+ td_thr_setsigpending F
+ td_thr_setxregs F
+ td_thr_sigsetmask F
+ td_thr_tls_get_addr F
+ td_thr_tlsbase F
+ td_thr_tsd F
+ td_thr_validate F
diff --git a/sysdeps/unix/sysv/linux/arc/libutil.abilist b/sysdeps/unix/sysv/linux/arc/libutil.abilist
new file mode 100644
index 000000000000..e12934336d7a
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libutil.abilist
@@ -0,0 +1,8 @@
+GLIBC_2.24
+ GLIBC_2.24 A
+ forkpty F
+ login F
+ login_tty F
+ logout F
+ logwtmp F
+ openpty F
diff --git a/sysdeps/unix/sysv/linux/arc/localplt.data b/sysdeps/unix/sysv/linux/arc/localplt.data
new file mode 100644
index 000000000000..ee2b94889b12
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/localplt.data
@@ -0,0 +1,35 @@
+libc.so: realloc
+libc.so: __eqsf2
+libc.so: __floatsisf
+libc.so: __ltdf2
+libc.so: __gedf2
+libc.so: malloc
+libc.so: __nesf2
+libc.so: memalign
+libc.so: __mulsf3
+libc.so: __floatunsisf
+libc.so: __addsf3
+libc.so: __fixsfsi
+libc.so: __subsf3
+libc.so: calloc
+libc.so: __muldf3
+libc.so: __signbit
+libc.so: free
+libc.so: __subdf3
+libc.so: __adddf3
+libc.so: __divdf3
+libc.so: __floatsidf
+libc.so: __divsf3
+libc.so: __nedf2
+libc.so: __eqdf2
+libm.so: __signbitf
+libm.so: __signbit
+libm.so: matherr
+# The dynamic loader uses __libc_memalign internally to allocate aligned
+# TLS storage. The other malloc family of functions are expected to allow
+# user symbol interposition.
+ld.so: __libc_memalign
+ld.so: malloc
+ld.so: calloc
+ld.so: realloc
+ld.so: free
diff --git a/sysdeps/unix/sysv/linux/arc/mmap_internal.h b/sysdeps/unix/sysv/linux/arc/mmap_internal.h
new file mode 100644
index 000000000000..e9b8a4366de6
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/mmap_internal.h
@@ -0,0 +1,26 @@
+/* mmap - map files or devices into memory.  Linux/ARC version.
+   Copyright (C) 2017 Free Software Foundation, Inc.
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
diff --git a/sysdeps/unix/sysv/linux/arc/shlib-versions b/sysdeps/unix/sysv/linux/arc/shlib-versions
new file mode 100644
index 000000000000..c4d5d029812d
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/shlib-versions
@@ -0,0 +1,2 @@
+DEFAULT                 GLIBC_2.21
+ld=ld-linux.so.2
diff --git a/sysdeps/unix/sysv/linux/arc/sigaction.c b/sysdeps/unix/sysv/linux/arc/sigaction.c
new file mode 100644
index 000000000000..2bd7b0f08ddc
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sigaction.c
@@ -0,0 +1,64 @@
+/* Copyright (C) 1997-2015 Free Software Foundation, Inc.
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
+	return INLINE_SYSCALL(rt_sigaction, 4,
+			sig, arg, oact, _NSIG / 8);
+}
+
+libc_hidden_def (__libc_sigaction)
+
+#include <nptl/sigaction.c>
diff --git a/sysdeps/unix/sysv/linux/arc/sigcontextinfo.h b/sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
new file mode 100644
index 000000000000..12ca534c9467
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
@@ -0,0 +1,28 @@
+/* ARC definitions for signal handling calling conventions.
+   Copyright (C) 2015 Free Software Foundation, Inc.
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
+#define SIGCONTEXT int _code, struct ucontext *
+#define SIGCONTEXT_EXTRA_ARGS _code,
+#define GET_PC(ctx)    ((void *) (ctx)->uc_mcontext.regs.scratch.ret)
+#define GET_FRAME(ctx) ((void *) (ctx)->uc_mcontext.regs.scratch.fp)
+#define GET_STACK(ctx) ((void *) (ctx)->uc_mcontext.regs.scratch.sp)
+#define CALL_SIGHANDLER(handler, signo, ctx) \
+  (handler)((signo), SIGCONTEXT_EXTRA_ARGS (ctx))
diff --git a/sysdeps/unix/sysv/linux/arc/sys/cachectl.h b/sysdeps/unix/sysv/linux/arc/sys/cachectl.h
new file mode 100644
index 000000000000..1f7db26af6ff
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sys/cachectl.h
@@ -0,0 +1,36 @@
+/* cacheflush - flush contents of instruction and/or data cache.
+   Copyright (C) 2015 Free Software Foundation, Inc.
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
diff --git a/sysdeps/unix/sysv/linux/arc/sys/procfs.h b/sysdeps/unix/sysv/linux/arc/sys/procfs.h
new file mode 100644
index 000000000000..3f655b77f05b
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sys/procfs.h
@@ -0,0 +1,123 @@
+/* Core image file related definitions, ARC version.
+   Copyright (C) 1996-2015 Free Software Foundation, Inc.
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
+#define _SYS_PROCFS_H	1
+
+/* This is somewhat modelled after the file of the same name on SVR4
+   systems.  It provides a definition of the core file format for ELF
+   used on Linux.  It doesn't have anything to do with the /proc file
+   system, even though Linux has one.
+
+   Anyway, the whole purpose of this file is for GDB and GDB only.
+   Don't read too much into it.  Don't use it for anything other than
+   GDB unless you know what you are doing.  */
+
+#include <features.h>
+#include <sys/time.h>
+#include <sys/types.h>
+#include <sys/user.h>
+
+__BEGIN_DECLS
+
+/* Type for a general-purpose register.  */
+typedef unsigned long elf_greg_t;
+
+/* And the whole bunch of them.  We could have used `struct
+   user_regs' directly in the typedef, but tradition says that
+   the register set is an array, which does have some peculiar
+   semantics, so leave it that way.  */
+#define ELF_NGREG (sizeof (struct user_regs_struct) / sizeof(elf_greg_t))
+typedef elf_greg_t elf_gregset_t[ELF_NGREG];
+
+/* Register set for the floating-point registers.  */
+typedef struct { } elf_fpregset_t;
+
+/* Signal info.  */
+struct elf_siginfo
+  {
+    int si_signo;			/* Signal number.  */
+    int si_code;			/* Extra code.  */
+    int si_errno;			/* Errno.  */
+  };
+
+/* Definitions to generate Intel SVR4-like core files.  These mostly
+   have the same names as the SVR4 types with "elf_" tacked on the
+   front to prevent clashes with Linux definitions, and the typedef
+   forms have been avoided.  This is mostly like the SVR4 structure,
+   but more Linuxy, with things that Linux does not support and which
+   GDB doesn't really use excluded.  */
+
+struct elf_prstatus
+  {
+    struct elf_siginfo pr_info;		/* Info associated with signal.  */
+    short int pr_cursig;		/* Current signal.  */
+    unsigned long int pr_sigpend;	/* Set of pending signals.  */
+    unsigned long int pr_sighold;	/* Set of held signals.  */
+    __pid_t pr_pid;
+    __pid_t pr_ppid;
+    __pid_t pr_pgrp;
+    __pid_t pr_sid;
+    struct timeval pr_utime;		/* User time.  */
+    struct timeval pr_stime;		/* System time.  */
+    struct timeval pr_cutime;		/* Cumulative user time.  */
+    struct timeval pr_cstime;		/* Cumulative system time.  */
+    elf_gregset_t pr_reg;		/* GP registers.  */
+    int pr_fpvalid;			/* True if math copro being used.  */
+  };
+
+
+#define ELF_PRARGSZ     (80)    /* Number of chars for args.  */
+
+struct elf_prpsinfo
+  {
+    char pr_state;			/* Numeric process state.  */
+    char pr_sname;			/* Char for pr_state.  */
+    char pr_zomb;			/* Zombie.  */
+    char pr_nice;			/* Nice val.  */
+    unsigned long int pr_flag;		/* Flags.  */
+    unsigned short int pr_uid;
+    unsigned short int pr_gid;
+    int pr_pid, pr_ppid, pr_pgrp, pr_sid;
+    /* Lots missing */
+    char pr_fname[16];			/* Filename of executable.  */
+    char pr_psargs[ELF_PRARGSZ];	/* Initial part of arg list.  */
+  };
+
+/* The rest of this file provides the types for emulation of the
+   Solaris <proc_service.h> interfaces that should be implemented by
+   users of libthread_db.  */
+
+/* Addresses.  */
+typedef void *psaddr_t;
+
+/* Register sets.  Linux has different names.  */
+typedef elf_gregset_t prgregset_t;
+typedef elf_fpregset_t prfpregset_t;
+
+/* We don't have any differences between processes and threads,
+   therefore have only one PID type.  */
+typedef __pid_t lwpid_t;
+
+/* Process status and info.  In the end we do provide typedefs for them.  */
+typedef struct elf_prstatus prstatus_t;
+typedef struct elf_prpsinfo prpsinfo_t;
+
+__END_DECLS
+
+#endif	/* sys/procfs.h */
diff --git a/sysdeps/unix/sysv/linux/arc/sys/ucontext.h b/sysdeps/unix/sysv/linux/arc/sys/ucontext.h
new file mode 100644
index 000000000000..37f7f9224853
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sys/ucontext.h
@@ -0,0 +1,40 @@
+/* struct ucontext definition, ARC version.
+   Copyright (C) 2015 Free Software Foundation, Inc.
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
+#include <signal.h>
+#include <bits/sigcontext.h>
+
+typedef struct sigcontext mcontext_t;
+
+/* Userlevel context.  */
+typedef struct ucontext
+  {
+    unsigned long uc_flags;
+    struct ucontext *uc_link;
+    stack_t uc_stack;
+    mcontext_t uc_mcontext;
+    __sigset_t uc_sigmask;
+  } ucontext_t;
+
+#endif /* sys/ucontext.h */
diff --git a/sysdeps/unix/sysv/linux/arc/sys/user.h b/sysdeps/unix/sysv/linux/arc/sys/user.h
new file mode 100644
index 000000000000..642f480f2302
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sys/user.h
@@ -0,0 +1,32 @@
+/* ptrace register data format definitions.
+   Copyright (C) 1998-2015 Free Software Foundation, Inc.
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
diff --git a/sysdeps/unix/sysv/linux/arc/syscall.S b/sysdeps/unix/sysv/linux/arc/syscall.S
new file mode 100644
index 000000000000..1ad559619f69
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/syscall.S
@@ -0,0 +1,33 @@
+/* syscall - indirect system call.
+   Copyright (C) 2015 Free Software Foundation, Inc.
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
+	mov_s	r4, r5
+	mov_s	r5, r6
+
+	ARC_TRAP_INSN
+        brhi    r0, -1024, 0f
+	j	[blink]
+PSEUDO_END (syscall)
diff --git a/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h b/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
new file mode 100644
index 000000000000..db89ad033a79
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
@@ -0,0 +1,140 @@
+/* Assembler macros with cancellation support, ARC version.
+   Copyright (C) 2003-2015 Free Software Foundation, Inc.
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
+#include <tls.h>
+#ifndef __ASSEMBLER__
+# include <nptl/pthreadP.h>
+#endif
+
+#if IS_IN (libc)
+#define BR_ERRNO_SETTER	        b PLTJMP(HIDDEN_JUMPTARGET(__syscall_error))
+#else
+#define BR_ERRNO_SETTER	        b PLTJMP(__syscall_error)
+#endif
+
+#if IS_IN (libc) || IS_IN (libpthread) || IS_IN (librt)
+
+#ifdef __ASSEMBLER__
+
+# undef PSEUDO
+# define PSEUDO(name, syscall_name, nargs)				\
+   /* vanilla version */				ASM_LINE_SEP	\
+   ENTRY(name##_nocancel)				ASM_LINE_SEP	\
+      DO_CALL (__NR_##syscall_name)			ASM_LINE_SEP	\
+      jls  [blink]					ASM_LINE_SEP	\
+      BR_ERRNO_SETTER					ASM_LINE_SEP	\
+   END(name##_nocancel)					ASM_LINE_SEP	\
+   /* thread cancellation variant */			ASM_LINE_SEP	\
+   ENTRY(name)			    			ASM_LINE_SEP	\
+      SINGLE_THREAD_P					ASM_LINE_SEP	\
+      bz name##_nocancel				ASM_LINE_SEP	\
+      DOCARGS_##nargs  /* stash syscall args */		ASM_LINE_SEP	\
+      CENABLE          /* call enable_asynccancel */	ASM_LINE_SEP	\
+      mov r9, r0       /* Safe-keep mask */ 		ASM_LINE_SEP	\
+      UNDOCARGS_##nargs	/* restore syscall args */	ASM_LINE_SEP	\
+      DO_CALL (__NR_##syscall_name)			ASM_LINE_SEP	\
+      PUSH  r0         /* save syscall return value */	ASM_LINE_SEP	\
+      mov   r0, r9  /* mask for disable_asynccancel */  ASM_LINE_SEP	\
+      CDISABLE						ASM_LINE_SEP	\
+      POP  r0       /* get syscall ret value back */	ASM_LINE_SEP	\
+      POP  blink    /* UNDOCARGS left blink on stack */	ASM_LINE_SEP	\
+      cmp  r0, -1024					ASM_LINE_SEP	\
+      jls  [blink]					ASM_LINE_SEP	\
+      BR_ERRNO_SETTER					ASM_LINE_SEP	\
+   END(name)
+
+#undef	PSEUDO_END
+#define	PSEUDO_END(name)	\
+
+# if IS_IN (libpthread)
+#  define CENABLE	bl PLTJMP(__pthread_enable_asynccancel)
+#  define CDISABLE	bl PLTJMP(__pthread_disable_asynccancel)
+# elif IS_IN (libc)
+#  define CENABLE	bl PLTJMP(__libc_enable_asynccancel)
+#  define CDISABLE	bl PLTJMP(__libc_disable_asynccancel)
+# elif IS_IN (librt)
+#  define CENABLE	bl PLTJMP(__librt_enable_asynccancel)
+#  define CDISABLE	bl PLTJMP(__librt_disable_asynccancel)
+# else
+#  error Unsupported library
+# endif
+
+#undef DO_CALL
+#define DO_CALL(num)				\
+	mov r8, num		ASM_LINE_SEP	\
+	ARC_TRAP_INSN		ASM_LINE_SEP	\
+	cmp r0, -1024
+
+.macro PUSH reg
+	st.a \reg, [sp, -4]
+.endm
+
+.macro POP reg
+	ld.ab \reg, [sp, 4]
+.endm
+
+#define DOCARGS_0	PUSH blink
+/* don't pop blink at this point */
+#define UNDOCARGS_0	ld   blink, [sp]
+
+#define DOCARGS_1	DOCARGS_0  ASM_LINE_SEP	PUSH r0
+#define UNDOCARGS_1	POP  r0    ASM_LINE_SEP	UNDOCARGS_0
+
+#define DOCARGS_2	DOCARGS_1  ASM_LINE_SEP	PUSH r1
+#define UNDOCARGS_2	POP  r1    ASM_LINE_SEP	UNDOCARGS_1
+
+#define DOCARGS_3	DOCARGS_2  ASM_LINE_SEP	PUSH r2
+#define UNDOCARGS_3	POP  r2    ASM_LINE_SEP	UNDOCARGS_2
+
+#define DOCARGS_4	DOCARGS_3  ASM_LINE_SEP	PUSH r3
+#define UNDOCARGS_4	POP  r3    ASM_LINE_SEP	UNDOCARGS_3
+
+#define DOCARGS_5	DOCARGS_4  ASM_LINE_SEP	PUSH r4
+#define UNDOCARGS_5	POP  r4    ASM_LINE_SEP	UNDOCARGS_4
+
+#define DOCARGS_6	DOCARGS_5  ASM_LINE_SEP	PUSH r5
+#define UNDOCARGS_6	POP  r5    ASM_LINE_SEP	UNDOCARGS_5
+
+#define DOCARGS_7	DOCARGS_6  ASM_LINE_SEP	PUSH r6
+#define UNDOCARGS_7	POP  r6    ASM_LINE_SEP	UNDOCARGS_6
+
+#  define SINGLE_THREAD_P 					\
+    THREAD_SELF r9     				ASM_LINE_SEP	\
+    ld	   r10, [r9, MULTIPLE_THREADS_OFFSET]	ASM_LINE_SEP	\
+    cmp    r10, 0
+
+#else /* !__ASSEMBLER__ */
+
+/* TBD: Can use @__local_multiple_threads for libc/libpthread like ARM */
+#   define SINGLE_THREAD_P	\
+    __glibc_likely(THREAD_GETMEM (THREAD_SELF, header.multiple_threads) == 0)
+
+#endif	/* !__ASSEMBLER__ */
+
+#elif !defined __ASSEMBLER__
+
+# define SINGLE_THREAD_P 1
+# define NO_CANCELLATION 1
+
+#endif
+
+#ifndef __ASSEMBLER__
+# define RTLD_SINGLE_THREAD_P \
+  __glibc_likely (THREAD_GETMEM (THREAD_SELF, header.multiple_threads) == 0)
+#endif
diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.c b/sysdeps/unix/sysv/linux/arc/sysdep.c
new file mode 100644
index 000000000000..43cca0fe6688
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sysdep.c
@@ -0,0 +1,22 @@
+/* Wrapper for setting errno.
+ *
+ * Copyright (C) 2000-2006 Erik Andersen <andersen at uclibc.org>
+ *
+ * Licensed under the LGPL v2.1 or later, see the file COPYING.LIB in this tarball.
+ */
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
index 000000000000..507d06a8a575
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/sysdep.h
@@ -0,0 +1,253 @@
+/* Assembler macros for ARC.
+   Copyright (C) 2000-2015 Free Software Foundation, Inc.
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
+    brhi   r0, -1024, 0f			ASM_LINE_SEP
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
+0:						ASM_LINE_SEP	\
+    st.a   blink, [sp, -4]			ASM_LINE_SEP	\
+    CALL_ERRNO_SETTER_C				ASM_LINE_SEP	\
+    ld.ab  blink, [sp, 4]			ASM_LINE_SEP	\
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
+		asm volatile ("st.a blink, [sp, -4] \n\t"         	\
+			       CALL_ERRNO_SETTER                   	\
+			      "ld.ab blink, [sp, 4] \n\t"         	\
+			      :"+r" (__res)                 		\
+			      :                                   	\
+			      :"r1","r2","r3","r4","r5","r6",		\
+			        "r7","r8","r9","r10","r11","r12");	\
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
diff --git a/sysdeps/unix/sysv/linux/arc/ucontext_i.sym b/sysdeps/unix/sysv/linux/arc/ucontext_i.sym
new file mode 100644
index 000000000000..5d0b6a1ae67e
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/ucontext_i.sym
@@ -0,0 +1,17 @@
+#include <inttypes.h>
+#include <signal.h>
+#include <stddef.h>
+#include <sys/ucontext.h>
+
+SIG_BLOCK
+SIG_SETMASK
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
diff --git a/sysdeps/unix/sysv/linux/arc/vfork.S b/sysdeps/unix/sysv/linux/arc/vfork.S
new file mode 100644
index 000000000000..7cb29f5ef95c
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/vfork.S
@@ -0,0 +1,42 @@
+/* vfork for ARC Linux.
+   Copyright (C) 2005-2015 Free Software Foundation, Inc.
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
