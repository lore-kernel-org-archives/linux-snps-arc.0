From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 31 Oct 2016 15:48:14 -0700
Subject: [PATCH 7/9] ARC: breakout timer stuff into a seperate header
In-Reply-To: <1477954096-770-1-git-send-email-vgupta@synopsys.com>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477954096-770-8-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/arcregs.h |  9 +--------
 arch/arc/kernel/time.c         |  2 +-
 include/soc/arc/timers.h       | 24 ++++++++++++++++++++++++
 3 files changed, 26 insertions(+), 9 deletions(-)
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
index f1ebe45bfcdf..dad3a9933c4c 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -38,8 +38,8 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <asm/irq.h>
-#include <asm/arcregs.h>
 
+#include <soc/arc/timers.h>
 #include <soc/arc/mcip.h>
 
 /* Timer related Aux registers */
diff --git a/include/soc/arc/timers.h b/include/soc/arc/timers.h
new file mode 100644
index 000000000000..79484fafabfa
--- /dev/null
+++ b/include/soc/arc/timers.h
@@ -0,0 +1,24 @@
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
