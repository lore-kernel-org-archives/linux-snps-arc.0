From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Nov 2016 14:31:33 -0700
Subject: [PATCH v2 02/10] ARC: timer: gfrc, rtc: deuglify big endian code
In-Reply-To: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
References: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478208701-30923-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

A standard "C" shift will be handled appropriately by the compiler
dependin gon the endian used fo rbuild. So we don't need the
explicit distinction in code

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/time.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index 1a117b999c0c..71bcdc1f9bd0 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -86,26 +86,19 @@ static int noinline arc_get_timer_clk(struct device_node *node)
 static cycle_t arc_read_gfrc(struct clocksource *cs)
 {
 	unsigned long flags;
-	union {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-		struct { u32 h, l; };
-#else
-		struct { u32 l, h; };
-#endif
-		cycle_t  full;
-	} stamp;
+	u32 l, h;
 
 	local_irq_save(flags);
 
 	__mcip_cmd(CMD_GFRC_READ_LO, 0);
-	stamp.l = read_aux_reg(ARC_REG_MCIP_READBACK);
+	l = read_aux_reg(ARC_REG_MCIP_READBACK);
 
 	__mcip_cmd(CMD_GFRC_READ_HI, 0);
-	stamp.h = read_aux_reg(ARC_REG_MCIP_READBACK);
+	h = read_aux_reg(ARC_REG_MCIP_READBACK);
 
 	local_irq_restore(flags);
 
-	return stamp.full;
+	return (((cycle_t)h) << 32) | l;
 }
 
 static struct clocksource arc_counter_gfrc = {
@@ -143,14 +136,7 @@ CLOCKSOURCE_OF_DECLARE(arc_gfrc, "snps,archs-timer-gfrc", arc_cs_setup_gfrc);
 static cycle_t arc_read_rtc(struct clocksource *cs)
 {
 	unsigned long status;
-	union {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-		struct { u32 high, low; };
-#else
-		struct { u32 low, high; };
-#endif
-		cycle_t  full;
-	} stamp;
+	u32 l, h;
 
         /*
          * hardware has an internal state machine which tracks readout of
@@ -159,12 +145,12 @@ static cycle_t arc_read_rtc(struct clocksource *cs)
          *  - high increments after low has been read
          */
 	do {
-		stamp.low = read_aux_reg(AUX_RTC_LOW);
-		stamp.high = read_aux_reg(AUX_RTC_HIGH);
+		l = read_aux_reg(AUX_RTC_LOW);
+		h = read_aux_reg(AUX_RTC_HIGH);
 		status = read_aux_reg(AUX_RTC_CTRL);
 	} while (!(status & _BITUL(31)));
 
-	return stamp.full;
+	return (((cycle_t)h) << 32) | l;
 }
 
 static struct clocksource arc_counter_rtc = {
-- 
2.7.4
