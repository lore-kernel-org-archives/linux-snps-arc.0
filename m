From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon,  2 Sep 2019 12:42:44 +0300
Subject: [PATCH] arc: libgcc: Import __udivdi3 & __udivmoddi4 to allow 64-bit
 division
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190902094244.486-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As reported by Kever here [1] we were unable to compile 64-bit division
code due to missing definition of __udivdi3().

Import its implementation and __udivmoddi4() as its direct dependency
from today's libgcc [2].

[1] https://patchwork.ozlabs.org/patch/1146845/
[2] https://github.com/gcc-mirror/gcc/commit/5d8723600bc0eed41226b5a6785bc02a053b45d5

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Kever Yang <kever.yang at rock-chips.com>
---
 arch/arc/lib/libgcc2.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arc/lib/libgcc2.c b/arch/arc/lib/libgcc2.c
index b92a841a37..ab1dbe1c13 100644
--- a/arch/arc/lib/libgcc2.c
+++ b/arch/arc/lib/libgcc2.c
@@ -158,3 +158,78 @@ __umodsi3(long a, long b)
 {
 	return udivmodsi4(a, b, 1);
 }
+
+UDWtype
+__udivmoddi4(UDWtype n, UDWtype d, UDWtype *rp)
+{
+	UDWtype q = 0, r = n, y = d;
+	UWtype lz1, lz2, i, k;
+
+	/*
+	 * Implements align divisor shift dividend method. This algorithm
+	 * aligns the divisor under the dividend and then perform number of
+	 * test-subtract iterations which shift the dividend left. Number of
+	 * iterations is k + 1 where k is the number of bit positions the
+	 * divisor must be shifted left  to align it under the dividend.
+	 * quotient bits can be saved in the rightmost positions of the
+	 * dividend as it shifts left on each test-subtract iteration.
+	 */
+
+	if (y <= r) {
+		lz1 = __builtin_clzll(d);
+		lz2 = __builtin_clzll(n);
+
+		k = lz1 - lz2;
+		y = (y << k);
+
+		/*
+		 * Dividend can exceed 2 ^ (width - 1) - 1 but still be less
+		 * than the aligned divisor. Normal iteration can drops the
+		 * high order bit of the dividend. Therefore, first
+		 * test-subtract iteration is a special case, saving its
+		 * quotient bit in a separate location and not shifting
+		 * the dividend.
+		 */
+
+		if (r >= y) {
+			r = r - y;
+			q = (1ULL << k);
+		}
+
+		if (k > 0) {
+			y = y >> 1;
+
+			/*
+			 * k additional iterations where k regular test
+			 * subtract shift dividend iterations are done.
+			 */
+			i = k;
+			do {
+				if (r >= y)
+					r = ((r - y) << 1) + 1;
+				else
+					r = (r << 1);
+				i = i - 1;
+			} while (i != 0);
+
+			/*
+			 * First quotient bit is combined with the quotient
+			 * bits resulting from the k regular iterations.
+			 */
+			q = q + r;
+			r = r >> k;
+			q = q - (r << k);
+		}
+	}
+
+	if (rp)
+		*rp = r;
+
+	return q;
+}
+
+UDWtype
+__udivdi3(UDWtype n, UDWtype d)
+{
+	return __udivmoddi4(n, d, (UDWtype *)0);
+}
-- 
2.16.2
