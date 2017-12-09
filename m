From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Sat,  9 Dec 2017 16:59:16 +0300
Subject: [PATCH 2/4] ARC: [plat-hsdk]: Get rid of core pll frequency set in
 platform code
In-Reply-To: <20171209135918.16720-1-Eugeniy.Paltsev@synopsys.com>
References: <20171209135918.16720-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171209135918.16720-3-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Get rid of core pll frequency set in platform code as we set it via
device tree using 'assigned-clock-rates' property.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/plat-hsdk/platform.c | 42 ------------------------------------------
 1 file changed, 42 deletions(-)

diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
index fd0ae5e..2958aed 100644
--- a/arch/arc/plat-hsdk/platform.c
+++ b/arch/arc/plat-hsdk/platform.c
@@ -38,42 +38,6 @@ static void __init hsdk_init_per_cpu(unsigned int cpu)
 #define CREG_PAE		(CREG_BASE + 0x180)
 #define CREG_PAE_UPDATE		(CREG_BASE + 0x194)
 
-#define CREG_CORE_IF_CLK_DIV	(CREG_BASE + 0x4B8)
-#define CREG_CORE_IF_CLK_DIV_2	0x1
-#define CGU_BASE		ARC_PERIPHERAL_BASE
-#define CGU_PLL_STATUS		(ARC_PERIPHERAL_BASE + 0x4)
-#define CGU_PLL_CTRL		(ARC_PERIPHERAL_BASE + 0x0)
-#define CGU_PLL_STATUS_LOCK	BIT(0)
-#define CGU_PLL_STATUS_ERR	BIT(1)
-#define CGU_PLL_CTRL_1GHZ	0x3A10
-#define HSDK_PLL_LOCK_TIMEOUT	500
-
-#define HSDK_PLL_LOCKED() \
-	!!(ioread32((void __iomem *) CGU_PLL_STATUS) & CGU_PLL_STATUS_LOCK)
-
-#define HSDK_PLL_ERR() \
-	!!(ioread32((void __iomem *) CGU_PLL_STATUS) & CGU_PLL_STATUS_ERR)
-
-static void __init hsdk_set_cpu_freq_1ghz(void)
-{
-	u32 timeout = HSDK_PLL_LOCK_TIMEOUT;
-
-	/*
-	 * As we set cpu clock which exceeds 500MHz, the divider for the interface
-	 * clock must be programmed to div-by-2.
-	 */
-	iowrite32(CREG_CORE_IF_CLK_DIV_2, (void __iomem *) CREG_CORE_IF_CLK_DIV);
-
-	/* Set cpu clock to 1GHz */
-	iowrite32(CGU_PLL_CTRL_1GHZ, (void __iomem *) CGU_PLL_CTRL);
-
-	while (!HSDK_PLL_LOCKED() && timeout--)
-		cpu_relax();
-
-	if (!HSDK_PLL_LOCKED() || HSDK_PLL_ERR())
-		pr_err("Failed to setup CPU frequency to 1GHz!");
-}
-
 #define SDIO_BASE		(ARC_PERIPHERAL_BASE + 0xA000)
 #define SDIO_UHS_REG_EXT	(SDIO_BASE + 0x108)
 #define SDIO_UHS_REG_EXT_DIV_2	(2 << 30)
@@ -98,12 +62,6 @@ static void __init hsdk_init_early(void)
 	 * minimum possible div-by-2.
 	 */
 	iowrite32(SDIO_UHS_REG_EXT_DIV_2, (void __iomem *) SDIO_UHS_REG_EXT);
-
-	/*
-	 * Setup CPU frequency to 1GHz.
-	 * TODO: remove it after smart hsdk pll driver will be introduced.
-	 */
-	hsdk_set_cpu_freq_1ghz();
 }
 
 static const char *hsdk_compat[] __initconst = {
-- 
2.9.3
