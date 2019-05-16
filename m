From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 16 May 2019 13:04:53 +0300
Subject: [PATCH] ARC: [plat-axs10x] Specify PHY node in .dtsi
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190516100453.41530-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

For completeness of the HW description add missing PHY entry in
AXS10x base-board .dtsi.

Cc: Trent Piepho <tpiepho at impinj.com>
Cc: Rob Herring <robh+dt at kernel.org>
Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/boot/dts/axs10x_mb.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 4ead6dc9af2f..98e9d63e868e 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -79,6 +79,7 @@
 			interrupts = < 4 >;
 			interrupt-names = "macirq";
 			phy-mode = "rgmii";
+			phy-handle = <&phy0>;
 			snps,pbl = < 32 >;
 			clocks = <&apbclk>;
 			clock-names = "stmmaceth";
@@ -86,6 +87,16 @@
 			resets = <&creg_rst 5>;
 			reset-names = "stmmaceth";
 			mac-address = [00 00 00 00 00 00]; /* Filled in by U-Boot */
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "snps,dwmac-mdio";
+				phy0: ethernet-phy at 1 {
+					reg = <1>;
+				};
+			};
+
 		};
 
 		ehci at 40000 {
-- 
2.16.2
