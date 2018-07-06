From: gustavo.pimentel@synopsys.com (Gustavo Pimentel)
Date: Fri,  6 Jul 2018 11:32:37 +0100
Subject: [PATCH v2] ARC: Configure APB GPIO controller on ARC HSDK platform
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5f3c59cdf0f4eb8bf22ca27031187fd866ffbecc.1530872741.git.gustavo.pimentel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

In case of HSDK we have intermediate INTC in for of DW APB GPIO controller
which is used as a de-bounce logic for interrupt wires that come from
outside the board.

We cannot use existing "irq-dw-apb-ictl" driver here because all input
lines are routed to corresponding output lines but not muxed into one
line (this is configured in RTL and we cannot change this in software).

But even if we add such a feature to "irq-dw-apb-ictl" driver that won't
benefit us as higher-level INTC (in case of HSDK it is IDU) anyways has
per-input control so adding fully-controller intermediate INTC will only
bring some overhead on interrupt processing but no other benefits.

Thus we just do one-time configuration of DW APB GPIO controller and
forget about it.

Based on implementation available on arch/arc/plat-axs10x/axs10x.c file.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel at synopsys.com>
---
 arch/arc/plat-hsdk/platform.c | 62 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
index 2958aed..2588b84 100644
--- a/arch/arc/plat-hsdk/platform.c
+++ b/arch/arc/plat-hsdk/platform.c
@@ -42,6 +42,66 @@ static void __init hsdk_init_per_cpu(unsigned int cpu)
 #define SDIO_UHS_REG_EXT	(SDIO_BASE + 0x108)
 #define SDIO_UHS_REG_EXT_DIV_2	(2 << 30)
 
+#define HSDK_GPIO_INTC          (ARC_PERIPHERAL_BASE + 0x3000)
+
+static void __init hsdk_enable_gpio_intc_wire(void)
+{
+	/*
+	 * Peripherals on CPU Card are wired to cpu intc via intermediate
+	 * DW APB GPIO blocks (mainly for debouncing)
+	 *
+	 *         ---------------------
+	 *        |  snps,archs-intc  |
+	 *        ---------------------
+	 *                  |
+	 *        ----------------------
+	 *        | snps,archs-idu-intc |
+	 *        ----------------------
+	 *         |   |     |   |    |
+	 *         | [eth] [USB]    [... other peripherals]
+	 *         |
+	 * -------------------
+	 * | snps,dw-apb-intc |
+	 * -------------------
+	 *  |      |   |   |
+	 * [Bt] [HAPS]   [... other peripherals]
+	 *
+	 * Current implementation of "irq-dw-apb-ictl" driver doesn't work well
+	 * with stacked INTCs. In particular problem happens if its master INTC
+	 * not yet instantiated. See discussion here -
+	 * https://lkml.org/lkml/2015/3/4/755
+	 *
+	 * So setup the first gpio block as a passive pass thru and hide it from
+	 * DT hardware topology - connect intc directly to cpu intc
+	 * The GPIO "wire" needs to be init nevertheless (here)
+	 *
+	 * One side adv is that peripheral interrupt handling avoids one nested
+	 * intc ISR hop
+	 *
+	 * According to HSDK User's Manual [1], "Table 2 Interrupt Mapping"
+	 * we have the following GPIO input lines used as sources of interrupt:
+	 * - GPIO[0] - Bluetooth interrupt of RS9113 module
+	 * - GPIO[2] - HAPS interrupt (on HapsTrak 3 connector)
+	 * - GPIO[3] - Audio codec (MAX9880A) interrupt
+	 * - GPIO[8-23] - Available on Arduino and PMOD_x headers
+	 * For now there's no use of Arduino and PMOD_x headers in Linux
+	 * use-case so we only enable lines 0, 2 and 3.
+	 *
+	 * [1] https://github.com/foss-for-synopsys-dwc-arc-processors/ARC-Development-Systems-Forum/wiki/docs/ARC_HSDK_User_Guide.pdf
+	 */
+#define GPIO_INTEN              (HSDK_GPIO_INTC + 0x30)
+#define GPIO_INTMASK            (HSDK_GPIO_INTC + 0x34)
+#define GPIO_INTTYPE_LEVEL      (HSDK_GPIO_INTC + 0x38)
+#define GPIO_INT_POLARITY       (HSDK_GPIO_INTC + 0x3c)
+#define GPIO_INT_CONNECTED_MASK	0x0d
+
+	iowrite32(0xffffffff, (void __iomem *) GPIO_INTMASK);
+	iowrite32(~GPIO_INT_CONNECTED_MASK, (void __iomem *) GPIO_INTMASK);
+	iowrite32(0x00000000, (void __iomem *) GPIO_INTTYPE_LEVEL);
+	iowrite32(0xffffffff, (void __iomem *) GPIO_INT_POLARITY);
+	iowrite32(GPIO_INT_CONNECTED_MASK, (void __iomem *) GPIO_INTEN);
+}
+
 static void __init hsdk_init_early(void)
 {
 	/*
@@ -62,6 +122,8 @@ static void __init hsdk_init_early(void)
 	 * minimum possible div-by-2.
 	 */
 	iowrite32(SDIO_UHS_REG_EXT_DIV_2, (void __iomem *) SDIO_UHS_REG_EXT);
+
+	hsdk_enable_gpio_intc_wire();
 }
 
 static const char *hsdk_compat[] __initconst = {
-- 
2.7.4
