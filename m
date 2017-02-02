From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 1 Feb 2017 16:50:15 -0800
Subject: [PATCH] clocksource: arc_timer: RTC: allow registration despite SMP
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485996615-2511-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

So far we didn't allow CPU private 64-bit RTC timer to register in SMP
as the individual counters may not be synchronized across cores.

However there is a situation when we build SMP kernel but want to use
the same image on UP as well as SMP hardware. Here we would certainly
want to use RTC, but current code doesn't allow as it only uses build
info (CONFIG_SMP) and not runtime info (num_online_cpus() or some such).

We can't possibly use num_online_cpus() anyways because clocksource
probe happens before other cpus are brought online

The simple fix is allow ETC probe for SMP and rely on higher rating of
GFRC to take over in general SMP case. We leave the pr_warn to notify
the user.

Cc: John Stultz <john.stultz at linaro.org>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 drivers/clocksource/arc_timer.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clocksource/arc_timer.c b/drivers/clocksource/arc_timer.c
index 7517f959cba7..87f193794bf2 100644
--- a/drivers/clocksource/arc_timer.c
+++ b/drivers/clocksource/arc_timer.c
@@ -145,10 +145,8 @@ static int __init arc_cs_setup_rtc(struct device_node *node)
 	}
 
 	/* Local to CPU hence not usable in SMP */
-	if (IS_ENABLED(CONFIG_SMP)) {
+	if (IS_ENABLED(CONFIG_SMP))
 		pr_warn("Local-64-bit-Ctr not usable in SMP");
-		return -EINVAL;
-	}
 
 	ret = arc_get_timer_clk(node);
 	if (ret)
-- 
2.7.4
