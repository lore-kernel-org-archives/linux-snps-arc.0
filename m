From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Tue, 29 May 2018 20:26:38 +0200
Subject: [PATCH 3/7] clocksource/drivers/arc_timer: Add comments about locking
 while read GFRC
In-Reply-To: <1527618402-31974-1-git-send-email-daniel.lezcano@linaro.org>
References: <1274a543-02dd-bbf0-c690-b08c788d9e91@linaro.org>
 <1527618402-31974-1-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1527618402-31974-3-git-send-email-daniel.lezcano@linaro.org>
To: linux-snps-arc@lists.infradead.org

From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>

This came to light in some internal discussions and it is nice to have
this documented rather than digging up the PRM (Prog Ref Manual) again.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
Acked-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
---
 drivers/clocksource/arc_timer.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clocksource/arc_timer.c b/drivers/clocksource/arc_timer.c
index 471b428..20da9b1 100644
--- a/drivers/clocksource/arc_timer.c
+++ b/drivers/clocksource/arc_timer.c
@@ -61,6 +61,20 @@ static u64 arc_read_gfrc(struct clocksource *cs)
 	unsigned long flags;
 	u32 l, h;
 
+	/*
+	 * From a programming model pov, there seems to be just one instance of
+	 * MCIP_CMD/MCIP_READBACK however micro-architecturally there's
+	 * an instance PER ARC CORE (not per cluster), and there are dedicated
+	 * hardware decode logic (per core) inside ARConnect to handle
+	 * simultaneous read/write accesses from cores via those two registers.
+	 * So several concurrent commands to ARConnect are OK if they are
+	 * trying to access two different sub-components (like GFRC,
+	 * inter-core interrupt, etc...). HW also supports simultaneously
+	 * accessing GFRC by multiple cores.
+	 * That's why it is safe to disable hard interrupts on the local CPU
+	 * before access to GFRC instead of taking global MCIP spinlock
+	 * defined in arch/arc/kernel/mcip.c
+	 */
 	local_irq_save(flags);
 
 	__mcip_cmd(CMD_GFRC_READ_LO, 0);
-- 
2.7.4
