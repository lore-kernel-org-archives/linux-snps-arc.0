From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 23 Aug 2016 12:41:18 +0300
Subject: [PATCH] ARC: Fix max ULP for cosine test
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471945278-18247-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Max ULP for "cos (M_PI_6l * 2.0) == 0.5" in "test-double" sub-test
is set to "0" for ARC. It causes "test-double" test failure.

I realized that this sub-test on ARM gets completely same results.
But it doesn't fails on ARM because max ULP is set to "1" for ARM.

I am wondering, if it was done for any special reason?

Otherwise, set max ULP for "cos (M_PI_6l * 2.0) == 0.5" test to
"1" instead of "0" for ARC.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 test/math/libm-test-ulps-arc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/test/math/libm-test-ulps-arc b/test/math/libm-test-ulps-arc
index 7139447..46b2ac5 100644
--- a/test/math/libm-test-ulps-arc
+++ b/test/math/libm-test-ulps-arc
@@ -2,6 +2,7 @@
 
 # cos
 Test "cos (M_PI_6l * 2.0) == 0.5":
+double: 1
 idouble: 1
 Test "cos (M_PI_6l * 4.0) == -0.5":
 double: 2
-- 
2.5.5
