From: lkp@intel.com (kbuild test robot)
Date: Tue, 10 Jul 2018 02:05:33 +0800
Subject: [PATCH] atomic{64}_t: Explicitly specify data storage length and
 alignment
In-Reply-To: <20180709124741.21037-1-abrodkin@synopsys.com>
References: <20180709124741.21037-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201807100026.VLTnDiLB%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v4.18-rc4 next-20180709]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Alexey-Brodkin/atomic-64-_t-Explicitly-specify-data-storage-length-and-alignment/20180709-223920
config: s390-allmodconfig (attached as .config)
compiler: s390x-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.2.0 make.cross ARCH=s390 

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/atomic.h:5:0,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from kernel/bounds.c:14:
   arch/s390/include/asm/atomic.h: In function 'atomic64_add_return':
>> arch/s390/include/asm/atomic.h:129:35: error: passing argument 2 of '__atomic64_add_barrier' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return __atomic64_add_barrier(i, &v->counter) + i;
                                      ^
   In file included from arch/s390/include/asm/bitops.h:38:0,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from arch/s390/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/s390/include/asm/atomic_ops.h:35:14: note: expected 'long int *' but argument is of type 'u64 * {aka long long unsigned int *}'
    __ATOMIC_OPS(__atomic64_add, long, "laag")
                 ^
   arch/s390/include/asm/atomic_ops.h:14:23: note: in definition of macro '__ATOMIC_OP'
    static inline op_type op_name(op_type val, op_type *ptr)  \
                          ^~~~~~~
>> arch/s390/include/asm/atomic_ops.h:35:1: note: in expansion of macro '__ATOMIC_OPS'
    __ATOMIC_OPS(__atomic64_add, long, "laag")
    ^~~~~~~~~~~~
   In file included from include/linux/atomic.h:5:0,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from kernel/bounds.c:14:
   arch/s390/include/asm/atomic.h: In function 'atomic64_fetch_add':
   arch/s390/include/asm/atomic.h:134:35: error: passing argument 2 of '__atomic64_add_barrier' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return __atomic64_add_barrier(i, &v->counter);
                                      ^
   In file included from arch/s390/include/asm/bitops.h:38:0,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from arch/s390/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/s390/include/asm/atomic_ops.h:35:14: note: expected 'long int *' but argument is of type 'u64 * {aka long long unsigned int *}'
    __ATOMIC_OPS(__atomic64_add, long, "laag")
                 ^
   arch/s390/include/asm/atomic_ops.h:14:23: note: in definition of macro '__ATOMIC_OP'
    static inline op_type op_name(op_type val, op_type *ptr)  \
                          ^~~~~~~
>> arch/s390/include/asm/atomic_ops.h:35:1: note: in expansion of macro '__ATOMIC_OPS'
    __ATOMIC_OPS(__atomic64_add, long, "laag")
    ^~~~~~~~~~~~
   In file included from include/linux/atomic.h:5:0,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from kernel/bounds.c:14:
   arch/s390/include/asm/atomic.h: In function 'atomic64_add':
>> arch/s390/include/asm/atomic.h:141:27: error: passing argument 2 of '__atomic64_add_const' from incompatible pointer type [-Werror=incompatible-pointer-types]
      __atomic64_add_const(i, &v->counter);
                              ^
   In file included from arch/s390/include/asm/bitops.h:38:0,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from arch/s390/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/s390/include/asm/atomic_ops.h:57:20: note: expected 'long int *' but argument is of type 'u64 * {aka long long unsigned int *}'
    __ATOMIC_CONST_OPS(__atomic64_add_const, long, "agsi")
                       ^
   arch/s390/include/asm/atomic_ops.h:44:20: note: in definition of macro '__ATOMIC_CONST_OP'
    static inline void op_name(op_type val, op_type *ptr)   \
                       ^~~~~~~
>> arch/s390/include/asm/atomic_ops.h:57:1: note: in expansion of macro '__ATOMIC_CONST_OPS'
    __ATOMIC_CONST_OPS(__atomic64_add_const, long, "agsi")
    ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/atomic.h:5:0,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from kernel/bounds.c:14:
>> arch/s390/include/asm/atomic.h:145:20: error: passing argument 2 of '__atomic64_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
     __atomic64_add(i, &v->counter);
                       ^
   In file included from arch/s390/include/asm/bitops.h:38:0,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from arch/s390/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/s390/include/asm/atomic_ops.h:35:14: note: expected 'long int *' but argument is of type 'u64 * {aka long long unsigned int *}'
    __ATOMIC_OPS(__atomic64_add, long, "laag")
                 ^
   arch/s390/include/asm/atomic_ops.h:14:23: note: in definition of macro '__ATOMIC_OP'
    static inline op_type op_name(op_type val, op_type *ptr)  \
                          ^~~~~~~
>> arch/s390/include/asm/atomic_ops.h:35:1: note: in expansion of macro '__ATOMIC_OPS'
    __ATOMIC_OPS(__atomic64_add, long, "laag")
    ^~~~~~~~~~~~
   In file included from include/linux/atomic.h:5:0,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from kernel/bounds.c:14:
   arch/s390/include/asm/atomic.h: In function 'atomic64_cmpxchg':
>> arch/s390/include/asm/atomic.h:152:28: error: passing argument 1 of '__atomic64_cmpxchg' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return __atomic64_cmpxchg(&v->counter, old, new);
                               ^
   In file included from arch/s390/include/asm/bitops.h:38:0,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from arch/s390/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/s390/include/asm/atomic_ops.h:133:20: note: expected 'long int *' but argument is of type 'u64 * {aka long long unsigned int *}'
    static inline long __atomic64_cmpxchg(long *ptr, long old, long new)
                       ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/atomic.h:5:0,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from kernel/bounds.c:14:
   arch/s390/include/asm/atomic.h: In function 'atomic64_and':
>> arch/s390/include/asm/atomic.h:158:21: error: passing argument 2 of '__atomic64_and' from incompatible pointer type [-Werror=incompatible-pointer-types]
     __atomic64_##op(i, &v->counter);    \
                        ^
>> arch/s390/include/asm/atomic.h:165:1: note: in expansion of macro 'ATOMIC64_OPS'
    ATOMIC64_OPS(and)
    ^~~~~~~~~~~~
   In file included from arch/s390/include/asm/bitops.h:38:0,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from arch/s390/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/s390/include/asm/atomic_ops.h:36:14: note: expected 'long int *' but argument is of type 'u64 * {aka long long unsigned int *}'
    __ATOMIC_OPS(__atomic64_and, long, "lang")
                 ^
   arch/s390/include/asm/atomic_ops.h:14:23: note: in definition of macro '__ATOMIC_OP'
    static inline op_type op_name(op_type val, op_type *ptr)  \
                          ^~~~~~~
   arch/s390/include/asm/atomic_ops.h:36:1: note: in expansion of macro '__ATOMIC_OPS'
    __ATOMIC_OPS(__atomic64_and, long, "lang")
    ^~~~~~~~~~~~
   In file included from include/linux/atomic.h:5:0,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from kernel/bounds.c:14:
   arch/s390/include/asm/atomic.h: In function 'atomic64_fetch_and':
>> arch/s390/include/asm/atomic.h:162:38: error: passing argument 2 of '__atomic64_and_barrier' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return __atomic64_##op##_barrier(i, &v->counter);  \
                                         ^
>> arch/s390/include/asm/atomic.h:165:1: note: in expansion of macro 'ATOMIC64_OPS'
    ATOMIC64_OPS(and)
    ^~~~~~~~~~~~
   In file included from arch/s390/include/asm/bitops.h:38:0,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from arch/s390/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/s390/include/asm/atomic_ops.h:36:14: note: expected 'long int *' but argument is of type 'u64 * {aka long long unsigned int *}'
    __ATOMIC_OPS(__atomic64_and, long, "lang")
                 ^
   arch/s390/include/asm/atomic_ops.h:14:23: note: in definition of macro '__ATOMIC_OP'
    static inline op_type op_name(op_type val, op_type *ptr)  \
                          ^~~~~~~
   arch/s390/include/asm/atomic_ops.h:36:1: note: in expansion of macro '__ATOMIC_OPS'
    __ATOMIC_OPS(__atomic64_and, long, "lang")
    ^~~~~~~~~~~~
   In file included from include/linux/atomic.h:5:0,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from kernel/bounds.c:14:
   arch/s390/include/asm/atomic.h: In function 'atomic64_or':
>> arch/s390/include/asm/atomic.h:158:21: error: passing argument 2 of '__atomic64_or' from incompatible pointer type [-Werror=incompatible-pointer-types]
     __atomic64_##op(i, &v->counter);    \
                        ^
   arch/s390/include/asm/atomic.h:166:1: note: in expansion of macro 'ATOMIC64_OPS'
    ATOMIC64_OPS(or)
    ^~~~~~~~~~~~
   In file included from arch/s390/include/asm/bitops.h:38:0,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from arch/s390/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/s390/include/asm/atomic_ops.h:37:14: note: expected 'long int *' but argument is of type 'u64 * {aka long long unsigned int *}'
    __ATOMIC_OPS(__atomic64_or,  long, "laog")
                 ^
   arch/s390/include/asm/atomic_ops.h:14:23: note: in definition of macro '__ATOMIC_OP'
    static inline op_type op_name(op_type val, op_type *ptr)  \
                          ^~~~~~~
   arch/s390/include/asm/atomic_ops.h:37:1: note: in expansion of macro '__ATOMIC_OPS'
    __ATOMIC_OPS(__atomic64_or,  long, "laog")
    ^~~~~~~~~~~~
   In file included from include/linux/atomic.h:5:0,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from kernel/bounds.c:14:
   arch/s390/include/asm/atomic.h: In function 'atomic64_fetch_or':
>> arch/s390/include/asm/atomic.h:162:38: error: passing argument 2 of '__atomic64_or_barrier' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return __atomic64_##op##_barrier(i, &v->counter);  \
                                         ^
   arch/s390/include/asm/atomic.h:166:1: note: in expansion of macro 'ATOMIC64_OPS'
    ATOMIC64_OPS(or)
    ^~~~~~~~~~~~
   In file included from arch/s390/include/asm/bitops.h:38:0,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from arch/s390/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/s390/include/asm/atomic_ops.h:37:14: note: expected 'long int *' but argument is of type 'u64 * {aka long long unsigned int *}'
    __ATOMIC_OPS(__atomic64_or,  long, "laog")
                 ^
   arch/s390/include/asm/atomic_ops.h:14:23: note: in definition of macro '__ATOMIC_OP'
    static inline op_type op_name(op_type val, op_type *ptr)  \
                          ^~~~~~~
   arch/s390/include/asm/atomic_ops.h:37:1: note: in expansion of macro '__ATOMIC_OPS'
    __ATOMIC_OPS(__atomic64_or,  long, "laog")
    ^~~~~~~~~~~~
   In file included from include/linux/atomic.h:5:0,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from kernel/bounds.c:14:
   arch/s390/include/asm/atomic.h: In function 'atomic64_xor':
>> arch/s390/include/asm/atomic.h:158:21: error: passing argument 2 of '__atomic64_xor' from incompatible pointer type [-Werror=incompatible-pointer-types]
     __atomic64_##op(i, &v->counter);    \
                        ^
   arch/s390/include/asm/atomic.h:167:1: note: in expansion of macro 'ATOMIC64_OPS'
    ATOMIC64_OPS(xor)
    ^~~~~~~~~~~~
   In file included from arch/s390/include/asm/bitops.h:38:0,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from arch/s390/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/s390/include/asm/atomic_ops.h:38:14: note: expected 'long int *' but argument is of type 'u64 * {aka long long unsigned int *}'
    __ATOMIC_OPS(__atomic64_xor, long, "laxg")
                 ^
   arch/s390/include/asm/atomic_ops.h:14:23: note: in definition of macro '__ATOMIC_OP'
    static inline op_type op_name(op_type val, op_type *ptr)  \
                          ^~~~~~~
   arch/s390/include/asm/atomic_ops.h:38:1: note: in expansion of macro '__ATOMIC_OPS'
    __ATOMIC_OPS(__atomic64_xor, long, "laxg")
    ^~~~~~~~~~~~
   In file included from include/linux/atomic.h:5:0,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from kernel/bounds.c:14:
   arch/s390/include/asm/atomic.h: In function 'atomic64_fetch_xor':
>> arch/s390/include/asm/atomic.h:162:38: error: passing argument 2 of '__atomic64_xor_barrier' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return __atomic64_##op##_barrier(i, &v->counter);  \
                                         ^
   arch/s390/include/asm/atomic.h:167:1: note: in expansion of macro 'ATOMIC64_OPS'
    ATOMIC64_OPS(xor)
    ^~~~~~~~~~~~
   In file included from arch/s390/include/asm/bitops.h:38:0,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from arch/s390/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/s390/include/asm/atomic_ops.h:38:14: note: expected 'long int *' but argument is of type 'u64 * {aka long long unsigned int *}'
    __ATOMIC_OPS(__atomic64_xor, long, "laxg")
                 ^
   arch/s390/include/asm/atomic_ops.h:14:23: note: in definition of macro '__ATOMIC_OP'
    static inline op_type op_name(op_type val, op_type *ptr)  \
                          ^~~~~~~
   arch/s390/include/asm/atomic_ops.h:38:1: note: in expansion of macro '__ATOMIC_OPS'
    __ATOMIC_OPS(__atomic64_xor, long, "laxg")
    ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [kernel/bounds.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [sub-make] Error 2

vim +/__atomic64_add_barrier +129 arch/s390/include/asm/atomic.h

^1da177e include/asm-s390/atomic.h      Linus Torvalds     2005-04-16  126  
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11  127  static inline long atomic64_add_return(long i, atomic64_t *v)
^1da177e include/asm-s390/atomic.h      Linus Torvalds     2005-04-16  128  {
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11 @129  	return __atomic64_add_barrier(i, &v->counter) + i;
0ccc8b7a arch/s390/include/asm/atomic.h Heiko Carstens     2014-03-20  130  }
0ccc8b7a arch/s390/include/asm/atomic.h Heiko Carstens     2014-03-20  131  
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11  132  static inline long atomic64_fetch_add(long i, atomic64_t *v)
56fefbbc arch/s390/include/asm/atomic.h Peter Zijlstra     2016-04-18  133  {
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11  134  	return __atomic64_add_barrier(i, &v->counter);
56fefbbc arch/s390/include/asm/atomic.h Peter Zijlstra     2016-04-18  135  }
56fefbbc arch/s390/include/asm/atomic.h Peter Zijlstra     2016-04-18  136  
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11  137  static inline void atomic64_add(long i, atomic64_t *v)
0ccc8b7a arch/s390/include/asm/atomic.h Heiko Carstens     2014-03-20  138  {
0ccc8b7a arch/s390/include/asm/atomic.h Heiko Carstens     2014-03-20  139  #ifdef CONFIG_HAVE_MARCH_Z196_FEATURES
0ccc8b7a arch/s390/include/asm/atomic.h Heiko Carstens     2014-03-20  140  	if (__builtin_constant_p(i) && (i > -129) && (i < 128)) {
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11 @141  		__atomic64_add_const(i, &v->counter);
0ccc8b7a arch/s390/include/asm/atomic.h Heiko Carstens     2014-03-20  142  		return;
0ccc8b7a arch/s390/include/asm/atomic.h Heiko Carstens     2014-03-20  143  	}
0ccc8b7a arch/s390/include/asm/atomic.h Heiko Carstens     2014-03-20  144  #endif
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11 @145  	__atomic64_add(i, &v->counter);
^1da177e include/asm-s390/atomic.h      Linus Torvalds     2005-04-16  146  }
973bd993 include/asm-s390/atomic.h      Martin Schwidefsky 2006-01-06  147  
3a5f10e3 include/asm-s390/atomic.h      Mathieu Desnoyers  2007-02-21  148  #define atomic64_xchg(v, new) (xchg(&((v)->counter), new))
3a5f10e3 include/asm-s390/atomic.h      Mathieu Desnoyers  2007-02-21  149  
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11  150  static inline long atomic64_cmpxchg(atomic64_t *v, long old, long new)
973bd993 include/asm-s390/atomic.h      Martin Schwidefsky 2006-01-06  151  {
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11 @152  	return __atomic64_cmpxchg(&v->counter, old, new);
973bd993 include/asm-s390/atomic.h      Martin Schwidefsky 2006-01-06  153  }
^1da177e include/asm-s390/atomic.h      Linus Torvalds     2005-04-16  154  
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11  155  #define ATOMIC64_OPS(op)						\
ae8c35c8 arch/s390/include/asm/atomic.h Peter Zijlstra     2014-04-23  156  static inline void atomic64_##op(long i, atomic64_t *v)			\
ae8c35c8 arch/s390/include/asm/atomic.h Peter Zijlstra     2014-04-23  157  {									\
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11 @158  	__atomic64_##op(i, &v->counter);				\
56fefbbc arch/s390/include/asm/atomic.h Peter Zijlstra     2016-04-18  159  }									\
56fefbbc arch/s390/include/asm/atomic.h Peter Zijlstra     2016-04-18  160  static inline long atomic64_fetch_##op(long i, atomic64_t *v)		\
56fefbbc arch/s390/include/asm/atomic.h Peter Zijlstra     2016-04-18  161  {									\
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11 @162  	return __atomic64_##op##_barrier(i, &v->counter);		\
ae8c35c8 arch/s390/include/asm/atomic.h Peter Zijlstra     2014-04-23  163  }
ae8c35c8 arch/s390/include/asm/atomic.h Peter Zijlstra     2014-04-23  164  
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11 @165  ATOMIC64_OPS(and)
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11  166  ATOMIC64_OPS(or)
126b30c3 arch/s390/include/asm/atomic.h Martin Schwidefsky 2016-11-11  167  ATOMIC64_OPS(xor)
ae8c35c8 arch/s390/include/asm/atomic.h Peter Zijlstra     2014-04-23  168  

:::::: The code at line 129 was first introduced by commit
:::::: 126b30c3cb476ce68489a657a7defb8e73775e6f s390/atomic: refactor atomic primitives

:::::: TO: Martin Schwidefsky <schwidefsky at de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky at de.ibm.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 50353 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20180710/bf32f15c/attachment-0001.gz>
