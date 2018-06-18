From: gustavo.pimentel@synopsys.com (Gustavo Pimentel)
Date: Mon, 18 Jun 2018 15:59:34 +0100
Subject: [PATCH] ARC: Add PCIe support for ARC HSDK platform
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3e9a2f384fd831fb2639ad99ec43ce0f019ac17c.1529333762.git.gustavo.pimentel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Add PCI support to the ARC HSDK platform allowing to use the generic PCI
setup functions.

Add GPIO interrupt configuration function on ARC HSDK platform and
configures it to PCI support.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel at synopsys.com>
---
 arch/arc/plat-hsdk/Kconfig    |  1 +
 arch/arc/plat-hsdk/platform.c | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arc/plat-hsdk/Kconfig b/arch/arc/plat-hsdk/Kconfig
index 19ab3cf..556bc5e 100644
--- a/arch/arc/plat-hsdk/Kconfig
+++ b/arch/arc/plat-hsdk/Kconfig
@@ -9,3 +9,4 @@ menuconfig ARC_SOC_HSDK
 	bool "ARC HS Development Kit SOC"
 	select CLK_HSDK
 	select RESET_HSDK
+	select MIGHT_HAVE_PCI
diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
index 2958aed..31adda7 100644
--- a/arch/arc/plat-hsdk/platform.c
+++ b/arch/arc/plat-hsdk/platform.c
@@ -42,6 +42,45 @@ static void __init hsdk_init_per_cpu(unsigned int cpu)
 #define SDIO_UHS_REG_EXT	(SDIO_BASE + 0x108)
 #define SDIO_UHS_REG_EXT_DIV_2	(2 << 30)
 
+#define HSDK_GPIO_INTC          (ARC_PERIPHERAL_BASE + 0x3000)
+#define GPIO_INTEN              (HSDK_GPIO_INTC + 0x30)
+#define GPIO_INTMASK            (HSDK_GPIO_INTC + 0x34)
+#define GPIO_INTTYPE_LEVEL      (HSDK_GPIO_INTC + 0x38)
+#define GPIO_INT_POLARITY       (HSDK_GPIO_INTC + 0x3c)
+
+#define GPIO_BLUETOOTH_INT	0x00000001
+#define GPIO_HAPS_INT		0x00000004
+#define GPIO_AUDIO_INT		0x00000008
+/* PMOD_A header */
+#define GPIO_PIN_08_INT		0x00000100
+#define GPIO_PIN_09_INT		0x00000200
+#define GPIO_PIN_10_INT		0x00000400
+#define GPIO_PIN_11_INT		0x00000800
+/* PMOD_B header */
+#define GPIO_PIN_12_INT		0x00001000
+#define GPIO_PIN_13_INT		0x00002000
+#define GPIO_PIN_14_INT		0x00004000
+#define GPIO_PIN_15_INT		0x00008000
+/* PMOD_C header */
+#define GPIO_PIN_16_INT		0x00010000
+#define GPIO_PIN_17_INT		0x00020000
+#define GPIO_PIN_18_INT		0x00040000
+#define GPIO_PIN_19_INT		0x00080000
+#define GPIO_PIN_20_INT		0x00100000
+#define GPIO_PIN_21_INT		0x00200000
+#define GPIO_PIN_22_INT		0x00400000
+#define GPIO_PIN_23_INT		0x00800000
+static void __init hsdk_enable_gpio_intc_wire(void)
+{
+	u32 val = GPIO_HAPS_INT;
+
+	iowrite32(0xffffffff, (void __iomem *) GPIO_INTMASK);
+	iowrite32(~val, (void __iomem *) GPIO_INTMASK);
+	iowrite32(0x00000000, (void __iomem *) GPIO_INTTYPE_LEVEL);
+	iowrite32(0xffffffff, (void __iomem *) GPIO_INT_POLARITY);
+	iowrite32(val, (void __iomem *) GPIO_INTEN);
+}
+
 static void __init hsdk_init_early(void)
 {
 	/*
@@ -62,6 +101,8 @@ static void __init hsdk_init_early(void)
 	 * minimum possible div-by-2.
 	 */
 	iowrite32(SDIO_UHS_REG_EXT_DIV_2, (void __iomem *) SDIO_UHS_REG_EXT);
+
+	sdk_enable_gpio_intc_wire();
 }
 
 static const char *hsdk_compat[] __initconst = {
-- 
2.7.4
