From: noamc@ezchip.com (Noam Camus)
Date: Sat, 31 Oct 2015 15:15:20 +0200
Subject: [PATCH v1 13/20] ARC: [plat-eznps] Use dedicated bitops/atomic/cmpxchg
In-Reply-To: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446297327-16298-14-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

We need our own implementaions since we lack of LLSC.
Our extended ISA provided with optimized solution for all 32bit
operations we see in those three headers.
Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/include/asm/atomic.h           |   69 +++++++++++++++++++++++++++++++
 arch/arc/include/asm/bitops.h           |   49 ++++++++++++++++++++++
 arch/arc/include/asm/cmpxchg.h          |   49 ++++++++++++++++++++++
 arch/arc/plat-eznps/include/plat/ctop.h |    1 +
 4 files changed, 168 insertions(+), 0 deletions(-)

diff --git a/arch/arc/include/asm/atomic.h b/arch/arc/include/asm/atomic.h
index c3ecda0..ca318c2 100644
--- a/arch/arc/include/asm/atomic.h
+++ b/arch/arc/include/asm/atomic.h
@@ -17,6 +17,74 @@
 #include <asm/barrier.h>
 #include <asm/smp.h>
 
+#ifdef CONFIG_ARC_PLAT_EZNPS
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
+	__asm__ __volatile__(						\
+	"	mov r2, %0\n"						\
+	"	mov r3, %1\n"						\
+	"       .word %2\n"						\
+	"	mov %0, r2"						\
+	: "+r"(temp)							\
+	: "r"(&v->counter), "i"(asm_op)					\
+	: "r2", "r3", "memory");					\
+									\
+	return v->counter;						\
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
+
+#undef ATOMIC_OPS
+#undef ATOMIC_OP_RETURN
+#undef ATOMIC_OP
+#else /* CONFIG_ARC_PLAT_EZNPS */
 #define atomic_read(v)  ((v)->counter)
 
 #ifdef CONFIG_ARC_HAS_LLSC
@@ -186,6 +254,7 @@ ATOMIC_OP(xor, ^=, xor)
 #undef SCOND_FAIL_RETRY_VAR_DEF
 #undef SCOND_FAIL_RETRY_ASM
 #undef SCOND_FAIL_RETRY_VARS
+#endif /* CONFIG_ARC_PLAT_EZNPS */
 
 /**
  * __atomic_add_unless - add unless the number is a given value
diff --git a/arch/arc/include/asm/bitops.h b/arch/arc/include/asm/bitops.h
index 57c1f33..54ecbe4 100644
--- a/arch/arc/include/asm/bitops.h
+++ b/arch/arc/include/asm/bitops.h
@@ -22,6 +22,48 @@
 #include <asm/smp.h>
 #endif
 
+#ifdef CONFIG_ARC_PLAT_EZNPS
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
+	old = (1UL << (nr & 0x1f));					\
+	if (asm_op == CTOP_INST_AAND_DI_R2_R2_R3)			\
+		old = ~old;						\
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
+	return (old & (1 << nr)) != 0;					\
+}
+#else /* CONFIG_ARC_PLAT_EZNPS */
 #if defined(CONFIG_ARC_HAS_LLSC)
 
 /*
@@ -155,6 +197,7 @@ static inline int test_and_##op##_bit(unsigned long nr, volatile unsigned long *
 }
 
 #endif /* CONFIG_ARC_HAS_LLSC */
+#endif /* CONFIG_ARC_PLAT_EZNPS */
 
 /***************************************
  * Non atomic variants
@@ -196,9 +239,15 @@ static inline int __test_and_##op##_bit(unsigned long nr, volatile unsigned long
 	/* __test_and_set_bit(), __test_and_clear_bit(), __test_and_change_bit() */\
 	__TEST_N_BIT_OP(op, c_op, asm_op)
 
+#ifdef CONFIG_ARC_PLAT_EZNPS
+BIT_OPS(set, |, CTOP_INST_AOR_DI_R2_R2_R3)
+BIT_OPS(clear, & ~, CTOP_INST_AAND_DI_R2_R2_R3)
+BIT_OPS(change, ^, CTOP_INST_AXOR_DI_R2_R2_R3)
+#else
 BIT_OPS(set, |, bset)
 BIT_OPS(clear, & ~, bclr)
 BIT_OPS(change, ^, bxor)
+#endif
 
 /*
  * This routine doesn't need to be atomic.
diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index af7a2db..8578586 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -14,6 +14,53 @@
 #include <asm/barrier.h>
 #include <asm/smp.h>
 
+#ifdef CONFIG_ARC_PLAT_EZNPS
+static inline unsigned long
+__cmpxchg(volatile void *ptr, unsigned long expected, unsigned long new)
+{
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
+	return new;
+}
+
+#define cmpxchg(ptr, o, n) ((typeof(*(ptr)))__cmpxchg((ptr), \
+				(unsigned long)(o), (unsigned long)(n)))
+#define atomic_cmpxchg(v, o, n) ((int)cmpxchg(&((v)->counter), (o), (n)))
+
+static inline unsigned long __xchg(unsigned long val, volatile void *ptr,
+				   int size)
+{
+	extern unsigned long __xchg_bad_pointer(void);
+
+	switch (size) {
+	case 4:
+		__asm__ __volatile__(
+		"	mov r2, %0\n"
+		"	mov r3, %1\n"
+		"	.word %2\n"
+		"	mov %0, r2\n"
+		: "+r"(val)
+		: "r"(ptr), "i"(CTOP_INST_XEX_DI_R2_R2_R3)
+		: "r2", "r3", "memory");
+
+		return val;
+	}
+	return __xchg_bad_pointer();
+}
+
+#define xchg(ptr, with) ((typeof(*(ptr)))__xchg((unsigned long)(with), (ptr), \
+						 sizeof(*(ptr))))
+#define atomic_xchg(v, new) (xchg(&((v)->counter), new))
+#else /* CONFIG_ARC_PLAT_EZNPS */
 #ifdef CONFIG_ARC_HAS_LLSC
 
 static inline unsigned long
@@ -158,4 +205,6 @@ static inline unsigned long __xchg(unsigned long val, volatile void *ptr,
  */
 #define atomic_xchg(v, new) (xchg(&((v)->counter), new))
 
+#endif /* CONFIG_ARC_PLAT_EZNPS */
+
 #endif
diff --git a/arch/arc/plat-eznps/include/plat/ctop.h b/arch/arc/plat-eznps/include/plat/ctop.h
index b708f9f..655a860 100644
--- a/arch/arc/plat-eznps/include/plat/ctop.h
+++ b/arch/arc/plat-eznps/include/plat/ctop.h
@@ -34,6 +34,7 @@
 #define AUX_REG_TSI1			(CTOP_AUX_BASE + 0x050)
 #define CTOP_AUX_EFLAGS			(CTOP_AUX_BASE + 0x080)
 #define CTOP_AUX_IACK			(CTOP_AUX_BASE + 0x088)
+#define CTOP_AUX_GPA1			(CTOP_AUX_BASE + 0x08C)
 #define CTOP_AUX_UDMC			(CTOP_AUX_BASE + 0x300)
 
 /* EZchip core instructions */
-- 
1.7.1
