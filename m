From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 11 Oct 2017 20:01:42 +0300
Subject: [PATCH] ARC: [plat-hsdk]: Increase SDIO CIU frequency to 50000000Hz
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171011170142.27232-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

With current SDIO CIU clock frequency (12500000Hz) DW MMC
controller fails to initialize some SD cards (which don't
support slow mode).

So increase SDIO CIU frequency from 12500000Hz to 50000000Hz by
switching from the default divisor value (div-by-8) to the
minimum possible value of the divisor (div-by-2) in HSDK platform
code.

Reported-by: Vineet Gupta <vgupta at synopsys.com>
Tested-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/boot/dts/hsdk.dts    | 11 ++++++-----
 arch/arc/plat-hsdk/platform.c | 10 ++++++++++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 8adde1b..8f627c2 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -137,14 +137,15 @@
 			/*
 			 * DW sdio controller has external ciu clock divider
 			 * controlled via register in SDIO IP. Due to its
-			 * unexpected default value (it should devide by 1
-			 * but it devides by 8) SDIO IP uses wrong clock and
+			 * unexpected default value (it should divide by 1
+			 * but it divides by 8) SDIO IP uses wrong clock and
 			 * works unstable (see STAR 9001204800)
+			 * We switched to the minimum possible value of the
+			 * divisor (div-by-2) in HSDK platform code.
 			 * So add temporary fix and change clock frequency
-			 * from 100000000 to 12500000 Hz until we fix dw sdio
-			 * driver itself.
+			 * to 50000000 Hz until we fix dw sdio driver itself.
 			 */
-			clock-frequency = <12500000>;
+			clock-frequency = <50000000>;
 			#clock-cells = <0>;
 		};
 
diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
index 744e62e..5ea46b6 100644
--- a/arch/arc/plat-hsdk/platform.c
+++ b/arch/arc/plat-hsdk/platform.c
@@ -74,6 +74,10 @@ static void __init hsdk_set_cpu_freq_1ghz(void)
 		pr_err("Failed to setup CPU frequency to 1GHz!");
 }
 
+#define SDIO_BASE		(ARC_PERIPHERAL_BASE + 0xA000)
+#define SDIO_UHS_REG_EXT	(SDIO_BASE + 0x108)
+#define SDIO_UHS_REG_EXT_DIV_2	(2 << 30)
+
 static void __init hsdk_init_early(void)
 {
 	/*
@@ -89,6 +93,12 @@ static void __init hsdk_init_early(void)
 	/* Really apply settings made above */
 	writel(1, (void __iomem *) CREG_PAE_UPDATE);
 
+	/* 
+	 * Switch SDIO external ciu clock divider from default div-by-8 to
+	 * minimum possible div-by-2.
+	 */
+	iowrite32(SDIO_UHS_REG_EXT_DIV_2, (void __iomem *) SDIO_UHS_REG_EXT);
+
 	/*
 	 * Setup CPU frequency to 1GHz.
 	 * TODO: remove it after smart hsdk pll driver will be introduced.
-- 
2.9.3
