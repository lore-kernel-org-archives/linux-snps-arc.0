From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon,  6 Jun 2016 13:56:24 +0300
Subject: [PATCH 2/3] ARCv2: [vdk] Enable ARC PGU on HS38 VDK
In-Reply-To: <1465210585-13284-1-git-send-email-abrodkin@synopsys.com>
References: <1465210585-13284-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1465210585-13284-3-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

With required ARC PGU updates that allow it to be used on simulation
platforms we may finally utilize ARC PGU in HS38 VDK with modern
Linux kernels.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi    | 13 +++++++++----
 arch/arc/boot/dts/vdk_hs38_smp.dts      |  2 +-
 arch/arc/configs/vdk_hs38_smp_defconfig |  7 ++-----
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
index 45cd665..99498a4 100644
--- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
@@ -23,6 +23,11 @@
 				#clock-cells = <0>;
 			};
 
+			pguclk: pguclk {
+				#clock-cells = <0>;
+				compatible = "fixed-clock";
+				clock-frequency = <25175000>;
+			};
 		};
 
 		ethernet at 0x18000 {
@@ -75,11 +80,11 @@
 		};
 
 /* PGU output directly sent to virtual LCD screen; hdmi controller not modelled */
-		pgu at 0x17000 {
-			compatible = "snps,arcpgufb";
+		pgu at 17000 {
+			compatible = "snps,arcpgu";
 			reg = <0x17000 0x400>;
-			clock-frequency = <51000000>; /* PGU'clock is initated in init function */
-			/* interrupts = <5>;   PGU interrupts not used, this vector is used for ps2 below */
+			clocks = <&pguclk>;
+			clock-names = "pxlclk";
 		};
 
 /* VDK has additional ps2 keyboard/mouse interface integrated in LCD screen model */
diff --git a/arch/arc/boot/dts/vdk_hs38_smp.dts b/arch/arc/boot/dts/vdk_hs38_smp.dts
index 031a5bc..2ba60c39 100644
--- a/arch/arc/boot/dts/vdk_hs38_smp.dts
+++ b/arch/arc/boot/dts/vdk_hs38_smp.dts
@@ -16,6 +16,6 @@
 	compatible = "snps,axs103";
 
 	chosen {
-		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 consoleblank=0";
+		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 consoleblank=0 video=640x480-24";
 	};
 };
diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
index 52ec315..969b206 100644
--- a/arch/arc/configs/vdk_hs38_smp_defconfig
+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
@@ -63,12 +63,9 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-CONFIG_FB=y
-CONFIG_ARCPGU_RGB888=y
-CONFIG_ARCPGU_DISPTYPE=0
-# CONFIG_VGA_CONSOLE is not set
+CONFIG_DRM=y
+CONFIG_DRM_ARCPGU=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-- 
2.5.5
