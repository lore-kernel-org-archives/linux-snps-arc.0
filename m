From: noamc@ezchip.com (Noam Camus)
Date: Sat, 7 Nov 2015 12:52:21 +0200
Subject: [PATCH v2 03/19] clocksource: Add NPS400 timers driver
In-Reply-To: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446893557-29748-4-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

Add internal tick generator which is shared by all cores.
Each cluster of cores view it through dedicated address.
This is used for SMP system where all CPUs synced by same
clock source.

Signed-off-by: Noam Camus <noamc at ezchip.com>
Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
Cc: Rob Herring <robh+dt at kernel.org>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: John Stultz <john.stultz at linaro.org>
Acked-by: Vineet Gupta <vgupta at synopsys.com>
---
 .../bindings/timer/ezchip,nps400-timer.txt         |   11 +++
 drivers/clocksource/Kconfig                        |    7 ++
 drivers/clocksource/Makefile                       |    1 +
 drivers/clocksource/timer-nps.c                    |   85 ++++++++++++++++++++
 4 files changed, 104 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
 create mode 100644 drivers/clocksource/timer-nps.c

diff --git a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
new file mode 100644
index 0000000..c5102c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
@@ -0,0 +1,11 @@
+NPS Network Processor
+
+Required properties:
+
+- compatible :	should be "ezchip,nps400-timer"
+
+Example:
+
+timer {
+	compatible = "ezchip,nps400-timer";
+};
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index a7726db..8437113 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -115,6 +115,13 @@ config CLKSRC_PISTACHIO
 	bool
 	select CLKSRC_OF
 
+config CLKSRC_NPS
+	bool "NPS400 clocksource driver" if COMPILE_TEST
+	select CLKSRC_OF
+	help
+	  NPS400 clocksource support.
+	  Got 64 bit counter with update rate up to 1000MHz.
+
 config CLKSRC_STM32
 	bool "Clocksource for STM32 SoCs" if !ARCH_STM32
 	depends on OF && ARM && (ARCH_STM32 || COMPILE_TEST)
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 5c00863..28c17dc 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_VF_PIT_TIMER)	+= vf_pit_timer.o
 obj-$(CONFIG_CLKSRC_QCOM)	+= qcom-timer.o
 obj-$(CONFIG_MTK_TIMER)		+= mtk_timer.o
 obj-$(CONFIG_CLKSRC_PISTACHIO)	+= time-pistachio.o
+obj-$(CONFIG_ARC_PLAT_EZNPS)	+= timer-nps.o
 
 obj-$(CONFIG_ARM_ARCH_TIMER)		+= arm_arch_timer.o
 obj-$(CONFIG_ARM_GLOBAL_TIMER)		+= arm_global_timer.o
diff --git a/drivers/clocksource/timer-nps.c b/drivers/clocksource/timer-nps.c
new file mode 100644
index 0000000..7abde9e
--- /dev/null
+++ b/drivers/clocksource/timer-nps.c
@@ -0,0 +1,85 @@
+/*
+ * Copyright(c) 2015 EZchip Technologies.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * The full GNU General Public License is included in this distribution in
+ * the file called "COPYING".
+ */
+
+#include <linux/clocksource.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <plat/ctop.h>
+
+#define NPS_MSU_TICK_LOW	0xC8
+#define NPS_CLUSTER_OFFSET	8
+#define NPS_CLUSTER_NUM		16
+
+static void *nps_msu_reg_low_addr[NPS_CLUSTER_NUM] __read_mostly;
+
+/*
+ * To get the value from the Global Timer Counter register proceed as follows:
+ * 1. Read the upper 32-bit timer counter register
+ * 2. Read the lower 32-bit timer counter register
+ * 3. Read the upper 32-bit timer counter register again. If the value is
+ *  different to the 32-bit upper value read previously, go back to step 2.
+ *  Otherwise the 64-bit timer counter value is correct.
+ */
+static cycle_t nps_clksrc_read(struct clocksource *clksrc)
+{
+	u64 counter;
+	u32 lower, upper, old_upper;
+	void *lower_p, *upper_p;
+	int cluster = (smp_processor_id() >> NPS_CLUSTER_OFFSET);
+
+	lower_p = nps_msu_reg_low_addr[cluster];
+	upper_p = lower_p + 4;
+
+	upper = ioread32be(upper_p);
+	do {
+		old_upper = upper;
+		lower = ioread32be(lower_p);
+		upper = ioread32be(upper_p);
+	} while (upper != old_upper);
+
+	counter = (upper << 32) | lower;
+	return (cycle_t)counter;
+}
+
+static struct clocksource nps_counter = {
+	.name	= "EZnps-tick",
+	.rating = 301,
+	.read   = nps_clksrc_read,
+	.mask   = CLOCKSOURCE_MASK(64),
+	.flags  = CLOCK_SOURCE_IS_CONTINUOUS,
+};
+
+static void __init nps_setup_clocksource(struct device_node *node)
+{
+	struct clocksource *clksrc = &nps_counter;
+	unsigned long rate, dt_root;
+	int ret, cluster;
+
+	for (cluster = 0; cluster < NPS_CLUSTER_NUM; cluster++)
+		nps_msu_reg_low_addr[cluster] =
+			nps_host_reg((cluster << NPS_CLUSTER_OFFSET),
+				 NPS_MSU_BLKID, NPS_MSU_TICK_LOW);
+
+	dt_root = of_get_flat_dt_root();
+	rate = (u32)of_get_flat_dt_prop(dt_root, "clock-frequency", NULL);
+
+	ret = clocksource_register_hz(clksrc, rate);
+	if (ret)
+		pr_err("Couldn't register clock source.\n");
+}
+
+CLOCKSOURCE_OF_DECLARE(nps_400, "nps,400-timer",
+		       nps_setup_clocksource);
-- 
1.7.1
