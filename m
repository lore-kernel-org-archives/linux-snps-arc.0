From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 14 Aug 2017 19:12:12 +0300
Subject: [PATCH 4/5] ARC: AXS103: DTS: Set cpu frequency explicitly via dts
In-Reply-To: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
References: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170814161213.17522-5-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Set cpu frequency explicitly via "cpu-freq" param in cpu 0 node
in device tree.

We add "cpu-freq" only to cpu 0 as all cpus are clocking from same
clock source (same pll in our case).

We override cpus node in skeleton as we don't need this change for
nsim.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/boot/dts/axc003.dtsi     | 13 +++++++++++++
 arch/arc/boot/dts/axc003_idu.dtsi | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index dca7e39..7c7411c 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -17,6 +17,19 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu at 0 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <0>;
+			cpu-freq = <100000000>;
+			clocks = <&core_clk>;
+		};
+	};
+
 	cpu_card {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 5b56bef..44bc01e 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -17,6 +17,41 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		 * "cpu-freq" was added only to cpu 0 as all cpus are clocking
+		 * from same clock source (same pll (core_clk) in our case).
+		 */
+		cpu at 0 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <0>;
+			cpu-freq = <100000000>;
+			clocks = <&core_clk>;
+		};
+		cpu at 1 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <1>;
+			clocks = <&core_clk>;
+		};
+		cpu at 2 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <2>;
+			clocks = <&core_clk>;
+		};
+		cpu at 3 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <3>;
+			clocks = <&core_clk>;
+		};
+	};
+
 	cpu_card {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.9.3
