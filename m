From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 26 Jun 2017 14:47:25 +0300
Subject: [PATCH] ARC: AXS: prepare dts files for enabling PAE40 on axs103
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170626114725.9678-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Enable 64bit adressing, where it needed, to make possible
enabling PAE40 on axs103.

This patch doesn't affect on any functionality.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/boot/dts/axc001.dtsi     | 20 +++++++++-----------
 arch/arc/boot/dts/axc003.dtsi     | 21 ++++++++++-----------
 arch/arc/boot/dts/axc003_idu.dtsi | 21 ++++++++++-----------
 arch/arc/boot/dts/axs10x_mb.dtsi  |  2 +-
 4 files changed, 30 insertions(+), 34 deletions(-)

diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
index 53ce226..a380ffa 100644
--- a/arch/arc/boot/dts/axc001.dtsi
+++ b/arch/arc/boot/dts/axc001.dtsi
@@ -15,15 +15,15 @@
 
 / {
 	compatible = "snps,arc";
-	#address-cells = <1>;
-	#size-cells = <1>;
+	#address-cells = <2>;
+	#size-cells = <2>;
 
 	cpu_card {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		ranges = <0x00000000 0xf0000000 0x10000000>;
+		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
 
 		core_clk: core_clk {
 			#clock-cells = <0>;
@@ -91,23 +91,21 @@
 	mb_intc: dw-apb-ictl at 0xe0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
-		reg = < 0xe0012000 0x200 >;
+		reg = < 0x0 0xe0012000 0x0 0x200 >;
 		interrupt-controller;
 		interrupt-parent = <&core_intc>;
 		interrupts = < 7 >;
 	};
 
 	memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x00000000 0x80000000 0x20000000>;
 		device_type = "memory";
-		reg = <0x80000000 0x1b000000>;	/* (512 - 32) MiB */
+		/* CONFIG_KERNEL_RAM_BASE_ADDRESS needs to match low mem start */
+		reg = <0x0 0x80000000 0x0 0x1b000000>;	/* (512 - 32) MiB */
 	};
 
 	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
+		#address-cells = <2>;
+		#size-cells = <2>;
 		ranges;
 		/*
 		 * We just move frame buffer area to the very end of
@@ -118,7 +116,7 @@
 		 */
 		frame_buffer: frame_buffer at 9e000000 {
 			compatible = "shared-dma-pool";
-			reg = <0x9e000000 0x2000000>;
+			reg = <0x0 0x9e000000 0x0 0x2000000>;
 			no-map;
 		};
 	};
diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index 14df46f..cc9239e 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -14,15 +14,15 @@
 
 / {
 	compatible = "snps,arc";
-	#address-cells = <1>;
-	#size-cells = <1>;
+	#address-cells = <2>;
+	#size-cells = <2>;
 
 	cpu_card {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		ranges = <0x00000000 0xf0000000 0x10000000>;
+		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
 
 		core_clk: core_clk {
 			#clock-cells = <0>;
@@ -94,30 +94,29 @@
 	mb_intc: dw-apb-ictl at 0xe0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
-		reg = < 0xe0012000 0x200 >;
+		reg = < 0x0 0xe0012000 0x0 0x200 >;
 		interrupt-controller;
 		interrupt-parent = <&core_intc>;
 		interrupts = < 24 >;
 	};
 
 	memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x00000000 0x80000000 0x40000000>;
 		device_type = "memory";
-		reg = <0x80000000 0x20000000>;	/* 512MiB */
+		/* CONFIG_KERNEL_RAM_BASE_ADDRESS needs to match low mem start */
+		reg = <0x0 0x80000000 0x0 0x20000000	/* 512 MiB low mem */
+		       0x1 0xc0000000 0x0 0x40000000>;	/* 1 GiB highmem */
 	};
 
 	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
+		#address-cells = <2>;
+		#size-cells = <2>;
 		ranges;
 		/*
 		 * Move frame buffer out of IOC aperture (0x8z-0xAz).
 		 */
 		frame_buffer: frame_buffer at be000000 {
 			compatible = "shared-dma-pool";
-			reg = <0xbe000000 0x2000000>;
+			reg = <0x0 0xbe000000 0x0 0x2000000>;
 			no-map;
 		};
 	};
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 695f9fa..4ebb2170 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -14,15 +14,15 @@
 
 / {
 	compatible = "snps,arc";
-	#address-cells = <1>;
-	#size-cells = <1>;
+	#address-cells = <2>;
+	#size-cells = <2>;
 
 	cpu_card {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		ranges = <0x00000000 0xf0000000 0x10000000>;
+		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
 
 		core_clk: core_clk {
 			#clock-cells = <0>;
@@ -100,30 +100,29 @@
 	mb_intc: dw-apb-ictl at 0xe0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
-		reg = < 0xe0012000 0x200 >;
+		reg = < 0x0 0xe0012000 0x0 0x200 >;
 		interrupt-controller;
 		interrupt-parent = <&idu_intc>;
 		interrupts = <0>;
 	};
 
 	memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x00000000 0x80000000 0x40000000>;
 		device_type = "memory";
-		reg = <0x80000000 0x20000000>;	/* 512MiB */
+		/* CONFIG_KERNEL_RAM_BASE_ADDRESS needs to match low mem start */
+		reg = <0x0 0x80000000 0x0 0x20000000	/* 512 MiB low mem */
+		       0x1 0xc0000000 0x0 0x40000000>;	/* 1 GiB highmem */
 	};
 
 	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
+		#address-cells = <2>;
+		#size-cells = <2>;
 		ranges;
 		/*
 		 * Move frame buffer out of IOC aperture (0x8z-0xAz).
 		 */
 		frame_buffer: frame_buffer at be000000 {
 			compatible = "shared-dma-pool";
-			reg = <0xbe000000 0x2000000>;
+			reg = <0x0 0xbe000000 0x0 0x2000000>;
 			no-map;
 		};
 	};
diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 41cfb29..0ff7e07 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -13,7 +13,7 @@
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x00000000 0xe0000000 0x10000000>;
+		ranges = <0x00000000 0x0 0xe0000000 0x10000000>;
 		interrupt-parent = <&mb_intc>;
 
 		i2sclk: i2sclk at 100a0 {
-- 
2.9.3
