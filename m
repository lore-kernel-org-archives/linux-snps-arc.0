From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon,  6 Jun 2016 13:56:25 +0300
Subject: [PATCH 3/3] ARC: [nsimosci] Enable ARC PGU on nSIM OSCI virtual
 platforms
In-Reply-To: <1465210585-13284-1-git-send-email-abrodkin@synopsys.com>
References: <1465210585-13284-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1465210585-13284-4-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

With required ARC PGU updates that allow it to be used on simulation
platforms we may finally utilize ARC PGU in nSIM OSCI virtual platforms
with modern Linux kernels.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/boot/dts/nsimosci.dts             | 14 +++++++++++---
 arch/arc/boot/dts/nsimosci_hs.dts          | 14 +++++++++++---
 arch/arc/boot/dts/nsimosci_hs_idu.dts      | 14 +++++++++++---
 arch/arc/configs/nsimosci_defconfig        |  3 ++-
 arch/arc/configs/nsimosci_hs_defconfig     |  3 ++-
 arch/arc/configs/nsimosci_hs_smp_defconfig |  3 ++-
 6 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/arch/arc/boot/dts/nsimosci.dts b/arch/arc/boot/dts/nsimosci.dts
index 763d66c..e659a34 100644
--- a/arch/arc/boot/dts/nsimosci.dts
+++ b/arch/arc/boot/dts/nsimosci.dts
@@ -19,7 +19,7 @@
 		/* this is for console on PGU */
 		/* bootargs = "console=tty0 consoleblank=0"; */
 		/* this is for console on serial */
-		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblank=0 debug";
+		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblank=0 debug video=640x480-24";
 	};
 
 	aliases {
@@ -57,9 +57,17 @@
 			no-loopback-test = <1>;
 		};
 
-		pgu0: pgu at f9000000 {
-			compatible = "snps,arcpgufb";
+		pguclk: pguclk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <25175000>;
+		};
+
+		pgu at f9000000 {
+			compatible = "snps,arcpgu";
 			reg = <0xf9000000 0x400>;
+			clocks = <&pguclk>;
+			clock-names = "pxlclk";
 		};
 
 		ps2: ps2 at f9001000 {
diff --git a/arch/arc/boot/dts/nsimosci_hs.dts b/arch/arc/boot/dts/nsimosci_hs.dts
index 4eb97c5..16ce5d6 100644
--- a/arch/arc/boot/dts/nsimosci_hs.dts
+++ b/arch/arc/boot/dts/nsimosci_hs.dts
@@ -19,7 +19,7 @@
 		/* this is for console on PGU */
 		/* bootargs = "console=tty0 consoleblank=0"; */
 		/* this is for console on serial */
-		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblank=0 debug";
+		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblank=0 debug video=640x480-24";
 	};
 
 	aliases {
@@ -57,9 +57,17 @@
 			no-loopback-test = <1>;
 		};
 
-		pgu0: pgu at f9000000 {
-			compatible = "snps,arcpgufb";
+		pguclk: pguclk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <25175000>;
+		};
+
+		pgu at f9000000 {
+			compatible = "snps,arcpgu";
 			reg = <0xf9000000 0x400>;
+			clocks = <&pguclk>;
+			clock-names = "pxlclk";
 		};
 
 		ps2: ps2 at f9001000 {
diff --git a/arch/arc/boot/dts/nsimosci_hs_idu.dts b/arch/arc/boot/dts/nsimosci_hs_idu.dts
index 853f897..ce8dfbc 100644
--- a/arch/arc/boot/dts/nsimosci_hs_idu.dts
+++ b/arch/arc/boot/dts/nsimosci_hs_idu.dts
@@ -17,7 +17,7 @@
 
 	chosen {
 		/* this is for console on serial */
-		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblan=0 debug";
+		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblan=0 debug video=640x480-24";
 	};
 
 	aliases {
@@ -76,9 +76,17 @@
 			no-loopback-test = <1>;
 		};
 
-		pgu0: pgu at f9000000 {
-			compatible = "snps,arcpgufb";
+		pguclk: pguclk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <25175000>;
+		};
+
+		pgu at f9000000 {
+			compatible = "snps,arcpgu";
 			reg = <0xf9000000 0x400>;
+			clocks = <&pguclk>;
+			clock-names = "pxlclk";
 		};
 
 		ps2: ps2 at f9001000 {
diff --git a/arch/arc/configs/nsimosci_defconfig b/arch/arc/configs/nsimosci_defconfig
index 42bafa5..98cf209 100644
--- a/arch/arc/configs/nsimosci_defconfig
+++ b/arch/arc/configs/nsimosci_defconfig
@@ -58,7 +58,8 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=1
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-CONFIG_FB=y
+CONFIG_DRM=y
+CONFIG_DRM_ARCPGU=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_HID is not set
diff --git a/arch/arc/configs/nsimosci_hs_defconfig b/arch/arc/configs/nsimosci_hs_defconfig
index 4bb60c1..ddf8b96 100644
--- a/arch/arc/configs/nsimosci_hs_defconfig
+++ b/arch/arc/configs/nsimosci_hs_defconfig
@@ -57,7 +57,8 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=1
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-CONFIG_FB=y
+CONFIG_DRM=y
+CONFIG_DRM_ARCPGU=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_HID is not set
diff --git a/arch/arc/configs/nsimosci_hs_smp_defconfig b/arch/arc/configs/nsimosci_hs_smp_defconfig
index 7e88f4c..ceb9074 100644
--- a/arch/arc/configs/nsimosci_hs_smp_defconfig
+++ b/arch/arc/configs/nsimosci_hs_smp_defconfig
@@ -70,7 +70,8 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-CONFIG_FB=y
+CONFIG_DRM=y
+CONFIG_DRM_ARCPGU=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_HID is not set
-- 
2.5.5
