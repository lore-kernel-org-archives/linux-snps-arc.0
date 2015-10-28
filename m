From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 29 Oct 2015 01:47:35 +0300
Subject: [PATCH] __div64_32: implement division by multiplication for 32-bit
 arches
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Existing default implementation of __div64_32() for 32-bit arches unfolds
into huge routine with tons of arithmetics like +, -, * and all of them
in loops. That leads to obvious performance degradation if do_div() is
frequently used.

Good example is extensive TCP/IP traffic.
That's what I'm getting with perf out of iperf3:
 -------------->8--------------
    30.05%  iperf3   [kernel.kallsyms]        [k] copy_from_iter
    11.77%  iperf3   [kernel.kallsyms]        [k] __div64_32
     5.44%  iperf3   [kernel.kallsyms]        [k] memset
     5.32%  iperf3   [kernel.kallsyms]        [k] stmmac_xmit
     2.70%  iperf3   [kernel.kallsyms]        [k] skb_segment
     2.56%  iperf3   [kernel.kallsyms]        [k] tcp_ack
 -------------->8--------------

do_div() here is mostly used in skb_mstamp_get() to convert nanoseconds
received from local_clock() to microseconds used in timestamp.
BTW conversion itself is as simple as "/=1000".

Fortunately we already have much better __div64_32() for 32-bit ARM.
There in case of division by constant preprocessor calculates so-called
"magic number" which is later used in multiplications instead of divisions.
It's really nice and very optimal but obviously works only for ARM
because ARM assembly is involved.

Now why don't we extend the same approach to all other 32-bit arches
with multiplication part implemented in pure C. With good compiler
resulting assembly will be quite close to manually written assembly.

And that change implements that.

But there's at least 1 problem which I don't know how to solve.
Preprocessor magic only happens if __div64_32() is inlined (that's
obvious - preprocessor has to know if divider is constant or not).

But __div64_32() is already marked as weak function (which in its turn
is required to allow some architectures to provide its own optimal
implementations). I.e. addition of "inline" for __div64_32() is not an
option.

So I do want to hear opinions on how to proceed with that patch.
Indeed there's the simplest solution - use this implementation only in
my architecture of preference (read ARC) but IMHO this change may
benefit other architectures as well.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Ingo Molnar <mingo at elte.hu>
Cc: Stephen Hemminger <shemminger at linux-foundation.org>
Cc: David S. Miller <davem at davemloft.net>
Cc: Nicolas Pitre <nico at cam.org>
Cc: Russell King <rmk+kernel at arm.linux.org.uk>
---
 lib/div64.c | 153 ++++++++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 128 insertions(+), 25 deletions(-)

diff --git a/lib/div64.c b/lib/div64.c
index 62a698a..3055328 100644
--- a/lib/div64.c
+++ b/lib/div64.c
@@ -23,37 +23,140 @@
 /* Not needed on 64bit architectures */
 #if BITS_PER_LONG == 32
 
+/* our own fls implementation to make sure constant propagation is fine */
+inline int __div64_fls(int bits)
+{
+	unsigned int __left = bits, __nr = 0;
+
+	if (__left & 0xffff0000)
+		__nr += 16, __left >>= 16;
+
+	if (__left & 0x0000ff00)
+		__nr +=  8, __left >>=  8;
+
+	if (__left & 0x000000f0)
+		__nr +=  4, __left >>=  4;
+
+	if (__left & 0x0000000c)
+		__nr +=  2, __left >>=  2;
+
+	if (__left & 0x00000002)
+		__nr +=  1;
+
+	return __nr;
+}
+
+/*
+ * If the divisor happens to be constant, we determine the appropriate
+ * inverse at compile time to turn the division into a few inline
+ * multiplications instead which is much faster.
+ */
 uint32_t __attribute__((weak)) __div64_32(uint64_t *n, uint32_t base)
 {
-	uint64_t rem = *n;
-	uint64_t b = base;
-	uint64_t res, d = 1;
-	uint32_t high = rem >> 32;
-
-	/* Reduce the thing a bit first */
-	res = 0;
-	if (high >= base) {
-		high /= base;
-		res = (uint64_t) high << 32;
-		rem -= (uint64_t) (high*base) << 32;
-	}
+	unsigned int __r, __b = base;
 
-	while ((int64_t)b > 0 && b < rem) {
-		b = b+b;
-		d = d+d;
-	}
+	if (!__builtin_constant_p(__b) || __b == 0) {
+		/* non-constant divisor (or zero): slow path */
+		uint64_t rem = *n;
+		uint64_t b = base;
+		uint64_t res, d = 1;
+		uint32_t high = rem >> 32;
+
+		/* Reduce the thing a bit first */
+		res = 0;
+		if (high >= base) {
+			high /= base;
+			res = (uint64_t) high << 32;
+			rem -= (uint64_t) (high*base) << 32;
+		}
+
+		while ((int64_t)b > 0 && b < rem) {
+			b = b+b;
+			d = d+d;
+		}
+
+		do {
+			if (rem >= b) {
+				rem -= b;
+				res += d;
+			}
+			b >>= 1;
+			d >>= 1;
+		} while (d);
 
-	do {
-		if (rem >= b) {
-			rem -= b;
-			res += d;
+		*n = res;
+		__r = rem;
+	} else if ((__b & (__b - 1)) == 0) {
+		/*
+		 * Trivial: __b is constant and a power of 2
+		 * gcc does the right thing with this code.
+		 * Even though code is the same as above but
+		 * we make it visually as a separate path.
+		 * Still only one of these branches will survive
+		 * pre-processor stage, so let's leave it here.
+		 */
+		__r = *n;
+		__r &= (__b - 1);
+		*n /= __b;
+	} else {
+		/* Start of preprocessor calculations */
+
+		/*
+		 * Multiply by inverse of __b: *n/b = *n*(p/b)/p
+		 * We rely on the fact that most of this code gets
+		 * optimized away at compile time due to constant
+		 * propagation and only a couple inline assembly
+		 * instructions should remain. Better avoid any
+		 * code construct that might prevent that.
+		 */
+		unsigned long long __res, __x, __t, __m, __n = *n;
+		unsigned int __p;
+		/* preserve low part of *n for reminder computation */
+		__r = __n;
+		/* determine number of bits to represent __b */
+		__p = 1 << __div64_fls(__b);
+		/* compute __m = ((__p << 64) + __b - 1) / __b */
+		__m = (~0ULL / __b) * __p;
+		__m += (((~0ULL % __b + 1) * __p) + __b - 1) / __b;
+		/* compute __res = __m*(~0ULL/__b*__b-1)/(__p << 64) */
+		__x = ~0ULL / __b * __b - 1;
+		__res = (__m & 0xffffffff) * (__x & 0xffffffff);
+		__res >>= 32;
+		__res += (__m & 0xffffffff) * (__x >> 32);
+		__t = __res;
+		__res += (__x & 0xffffffff) * (__m >> 32);
+		__t = (__res < __t) ? (1ULL << 32) : 0;
+		__res = (__res >> 32) + __t;
+		__res += (__m >> 32) * (__x >> 32);
+		__res /= __p;
+		/* End of preprocessor calculations */
+
+		/* Start of run-time calculations */
+		__res = (unsigned int)__m * (unsigned int)__n;
+		__res >>= 32;
+		__res += (unsigned int)__m * (__n >> 32);
+		__t = __res;
+		__res += (unsigned int)__n * (__m >> 32);
+		__t = (__res < __t) ? (1ULL << 32) : 0;
+		__res = (__res >> 32) + __t;
+		__res += (__m >> 32) * (__n >> 32);
+		__res /= __p;
+
+		/*
+		 * The reminder can be computed with 32-bit regs
+		 * only, and gcc is good at that.
+		 */
+		{
+			unsigned int __res0 = __res;
+			unsigned int __b0 = __b;
+
+			__r -= __res0 * __b0;
 		}
-		b >>= 1;
-		d >>= 1;
-	} while (d);
+		/* End of run-time calculations */
 
-	*n = res;
-	return rem;
+		*n = __res;
+	}
+	return __r;
 }
 
 EXPORT_SYMBOL(__div64_32);
-- 
2.4.3
