From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 15 Feb 2016 19:37:47 +0300
Subject: [PATCH] arc: make sure __delay() never gets executed with 0 loops
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1455554267-23886-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Current implementation of __delay() function uses so-called
zero-delay loops. And the only condition to exit that loop is
LP_COUNT (loop count register) = 1 (but not 0 as it might be easily
imagined).

So if our calculation of "loops" gives 0 (and that is pretty possible
given result of multiplication being >> 32) then zero-delay loop
mechanism starts with LP_COUNT=0 and it ends up decrementing LP_COUNT
while staying in the loop effectively producing close to infinite delay
instead of very short one.

I bumped into it with AXS101 + external DDR controller and caches
disabled. In that case I've got very small
loops_per_jiffy=0xf00:
------------------------>8--------------------
Calibrating delay loop... 0.77 BogoMIPS (lpj=3862)
------------------------>8--------------------

And on console output delays were way too long.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
 Please enter the commit message for your changes. Lines starting
---
 arch/arc/include/asm/delay.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/delay.h b/arch/arc/include/asm/delay.h
index 08e7e2a..1a7a1dc 100644
--- a/arch/arc/include/asm/delay.h
+++ b/arch/arc/include/asm/delay.h
@@ -57,7 +57,8 @@ static inline void __udelay(unsigned long usecs)
 	 */
 	loops = ((u64) usecs * 4295 * HZ * loops_per_jiffy) >> 32;
 
-	__delay(loops);
+	if (loops)
+		__delay(loops);
 }
 
 #define udelay(n) (__builtin_constant_p(n) ? ((n) > 20000 ? __bad_udelay() \
-- 
2.4.3
