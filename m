From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Jan 2019 17:25:45 -0800
Subject: [PATCH v2 05/15] ARC: Atomics and Locking primitives
In-Reply-To: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548811555-24373-6-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                                 |  3 ++
 sysdeps/arc/atomic-machine.h              | 73 +++++++++++++++++++++++++++++++
 sysdeps/arc/nptl/bits/pthreadtypes-arch.h | 72 ++++++++++++++++++++++++++++++
 sysdeps/arc/nptl/bits/semaphore.h         | 32 ++++++++++++++
 4 files changed, 180 insertions(+)
 create mode 100644 sysdeps/arc/atomic-machine.h
 create mode 100644 sysdeps/arc/nptl/bits/pthreadtypes-arch.h
 create mode 100644 sysdeps/arc/nptl/bits/semaphore.h

diff --git a/ChangeLog b/ChangeLog
index 2a9cea8235f1..5406e4c16fc2 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -31,6 +31,9 @@
 	* sysdeps/arc/nptl/tcb-offsets.sym: New file.
 	* sysdeps/arc/nptl/tls.h: New file.
 	* sysdeps/arc/stackinfo.h: New file.
+	* sysdeps/arc/atomic-machine.h: New file.
+	* sysdeps/arc/nptl/bits/pthreadtypes-arch.h: New file.
+	* sysdeps/arc/nptl/bits/semaphore.h: New file.
 
 2019-01-25  Siddhesh Poyarekar  <siddhesh at sourceware.org>
 
diff --git a/sysdeps/arc/atomic-machine.h b/sysdeps/arc/atomic-machine.h
new file mode 100644
index 000000000000..bdc91d0558f9
--- /dev/null
+++ b/sysdeps/arc/atomic-machine.h
@@ -0,0 +1,73 @@
+/* Low-level functions for atomic operations. ARC version.
+   Copyright (C) 2012-2019 Free Software Foundation, Inc.
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
+#define USE_ATOMIC_COMPILER_BUILTINS 1
+
+/* ARC does have legacy atomic EX reg, [mem] instruction but the micro-arch
+   is not as optimal as LLOCK/SCOND specially for SMP.  */
+#define ATOMIC_EXCHANGE_USES_CAS 1
+
+#define __arch_compare_and_exchange_bool_8_acq(mem, newval, oldval)	\
+  (abort (), 0)
+#define __arch_compare_and_exchange_bool_16_acq(mem, newval, oldval)	\
+  (abort (), 0)
+#define __arch_compare_and_exchange_bool_64_acq(mem, newval, oldval)	\
+  (abort (), 0)
+
+#define __arch_compare_and_exchange_val_8_int(mem, newval, oldval, model)	\
+  (abort (), (__typeof (*mem)) 0)
+#define __arch_compare_and_exchange_val_16_int(mem, newval, oldval, model)	\
+  (abort (), (__typeof (*mem)) 0)
+#define __arch_compare_and_exchange_val_64_int(mem, newval, oldval, model)	\
+  (abort (), (__typeof (*mem)) 0)
+
+#define __arch_compare_and_exchange_val_32_int(mem, newval, oldval, model)	\
+  ({										\
+    typeof (*mem) __oldval = (oldval);                                  	\
+    __atomic_compare_exchange_n (mem, (void *) &__oldval, newval, 0,    	\
+                                 model, __ATOMIC_RELAXED);              	\
+    __oldval;                                                           	\
+  })
+
+#define atomic_compare_and_exchange_val_acq(mem, new, old)		\
+  __atomic_val_bysize (__arch_compare_and_exchange_val, int,		\
+		       mem, new, old, __ATOMIC_ACQUIRE)
+
+#ifdef __ARC700__
+#define atomic_full_barrier()  ({ asm volatile ("sync":::"memory"); })
+#else
+#define atomic_full_barrier()  ({ asm volatile ("dmb 3":::"memory"); })
+#endif
+
+#endif /* _ARC_BITS_ATOMIC_H */
diff --git a/sysdeps/arc/nptl/bits/pthreadtypes-arch.h b/sysdeps/arc/nptl/bits/pthreadtypes-arch.h
new file mode 100644
index 000000000000..cd91785a331c
--- /dev/null
+++ b/sysdeps/arc/nptl/bits/pthreadtypes-arch.h
@@ -0,0 +1,72 @@
+/* Machine-specific pthread type layouts.  ARC version.
+   Copyright (C) 2012-2019 Free Software Foundation, Inc.
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
+/* Data structure for mutex handling.  */
+#define __PTHREAD_COMPAT_PADDING_MID
+#define __PTHREAD_COMPAT_PADDING_END
+#define __PTHREAD_MUTEX_LOCK_ELISION    0
+#define __PTHREAD_MUTEX_NUSERS_AFTER_KIND  1
+#define __PTHREAD_MUTEX_USE_UNION          1
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
index 000000000000..662d08401d0c
--- /dev/null
+++ b/sysdeps/arc/nptl/bits/semaphore.h
@@ -0,0 +1,32 @@
+/* Machine-specific POSIX semaphore type layouts.  ARC version.
+   Copyright (C) 2002-2019 Free Software Foundation, Inc.
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
-- 
2.7.4
