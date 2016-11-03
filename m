From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Nov 2016 16:33:28 -0700
Subject: [PATCH v3 03/10] ARC: timer: gfrc,
 rtc: Read BCR to detect whether hardware exists ...
In-Reply-To: <1478216015-18931-1-git-send-email-vgupta@synopsys.com>
References: <1478216015-18931-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478216015-18931-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

... don't rely on cpuinfo populated in arc boot code. This paves way for
moving this code in drivers/clocksource/

And while at it, convert the WARN() to pr_warn() as sugested by Daniel

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/time.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index 8d66bb446209..d3f3750a0d2d 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -111,11 +111,14 @@ static struct clocksource arc_counter_gfrc = {
 
 static int __init arc_cs_setup_gfrc(struct device_node *node)
 {
-	int exists = cpuinfo_arc700[0].extn.gfrc;
+	struct mcip_bcr mp;
 	int ret;
 
-	if (WARN(!exists, "Global-64-bit-Ctr clocksource not detected"))
+	READ_BCR(ARC_REG_MCIP_BCR, mp);
+	if (!mp.gfrc) {
+		pr_warn("Global-64-bit-Ctr clocksource not detected");
 		return -ENXIO;
+	}
 
 	ret = arc_get_timer_clk(node);
 	if (ret)
@@ -163,15 +166,20 @@ static struct clocksource arc_counter_rtc = {
 
 static int __init arc_cs_setup_rtc(struct device_node *node)
 {
-	int exists = cpuinfo_arc700[smp_processor_id()].extn.rtc;
+	struct bcr_timer timer;
 	int ret;
 
-	if (WARN(!exists, "Local-64-bit-Ctr clocksource not detected"))
+	READ_BCR(ARC_REG_TIMERS_BCR, timer);
+	if (!timer.rtc) {
+		pr_warn("Local-64-bit-Ctr clocksource not detected");
 		return -ENXIO;
+	}
 
 	/* Local to CPU hence not usable in SMP */
-	if (WARN(IS_ENABLED(CONFIG_SMP), "Local-64-bit-Ctr not usable in SMP"))
+	if (IS_ENABLED(CONFIG_SMP)) {
+		pr_warn("Local-64-bit-Ctr not usable in SMP");
 		return -EINVAL;
+	}
 
 	ret = arc_get_timer_clk(node);
 	if (ret)
-- 
2.7.4
