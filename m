From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 18 Jan 2018 16:48:47 +0300
Subject: [PATCH] ARC: Enable fatal signals on boot for dev platforms
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180118134847.42262-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

It's very convenient to have fatal signals enabled on developemnt
platform as this allows to catch problems that happen early in
user-space (like crashing init or dynamic loader).

Otherwise we may either enable it later from alive taregt console
by "echo 1 > /proc/sys/kernel/print-fatal-signals" but:
 1. We might be unfortunate enough to not reach working console
 2. Forget to enable fatal signals and miss something interesting

Given we're talking about development platforms here it shouldn't
be a problem if a bit more data gets printed to debug console.

Moreover this makes behavior of all our dev platforms predictable
as today some platforms already have it enabled and some don't -
which is way too inconvenient.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/boot/dts/axs101.dts          | 2 +-
 arch/arc/boot/dts/haps_hs_idu.dts     | 2 +-
 arch/arc/boot/dts/nsim_700.dts        | 2 +-
 arch/arc/boot/dts/nsim_hs.dts         | 2 +-
 arch/arc/boot/dts/nsim_hs_idu.dts     | 2 +-
 arch/arc/boot/dts/nsimosci.dts        | 2 +-
 arch/arc/boot/dts/nsimosci_hs.dts     | 2 +-
 arch/arc/boot/dts/nsimosci_hs_idu.dts | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arc/boot/dts/axs101.dts b/arch/arc/boot/dts/axs101.dts
index 70aec7d6ca60..626b694c7be7 100644
--- a/arch/arc/boot/dts/axs101.dts
+++ b/arch/arc/boot/dts/axs101.dts
@@ -17,6 +17,6 @@
 	compatible = "snps,axs101", "snps,arc-sdp";
 
 	chosen {
-		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 consoleblank=0 video=1280x720 at 60";
+		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 consoleblank=0 video=1280x720 at 60 print-fatal-signals=1";
 	};
 };
diff --git a/arch/arc/boot/dts/haps_hs_idu.dts b/arch/arc/boot/dts/haps_hs_idu.dts
index 215cddd0b63b..0c603308aeb3 100644
--- a/arch/arc/boot/dts/haps_hs_idu.dts
+++ b/arch/arc/boot/dts/haps_hs_idu.dts
@@ -22,7 +22,7 @@
 	};
 
 	chosen {
-		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=ttyS0,115200n8 debug";
+		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1";
 	};
 
 	aliases {
diff --git a/arch/arc/boot/dts/nsim_700.dts b/arch/arc/boot/dts/nsim_700.dts
index 5ee96b067c08..ff2f2c70c545 100644
--- a/arch/arc/boot/dts/nsim_700.dts
+++ b/arch/arc/boot/dts/nsim_700.dts
@@ -17,7 +17,7 @@
 	interrupt-parent = <&core_intc>;
 
 	chosen {
-		bootargs = "earlycon=arc_uart,mmio32,0xc0fc1000,115200n8 console=ttyARC0,115200n8";
+		bootargs = "earlycon=arc_uart,mmio32,0xc0fc1000,115200n8 console=ttyARC0,115200n8 print-fatal-signals=1";
 	};
 
 	aliases {
diff --git a/arch/arc/boot/dts/nsim_hs.dts b/arch/arc/boot/dts/nsim_hs.dts
index 8d787b251f73..8e2489b16b0a 100644
--- a/arch/arc/boot/dts/nsim_hs.dts
+++ b/arch/arc/boot/dts/nsim_hs.dts
@@ -24,7 +24,7 @@
 	};
 
 	chosen {
-		bootargs = "earlycon=arc_uart,mmio32,0xc0fc1000,115200n8 console=ttyARC0,115200n8";
+		bootargs = "earlycon=arc_uart,mmio32,0xc0fc1000,115200n8 console=ttyARC0,115200n8 print-fatal-signals=1";
 	};
 
 	aliases {
diff --git a/arch/arc/boot/dts/nsim_hs_idu.dts b/arch/arc/boot/dts/nsim_hs_idu.dts
index 4f98ebf71fd8..ed12f494721d 100644
--- a/arch/arc/boot/dts/nsim_hs_idu.dts
+++ b/arch/arc/boot/dts/nsim_hs_idu.dts
@@ -15,7 +15,7 @@
 	interrupt-parent = <&core_intc>;
 
 	chosen {
-		bootargs = "earlycon=arc_uart,mmio32,0xc0fc1000,115200n8 console=ttyARC0,115200n8";
+		bootargs = "earlycon=arc_uart,mmio32,0xc0fc1000,115200n8 console=ttyARC0,115200n8 print-fatal-signals=1";
 	};
 
 	aliases {
diff --git a/arch/arc/boot/dts/nsimosci.dts b/arch/arc/boot/dts/nsimosci.dts
index 3c391ba565ed..7842e5eb4ab5 100644
--- a/arch/arc/boot/dts/nsimosci.dts
+++ b/arch/arc/boot/dts/nsimosci.dts
@@ -20,7 +20,7 @@
 		/* this is for console on PGU */
 		/* bootargs = "console=tty0 consoleblank=0"; */
 		/* this is for console on serial */
-		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblank=0 debug video=640x480-24";
+		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblank=0 debug video=640x480-24 print-fatal-signals=1";
 	};
 
 	aliases {
diff --git a/arch/arc/boot/dts/nsimosci_hs.dts b/arch/arc/boot/dts/nsimosci_hs.dts
index 14a727cbf4c9..b8838cf2b4ec 100644
--- a/arch/arc/boot/dts/nsimosci_hs.dts
+++ b/arch/arc/boot/dts/nsimosci_hs.dts
@@ -20,7 +20,7 @@
 		/* this is for console on PGU */
 		/* bootargs = "console=tty0 consoleblank=0"; */
 		/* this is for console on serial */
-		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblank=0 debug video=640x480-24";
+		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblank=0 debug video=640x480-24 print-fatal-signals=1";
 	};
 
 	aliases {
diff --git a/arch/arc/boot/dts/nsimosci_hs_idu.dts b/arch/arc/boot/dts/nsimosci_hs_idu.dts
index 5052917d4a99..72a2c723f1f7 100644
--- a/arch/arc/boot/dts/nsimosci_hs_idu.dts
+++ b/arch/arc/boot/dts/nsimosci_hs_idu.dts
@@ -18,7 +18,7 @@
 
 	chosen {
 		/* this is for console on serial */
-		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblan=0 debug video=640x480-24";
+		bootargs = "earlycon=uart8250,mmio32,0xf0000000,115200n8 console=tty0 console=ttyS0,115200n8 consoleblan=0 debug video=640x480-24 print-fatal-signals=1";
 	};
 
 	aliases {
-- 
2.11.0
