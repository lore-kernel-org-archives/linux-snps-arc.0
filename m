From: nicolas.pitre@linaro.org (Nicolas Pitre)
Date: Thu, 29 Oct 2015 21:26:25 -0400 (EDT)
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <alpine.LFD.2.20.1510281907170.630@knanqh.ubzr>
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
 <alpine.LFD.2.20.1510281907170.630@knanqh.ubzr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.LFD.2.20.1510292112590.630@knanqh.ubzr>
To: linux-snps-arc@lists.infradead.org

On Wed, 28 Oct 2015, Nicolas Pitre wrote:

> On Thu, 29 Oct 2015, Alexey Brodkin wrote:
> 
> > Fortunately we already have much better __div64_32() for 32-bit ARM.
> > There in case of division by constant preprocessor calculates so-called
> > "magic number" which is later used in multiplications instead of divisions.
> 
> It's not magic, it is science.  :-)
> 
> > It's really nice and very optimal but obviously works only for ARM
> > because ARM assembly is involved.
> > 
> > Now why don't we extend the same approach to all other 32-bit arches
> > with multiplication part implemented in pure C. With good compiler
> > resulting assembly will be quite close to manually written assembly.

Well... not as close at least on ARM.  Maybe 2x to 3x more costly than 
the one with assembly.  Still better than 100x or so without this 
optimization.

> > But there's at least 1 problem which I don't know how to solve.
> > Preprocessor magic only happens if __div64_32() is inlined (that's
> > obvious - preprocessor has to know if divider is constant or not).
> > 
> > But __div64_32() is already marked as weak function (which in its turn
> > is required to allow some architectures to provide its own optimal
> > implementations). I.e. addition of "inline" for __div64_32() is not an
> > option.
> 
> You can't inline __div64_32().  It should remain as is and used only for 
> the slow path.
> 
> For the constant based optimization to work, you need to modify do_div() 
> in include/asm-generic/div64.h directly.

OK... I was intrigued, so I adapted my ARM code to the generic case, 
including the overflow avoidance optimizations.  Please have look and 
tell me how this works for you.

If this patch is accepted upstream, then it could be possible to 
abstract only the actual multiplication part with some architecture 
specific assembly.

diff --git a/include/asm-generic/div64.h b/include/asm-generic/div64.h
index 8f4e319334..43c3b21dca 100644
--- a/include/asm-generic/div64.h
+++ b/include/asm-generic/div64.h
@@ -32,6 +32,149 @@
 
 #elif BITS_PER_LONG == 32
 
+/* macroized fls implementation to ensure proper constant propagation */
+#define __div64_fls(bits)						\
+({								\
+	unsigned int __left = (bits), __nr = 0;			\
+	if (__left & 0xffff0000) __nr += 16, __left >>= 16;	\
+	if (__left & 0x0000ff00) __nr +=  8, __left >>=  8;	\
+	if (__left & 0x000000f0) __nr +=  4, __left >>=  4;	\
+	if (__left & 0x0000000c) __nr +=  2, __left >>=  2;	\
+	if (__left & 0x00000002) __nr +=  1;			\
+	__nr;							\
+})
+
+/*
+ * If the divisor happens to be constant, we determine the appropriate
+ * inverse at compile time to turn the division into a few inline
+ * multiplications which ought to be much faster. And yet only if compiling
+ * with a sufficiently recent gcc version to perform proper 64-bit constant
+ * propagation.
+ *
+ * (It is unfortunate that gcc doesn't perform all this internally.)
+ */
+#define __div64_const32(n, ___b)						\
+({									\
+	/*								\
+	 * Multiplication by reciprocal of b: n / b = n * (p / b) / p	\
+	 *								\
+	 * We rely on the fact that most of this code gets optimized	\
+	 * away at compile time due to constant propagation and only	\
+	 * a few multiplication instructions should remain.		\
+	 * Hence this monstrous macro (static inline doesn't always	\
+	 * do the trick for some reason).				\
+	 */								\
+	uint64_t ___res, ___x, ___t, ___m, ___n = (n);			\
+	uint32_t ___c, ___p, ___m_lo, ___m_hi, ___n_lo, ___n_hi;	\
+									\
+	/* determine number of bits to represent b */			\
+	___p = 1 << __div64_fls(___b);					\
+									\
+	/* compute m = ((p << 64) + b - 1) / b */			\
+	___m = (~0ULL / ___b) * ___p;					\
+	___m += (((~0ULL % ___b + 1) * ___p) + ___b - 1) / ___b;	\
+									\
+	/* dividend that produces one less than the highest result */	\
+	___x = ~0ULL / ___b * ___b - 1;					\
+									\
+	/* test our m with res = m * x / (p << 64) */			\
+	___res = ((___m & 0xffffffff) * (___x & 0xffffffff)) >> 32;	\
+	___t = ___res += (___m & 0xffffffff) * (___x >> 32);		\
+	___res += (___x & 0xffffffff) * (___m >> 32);			\
+	___t = (___res < ___t) ? (1ULL << 32) : 0;			\
+	___res = (___res >> 32) + ___t;					\
+	___res += (___m >> 32) * (___x >> 32);				\
+	___res /= ___p;							\
+									\
+	/* Now sanitize and optimize what we've got. */			\
+	if (~0ULL % (___b / (___b & -___b)) == 0) {			\
+		/* those cases can be simplified with: */		\
+		___n /= (___b & -___b);					\
+		___m = ~0ULL / (___b / (___b & -___b));			\
+		___p = 1;						\
+		___c = 1;						\
+	} else if (___res != ___x / ___b) {				\
+		/*							\
+		 * We can't get away without a correction to compensate	\
+		 * for bit truncation errors.  To avoid it we'd need an	\
+		 * additional bit to represent m which would overflow	\
+		 * our 64-bit variable.					\
+		 *							\
+		 * Instead we do m = p / b and n / b = (n * m + m) / p.	\
+		 */							\
+		___c = 1;						\
+		/* Compute m = (p << 64) / b */				\
+		___m = (~0ULL / ___b) * ___p;				\
+		___m += ((~0ULL % ___b + 1) * ___p) / ___b;		\
+	} else {							\
+		/*							\
+		 * Reduce m / p, and try to clear bit 31 of m when	\
+		 * possible, otherwise that'll need extra overflow	\
+		 * handling later.					\
+		 */							\
+		unsigned int ___bits = -(___m & -___m);			\
+		___bits |= ___m >> 32;					\
+		___bits = (~___bits) << 1;				\
+		/*							\
+		 * If ___bits == 0 then setting bit 31 is  unavoidable.	\
+		 * Simply apply the maximum possible reduction in that	\
+		 * case. Otherwise the MSB of ___bits indicates the	\
+		 * best reduction we should apply.			\
+		 */							\
+		if (!___bits) {						\
+			___p /= (___m & -___m);				\
+			___m /= (___m & -___m);				\
+		} else {						\
+			___p >>= __div64_fls(___bits);			\
+			___m >>= __div64_fls(___bits);			\
+		}							\
+		/* No correction needed. */				\
+		___c = 0;						\
+	}								\
+									\
+	/*								\
+	 * Now we have a combination of 2 conditions:			\
+	 *								\
+	 * 1) whether or not we need a correction (___c), and		\
+	 *								\
+	 * 2) whether or not there might be an overflow in the cross	\
+	 *    product determined by (___m & ((1 << 63) | (1 << 31))).	\
+	 *								\
+	 * Select the best way to do the m * n / (p << 64) operation.	\
+	 * From here on there will be actual runtime code generated.	\
+	 */								\
+									\
+	___m_lo = ___m;							\
+	___m_hi = ___m >> 32;						\
+	___n_lo = ___n;							\
+	___n_hi = ___n >> 32;						\
+									\
+	if (!___c) {							\
+		___res = ((uint64_t)___m_lo * ___n_lo) >> 32;		\
+	} else if (!(___m & ((1ULL << 63) | (1ULL << 31)))) {		\
+		___res = (___m + (uint64_t)___m_lo * ___n_lo) >> 32;	\
+	} else {							\
+		___res = ___m + (uint64_t)___m_lo * ___n_lo;		\
+		___t = (___res < ___m) ? (1ULL << 32) : 0;		\
+	       	___res = (___res >> 32) + ___t;				\
+	}								\
+									\
+	if (!(___m & ((1ULL << 63) | (1ULL << 31)))) {			\
+		___res += (uint64_t)___m_lo * ___n_hi;			\
+		___res += (uint64_t)___m_hi * ___n_lo;			\
+		___res >>= 32;						\
+	} else {							\
+		___t = ___res += (uint64_t)___m_lo * ___n_hi;		\
+		___res += (uint64_t)___m_hi * ___n_lo;			\
+		___t = (___res < ___t) ? (1ULL << 32) : 0;		\
+		___res = (___res >> 32) + ___t;				\
+	}								\
+									\
+	___res += (uint64_t)___m_hi * ___n_hi;				\
+									\
+	___res / ___p;							\
+})
+
 extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
 
 /* The unnecessary pointer compare is there
@@ -41,7 +184,20 @@ extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
 	uint32_t __base = (base);			\
 	uint32_t __rem;					\
 	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
-	if (likely(((n) >> 32) == 0)) {			\
+	if (__builtin_constant_p(__base) &&		\
+	    (__base & (__base - 1)) == 0) {		\
+		/* constant power of 2: gcc is fine */	\
+		__rem = (n) & (__base - 1);		\
+		(n) /= __base;				\
+	} else if ((__GNUC__ >= 4) &&			\
+	    __builtin_constant_p(__base) &&		\
+	    __base != 0) {				\
+		uint32_t __res_lo, __n_lo = (n);	\
+		(n) = __div64_const32(n, __base);	\
+		/* the remainder can be computed with 32-bit regs */ \
+		__res_lo = (n);				\
+		__rem = __n_lo - __res_lo * __base;	\
+	} else if (likely(((n) >> 32) == 0)) {		\
 		__rem = (uint32_t)(n) % __base;		\
 		(n) = (uint32_t)(n) / __base;		\
 	} else 						\
