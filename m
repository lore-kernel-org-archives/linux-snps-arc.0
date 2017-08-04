From: alex.g@adaptrum.com (Alexandru Gagniuc)
Date: Fri,  4 Aug 2017 13:03:53 -0700
Subject: [PATCH v2 2/2] ARC: DTS: Add device-tree for Anarion-based
 development board
In-Reply-To: <20170804200353.15653-1-alex.g@adaptrum.com>
References: <20170728220707.13960-3-alex.g@adaptrum.com>
 <20170804200353.15653-1-alex.g@adaptrum.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170804200353.15653-2-alex.g@adaptrum.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Alexandru Gagniuc <alex.g at adaptrum.com>
---
Changes since v1:
 * Updated CPU core clock to 24 MHz to match HW changes.

 arch/arc/boot/dts/adaptrum_anarion.dtsi     | 108 ++++++++++++++++++++++++++++
 arch/arc/boot/dts/adaptrum_anarion_fpga.dts |  49 +++++++++++++
 2 files changed, 157 insertions(+)
 create mode 100644 arch/arc/boot/dts/adaptrum_anarion.dtsi
 create mode 100644 arch/arc/boot/dts/adaptrum_anarion_fpga.dts

diff --git a/arch/arc/boot/dts/adaptrum_anarion.dtsi b/arch/arc/boot/dts/adaptrum_anarion.dtsi
new file mode 100644
index 0000000..31ed204
--- /dev/null
+++ b/arch/arc/boot/dts/adaptrum_anarion.dtsi
@@ -0,0 +1,108 @@
+/*
+ * (C) Copyright 2017 Adaptrum, Inc.
+ * Written by Alexandru Gagniuc <alex.g at adaptrum.com> for Adaptrum, Inc.
+ * Licensed under the GPLv2 or (at your option) any later version
+ */
+
+/* This skeleton is based on the ARC700 CPU */
+#include "skeleton.dtsi"
+
+/ {
+	compatible = "adaptrum,anarion";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	soc {
+		compatible = "simple-bus";
+		device_type = "soc";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		interrupt-parent = <&core_intc>;
+
+		core_intc: interrupt-controller {
+			compatible = "snps,arc700-intc";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		uart0: serial at f2202100 {
+			compatible = "ns16550";
+			reg = <0xf2202100 0x20>;
+			interrupts = <8>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <192000000>;
+			status = "disabled";
+		};
+
+		uart1: serial at f2202200 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0xf2202200 0x20>;
+			interrupts = <8>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <192000000>;
+			status = "disabled";
+		};
+
+		uart2: serial at f2202300 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0xf2202300 0x20>;
+			interrupts = <8>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <192000000>;
+			status = "disabled";
+		};
+
+		uart3: serial at f2202400 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0xf2202400 0x20>;
+			interrupts = <8>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <192000000>;
+			status = "disabled";
+		};
+
+		qspi: qspi at f200f000 {
+			compatible = "adaptrum,anarion-qspi";
+			reg = <0xf200f000 0x1000>,
+			      <0x20000000 0x08000000>;
+
+			interrupts = <10>;
+			status = "disabled";
+		};
+
+		gmac0: ethernet at f2010000 {
+			compatible = "adaptrum,anarion-gmac", "snps,dwmac";
+			reg = <0xf2010000 0x4000>;
+
+			interrupt-parent = <&core_intc>;
+			interrupts = <20>;
+			interrupt-names = "macirq";
+
+			clocks = <&core_clk>;
+			clock-names = "stmmaceth";
+
+			snps,pbl = <32>;
+			status = "disabled";
+		};
+
+		gmac1: ethernet at f2014000 {
+			compatible = "adaptrum,anarion-gmac", "snps,dwmac";
+			reg = <0xf2014000 0x4000>, <0xf2018100 8>;
+
+			interrupt-parent = <&core_intc>;
+			interrupts = <21>;
+			interrupt-names = "macirq";
+
+			clocks = <&core_clk>;
+			clock-names = "stmmaceth";
+
+			snps,pbl = <32>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arc/boot/dts/adaptrum_anarion_fpga.dts b/arch/arc/boot/dts/adaptrum_anarion_fpga.dts
new file mode 100644
index 0000000..02b838f
--- /dev/null
+++ b/arch/arc/boot/dts/adaptrum_anarion_fpga.dts
@@ -0,0 +1,49 @@
+/*
+ * (C) Copyright 2017 Adaptrum, Inc.
+ * Written by Alexandru Gagniuc <alex.g at adaptrum.com> for Adaptrum, Inc.
+ * Licensed under the GPLv2 or (at your option) any later version
+ */
+
+/dts-v1/;
+
+#include "adaptrum_anarion.dtsi"
+
+/ {
+	model = "adaptrum,anarion";
+	compatible = "adaptrum,anarion";
+
+	chosen {
+		bootargs = "earlycon console=ttyS0,115200n8";
+		stdout-path = "serial0:115200n8";
+	};
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	core_clk: core_clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&qspi {
+	status = "okay";
+	flash0: w25q128fvn at 0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "winbond,w25q128", "jedec,spi-nor";
+		spi-max-frequency = <70000000>;
+		m25p,fast-read;
+	};
+};
+
+&gmac1 {
+	phy-mode = "rgmii";
+	status = "okay";
+};
-- 
2.9.3
