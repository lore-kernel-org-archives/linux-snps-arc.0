From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 8 Sep 2016 12:29:27 -0700
Subject: [PATCH] ARCv2: Implement atomic64 based on LLOCKD/SCONDD instructions
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1473362967-23750-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARCv2 ISA provides 64-bit exclusive load/stores so use them to implement
the 64-bit atomics and elide the spinlock based generic 64-bit atomics

boot tested with atomic64 self-test (and GOD bless the person who wrote
them, I realized my inline assmebly is sloppy as hell)

One thing I'm not sure of is the lack of explicit memory clobber in
barrier-less ops e.g. atomic64_add() (BTW same is true for 32-bit
atomic_add() as well). Per commit 398aa66827 ("ARM: 6212/1: atomic ops:
add memory constraints to inline asm ") Will fixed ARM code by adding
appropriate constraint to atomic64_add(). For ARC instead adding memory
clobber to atomic64_set() does the trick (otherwise self-test is broked)
This is on ARC we can't possibly use "m" in atomic64_add() since that make gcc
emit register relative effective addresses which LLOCKD/SCONDD are not
allowed by ISA

Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Will Deacon <will.deacon at arm.com>
Cc: linux-snps-arc at lists.infradead.org
Cc: linux-kernel at vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Kconfig              |   2 +-
 arch/arc/include/asm/atomic.h | 255 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 254 insertions(+), 3 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 0d3e59f56974..073b3582544b 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -13,7 +13,7 @@ config ARC
 	select CLKSRC_OF
 	select CLONE_BACKWARDS
 	select COMMON_CLK
-	select GENERIC_ATOMIC64
+	select GENERIC_ATOMIC64 if !ISA_ARCV2 || !(ARC_HAS_LL64 && ARC_HAS_LLSC)
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_FIND_FIRST_BIT
 	# for now, we don't need GENERIC_IRQ_PROBE, CONFIG_GENERIC_IRQ_CHIP
diff --git a/arch/arc/include/asm/atomic.h b/arch/arc/include/asm/atomic.h
index 4e3c1b6b0806..2b7e84d8fffa 100644
--- a/arch/arc/include/asm/atomic.h
+++ b/arch/arc/include/asm/atomic.h
@@ -20,6 +20,7 @@
 #ifndef CONFIG_ARC_PLAT_EZNPS
 
 #define atomic_read(v)  READ_ONCE((v)->counter)
+#define ATOMIC_INIT(i)	{ (i) }
 
 #ifdef CONFIG_ARC_HAS_LLSC
 
@@ -343,10 +344,260 @@ ATOMIC_OPS(xor, ^=, CTOP_INST_AXOR_DI_R2_R2_R3)
 
 #define atomic_add_negative(i, v)	(atomic_add_return(i, v) < 0)
 
-#define ATOMIC_INIT(i)			{ (i) }
+
+#ifdef CONFIG_GENERIC_ATOMIC64
 
 #include <asm-generic/atomic64.h>
 
-#endif
+#else	/* Kconfig ensures this is only enabled with needed h/w assist */
+
+/*
+ * ARCv2 supports 64-bit exclusive load (LLOCKD) / store (SCONDD)
+ *  - The address HAS to be 64-bit aligned
+ *  - There are 2 semantics involved here:
+ *    = exlusive implies no interim update between load/store to same addr
+ *    = both words are observed/updated together: this is guaranteed even
+ *      for regular 64-bit load (LDD) / store (STD). Thus atomic64_set()
+ *      is NOT required to use LLOCKD+SCONDD, STD suffices
+ */
+
+typedef struct {
+	aligned_u64 counter;
+} atomic64_t;
+
+#define ATOMIC64_INIT(a) { (a) }
+
+static inline long long atomic64_read(const atomic64_t *v)
+{
+	unsigned long long val;
+
+	__asm__ __volatile__(
+	"	ldd   %0, [%1]	\n"
+	: "=r"(val)
+	: "r"(&v->counter));
+
+	return val;
+}
+
+static inline void atomic64_set(atomic64_t *v, long long a)
+{
+	/*
+	 * This could have been a simple assignment in "C" but would need
+	 * explicit volatile. Otherwise gcc optimizers could elide the store
+	 * which borked atomic64 self test
+	 */
+	__asm__ __volatile__(
+	"	std   %0, [%1]	\n"
+	:
+	: "r"(a), "r"(&v->counter)
+	: "memory");
+}
+
+#define ATOMIC64_OP(op, op1, op2)					\
+static inline void atomic64_##op(long long a, atomic64_t *v)		\
+{									\
+	unsigned long long val;						\
+									\
+	__asm__ __volatile__(						\
+	"1:				\n"				\
+	"	llockd  %0, [%1]	\n"				\
+	"	" #op1 " %L0, %L0, %L2	\n"				\
+	"	" #op2 " %H0, %H0, %H2	\n"				\
+	"	scondd   %0, [%1]	\n"				\
+	"	bnz     1b		\n"				\
+	: "=&r"(val)							\
+	: "r"(&v->counter), "ir"(a)					\
+	: "cc");						\
+}									\
+
+#define ATOMIC64_OP_RETURN(op, op1, op2)		        	\
+static inline long long atomic64_##op##_return(long long a, atomic64_t *v)	\
+{									\
+	unsigned long long val;						\
+									\
+	smp_mb();							\
+									\
+	__asm__ __volatile__(						\
+	"1:				\n"				\
+	"	llockd   %0, [%1]	\n"				\
+	"	" #op1 " %L0, %L0, %L2	\n"				\
+	"	" #op2 " %H0, %H0, %H2	\n"				\
+	"	scondd   %0, [%1]	\n"				\
+	"	bnz     1b		\n"				\
+	: [val] "=&r"(val)						\
+	: "r"(&v->counter), "ir"(a)					\
+	: "cc");	/* memory clobber comes from smp_mb() */	\
+									\
+	smp_mb();							\
+									\
+	return val;							\
+}
+
+#define ATOMIC64_FETCH_OP(op, op1, op2)		        		\
+static inline long long atomic64_fetch_##op(long long a, atomic64_t *v)	\
+{									\
+	unsigned long long val, orig;					\
+									\
+	smp_mb();							\
+									\
+	__asm__ __volatile__(						\
+	"1:				\n"				\
+	"	llockd   %0, [%2]	\n"				\
+	"	" #op1 " %L1, %L0, %L3	\n"				\
+	"	" #op2 " %H1, %H0, %H3	\n"				\
+	"	scondd   %1, [%2]	\n"				\
+	"	bnz     1b		\n"				\
+	: "=&r"(orig), "=&r"(val)					\
+	: "r"(&v->counter), "ir"(a)					\
+	: "cc");	/* memory clobber comes from smp_mb() */	\
+									\
+	smp_mb();							\
+									\
+	return orig;							\
+}
+
+#define ATOMIC64_OPS(op, op1, op2)					\
+	ATOMIC64_OP(op, op1, op2)					\
+	ATOMIC64_OP_RETURN(op, op1, op2)				\
+	ATOMIC64_FETCH_OP(op, op1, op2)
+
+#define atomic64_andnot atomic64_andnot
+
+ATOMIC64_OPS(add, add.f, adc)
+ATOMIC64_OPS(sub, sub.f, sbc)
+ATOMIC64_OPS(and, and, and)
+ATOMIC64_OPS(andnot, bic, bic)
+ATOMIC64_OPS(or, or, or)
+ATOMIC64_OPS(xor, xor, xor)
+
+#undef ATOMIC64_OPS
+#undef ATOMIC64_FETCH_OP
+#undef ATOMIC64_OP_RETURN
+#undef ATOMIC64_OP
+
+static inline long long
+atomic64_cmpxchg(atomic64_t *ptr, long long expected, long long new)
+{
+	long long prev;
+
+	smp_mb();
+
+	__asm__ __volatile__(
+	"1:	llockd  %0, [%1]	\n"
+	"	brne    %L0, %L2, 2f	\n"
+	"	brne    %H0, %H2, 2f	\n"
+	"	scondd  %3, [%1]	\n"
+	"	bnz     1b		\n"
+	"2:				\n"
+	: "=&r"(prev)
+	: "r"(ptr), "ir"(expected), "r"(new)
+	: "cc");	/* memory clobber comes from smp_mb() */
+
+	smp_mb();
+
+	return prev;
+}
+
+static inline long long atomic64_xchg(atomic64_t *ptr, long long new)
+{
+	long long prev;
+
+	smp_mb();
+
+	__asm__ __volatile__(
+	"1:	llockd  %0, [%1]	\n"
+	"	scondd  %2, [%1]	\n"
+	"	bnz     1b		\n"
+	"2:				\n"
+	: "=&r"(prev)
+	: "r"(ptr), "r"(new)
+	: "cc");	/* memory clobber comes from smp_mb() */
+
+	smp_mb();
+
+	return prev;
+}
+
+/**
+ * atomic64_dec_if_positive - decrement by 1 if old value positive
+ * @v: pointer of type atomic64_t
+ *
+ * The function returns the old value of *v minus 1, even if
+ * the atomic variable, v, was not decremented.
+ */
+
+static inline long long atomic64_dec_if_positive(atomic64_t *v)
+{
+	long long val;
+
+	smp_mb();
+
+	__asm__ __volatile__(
+	"1:	llockd  %0, [%1]	\n"
+	"	sub.f   %L0, %L0, 1	# w0 - 1, set C on borrow\n"
+	"	sub.c   %H0, %H0, 1	# if C set, w1 - 1\n"
+	"	brlt    %H0, 0, 2f	\n"
+	"	scondd  %0, [%1]	\n"
+	"	bnz     1b		\n"
+	"2:				\n"
+	: "=&r"(val)
+	: "r"(&v->counter)
+	: "cc");	/* memory clobber comes from smp_mb() */
+
+	smp_mb();
+
+	return val;
+}
+
+/**
+ * atomic64_add_unless - add unless the number is a given value
+ * @v: pointer of type atomic64_t
+ * @a: the amount to add to v...
+ * @u: ...unless v is equal to u.
+ *
+ * if (v != u) { v += a; ret = 1} else {ret = 0}
+ * Returns 1 iff @v was not @u (i.e. if add actually happened)
+ */
+static inline int atomic64_add_unless(atomic64_t *v, long long a, long long u)
+{
+	long long val;
+	int op_done;
+
+	smp_mb();
+
+	__asm__ __volatile__(
+	"1:	llockd  %0, [%2]	\n"
+	"	mov	%1, 1		\n"
+	"	brne	%L0, %L4, 2f	# continue to add since v != u \n"
+	"	breq.d	%H0, %H4, 3f	# return since v == u \n"
+	"	mov	%1, 0		\n"
+	"2:				\n"
+	"	add.f   %L0, %L0, %L3	\n"
+	"	adc     %H0, %H0, %H3	\n"
+	"	scondd  %0, [%2]	\n"
+	"	bnz     1b		\n"
+	"3:				\n"
+	: "=&r"(val), "=&r" (op_done)
+	: "r"(&v->counter), "r"(a), "r"(u)
+	: "cc");	/* memory clobber comes from smp_mb() */
+
+	smp_mb();
+
+	return op_done;
+}
+
+#define atomic64_add_negative(a, v)	(atomic64_add_return((a), (v)) < 0)
+#define atomic64_inc(v)			atomic64_add(1LL, (v))
+#define atomic64_inc_return(v)		atomic64_add_return(1LL, (v))
+#define atomic64_inc_and_test(v)	(atomic64_inc_return(v) == 0)
+#define atomic64_sub_and_test(a, v)	(atomic64_sub_return((a), (v)) == 0)
+#define atomic64_dec(v)			atomic64_sub(1LL, (v))
+#define atomic64_dec_return(v)		atomic64_sub_return(1LL, (v))
+#define atomic64_dec_and_test(v)	(atomic64_dec_return((v)) == 0)
+#define atomic64_inc_not_zero(v)	atomic64_add_unless((v), 1LL, 0LL)
+
+#endif	/* !CONFIG_GENERIC_ATOMIC64 */
+
+#endif	/* !__ASSEMBLY__ */
 
 #endif
-- 
2.7.4
