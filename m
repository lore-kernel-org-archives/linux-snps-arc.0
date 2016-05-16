From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 16 May 2016 12:57:43 +0300
Subject: [PATCH] arc: axs103_smp: Fix CPU frequency to 100MHz for dual-core
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1463392663-12952-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The most recent release of AXS103 [v1.1] is proven to work
at 100 MHz in dual-core mode so this change uses mentioned feature.
For that we:
 * Update axc003_idu.dtsi with mention of really-used CPU clock freq
 * Remove clock override in AXS platform code for dual-core HW

Note we're still leaving a hack for clock "downgrade" on early boot
for quad-core hardware.

Also note this change will break functionality of AXS103 v1.0 hardware.
That means all users of AXS103 __must__ upgrade their boards with the
most recent firmware.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/boot/dts/axc003_idu.dtsi | 2 +-
 arch/arc/plat-axs10x/axs10x.c     | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 8955881d..ed1674b 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -28,7 +28,7 @@
 		core_clk: core_clk {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
-			clock-frequency = <90000000>;
+			clock-frequency = <100000000>;
 		};
 
 		core_intc: archs-intc at cpu {
diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
index 9701c93..8654870 100644
--- a/arch/arc/plat-axs10x/axs10x.c
+++ b/arch/arc/plat-axs10x/axs10x.c
@@ -410,8 +410,6 @@ static void __init axs103_early_init(void)
 	unsigned int num_cores = (read_aux_reg(ARC_REG_MCIP_BCR) >> 16) & 0x3F;
 	if (num_cores > 2)
 		freq = 50;
-	else if (num_cores == 2)
-		freq = 75;
 #endif
 
 	switch (freq) {
-- 
2.5.5
