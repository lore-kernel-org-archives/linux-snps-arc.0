From: noamc@ezchip.com (Noam Camus)
Date: Wed, 16 Dec 2015 03:10:33 +0200
Subject: [PATCH v4 14/19] ARC: [plat-eznps] Use dedicated atomic/bitops/cmpxchg
In-Reply-To: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
References: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1450228238-4499-15-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

We need our own implementaions since we lack LLSC support.
Our extended ISA provided with optimized solution for all 32bit
operations we see in these three headers.
Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/include/asm/atomic.h  |   79 +++++++++++++++++++++++++++++++++++-
 arch/arc/include/asm/bitops.h  |   54 +++++++++++++++++++++++++
 arch/arc/include/asm/cmpxchg.h |   87 +++++++++++++++++++++++++++++++++-------
 3 files changed, 202 insertions(+), 18 deletions(-)

diff --git a/arch/arc/include/asm/atomic.h b/arch/arc/include/asm/atomic.h
index 7730d30..a626996 100644
--- a/arch/arc/include/asm/atomic.h
+++ b/arch/arc/include/asm/atomic.h
@@ -17,6 +17,7 @@
 #include <asm/barrier.h>
 #include <asm/smp.h>
 
+#ifndef CONFIG_ARC_PLAT_EZNPS
 #define atomic_read(v)  READ_ONCE((v)->counter)
 
 #ifdef CONFIG_ARC_HAS_LLSC
@@ -180,12 +181,84 @@ ATOMIC_OP(andnot, &= ~, bic)
 ATOMIC_OP(or, |=, or)
 ATOMIC_OP(xor, ^=, xor)
 
-#undef ATOMIC_OPS
-#undef ATOMIC_OP_RETURN
-#undef ATOMIC_OP
 #undef SCOND_FAIL_RETRY_VAR_DEF
 #undef SCOND_FAIL_RETRY_ASM
 #undef SCOND_FAIL_RETRY_VARS
+#else /* CONFIG_ARC_PLAT_EZNPS */
+static inline int atomic_read(const atomic_t *v)
+{
+	int temp;
+
+	__asm__ __volatile__(
+	"	ld.di %0, [%1]"
+	: "=r"(temp)
+	: "r"(&v->counter)
+	: "memory");
+	return temp;
+}
+
+static inline void atomic_set(atomic_t *v, int i)
+{
+	__asm__ __volatile__(
+	"	st.di %0,[%1]"
+	:
+	: "r"(i), "r"(&v->counter)
+	: "memory");
+}
+
+#define ATOMIC_OP(op, c_op, asm_op)					\
+static inline void atomic_##op(int i, atomic_t *v)			\
+{									\
+	__asm__ __volatile__(						\
+	"	mov r2, %0\n"						\
+	"	mov r3, %1\n"						\
+	"       .word %2\n"						\
+	:								\
+	: "r"(i), "r"(&v->counter), "i"(asm_op)				\
+	: "r2", "r3", "memory");					\
+}									\
+
+#define ATOMIC_OP_RETURN(op, c_op, asm_op)				\
+static inline int atomic_##op##_return(int i, atomic_t *v)		\
+{									\
+	unsigned int temp = i;						\
+									\
+	/* Explicit full memory barrier needed before/after */		\
+	smp_mb();							\
+									\
+	__asm__ __volatile__(						\
+	"	mov r2, %0\n"						\
+	"	mov r3, %1\n"						\
+	"       .word %2\n"						\
+	"	mov %0, r2"						\
+	: "+r"(temp)							\
+	: "r"(&v->counter), "i"(asm_op)					\
+	: "r2", "r3", "memory");					\
+									\
+	smp_mb();							\
+									\
+	temp c_op i;							\
+									\
+	return temp;							\
+}
+
+#define ATOMIC_OPS(op, c_op, asm_op)					\
+	ATOMIC_OP(op, c_op, asm_op)					\
+	ATOMIC_OP_RETURN(op, c_op, asm_op)
+
+ATOMIC_OPS(add, +=, CTOP_INST_AADD_DI_R2_R2_R3)
+#define atomic_sub(i, v) atomic_add(-(i), (v))
+#define atomic_sub_return(i, v) atomic_add_return(-(i), (v))
+
+ATOMIC_OP(and, &=, CTOP_INST_AAND_DI_R2_R2_R3)
+#define atomic_andnot(mask, v) atomic_and(~(mask), (v))
+ATOMIC_OP(or, |=, CTOP_INST_AOR_DI_R2_R2_R3)
+ATOMIC_OP(xor, ^=, CTOP_INST_AXOR_DI_R2_R2_R3)
+#endif /* CONFIG_ARC_PLAT_EZNPS */
+
+#undef ATOMIC_OPS
+#undef ATOMIC_OP_RETURN
+#undef ATOMIC_OP
 
 /**
  * __atomic_add_unless - add unless the number is a given value
diff --git a/arch/arc/include/asm/bitops.h b/arch/arc/include/asm/bitops.h
index 57c1f33..5a29185 100644
--- a/arch/arc/include/asm/bitops.h
+++ b/arch/arc/include/asm/bitops.h
@@ -22,6 +22,7 @@
 #include <asm/smp.h>
 #endif
 
+#ifndef CONFIG_ARC_PLAT_EZNPS
 #if defined(CONFIG_ARC_HAS_LLSC)
 
 /*
@@ -155,6 +156,53 @@ static inline int test_and_##op##_bit(unsigned long nr, volatile unsigned long *
 }
 
 #endif /* CONFIG_ARC_HAS_LLSC */
+#else /* CONFIG_ARC_PLAT_EZNPS */
+#define BIT_OP(op, c_op, asm_op)					\
+static inline void op##_bit(unsigned long nr, volatile unsigned long *m)\
+{									\
+	m += nr >> 5;							\
+									\
+	nr = (1UL << (nr & 0x1f));					\
+	if (asm_op == CTOP_INST_AAND_DI_R2_R2_R3)			\
+		nr = ~nr;						\
+									\
+	__asm__ __volatile__(						\
+	"	mov r2, %0\n"						\
+	"	mov r3, %1\n"						\
+	"	.word %2\n"						\
+	:								\
+	: "r"(nr), "r"(m), "i"(asm_op)					\
+	: "r2", "r3", "memory");					\
+}
+
+#define TEST_N_BIT_OP(op, c_op, asm_op)					\
+static inline int test_and_##op##_bit(unsigned long nr, volatile unsigned long *m)\
+{									\
+	unsigned long old;						\
+									\
+	m += nr >> 5;							\
+									\
+	nr = old = (1UL << (nr & 0x1f));				\
+	if (asm_op == CTOP_INST_AAND_DI_R2_R2_R3)			\
+		old = ~old;						\
+									\
+	/* Explicit full memory barrier needed before/after */		\
+	smp_mb();							\
+									\
+	__asm__ __volatile__(						\
+	"	mov r2, %0\n"						\
+	"	mov r3, %1\n"						\
+	"       .word %2\n"						\
+	"	mov %0, r2"						\
+	: "+r"(old)							\
+	: "r"(m), "i"(asm_op)						\
+	: "r2", "r3", "memory");					\
+									\
+	smp_mb();							\
+									\
+	return (old & nr) != 0;					\
+}
+#endif /* CONFIG_ARC_PLAT_EZNPS */
 
 /***************************************
  * Non atomic variants
@@ -196,9 +244,15 @@ static inline int __test_and_##op##_bit(unsigned long nr, volatile unsigned long
 	/* __test_and_set_bit(), __test_and_clear_bit(), __test_and_change_bit() */\
 	__TEST_N_BIT_OP(op, c_op, asm_op)
 
+#ifndef CONFIG_ARC_PLAT_EZNPS
 BIT_OPS(set, |, bset)
 BIT_OPS(clear, & ~, bclr)
 BIT_OPS(change, ^, bxor)
+#else
+BIT_OPS(set, |, CTOP_INST_AOR_DI_R2_R2_R3)
+BIT_OPS(clear, & ~, CTOP_INST_AAND_DI_R2_R2_R3)
+BIT_OPS(change, ^, CTOP_INST_AXOR_DI_R2_R2_R3)
+#endif
 
 /*
  * This routine doesn't need to be atomic.
diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index af7a2db..6d320d3 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -14,6 +14,7 @@
 #include <asm/barrier.h>
 #include <asm/smp.h>
 
+#ifndef CONFIG_ARC_PLAT_EZNPS
 #ifdef CONFIG_ARC_HAS_LLSC
 
 static inline unsigned long
@@ -66,21 +67,6 @@ __cmpxchg(volatile void *ptr, unsigned long expected, unsigned long new)
 
 #endif /* CONFIG_ARC_HAS_LLSC */
 
-#define cmpxchg(ptr, o, n) ((typeof(*(ptr)))__cmpxchg((ptr), \
-				(unsigned long)(o), (unsigned long)(n)))
-
-/*
- * Since not supported natively, ARC cmpxchg() uses atomic_ops_lock (UP/SMP)
- * just to gaurantee semantics.
- * atomic_cmpxchg() needs to use the same locks as it's other atomic siblings
- * which also happens to be atomic_ops_lock.
- *
- * Thus despite semantically being different, implementation of atomic_cmpxchg()
- * is same as cmpxchg().
- */
-#define atomic_cmpxchg(v, o, n) ((int)cmpxchg(&((v)->counter), (o), (n)))
-
-
 /*
  * xchg (reg with memory) based on "Native atomic" EX insn
  */
@@ -143,6 +129,63 @@ static inline unsigned long __xchg(unsigned long val, volatile void *ptr,
 
 #endif
 
+#else /* CONFIG_ARC_PLAT_EZNPS */
+static inline unsigned long
+__cmpxchg(volatile void *ptr, unsigned long expected, unsigned long new)
+{
+	/*
+	 * Explicit full memory barrier needed before/after
+	 */
+	smp_mb();
+
+	write_aux_reg(CTOP_AUX_GPA1, expected);
+
+	__asm__ __volatile__(
+	"	mov r2, %0\n"
+	"	mov r3, %1\n"
+	"	.word %2\n"
+	"	mov %0, r2"
+	: "+r"(new)
+	: "r"(ptr), "i"(CTOP_INST_EXC_DI_R2_R2_R3)
+	: "r2", "r3", "memory");
+
+	smp_mb();
+
+	return new;
+}
+
+static inline unsigned long __xchg(unsigned long val, volatile void *ptr,
+				   int size)
+{
+	extern unsigned long __xchg_bad_pointer(void);
+
+	switch (size) {
+	case 4:
+		/*
+		 * Explicit full memory barrier needed before/after
+		 */
+		smp_mb();
+
+		__asm__ __volatile__(
+		"	mov r2, %0\n"
+		"	mov r3, %1\n"
+		"	.word %2\n"
+		"	mov %0, r2\n"
+		: "+r"(val)
+		: "r"(ptr), "i"(CTOP_INST_XEX_DI_R2_R2_R3)
+		: "r2", "r3", "memory");
+
+		smp_mb();
+
+		return val;
+	}
+	return __xchg_bad_pointer();
+}
+
+#define xchg(ptr, with) ((typeof(*(ptr)))__xchg((unsigned long)(with), (ptr), \
+						 sizeof(*(ptr))))
+#endif /* CONFIG_ARC_PLAT_EZNPS */
+
 /*
  * "atomic" variant of xchg()
  * REQ: It needs to follow the same serialization rules as other atomic_xxx()
@@ -158,4 +201,18 @@ static inline unsigned long __xchg(unsigned long val, volatile void *ptr,
  */
 #define atomic_xchg(v, new) (xchg(&((v)->counter), new))
 
+#define cmpxchg(ptr, o, n) ((typeof(*(ptr)))__cmpxchg((ptr), \
+				(unsigned long)(o), (unsigned long)(n)))
+
+/*
+ * Since not supported natively, ARC cmpxchg() uses atomic_ops_lock (UP/SMP)
+ * just to gaurantee semantics.
+ * atomic_cmpxchg() needs to use the same locks as it's other atomic siblings
+ * which also happens to be atomic_ops_lock.
+ *
+ * Thus despite semantically being different, implementation of atomic_cmpxchg()
+ * is same as cmpxchg().
+ */
+#define atomic_cmpxchg(v, o, n) ((int)cmpxchg(&((v)->counter), (o), (n)))
+
 #endif
-- 
1.7.1
