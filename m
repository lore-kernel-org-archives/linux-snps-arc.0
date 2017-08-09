From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed,  9 Aug 2017 21:09:25 +0300
Subject: [PATCH] ARC: HSDK: DTS: Add reset controller node to manage ethernet
 reset
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170809180925.31273-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

DW ethernet controller on HSDK hangs sometimes after SW reset, so
add reset node to make possible to reset DW ethernet controller HW.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
NOTE: this patch is effective only if patches to DW ethernet controller
      and reset controller are applied (they are already in linux-next)

 arch/arc/boot/dts/hsdk.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index e096879..84052db 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -12,6 +12,7 @@
 /dts-v1/;
 
 #include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/reset/snps,hsdk-v1-reset.h>
 
 / {
 	model = "snps,hsdk";
@@ -102,6 +103,12 @@
 
 		ranges = <0x00000000 0xf0000000 0x10000000>;
 
+		cgu_rst: reset {
+			compatible = "snps,hsdk-v1.0-reset";
+			#reset-cells = <1>;
+			reg = <0x8A0 0x4>, <0xFF0 0x4>;
+		};
+
 		serial: serial at 5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
@@ -141,6 +148,8 @@
 			clocks = <&gmacclk>;
 			clock-names = "stmmaceth";
 			phy-handle = <&phy0>;
+			resets = <&cgu_rst HSDK_V1_ETH_RESET>;
+			reset-names = "stmmaceth";
 
 			mdio {
 				#address-cells = <1>;
-- 
2.9.3
