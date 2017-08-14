From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 14 Aug 2017 19:12:11 +0300
Subject: [PATCH 3/5] ARC: AXS103: DTS: Add core pll node to manage cpu
 frequency
In-Reply-To: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
References: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170814161213.17522-4-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Add core pll node (core_clk) to manage cpu frequency.
core_clk represents pll itself.
input_clk represents clock signal source (basically xtal) which
comes to pll input.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/boot/dts/axc003.dtsi     | 11 +++++++++--
 arch/arc/boot/dts/axc003_idu.dtsi | 11 +++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index cc9239e..dca7e39 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -24,10 +24,17 @@
 
 		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
 
-		core_clk: core_clk {
+		input_clk: input-clk {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
-			clock-frequency = <90000000>;
+			clock-frequency = <33333333>;
+		};
+
+		core_clk: core-clk at 80 {
+			compatible = "snps,axs10x-arc-pll-clock";
+			reg = <0x80 0x10>, <0x100 0x10>;
+			#clock-cells = <0>;
+			clocks = <&input_clk>;
 		};
 
 		core_intc: archs-intc at cpu {
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 4ebb2170..5b56bef 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -24,10 +24,17 @@
 
 		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
 
-		core_clk: core_clk {
+		input_clk: input-clk {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
-			clock-frequency = <100000000>;
+			clock-frequency = <33333333>;
+		};
+
+		core_clk: core-clk at 80 {
+			compatible = "snps,axs10x-arc-pll-clock";
+			reg = <0x80 0x10>, <0x100 0x10>;
+			#clock-cells = <0>;
+			clocks = <&input_clk>;
 		};
 
 		core_intc: archs-intc at cpu {
-- 
2.9.3
