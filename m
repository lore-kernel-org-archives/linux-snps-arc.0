From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 10 Jun 2016 17:29:13 +0300
Subject: [PATCH 3/3] ARC: [nsimosci] Enable ARC PGU on nSIM OSCI virtual
 platforms
In-Reply-To: <1465568953-21893-1-git-send-email-abrodkin@synopsys.com>
References: <1465568953-21893-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1465568953-21893-4-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

With required ARC PGU updates that allow it to be used on simulation
platforms we may finally utilize ARC PGU in nSIM OSCI virtual platforms
with modern Linux kernels.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---

No changes in v2.

 arch/arc/boot/dts/nsimosci.dts             | 14 +++++++++++---
 arch/arc/boot/dts/nsimosci_hs.dts          | 14 +++++++++++---
 arch/arc/boot/dts/nsimosci_hs_idu.dts      | 14 +++++++++++---
 arch/arc/configs/nsimosci_defconfig        |  3 ++-
 arch/arc/configs/nsimosci_hs_defconfig     |  3 ++-
 arch/arc/configs/nsimosci_hs_smp_defconfig |  3 ++-
 6 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/arch/arc/boot/dts/nsimosci.dts b/arch/arc/boot/dts/nsimosci.dts
index b5b060a..37c416d 100644
--- a/arch/arc/boot/dts/nsimosci.dts
+++ b/arch/arc/boot/dts/nsimosci.dts
@@ -20,7 +20,7 @@
 		/* this is for console on PGU */
 		/* bootargs = "console=tty0 consoleblank=0"; */
 		/* this is for console on serial */
-		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblank=0 debug";
+		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblank=0 debug video=640x480-24";
 	};
 
 	aliases {
@@ -58,9 +58,17 @@
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
index 325e730..f2a22c4 100644
--- a/arch/arc/boot/dts/nsimosci_hs.dts
+++ b/arch/arc/boot/dts/nsimosci_hs.dts
@@ -20,7 +20,7 @@
 		/* this is for console on PGU */
 		/* bootargs = "console=tty0 consoleblank=0"; */
 		/* this is for console on serial */
-		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblank=0 debug";
+		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblank=0 debug video=640x480-24";
 	};
 
 	aliases {
@@ -58,9 +58,17 @@
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
index ee03d71..34457a5 100644
--- a/arch/arc/boot/dts/nsimosci_hs_idu.dts
+++ b/arch/arc/boot/dts/nsimosci_hs_idu.dts
@@ -18,7 +18,7 @@
 
 	chosen {
 		/* this is for console on serial */
-		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblan=0 debug";
+		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblan=0 debug video=640x480-24";
 	};
 
 	aliases {
@@ -77,9 +77,17 @@
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
