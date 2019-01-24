From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 24 Jan 2019 15:17:03 +0300
Subject: [PATCH v2] ARC: [scripted] fix node name and address spelling
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190124121703.2337-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Alexey Brodkin <alexey.brodkin@synopsys.com>

1. Remove "0x" prefix from unit-address of node names
----------------------->8------------------------
sed -i 's/@0x/@/g' arch/arc/boot/dts/*.dts*
----------------------->8------------------------

2. Make all hex addresses lowercase:
----------------------->8------------------------
sed -i 's/@\([0-9A-Za-z]*\)/@\L\1/g' arch/arc/boot/dts/*.dts*
sed -i 's/0x\([0-9A-Za-z]*\)/0x\L\1/g' arch/arc/boot/dts/*.dts*
----------------------->8------------------------

Inspired by [1] and the like.

[1] http://kisskb.ellerman.id.au/kisskb/buildresult/13612017/

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Rob Herring <robh+dt at kernel.org>
---

Changes v1 -> v2:

 * Convert all hex addresses to lower-case [Rob]

 arch/arc/boot/dts/abilis_tb100.dtsi    | 58 ++++++++++++++++----------------
 arch/arc/boot/dts/abilis_tb100_dvk.dts | 14 ++++----
 arch/arc/boot/dts/abilis_tb101.dtsi    | 58 ++++++++++++++++----------------
 arch/arc/boot/dts/abilis_tb101_dvk.dts | 14 ++++----
 arch/arc/boot/dts/abilis_tb10x.dtsi    | 60 +++++++++++++++++-----------------
 arch/arc/boot/dts/axc001.dtsi          |  6 ++--
 arch/arc/boot/dts/axc003.dtsi          | 16 ++++-----
 arch/arc/boot/dts/axc003_idu.dtsi      | 16 ++++-----
 arch/arc/boot/dts/axs10x_mb.dtsi       | 22 ++++++-------
 arch/arc/boot/dts/hsdk.dts             |  4 +--
 arch/arc/boot/dts/vdk_axc003.dtsi      |  4 +--
 arch/arc/boot/dts/vdk_axc003_idu.dtsi  |  4 +--
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi   | 18 +++++-----
 13 files changed, 147 insertions(+), 147 deletions(-)

diff --git a/arch/arc/boot/dts/abilis_tb100.dtsi b/arch/arc/boot/dts/abilis_tb100.dtsi
index 02410b211433..c0bcd97522bb 100644
--- a/arch/arc/boot/dts/abilis_tb100.dtsi
+++ b/arch/arc/boot/dts/abilis_tb100.dtsi
@@ -38,7 +38,7 @@
 			clock-div = <6>;
 		};
 
-		iomux: iomux at FF10601c {
+		iomux: iomux at ff10601c {
 			/* Port 1 */
 			pctl_tsin_s0: pctl-tsin-s0 {   /* Serial TS-in 0 */
 				abilis,function = "mis0";
@@ -162,182 +162,182 @@
 			};
 		};
 
-		gpioa: gpio at FF140000 {
+		gpioa: gpio at ff140000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF140000 0x1000>;
+			reg = <0xff140000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <3>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpioa";
 		};
-		gpiob: gpio at FF141000 {
+		gpiob: gpio at ff141000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF141000 0x1000>;
+			reg = <0xff141000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <2>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiob";
 		};
-		gpioc: gpio at FF142000 {
+		gpioc: gpio at ff142000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF142000 0x1000>;
+			reg = <0xff142000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <3>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpioc";
 		};
-		gpiod: gpio at FF143000 {
+		gpiod: gpio at ff143000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF143000 0x1000>;
+			reg = <0xff143000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <2>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiod";
 		};
-		gpioe: gpio at FF144000 {
+		gpioe: gpio at ff144000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF144000 0x1000>;
+			reg = <0xff144000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <3>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpioe";
 		};
-		gpiof: gpio at FF145000 {
+		gpiof: gpio at ff145000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF145000 0x1000>;
+			reg = <0xff145000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <2>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiof";
 		};
-		gpiog: gpio at FF146000 {
+		gpiog: gpio at ff146000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF146000 0x1000>;
+			reg = <0xff146000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <3>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiog";
 		};
-		gpioh: gpio at FF147000 {
+		gpioh: gpio at ff147000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF147000 0x1000>;
+			reg = <0xff147000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <2>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpioh";
 		};
-		gpioi: gpio at FF148000 {
+		gpioi: gpio at ff148000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF148000 0x1000>;
+			reg = <0xff148000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <12>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpioi";
 		};
-		gpioj: gpio at FF149000 {
+		gpioj: gpio at ff149000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF149000 0x1000>;
+			reg = <0xff149000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <32>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpioj";
 		};
-		gpiok: gpio at FF14a000 {
+		gpiok: gpio at ff14a000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF14A000 0x1000>;
+			reg = <0xff14a000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <22>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiok";
 		};
-		gpiol: gpio at FF14b000 {
+		gpiol: gpio at ff14b000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF14B000 0x1000>;
+			reg = <0xff14b000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <4>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiol";
 		};
-		gpiom: gpio at FF14c000 {
+		gpiom: gpio at ff14c000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF14C000 0x1000>;
+			reg = <0xff14c000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <4>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiom";
 		};
-		gpion: gpio at FF14d000 {
+		gpion: gpio at ff14d000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF14D000 0x1000>;
+			reg = <0xff14d000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <5>;
diff --git a/arch/arc/boot/dts/abilis_tb100_dvk.dts b/arch/arc/boot/dts/abilis_tb100_dvk.dts
index 3acf04db8030..c968e677db46 100644
--- a/arch/arc/boot/dts/abilis_tb100_dvk.dts
+++ b/arch/arc/boot/dts/abilis_tb100_dvk.dts
@@ -37,27 +37,27 @@
 	};
 
 	soc100 {
-		uart at FF100000 {
+		uart at ff100000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pctl_uart0>;
 		};
-		ethernet at FE100000 {
+		ethernet at fe100000 {
 			phy-mode = "rgmii";
 		};
 
-		i2c0: i2c at FF120000 {
+		i2c0: i2c at ff120000 {
 			i2c-sda-hold-time-ns = <432>;
 		};
-		i2c1: i2c at FF121000 {
+		i2c1: i2c at ff121000 {
 			i2c-sda-hold-time-ns = <432>;
 		};
-		i2c2: i2c at FF122000 {
+		i2c2: i2c at ff122000 {
 			i2c-sda-hold-time-ns = <432>;
 		};
-		i2c3: i2c at FF123000 {
+		i2c3: i2c at ff123000 {
 			i2c-sda-hold-time-ns = <432>;
 		};
-		i2c4: i2c at FF124000 {
+		i2c4: i2c at ff124000 {
 			i2c-sda-hold-time-ns = <432>;
 		};
 
diff --git a/arch/arc/boot/dts/abilis_tb101.dtsi b/arch/arc/boot/dts/abilis_tb101.dtsi
index f9e7686044eb..6a1615f58f05 100644
--- a/arch/arc/boot/dts/abilis_tb101.dtsi
+++ b/arch/arc/boot/dts/abilis_tb101.dtsi
@@ -38,7 +38,7 @@
 			clock-div = <6>;
 		};
 
-		iomux: iomux at FF10601c {
+		iomux: iomux at ff10601c {
 			/* Port 1 */
 			pctl_tsin_s0: pctl-tsin-s0 {   /* Serial TS-in 0 */
 				abilis,function = "mis0";
@@ -171,182 +171,182 @@
 			};
 		};
 
-		gpioa: gpio at FF140000 {
+		gpioa: gpio at ff140000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF140000 0x1000>;
+			reg = <0xff140000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <3>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpioa";
 		};
-		gpiob: gpio at FF141000 {
+		gpiob: gpio at ff141000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF141000 0x1000>;
+			reg = <0xff141000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <2>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiob";
 		};
-		gpioc: gpio at FF142000 {
+		gpioc: gpio at ff142000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF142000 0x1000>;
+			reg = <0xff142000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <3>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpioc";
 		};
-		gpiod: gpio at FF143000 {
+		gpiod: gpio at ff143000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF143000 0x1000>;
+			reg = <0xff143000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <2>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiod";
 		};
-		gpioe: gpio at FF144000 {
+		gpioe: gpio at ff144000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF144000 0x1000>;
+			reg = <0xff144000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <3>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpioe";
 		};
-		gpiof: gpio at FF145000 {
+		gpiof: gpio at ff145000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF145000 0x1000>;
+			reg = <0xff145000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <2>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiof";
 		};
-		gpiog: gpio at FF146000 {
+		gpiog: gpio at ff146000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF146000 0x1000>;
+			reg = <0xff146000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <3>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiog";
 		};
-		gpioh: gpio at FF147000 {
+		gpioh: gpio at ff147000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF147000 0x1000>;
+			reg = <0xff147000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <2>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpioh";
 		};
-		gpioi: gpio at FF148000 {
+		gpioi: gpio at ff148000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF148000 0x1000>;
+			reg = <0xff148000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <12>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpioi";
 		};
-		gpioj: gpio at FF149000 {
+		gpioj: gpio at ff149000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF149000 0x1000>;
+			reg = <0xff149000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <32>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpioj";
 		};
-		gpiok: gpio at FF14a000 {
+		gpiok: gpio at ff14a000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF14A000 0x1000>;
+			reg = <0xff14a000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <22>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiok";
 		};
-		gpiol: gpio at FF14b000 {
+		gpiol: gpio at ff14b000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF14B000 0x1000>;
+			reg = <0xff14b000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <4>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiol";
 		};
-		gpiom: gpio at FF14c000 {
+		gpiom: gpio at ff14c000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF14C000 0x1000>;
+			reg = <0xff14c000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <4>;
 			gpio-ranges = <&iomux 0 0 0>;
 			gpio-ranges-group-names = "gpiom";
 		};
-		gpion: gpio at FF14d000 {
+		gpion: gpio at ff14d000 {
 			compatible = "abilis,tb10x-gpio";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <27 2>;
-			reg = <0xFF14D000 0x1000>;
+			reg = <0xff14d000 0x1000>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			abilis,ngpio = <5>;
diff --git a/arch/arc/boot/dts/abilis_tb101_dvk.dts b/arch/arc/boot/dts/abilis_tb101_dvk.dts
index 37d88c5dd181..05143ce9c120 100644
--- a/arch/arc/boot/dts/abilis_tb101_dvk.dts
+++ b/arch/arc/boot/dts/abilis_tb101_dvk.dts
@@ -37,27 +37,27 @@
 	};
 
 	soc100 {
-		uart at FF100000 {
+		uart at ff100000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pctl_uart0>;
 		};
-		ethernet at FE100000 {
+		ethernet at fe100000 {
 			phy-mode = "rgmii";
 		};
 
-		i2c0: i2c at FF120000 {
+		i2c0: i2c at ff120000 {
 			i2c-sda-hold-time-ns = <432>;
 		};
-		i2c1: i2c at FF121000 {
+		i2c1: i2c at ff121000 {
 			i2c-sda-hold-time-ns = <432>;
 		};
-		i2c2: i2c at FF122000 {
+		i2c2: i2c at ff122000 {
 			i2c-sda-hold-time-ns = <432>;
 		};
-		i2c3: i2c at FF123000 {
+		i2c3: i2c at ff123000 {
 			i2c-sda-hold-time-ns = <432>;
 		};
-		i2c4: i2c at FF124000 {
+		i2c4: i2c at ff124000 {
 			i2c-sda-hold-time-ns = <432>;
 		};
 
diff --git a/arch/arc/boot/dts/abilis_tb10x.dtsi b/arch/arc/boot/dts/abilis_tb10x.dtsi
index 3121536b25a3..2fbf1bdfe6de 100644
--- a/arch/arc/boot/dts/abilis_tb10x.dtsi
+++ b/arch/arc/boot/dts/abilis_tb10x.dtsi
@@ -54,7 +54,7 @@
 		#size-cells	= <1>;
 		device_type	= "soc";
 		ranges		= <0xfe000000 0xfe000000 0x02000000
-				0x000F0000 0x000F0000 0x00010000>;
+				0x000f0000 0x000f0000 0x00010000>;
 		compatible	= "abilis,tb10x", "simple-bus";
 
 		pll0: oscillator {
@@ -75,10 +75,10 @@
 			clock-output-names = "ahb_clk";
 		};
 
-		iomux: iomux at FF10601c {
+		iomux: iomux at ff10601c {
 			compatible = "abilis,tb10x-iomux";
 			#gpio-range-cells = <3>;
-			reg = <0xFF10601c 0x4>;
+			reg = <0xff10601c 0x4>;
 		};
 
 		intc: interrupt-controller {
@@ -88,7 +88,7 @@
 		};
 		tb10x_ictl: pic at fe002000 {
 			compatible = "abilis,tb10x-ictl";
-			reg = <0xFE002000 0x20>;
+			reg = <0xfe002000 0x20>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
@@ -96,27 +96,27 @@
 					20 21 22 23 24 25 26 27 28 29 30 31>;
 		};
 
-		uart at FF100000 {
+		uart at ff100000 {
 			compatible = "snps,dw-apb-uart";
-			reg = <0xFF100000 0x100>;
+			reg = <0xff100000 0x100>;
 			clock-frequency = <166666666>;
 			interrupts = <25 8>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			interrupt-parent = <&tb10x_ictl>;
 		};
-		ethernet at FE100000 {
+		ethernet at fe100000 {
 			compatible = "snps,dwmac-3.70a","snps,dwmac";
-			reg = <0xFE100000 0x1058>;
+			reg = <0xfe100000 0x1058>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <6 8>;
 			interrupt-names = "macirq";
 			clocks = <&ahb_clk>;
 			clock-names = "stmmaceth";
 		};
-		dma at FE000000 {
+		dma at fe000000 {
 			compatible = "snps,dma-spear1340";
-			reg = <0xFE000000 0x400>;
+			reg = <0xfe000000 0x400>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <14 8>;
 			dma-channels = <6>;
@@ -132,70 +132,70 @@
 			multi-block = <1 1 1 1 1 1>;
 		};
 
-		i2c0: i2c at FF120000 {
+		i2c0: i2c at ff120000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "snps,designware-i2c";
-			reg = <0xFF120000 0x1000>;
+			reg = <0xff120000 0x1000>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <12 8>;
 			clocks = <&ahb_clk>;
 		};
-		i2c1: i2c at FF121000 {
+		i2c1: i2c at ff121000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "snps,designware-i2c";
-			reg = <0xFF121000 0x1000>;
+			reg = <0xff121000 0x1000>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <12 8>;
 			clocks = <&ahb_clk>;
 		};
-		i2c2: i2c at FF122000 {
+		i2c2: i2c at ff122000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "snps,designware-i2c";
-			reg = <0xFF122000 0x1000>;
+			reg = <0xff122000 0x1000>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <12 8>;
 			clocks = <&ahb_clk>;
 		};
-		i2c3: i2c at FF123000 {
+		i2c3: i2c at ff123000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "snps,designware-i2c";
-			reg = <0xFF123000 0x1000>;
+			reg = <0xff123000 0x1000>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <12 8>;
 			clocks = <&ahb_clk>;
 		};
-		i2c4: i2c at FF124000 {
+		i2c4: i2c at ff124000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "snps,designware-i2c";
-			reg = <0xFF124000 0x1000>;
+			reg = <0xff124000 0x1000>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <12 8>;
 			clocks = <&ahb_clk>;
 		};
 
-		spi0: spi at 0xFE010000 {
+		spi0: spi at fe010000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			cell-index = <0>;
 			compatible = "abilis,tb100-spi";
 			num-cs = <1>;
-			reg = <0xFE010000 0x20>;
+			reg = <0xfe010000 0x20>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <26 8>;
 			clocks = <&ahb_clk>;
 		};
-		spi1: spi at 0xFE011000 {
+		spi1: spi at fe011000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			cell-index = <1>;
 			compatible = "abilis,tb100-spi";
 			num-cs = <2>;
-			reg = <0xFE011000 0x20>;
+			reg = <0xfe011000 0x20>;
 			interrupt-parent = <&tb10x_ictl>;
 			interrupts = <10 8>;
 			clocks = <&ahb_clk>;
@@ -226,23 +226,23 @@
 			interrupts = <20 2>, <19 2>;
 			interrupt-names = "cmd_irq", "event_irq";
 		};
-		tb10x_mdsc0: tb10x-mdscr at FF300000 {
+		tb10x_mdsc0: tb10x-mdscr at ff300000 {
 			compatible = "abilis,tb100-mdscr";
-			reg = <0xFF300000 0x7000>;
+			reg = <0xff300000 0x7000>;
 			tb100-mdscr-manage-tsin;
 		};
-		tb10x_mscr0: tb10x-mdscr at FF307000 {
+		tb10x_mscr0: tb10x-mdscr at ff307000 {
 			compatible = "abilis,tb100-mdscr";
-			reg = <0xFF307000 0x7000>;
+			reg = <0xff307000 0x7000>;
 		};
 		tb10x_scr0: tb10x-mdscr at ff30e000 {
 			compatible = "abilis,tb100-mdscr";
-			reg = <0xFF30e000 0x4000>;
+			reg = <0xff30e000 0x4000>;
 			tb100-mdscr-manage-tsin;
 		};
 		tb10x_scr1: tb10x-mdscr at ff312000 {
 			compatible = "abilis,tb100-mdscr";
-			reg = <0xFF312000 0x4000>;
+			reg = <0xff312000 0x4000>;
 			tb100-mdscr-manage-tsin;
 		};
 		tb10x_wfb: tb10x-wfb at ff319000 {
diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
index fdc266504ada..37be3bf03ad6 100644
--- a/arch/arc/boot/dts/axc001.dtsi
+++ b/arch/arc/boot/dts/axc001.dtsi
@@ -41,7 +41,7 @@
 		 * this GPIO block ORs all interrupts on CPU card (creg,..)
 		 * to uplink only 1 IRQ to ARC core intc
 		 */
-		dw-apb-gpio at 0x2000 {
+		dw-apb-gpio at 2000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = < 0x2000 0x80 >;
 			#address-cells = <1>;
@@ -60,7 +60,7 @@
 			};
 		};
 
-		debug_uart: dw-apb-uart at 0x5000 {
+		debug_uart: dw-apb-uart at 5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
 			clock-frequency = <33333000>;
@@ -88,7 +88,7 @@
 	 * avoid duplicating the MB dtsi file given that IRQ from
 	 * this intc to cpu intc are different for axs101 and axs103
 	 */
-	mb_intc: dw-apb-ictl at 0xe0012000 {
+	mb_intc: dw-apb-ictl at e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0x0 0xe0012000 0x0 0x200 >;
diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index d75d65ddf8e3..effa37536d7a 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -55,7 +55,7 @@
 		 * this GPIO block ORs all interrupts on CPU card (creg,..)
 		 * to uplink only 1 IRQ to ARC core intc
 		 */
-		dw-apb-gpio at 0x2000 {
+		dw-apb-gpio at 2000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = < 0x2000 0x80 >;
 			#address-cells = <1>;
@@ -74,7 +74,7 @@
 			};
 		};
 
-		debug_uart: dw-apb-uart at 0x5000 {
+		debug_uart: dw-apb-uart at 5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
 			clock-frequency = <33333000>;
@@ -102,19 +102,19 @@
 	 * external DMA buffer located outside of IOC aperture.
 	 */
 	axs10x_mb {
-		ethernet at 0x18000 {
+		ethernet at 18000 {
 			dma-coherent;
 		};
 
-		ehci at 0x40000 {
+		ehci at 40000 {
 			dma-coherent;
 		};
 
-		ohci at 0x60000 {
+		ohci at 60000 {
 			dma-coherent;
 		};
 
-		mmc at 0x15000 {
+		mmc at 15000 {
 			dma-coherent;
 		};
 	};
@@ -132,7 +132,7 @@
 	 * avoid duplicating the MB dtsi file given that IRQ from
 	 * this intc to cpu intc are different for axs101 and axs103
 	 */
-	mb_intc: dw-apb-ictl at 0xe0012000 {
+	mb_intc: dw-apb-ictl at e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0x0 0xe0012000 0x0 0x200 >;
@@ -153,7 +153,7 @@
 		#size-cells = <2>;
 		ranges;
 		/*
-		 * Move frame buffer out of IOC aperture (0x8z-0xAz).
+		 * Move frame buffer out of IOC aperture (0x8z-0xaz).
 		 */
 		frame_buffer: frame_buffer at be000000 {
 			compatible = "shared-dma-pool";
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index a05bb737ea63..e401e59f6180 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -62,7 +62,7 @@
 		 * this GPIO block ORs all interrupts on CPU card (creg,..)
 		 * to uplink only 1 IRQ to ARC core intc
 		 */
-		dw-apb-gpio at 0x2000 {
+		dw-apb-gpio at 2000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = < 0x2000 0x80 >;
 			#address-cells = <1>;
@@ -81,7 +81,7 @@
 			};
 		};
 
-		debug_uart: dw-apb-uart at 0x5000 {
+		debug_uart: dw-apb-uart at 5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
 			clock-frequency = <33333000>;
@@ -109,19 +109,19 @@
 	 * external DMA buffer located outside of IOC aperture.
 	 */
 	axs10x_mb {
-		ethernet at 0x18000 {
+		ethernet at 18000 {
 			dma-coherent;
 		};
 
-		ehci at 0x40000 {
+		ehci at 40000 {
 			dma-coherent;
 		};
 
-		ohci at 0x60000 {
+		ohci at 60000 {
 			dma-coherent;
 		};
 
-		mmc at 0x15000 {
+		mmc at 15000 {
 			dma-coherent;
 		};
 	};
@@ -138,7 +138,7 @@
 	 * avoid duplicating the MB dtsi file given that IRQ from
 	 * this intc to cpu intc are different for axs101 and axs103
 	 */
-	mb_intc: dw-apb-ictl at 0xe0012000 {
+	mb_intc: dw-apb-ictl at e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0x0 0xe0012000 0x0 0x200 >;
@@ -159,7 +159,7 @@
 		#size-cells = <2>;
 		ranges;
 		/*
-		 * Move frame buffer out of IOC aperture (0x8z-0xAz).
+		 * Move frame buffer out of IOC aperture (0x8z-0xaz).
 		 */
 		frame_buffer: frame_buffer at be000000 {
 			compatible = "shared-dma-pool";
diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 37bafd44e36d..4ead6dc9af2f 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -72,7 +72,7 @@
 			};
 		};
 
-		gmac: ethernet at 0x18000 {
+		gmac: ethernet at 18000 {
 			#interrupt-cells = <1>;
 			compatible = "snps,dwmac";
 			reg = < 0x18000 0x2000 >;
@@ -88,13 +88,13 @@
 			mac-address = [00 00 00 00 00 00]; /* Filled in by U-Boot */
 		};
 
-		ehci at 0x40000 {
+		ehci at 40000 {
 			compatible = "generic-ehci";
 			reg = < 0x40000 0x100 >;
 			interrupts = < 8 >;
 		};
 
-		ohci at 0x60000 {
+		ohci at 60000 {
 			compatible = "generic-ohci";
 			reg = < 0x60000 0x100 >;
 			interrupts = < 8 >;
@@ -118,7 +118,7 @@
 		 * dw_mci_pltfm_prepare_command() is used in generic platform
 		 * code.
 		 */
-		mmc at 0x15000 {
+		mmc at 15000 {
 			compatible = "altr,socfpga-dw-mshc";
 			reg = < 0x15000 0x400 >;
 			fifo-depth = < 16 >;
@@ -129,7 +129,7 @@
 			bus-width = < 4 >;
 		};
 
-		uart at 0x20000 {
+		uart at 20000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x20000 0x100>;
 			clock-frequency = <33333333>;
@@ -139,7 +139,7 @@
 			reg-io-width = <4>;
 		};
 
-		uart at 0x21000 {
+		uart at 21000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x21000 0x100>;
 			clock-frequency = <33333333>;
@@ -150,7 +150,7 @@
 		};
 
 		/* UART muxed with USB data port (ttyS3) */
-		uart at 0x22000 {
+		uart at 22000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x22000 0x100>;
 			clock-frequency = <33333333>;
@@ -160,7 +160,7 @@
 			reg-io-width = <4>;
 		};
 
-		i2c at 0x1d000 {
+		i2c at 1d000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x1d000 0x100>;
 			clock-frequency = <400000>;
@@ -177,7 +177,7 @@
 			#sound-dai-cells = <0>;
 		};
 
-		i2c at 0x1f000 {
+		i2c at 1f000 {
 			compatible = "snps,designware-i2c";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -218,13 +218,13 @@
 				};
 			};
 
-			eeprom at 0x54{
+			eeprom at 54{
 				compatible = "atmel,24c01";
 				reg = <0x54>;
 				pagesize = <0x8>;
 			};
 
-			eeprom at 0x57{
+			eeprom at 57{
 				compatible = "atmel,24c04";
 				reg = <0x57>;
 				pagesize = <0x8>;
diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 43f17b51ee89..6c23fa063ced 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -110,12 +110,12 @@
 		cgu_rst: reset-controller at 8a0 {
 			compatible = "snps,hsdk-reset";
 			#reset-cells = <1>;
-			reg = <0x8A0 0x4>, <0xFF0 0x4>;
+			reg = <0x8a0 0x4>, <0xff0 0x4>;
 		};
 
 		core_clk: core-clk at 0 {
 			compatible = "snps,hsdk-core-pll-clock";
-			reg = <0x00 0x10>, <0x14B8 0x4>;
+			reg = <0x00 0x10>, <0x14b8 0x4>;
 			#clock-cells = <0>;
 			clocks = <&input_clk>;
 
diff --git a/arch/arc/boot/dts/vdk_axc003.dtsi b/arch/arc/boot/dts/vdk_axc003.dtsi
index 0fd6ba985b16..84e8766c8ca2 100644
--- a/arch/arc/boot/dts/vdk_axc003.dtsi
+++ b/arch/arc/boot/dts/vdk_axc003.dtsi
@@ -36,7 +36,7 @@
 			#interrupt-cells = <1>;
 		};
 
-		debug_uart: dw-apb-uart at 0x5000 {
+		debug_uart: dw-apb-uart at 5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
 			clock-frequency = <2403200>;
@@ -49,7 +49,7 @@
 
 	};
 
-	mb_intc: dw-apb-ictl at 0xe0012000 {
+	mb_intc: dw-apb-ictl at e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0xe0012000 0x200 >;
diff --git a/arch/arc/boot/dts/vdk_axc003_idu.dtsi b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
index 28956f9a9f3d..eb7e705e8a27 100644
--- a/arch/arc/boot/dts/vdk_axc003_idu.dtsi
+++ b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
@@ -44,7 +44,7 @@
 			#interrupt-cells = <1>;
 		};
 
-		debug_uart: dw-apb-uart at 0x5000 {
+		debug_uart: dw-apb-uart at 5000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x5000 0x100>;
 			clock-frequency = <2403200>;
@@ -57,7 +57,7 @@
 
 	};
 
-	mb_intc: dw-apb-ictl at 0xe0012000 {
+	mb_intc: dw-apb-ictl at e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0xe0012000 0x200 >;
diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
index 48bb4b4cd234..925d5cc95dbb 100644
--- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
@@ -36,7 +36,7 @@
 			};
 		};
 
-		ethernet at 0x18000 {
+		ethernet at 18000 {
 			#interrupt-cells = <1>;
 			compatible = "snps,dwmac";
 			reg = < 0x18000 0x2000 >;
@@ -49,13 +49,13 @@
 			clock-names = "stmmaceth";
 		};
 
-		ehci at 0x40000 {
+		ehci at 40000 {
 			compatible = "generic-ehci";
 			reg = < 0x40000 0x100 >;
 			interrupts = < 8 >;
 		};
 
-		uart at 0x20000 {
+		uart at 20000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x20000 0x100>;
 			clock-frequency = <2403200>;
@@ -65,7 +65,7 @@
 			reg-io-width = <4>;
 		};
 
-		uart at 0x21000 {
+		uart at 21000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x21000 0x100>;
 			clock-frequency = <2403200>;
@@ -75,7 +75,7 @@
 			reg-io-width = <4>;
 		};
 
-		uart at 0x22000 {
+		uart at 22000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x22000 0x100>;
 			clock-frequency = <2403200>;
@@ -101,7 +101,7 @@
 			interrupt-names = "arc_ps2_irq";
 		};
 
-		mmc at 0x15000 {
+		mmc at 15000 {
 			compatible = "snps,dw-mshc";
 			reg = <0x15000 0x400>;
 			fifo-depth = <1024>;
@@ -117,11 +117,11 @@
 	 * Embedded Vision subsystem UIO mappings; only relevant for EV VDK
 	 *
 	 * This node is intentionally put outside of MB above becase
-	 * it maps areas outside of MB's 0xEz-0xFz.
+	 * it maps areas outside of MB's 0xez-0xfz.
 	 */
-	uio_ev: uio at 0xD0000000 {
+	uio_ev: uio at d0000000 {
 		compatible = "generic-uio";
-		reg = <0xD0000000 0x2000 0xD1000000 0x2000 0x90000000 0x10000000 0xC0000000 0x10000000>;
+		reg = <0xd0000000 0x2000 0xd1000000 0x2000 0x90000000 0x10000000 0xc0000000 0x10000000>;
 		reg-names = "ev_gsa", "ev_ctrl", "ev_shared_mem", "ev_code_mem";
 		interrupt-parent = <&mb_intc>;
 		interrupts = <23>;
-- 
2.16.2
