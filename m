From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Sat,  8 Dec 2018 10:01:01 +0300
Subject: [PATCH] ARC: Remove 0x prefix from unit-address of node names
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181208070101.6117-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Done automatically with help of:
----------------------->8------------------------
sed -i 's/@0x/@/g' arch/arc/boot/dts/*.dts*
----------------------->8------------------------

Inspired by [1] and the like.

[1] http://kisskb.ellerman.id.au/kisskb/buildresult/13612017/

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Rob Herring <robh+dt at kernel.org>

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/boot/dts/abilis_tb10x.dtsi   |  4 ++--
 arch/arc/boot/dts/axc001.dtsi         |  6 +++---
 arch/arc/boot/dts/axc003.dtsi         | 14 +++++++-------
 arch/arc/boot/dts/axc003_idu.dtsi     | 14 +++++++-------
 arch/arc/boot/dts/axs10x_mb.dtsi      | 22 +++++++++++-----------
 arch/arc/boot/dts/vdk_axc003.dtsi     |  4 ++--
 arch/arc/boot/dts/vdk_axc003_idu.dtsi |  4 ++--
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi  | 14 +++++++-------
 8 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/arch/arc/boot/dts/abilis_tb10x.dtsi b/arch/arc/boot/dts/abilis_tb10x.dtsi
index 3121536b25a3..77ac1368a65b 100644
--- a/arch/arc/boot/dts/abilis_tb10x.dtsi
+++ b/arch/arc/boot/dts/abilis_tb10x.dtsi
@@ -178,7 +178,7 @@
 			clocks = <&ahb_clk>;
 		};
 
-		spi0: spi at 0xFE010000 {
+		spi0: spi at FE010000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			cell-index = <0>;
@@ -189,7 +189,7 @@
 			interrupts = <26 8>;
 			clocks = <&ahb_clk>;
 		};
-		spi1: spi at 0xFE011000 {
+		spi1: spi at FE011000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			cell-index = <1>;
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
index d75d65ddf8e3..ffa208a57a0a 100644
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
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index a05bb737ea63..ad795748ac63 100644
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
index 48bb4b4cd234..ad18daa7b307 100644
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
@@ -119,7 +119,7 @@
 	 * This node is intentionally put outside of MB above becase
 	 * it maps areas outside of MB's 0xEz-0xFz.
 	 */
-	uio_ev: uio at 0xD0000000 {
+	uio_ev: uio at D0000000 {
 		compatible = "generic-uio";
 		reg = <0xD0000000 0x2000 0xD1000000 0x2000 0x90000000 0x10000000 0xC0000000 0x10000000>;
 		reg-names = "ev_gsa", "ev_ctrl", "ev_shared_mem", "ev_code_mem";
-- 
2.16.2
