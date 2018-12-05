From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed,  5 Dec 2018 20:06:05 +0300
Subject: [PATCH 1/5] ARC: perf: trivial code cleanup
In-Reply-To: <20181205170609.18690-1-Eugeniy.Paltsev@synopsys.com>
References: <20181205170609.18690-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181205170609.18690-2-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Use BIT(), lower_32_bits(), upper_32_bits() macroses,
fix code style violations.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/kernel/perf_event.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 8aec462d90fb..811a07a2ca21 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -19,6 +19,9 @@
 #include <asm/arcregs.h>
 #include <asm/stacktrace.h>
 
+/* HW holds 8 symbols + one for null terminator */
+#define ARCPMU_EVENT_NAME_LEN	9
+
 struct arc_pmu {
 	struct pmu	pmu;
 	unsigned int	irq;
@@ -155,7 +158,7 @@ static int arc_pmu_event_init(struct perf_event *event)
 	int ret;
 
 	if (!is_sampling_event(event)) {
-		hwc->sample_period  = arc_pmu->max_period;
+		hwc->sample_period = arc_pmu->max_period;
 		hwc->last_period = hwc->sample_period;
 		local64_set(&hwc->period_left, hwc->sample_period);
 	}
@@ -192,6 +195,7 @@ static int arc_pmu_event_init(struct perf_event *event)
 		pr_debug("init cache event with h/w %08x \'%s\'\n",
 			 (int)hwc->config, arc_pmu_ev_hw_map[ret]);
 		return 0;
+
 	default:
 		return -ENOENT;
 	}
@@ -246,8 +250,8 @@ static int arc_pmu_event_set_period(struct perf_event *event)
 	write_aux_reg(ARC_REG_PCT_INDEX, idx);
 
 	/* Write value */
-	write_aux_reg(ARC_REG_PCT_COUNTL, (u32)value);
-	write_aux_reg(ARC_REG_PCT_COUNTH, (value >> 32));
+	write_aux_reg(ARC_REG_PCT_COUNTL, lower_32_bits(value));
+	write_aux_reg(ARC_REG_PCT_COUNTH, upper_32_bits(value));
 
 	perf_event_update_userpage(event);
 
@@ -277,7 +281,7 @@ static void arc_pmu_start(struct perf_event *event, int flags)
 	/* Enable interrupt for this counter */
 	if (is_sampling_event(event))
 		write_aux_reg(ARC_REG_PCT_INT_CTRL,
-			      read_aux_reg(ARC_REG_PCT_INT_CTRL) | (1 << idx));
+			      read_aux_reg(ARC_REG_PCT_INT_CTRL) | BIT(idx));
 
 	/* enable ARC pmu here */
 	write_aux_reg(ARC_REG_PCT_INDEX, idx);		/* counter # */
@@ -295,9 +299,9 @@ static void arc_pmu_stop(struct perf_event *event, int flags)
 		 * Reset interrupt flag by writing of 1. This is required
 		 * to make sure pending interrupt was not left.
 		 */
-		write_aux_reg(ARC_REG_PCT_INT_ACT, 1 << idx);
+		write_aux_reg(ARC_REG_PCT_INT_ACT, BIT(idx));
 		write_aux_reg(ARC_REG_PCT_INT_CTRL,
-			      read_aux_reg(ARC_REG_PCT_INT_CTRL) & ~(1 << idx));
+			      read_aux_reg(ARC_REG_PCT_INT_CTRL) & ~BIT(idx));
 	}
 
 	if (!(event->hw.state & PERF_HES_STOPPED)) {
@@ -349,9 +353,10 @@ static int arc_pmu_add(struct perf_event *event, int flags)
 
 	if (is_sampling_event(event)) {
 		/* Mimic full counter overflow as other arches do */
-		write_aux_reg(ARC_REG_PCT_INT_CNTL, (u32)arc_pmu->max_period);
+		write_aux_reg(ARC_REG_PCT_INT_CNTL,
+			      lower_32_bits(arc_pmu->max_period));
 		write_aux_reg(ARC_REG_PCT_INT_CNTH,
-			      (arc_pmu->max_period >> 32));
+			      upper_32_bits(arc_pmu->max_period));
 	}
 
 	write_aux_reg(ARC_REG_PCT_CONFIG, 0);
@@ -392,7 +397,7 @@ static irqreturn_t arc_pmu_intr(int irq, void *dev)
 		idx = __ffs(active_ints);
 
 		/* Reset interrupt flag by writing of 1 */
-		write_aux_reg(ARC_REG_PCT_INT_ACT, 1 << idx);
+		write_aux_reg(ARC_REG_PCT_INT_ACT, BIT(idx));
 
 		/*
 		 * On reset of "interrupt active" bit corresponding
@@ -400,7 +405,7 @@ static irqreturn_t arc_pmu_intr(int irq, void *dev)
 		 * Now we need to re-enable interrupt for the counter.
 		 */
 		write_aux_reg(ARC_REG_PCT_INT_CTRL,
-			read_aux_reg(ARC_REG_PCT_INT_CTRL) | (1 << idx));
+			read_aux_reg(ARC_REG_PCT_INT_CTRL) | BIT(idx));
 
 		event = pmu_cpu->act_counter[idx];
 		hwc = &event->hw;
@@ -414,7 +419,7 @@ static irqreturn_t arc_pmu_intr(int irq, void *dev)
 				arc_pmu_stop(event, 0);
 		}
 
-		active_ints &= ~(1U << idx);
+		active_ints &= ~BIT(idx);
 	} while (active_ints);
 
 done:
@@ -453,7 +458,7 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 			uint32_t word0, word1;
 			char sentinel;
 		} indiv;
-		char str[9];
+		char str[ARCPMU_EVENT_NAME_LEN];
 	} cc_name;
 
 
@@ -483,7 +488,7 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 		arc_pmu->n_counters, counter_size, cc_bcr.c,
 		has_interrupts ? ", [overflow IRQ support]":"");
 
-	cc_name.str[8] = 0;
+	cc_name.str[ARCPMU_EVENT_NAME_LEN - 1] = 0;
 	for (i = 0; i < PERF_COUNT_ARC_HW_MAX; i++)
 		arc_pmu->ev_hw_idx[i] = -1;
 
-- 
2.14.5
