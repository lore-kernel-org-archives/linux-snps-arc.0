From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 31 Aug 2017 11:06:07 -0700
Subject: [PATCH] ARC: reset: remove the misleading v1 suffix all over
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1504202767-17361-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

There is no plan yet to do a v2 board. And even if we were to do it only
some IPs would actually change, so it be best to add suffixes at that
point, not now !

Cc: Philipp Zabel <p.zabel at pengutronix.de>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
P.S. Philip, if you and Eugeniy are OK, can this be please squashed with
his original patch since it has not yet been merged etc.

Thx,

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 MAINTAINERS                                     |  5 ++-
 drivers/reset/Kconfig                           |  6 ++--
 drivers/reset/Makefile                          |  2 +-
 drivers/reset/{reset-hsdk-v1.c => reset-hsdk.c} | 44 ++++++++++++-------------
 include/dt-bindings/reset/snps,hsdk-reset.h     | 17 ++++++++++
 include/dt-bindings/reset/snps,hsdk-v1-reset.h  | 17 ----------
 6 files changed, 45 insertions(+), 46 deletions(-)
 rename drivers/reset/{reset-hsdk-v1.c => reset-hsdk.c} (72%)
 create mode 100644 include/dt-bindings/reset/snps,hsdk-reset.h
 delete mode 100644 include/dt-bindings/reset/snps,hsdk-v1-reset.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9f0d68686bce..2c9f2825e70a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12891,9 +12891,8 @@ F:	drivers/mmc/host/dw_mmc*
 SYNOPSYS HSDK RESET CONTROLLER DRIVER
 M:	Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
 S:	Supported
-F:	drivers/reset/reset-hsdk-v1.c
-F:	include/dt-bindings/reset/snps,hsdk-v1-reset.h
-F:	Documentation/devicetree/bindings/reset/snps,hsdk-v1-reset.txt
+F:	drivers/reset/reset-hsdk.c
+F:	include/dt-bindings/reset/snps,hsdk-reset.h
 
 SYSTEM CONFIGURATION (SYSCON)
 M:	Lee Jones <lee.jones at linaro.org>
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 52d5251660b9..1aaa434e4ab9 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -34,11 +34,11 @@ config RESET_BERLIN
 	help
 	  This enables the reset controller driver for Marvell Berlin SoCs.
 
-config RESET_HSDK_V1
-	bool "HSDK v1 Reset Driver"
+config RESET_SNPS_HSDK
+	bool "Synopsys HSDK Reset Driver"
 	default n
 	help
-	  This enables the reset controller driver for HSDK v1.
+	  This enables the reset controller driver for HSDK board.
 
 config RESET_IMX7
 	bool "i.MX7 Reset Driver" if COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index b62783f50fe5..52832958c74f 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -5,7 +5,7 @@ obj-$(CONFIG_ARCH_TEGRA) += tegra/
 obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
 obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
-obj-$(CONFIG_RESET_HSDK_V1) += reset-hsdk-v1.o
+obj-$(CONFIG_RESET_SNPS_HSDK) += reset-hsdk.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
 obj-$(CONFIG_RESET_MESON) += reset-meson.o
diff --git a/drivers/reset/reset-hsdk-v1.c b/drivers/reset/reset-hsdk.c
similarity index 72%
rename from drivers/reset/reset-hsdk-v1.c
rename to drivers/reset/reset-hsdk.c
index bca13e4bf622..8bce391c6943 100644
--- a/drivers/reset/reset-hsdk-v1.c
+++ b/drivers/reset/reset-hsdk.c
@@ -1,7 +1,7 @@
 /*
  * Copyright (C) 2017 Synopsys.
  *
- * Synopsys HSDKv1 SDP reset driver.
+ * Synopsys HSDK Development platform reset driver.
  *
  * This file is licensed under the terms of the GNU General Public
  * License version 2. This program is licensed "as is" without any
@@ -18,9 +18,9 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#define to_hsdkv1_rst(p)	container_of((p), struct hsdkv1_rst, rcdev)
+#define to_hsdk_rst(p)	container_of((p), struct hsdk_rst, rcdev)
 
-struct hsdkv1_rst {
+struct hsdk_rst {
 	void __iomem			*regs_ctl;
 	void __iomem			*regs_rst;
 	spinlock_t			lock;
@@ -49,12 +49,12 @@ static const u32 rst_map[] = {
 #define CGU_IP_SW_RESET_RESET		BIT(0)
 #define SW_RESET_TIMEOUT		10000
 
-static void hsdkv1_reset_config(struct hsdkv1_rst *rst, unsigned long id)
+static void hsdk_reset_config(struct hsdk_rst *rst, unsigned long id)
 {
 	writel(rst_map[id], rst->regs_ctl + CGU_SYS_RST_CTRL);
 }
 
-static int hsdkv1_reset_do(struct hsdkv1_rst *rst)
+static int hsdk_reset_do(struct hsdk_rst *rst)
 {
 	u32 reg;
 
@@ -69,28 +69,28 @@ static int hsdkv1_reset_do(struct hsdkv1_rst *rst)
 		!(reg & CGU_IP_SW_RESET_RESET), 5, SW_RESET_TIMEOUT);
 }
 
-static int hsdkv1_reset_reset(struct reset_controller_dev *rcdev,
+static int hsdk_reset_reset(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
-	struct hsdkv1_rst *rst = to_hsdkv1_rst(rcdev);
+	struct hsdk_rst *rst = to_hsdk_rst(rcdev);
 	unsigned long flags;
 	int ret;
 
 	spin_lock_irqsave(&rst->lock, flags);
-	hsdkv1_reset_config(rst, id);
-	ret = hsdkv1_reset_do(rst);
+	hsdk_reset_config(rst, id);
+	ret = hsdk_reset_do(rst);
 	spin_unlock_irqrestore(&rst->lock, flags);
 
 	return ret;
 }
 
-static const struct reset_control_ops hsdkv1_reset_ops = {
-	.reset	= hsdkv1_reset_reset,
+static const struct reset_control_ops hsdk_reset_ops = {
+	.reset	= hsdk_reset_reset,
 };
 
-static int hsdkv1_reset_probe(struct platform_device *pdev)
+static int hsdk_reset_probe(struct platform_device *pdev)
 {
-	struct hsdkv1_rst *rst;
+	struct hsdk_rst *rst;
 	struct resource *mem;
 
 	rst = devm_kzalloc(&pdev->dev, sizeof(*rst), GFP_KERNEL);
@@ -110,7 +110,7 @@ static int hsdkv1_reset_probe(struct platform_device *pdev)
 	spin_lock_init(&rst->lock);
 
 	rst->rcdev.owner = THIS_MODULE;
-	rst->rcdev.ops = &hsdkv1_reset_ops;
+	rst->rcdev.ops = &hsdk_reset_ops;
 	rst->rcdev.of_node = pdev->dev.of_node;
 	rst->rcdev.nr_resets = HSDK_MAX_RESETS;
 	rst->rcdev.of_reset_n_cells = 1;
@@ -118,20 +118,20 @@ static int hsdkv1_reset_probe(struct platform_device *pdev)
 	return reset_controller_register(&rst->rcdev);
 }
 
-static const struct of_device_id hsdkv1_reset_dt_match[] = {
-	{ .compatible = "snps,hsdk-v1.0-reset" },
+static const struct of_device_id hsdk_reset_dt_match[] = {
+	{ .compatible = "snps,hsdk-reset" },
 	{ },
 };
 
-static struct platform_driver hsdkv1_reset_driver = {
-	.probe	= hsdkv1_reset_probe,
+static struct platform_driver hsdk_reset_driver = {
+	.probe	= hsdk_reset_probe,
 	.driver	= {
-		.name = "hsdk-v1.0-reset",
-		.of_match_table = hsdkv1_reset_dt_match,
+		.name = "hsdk-reset",
+		.of_match_table = hsdk_reset_dt_match,
 	},
 };
-builtin_platform_driver(hsdkv1_reset_driver);
+builtin_platform_driver(hsdk_reset_driver);
 
 MODULE_AUTHOR("Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>");
-MODULE_DESCRIPTION("Synopsys HSDKv1 SDP reset driver");
+MODULE_DESCRIPTION("Synopsys HSDK SDP reset driver");
 MODULE_LICENSE("GPL v2");
diff --git a/include/dt-bindings/reset/snps,hsdk-reset.h b/include/dt-bindings/reset/snps,hsdk-reset.h
new file mode 100644
index 000000000000..e1a643e4bc91
--- /dev/null
+++ b/include/dt-bindings/reset/snps,hsdk-reset.h
@@ -0,0 +1,17 @@
+/**
+ * This header provides index for the HSDK reset controller.
+ */
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_SNPS_HSDK
+#define _DT_BINDINGS_RESET_CONTROLLER_SNPS_HSDK
+
+#define HSDK_APB_RESET	0
+#define HSDK_AXI_RESET	1
+#define HSDK_ETH_RESET	2
+#define HSDK_USB_RESET	3
+#define HSDK_SDIO_RESET	4
+#define HSDK_HDMI_RESET	5
+#define HSDK_GFX_RESET	6
+#define HSDK_DMAC_RESET	7
+#define HSDK_EBI_RESET	8
+
+#endif /*_DT_BINDINGS_RESET_CONTROLLER_SNPS_HSDK*/
diff --git a/include/dt-bindings/reset/snps,hsdk-v1-reset.h b/include/dt-bindings/reset/snps,hsdk-v1-reset.h
deleted file mode 100644
index d898c89b7123..000000000000
--- a/include/dt-bindings/reset/snps,hsdk-v1-reset.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/**
- * This header provides index for the HSDK v1 reset controller.
- */
-#ifndef _DT_BINDINGS_RESET_CONTROLLER_HSDK_V1
-#define _DT_BINDINGS_RESET_CONTROLLER_HSDK_V1
-
-#define HSDK_V1_APB_RESET	0
-#define HSDK_V1_AXI_RESET	1
-#define HSDK_V1_ETH_RESET	2
-#define HSDK_V1_USB_RESET	3
-#define HSDK_V1_SDIO_RESET	4
-#define HSDK_V1_HDMI_RESET	5
-#define HSDK_V1_GFX_RESET	6
-#define HSDK_V1_DMAC_RESET	7
-#define HSDK_V1_EBI_RESET	8
-
-#endif /*_DT_BINDINGS_RESET_CONTROLLER_HSDK_V1*/
-- 
2.7.4
