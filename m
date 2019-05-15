From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 15 May 2019 18:33:40 +0300
Subject: [PATCH] ARC: [plat-hsdk] Get rid of inappropriate PHY settings
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190515153340.40074-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Initial bring-up of the platform was done on FPGA prototype
where TI's DP83867 PHY was used. And so some specific PHY
options were added.

Just to confirm this is what we get on FPGA prototype in the bootlog:
| TI DP83867 stmmac-0:00: attached PHY driver [TI DP83867] ...

On real board though we have Micrel KZS9031 PHY and we even have
CONFIG_MICREL_PHY=y set in hsdk_defconfig. That's what we see in the bootlog:
| Micrel KSZ9031 Gigabit PHY stmmac-0:00: ...

So essentially all TI-related bits have to go away.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Trent Piepho <tpiepho at impinj.com>
Cc: Rob Herring <robh+dt at kernel.org>
---
 arch/arc/boot/dts/hsdk.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 7425bb0f2d1b..f88a898029ce 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -11,7 +11,6 @@
  */
 /dts-v1/;
 
-#include <dt-bindings/net/ti-dp83867.h>
 #include <dt-bindings/reset/snps,hsdk-reset.h>
 
 / {
@@ -201,9 +200,6 @@
 				compatible = "snps,dwmac-mdio";
 				phy0: ethernet-phy at 0 {
 					reg = <0>;
-					ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
-					ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
-					ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 				};
 			};
 		};
-- 
2.16.2
