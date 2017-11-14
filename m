From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 14 Nov 2017 17:32:13 +0300
Subject: [PATCH 1/2] ARC: [plat-axs10x]: DTS: Add reset controller node to
 manage ethernet reset
In-Reply-To: <20171114143214.2513-1-Eugeniy.Paltsev@synopsys.com>
References: <20171114143214.2513-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171114143214.2513-2-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

DW ethernet controller on axs10x hangs sometimes after SW reset, so
add reset node to make possible to reset DW ethernet controller HW.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/boot/dts/axs10x_mb.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index e114000..74d070c 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -16,6 +16,12 @@
 		ranges = <0x00000000 0x0 0xe0000000 0x10000000>;
 		interrupt-parent = <&mb_intc>;
 
+		creg_rst: reset-controller at 11220 {
+			compatible = "snps,axs10x-reset";
+			#reset-cells = <1>;
+			reg = <0x11220 0x4>;
+		};
+
 		i2sclk: i2sclk at 100a0 {
 			compatible = "snps,axs10x-i2s-pll-clock";
 			reg = <0x100a0 0x10>;
@@ -73,6 +79,8 @@
 			clocks = <&apbclk>;
 			clock-names = "stmmaceth";
 			max-speed = <100>;
+			resets = <&creg_rst 5>;
+			reset-names = "stmmaceth";
 		};
 
 		ehci at 0x40000 {
-- 
2.9.3
