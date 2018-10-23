From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 23 Oct 2018 15:09:19 +0300
Subject: [PATCH] ARC: [plat-hsdk] Enable DW APB GPIO support
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181023120919.11627-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Enable GPIO support on HSDK. HSDK SoC includes Synopsys
DesignWare DW_apb_gpio IP with 24 GPIOs mapped onto port A.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/boot/dts/hsdk.dts      | 15 +++++++++++++++
 arch/arc/configs/hsdk_defconfig |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index ef149f59929a..43f17b51ee89 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -222,6 +222,21 @@
 			bus-width = <4>;
 			dma-coherent;
 		};
+
+		gpio: gpio at 3000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x3000 0x20>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gpio_port_a: gpio-controller at 0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <24>;
+				reg = <0>;
+			};
+		};
 	};
 
 	memory at 80000000 {
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 1dec2b4bc5e6..eca10b8baea5 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -45,6 +45,9 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_DWAPB=y
 # CONFIG_HWMON is not set
 CONFIG_DRM=y
 # CONFIG_DRM_FBDEV_EMULATION is not set
-- 
2.14.5
