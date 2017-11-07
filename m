From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 7 Nov 2017 14:13:01 -0800
Subject: [PATCH 1/4] ARCv2: perf: tweak overflow interrupt
In-Reply-To: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
References: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1510092784-19942-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Current perf ISR loops thru all 32 counters, checking for each if it
caused the interrupt. Instead only loop thru counters which actually
interrupted (typically 1).

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/perf_event.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 2ce24e74f879..0eaa132a2c90 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -377,21 +377,22 @@ static irqreturn_t arc_pmu_intr(int irq, void *dev)
 	struct perf_sample_data data;
 	struct arc_pmu_cpu *pmu_cpu = this_cpu_ptr(&arc_pmu_cpu);
 	struct pt_regs *regs;
-	int active_ints;
+	unsigned int active_ints;
 	int idx;
 
 	arc_pmu_disable(&arc_pmu->pmu);
 
 	active_ints = read_aux_reg(ARC_REG_PCT_INT_ACT);
+	if (!active_ints)
+		goto done;
 
 	regs = get_irq_regs();
 
-	for (idx = 0; idx < arc_pmu->n_counters; idx++) {
-		struct perf_event *event = pmu_cpu->act_counter[idx];
+	do {
+		struct perf_event *event;
 		struct hw_perf_event *hwc;
 
-		if (!(active_ints & (1 << idx)))
-			continue;
+		idx = __ffs(active_ints);
 
 		/* Reset interrupt flag by writing of 1 */
 		write_aux_reg(ARC_REG_PCT_INT_ACT, 1 << idx);
@@ -404,19 +405,22 @@ static irqreturn_t arc_pmu_intr(int irq, void *dev)
 		write_aux_reg(ARC_REG_PCT_INT_CTRL,
 			read_aux_reg(ARC_REG_PCT_INT_CTRL) | (1 << idx));
 
+		event = pmu_cpu->act_counter[idx];
 		hwc = &event->hw;
 
 		WARN_ON_ONCE(hwc->idx != idx);
 
 		arc_perf_event_update(event, &event->hw, event->hw.idx);
 		perf_sample_data_init(&data, 0, hwc->last_period);
-		if (!arc_pmu_event_set_period(event))
-			continue;
+		if (arc_pmu_event_set_period(event)) {
+			if (perf_event_overflow(event, &data, regs))
+				arc_pmu_stop(event, 0);
+		}
 
-		if (perf_event_overflow(event, &data, regs))
-			arc_pmu_stop(event, 0);
-	}
+		active_ints &= ~(1U << idx);
+	} while (active_ints);
 
+done:
 	arc_pmu_enable(&arc_pmu->pmu);
 
 	return IRQ_HANDLED;
-- 
2.7.4
