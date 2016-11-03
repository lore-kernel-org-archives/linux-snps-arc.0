From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Nov 2016 14:31:40 -0700
Subject: [PATCH v2 09/10] ARC: breakout timer include code into separate
 header ...
In-Reply-To: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
References: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478208701-30923-10-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

... which allows for use in drivers/clocksource later

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/arcregs.h |  9 +--------
 arch/arc/kernel/time.c         | 18 +++---------------
 include/soc/arc/timers.h       | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 23 deletions(-)
 create mode 100644 include/soc/arc/timers.h

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index ccf5dc96713b..a17aa4558832 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -20,7 +20,6 @@
 #define ARC_REG_FP_V2_BCR	0xc8	/* ARCv2 FPU */
 #define ARC_REG_SLC_BCR		0xce
 #define ARC_REG_DCCM_BUILD	0x74	/* DCCM size (common) */
-#define ARC_REG_TIMERS_BCR	0x75
 #define ARC_REG_AP_BCR		0x76
 #define ARC_REG_ICCM_BUILD	0x78	/* ICCM size (common) */
 #define ARC_REG_XY_MEM_BCR	0x79
@@ -206,13 +205,7 @@ struct bcr_fp_arcv2 {
 #endif
 };
 
-struct bcr_timer {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-	unsigned int pad2:15, rtsc:1, pad1:5, rtc:1, t1:1, t0:1, ver:8;
-#else
-	unsigned int ver:8, t0:1, t1:1, rtc:1, pad1:5, rtsc:1, pad2:15;
-#endif
-};
+#include <soc/arc/timers.h>
 
 struct bcr_bpu_arcompact {
 #ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index f0b6e6bc1e36..878c71dda8b9 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -38,22 +38,10 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <asm/irq.h>
-#include <asm/arcregs.h>
 
+#include <soc/arc/timers.h>
 #include <soc/arc/mcip.h>
 
-/* Timer related Aux registers */
-#define ARC_REG_TIMER0_LIMIT	0x23	/* timer 0 limit */
-#define ARC_REG_TIMER0_CTRL	0x22	/* timer 0 control */
-#define ARC_REG_TIMER0_CNT	0x21	/* timer 0 count */
-#define ARC_REG_TIMER1_LIMIT	0x102	/* timer 1 limit */
-#define ARC_REG_TIMER1_CTRL	0x101	/* timer 1 control */
-#define ARC_REG_TIMER1_CNT	0x100	/* timer 1 count */
-
-#define TIMER_CTRL_IE	(1 << 0) /* Interrupt when Count reaches limit */
-#define TIMER_CTRL_NH	(1 << 1) /* Count only when CPU NOT halted */
-
-#define ARC_TIMER_MAX	0xFFFFFFFF
 
 static unsigned long arc_timer_freq;
 
@@ -218,7 +206,7 @@ static int __init arc_cs_setup_timer1(struct device_node *node)
 	if (ret)
 		return ret;
 
-	write_aux_reg(ARC_REG_TIMER1_LIMIT, ARC_TIMER_MAX);
+	write_aux_reg(ARC_REG_TIMER1_LIMIT, ARC_TIMERN_MAX);
 	write_aux_reg(ARC_REG_TIMER1_CNT, 0);
 	write_aux_reg(ARC_REG_TIMER1_CTRL, TIMER_CTRL_NH);
 
@@ -296,7 +284,7 @@ static int arc_timer_starting_cpu(unsigned int cpu)
 
 	evt->cpumask = cpumask_of(smp_processor_id());
 
-	clockevents_config_and_register(evt, arc_timer_freq, 0, ARC_TIMER_MAX);
+	clockevents_config_and_register(evt, arc_timer_freq, 0, ARC_TIMERN_MAX);
 	enable_percpu_irq(arc_timer_irq, 0);
 	return 0;
 }
diff --git a/include/soc/arc/timers.h b/include/soc/arc/timers.h
new file mode 100644
index 000000000000..a20ed2fbc432
--- /dev/null
+++ b/include/soc/arc/timers.h
@@ -0,0 +1,38 @@
+/*
+ * Copyright (C) 2016-17 Synopsys, Inc. (www.synopsys.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __SOC_ARC_TIMERS_H
+#define __SOC_ARC_TIMERS_H
+
+#include <soc/arc/aux.h>
+
+/* Timer related Aux registers */
+#define ARC_REG_TIMER0_LIMIT	0x23	/* timer 0 limit */
+#define ARC_REG_TIMER0_CTRL	0x22	/* timer 0 control */
+#define ARC_REG_TIMER0_CNT	0x21	/* timer 0 count */
+#define ARC_REG_TIMER1_LIMIT	0x102	/* timer 1 limit */
+#define ARC_REG_TIMER1_CTRL	0x101	/* timer 1 control */
+#define ARC_REG_TIMER1_CNT	0x100	/* timer 1 count */
+
+/* CTRL reg bits */
+#define TIMER_CTRL_IE	        (1 << 0) /* Interrupt when Count reaches limit */
+#define TIMER_CTRL_NH	        (1 << 1) /* Count only when CPU NOT halted */
+
+#define ARC_TIMERN_MAX		0xFFFFFFFF
+
+#define ARC_REG_TIMERS_BCR	0x75
+
+struct bcr_timer {
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	unsigned int pad2:15, rtsc:1, pad1:5, rtc:1, t1:1, t0:1, ver:8;
+#else
+	unsigned int ver:8, t0:1, t1:1, rtc:1, pad1:5, rtsc:1, pad2:15;
+#endif
+};
+
+#endif
-- 
2.7.4
