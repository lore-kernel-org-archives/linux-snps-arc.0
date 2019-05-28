From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 28 May 2019 12:40:52 +0300
Subject: [PATCH] ARC: [plat-hsdk]: enable creg-gpio controller
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190528094052.2393-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

HSDK SOC has CREG GPIO controller which can be used to control
SPI chip select lines.
Enable it in preparation of enabling SPI peripherals.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/boot/dts/hsdk.dts      | 8 ++++++++
 arch/arc/configs/hsdk_defconfig | 1 +
 2 files changed, 9 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 7425bb0f2d1b..83e163e51b34 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -237,6 +237,14 @@
 			dma-coherent;
 		};
 
+		creg_gpio: gpio at 14b0 {
+			compatible = "snps,creg-gpio-hsdk";
+			reg = <0x14b0 0x4>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <2>;
+		};
+
 		gpio: gpio at 3000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3000 0x20>;
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 0e5fd29ed238..0c4411f50948 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -49,6 +49,7 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_SNPS_CREG=y
 # CONFIG_HWMON is not set
 CONFIG_DRM=y
 # CONFIG_DRM_FBDEV_EMULATION is not set
-- 
2.21.0
