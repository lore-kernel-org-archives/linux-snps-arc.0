From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 25 May 2016 15:11:29 +0300
Subject: [PATCH] arc: Get rid of root core-frequency property
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464178289-25759-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Now when we switched to usage of real clk devices for CPU core
frequency those root properties make no sense any longer.
Se we're just getting rid of them here to not confuse readers of
our .dts files.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Christian Ruppert <christian.ruppert at alitech.com>
Cc: Noam Camus <noamca at mellanox.com>
---
 arch/arc/boot/dts/abilis_tb100.dtsi    | 2 --
 arch/arc/boot/dts/abilis_tb101.dtsi    | 2 --
 arch/arc/boot/dts/axc001.dtsi          | 1 -
 arch/arc/boot/dts/axc003.dtsi          | 1 -
 arch/arc/boot/dts/axc003_idu.dtsi      | 1 -
 arch/arc/boot/dts/eznps.dts            | 1 -
 arch/arc/boot/dts/nsim_700.dts         | 1 -
 arch/arc/boot/dts/nsimosci.dts         | 1 -
 arch/arc/boot/dts/nsimosci_hs.dts      | 1 -
 arch/arc/boot/dts/nsimosci_hs_idu.dts  | 1 -
 arch/arc/boot/dts/skeleton.dtsi        | 1 -
 arch/arc/boot/dts/skeleton_hs.dtsi     | 1 -
 arch/arc/boot/dts/skeleton_hs_idu.dtsi | 1 -
 arch/arc/boot/dts/vdk_axc003.dtsi      | 1 -
 arch/arc/boot/dts/vdk_axc003_idu.dtsi  | 1 -
 15 files changed, 17 deletions(-)

diff --git a/arch/arc/boot/dts/abilis_tb100.dtsi b/arch/arc/boot/dts/abilis_tb100.dtsi
index 3942634..02410b2 100644
--- a/arch/arc/boot/dts/abilis_tb100.dtsi
+++ b/arch/arc/boot/dts/abilis_tb100.dtsi
@@ -23,8 +23,6 @@
 
 
 / {
-	clock-frequency		= <500000000>;	/* 500 MHZ */
-
 	soc100 {
 		bus-frequency	= <166666666>;
 
diff --git a/arch/arc/boot/dts/abilis_tb101.dtsi b/arch/arc/boot/dts/abilis_tb101.dtsi
index b046722..f9e7686 100644
--- a/arch/arc/boot/dts/abilis_tb101.dtsi
+++ b/arch/arc/boot/dts/abilis_tb101.dtsi
@@ -23,8 +23,6 @@
 
 
 / {
-	clock-frequency		= <500000000>;	/* 500 MHZ */
-
 	soc100 {
 		bus-frequency	= <166666666>;
 
diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
index 3e02f15..6ae2c47 100644
--- a/arch/arc/boot/dts/axc001.dtsi
+++ b/arch/arc/boot/dts/axc001.dtsi
@@ -15,7 +15,6 @@
 
 / {
 	compatible = "snps,arc";
-	clock-frequency = <750000000>;	/* 750 MHZ */
 	#address-cells = <1>;
 	#size-cells = <1>;
 
diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index 378e455..14df46f 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -14,7 +14,6 @@
 
 / {
 	compatible = "snps,arc";
-	clock-frequency = <90000000>;
 	#address-cells = <1>;
 	#size-cells = <1>;
 
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 64c94b2..3d6cfa3 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -14,7 +14,6 @@
 
 / {
 	compatible = "snps,arc";
-	clock-frequency = <90000000>;
 	#address-cells = <1>;
 	#size-cells = <1>;
 
diff --git a/arch/arc/boot/dts/eznps.dts b/arch/arc/boot/dts/eznps.dts
index b89f6c3..1e0d225 100644
--- a/arch/arc/boot/dts/eznps.dts
+++ b/arch/arc/boot/dts/eznps.dts
@@ -18,7 +18,6 @@
 
 / {
 	compatible = "ezchip,arc-nps";
-	clock-frequency = <83333333>;	/* 83.333333 MHZ */
 	#address-cells = <1>;
 	#size-cells = <1>;
 	interrupt-parent = <&intc>;
diff --git a/arch/arc/boot/dts/nsim_700.dts b/arch/arc/boot/dts/nsim_700.dts
index 5d5e373..6397051 100644
--- a/arch/arc/boot/dts/nsim_700.dts
+++ b/arch/arc/boot/dts/nsim_700.dts
@@ -11,7 +11,6 @@
 
 / {
 	compatible = "snps,nsim";
-	clock-frequency = <80000000>;	/* 80 MHZ */
 	#address-cells = <1>;
 	#size-cells = <1>;
 	interrupt-parent = <&core_intc>;
diff --git a/arch/arc/boot/dts/nsimosci.dts b/arch/arc/boot/dts/nsimosci.dts
index b5b060a..763d66c 100644
--- a/arch/arc/boot/dts/nsimosci.dts
+++ b/arch/arc/boot/dts/nsimosci.dts
@@ -11,7 +11,6 @@
 
 / {
 	compatible = "snps,nsimosci";
-	clock-frequency = <20000000>;	/* 20 MHZ */
 	#address-cells = <1>;
 	#size-cells = <1>;
 	interrupt-parent = <&core_intc>;
diff --git a/arch/arc/boot/dts/nsimosci_hs.dts b/arch/arc/boot/dts/nsimosci_hs.dts
index 325e730..4eb97c5 100644
--- a/arch/arc/boot/dts/nsimosci_hs.dts
+++ b/arch/arc/boot/dts/nsimosci_hs.dts
@@ -11,7 +11,6 @@
 
 / {
 	compatible = "snps,nsimosci_hs";
-	clock-frequency = <20000000>;	/* 20 MHZ */
 	#address-cells = <1>;
 	#size-cells = <1>;
 	interrupt-parent = <&core_intc>;
diff --git a/arch/arc/boot/dts/nsimosci_hs_idu.dts b/arch/arc/boot/dts/nsimosci_hs_idu.dts
index ee03d71..853f897 100644
--- a/arch/arc/boot/dts/nsimosci_hs_idu.dts
+++ b/arch/arc/boot/dts/nsimosci_hs_idu.dts
@@ -11,7 +11,6 @@
 
 / {
 	compatible = "snps,nsimosci_hs";
-	clock-frequency = <5000000>;	/* 5 MHZ */
 	#address-cells = <1>;
 	#size-cells = <1>;
 	interrupt-parent = <&core_intc>;
diff --git a/arch/arc/boot/dts/skeleton.dtsi b/arch/arc/boot/dts/skeleton.dtsi
index 3a10cc6..65808fe 100644
--- a/arch/arc/boot/dts/skeleton.dtsi
+++ b/arch/arc/boot/dts/skeleton.dtsi
@@ -13,7 +13,6 @@
 
 / {
 	compatible = "snps,arc";
-	clock-frequency = <80000000>;	/* 80 MHZ */
 	#address-cells = <1>;
 	#size-cells = <1>;
 	chosen { };
diff --git a/arch/arc/boot/dts/skeleton_hs.dtsi b/arch/arc/boot/dts/skeleton_hs.dtsi
index 71fd308..2dfe803 100644
--- a/arch/arc/boot/dts/skeleton_hs.dtsi
+++ b/arch/arc/boot/dts/skeleton_hs.dtsi
@@ -8,7 +8,6 @@
 
 / {
 	compatible = "snps,arc";
-	clock-frequency = <80000000>;	/* 80 MHZ */
 	#address-cells = <1>;
 	#size-cells = <1>;
 	chosen { };
diff --git a/arch/arc/boot/dts/skeleton_hs_idu.dtsi b/arch/arc/boot/dts/skeleton_hs_idu.dtsi
index d1cb25a..4c11079 100644
--- a/arch/arc/boot/dts/skeleton_hs_idu.dtsi
+++ b/arch/arc/boot/dts/skeleton_hs_idu.dtsi
@@ -8,7 +8,6 @@
 
 / {
 	compatible = "snps,arc";
-	clock-frequency = <80000000>;	/* 80 MHZ */
 	#address-cells = <1>;
 	#size-cells = <1>;
 	chosen { };
diff --git a/arch/arc/boot/dts/vdk_axc003.dtsi b/arch/arc/boot/dts/vdk_axc003.dtsi
index ad4ee43..0fd6ba9 100644
--- a/arch/arc/boot/dts/vdk_axc003.dtsi
+++ b/arch/arc/boot/dts/vdk_axc003.dtsi
@@ -14,7 +14,6 @@
 
 / {
 	compatible = "snps,arc";
-	clock-frequency = <50000000>;
 	#address-cells = <1>;
 	#size-cells = <1>;
 
diff --git a/arch/arc/boot/dts/vdk_axc003_idu.dtsi b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
index a3cb626..82214cd 100644
--- a/arch/arc/boot/dts/vdk_axc003_idu.dtsi
+++ b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
@@ -15,7 +15,6 @@
 
 / {
 	compatible = "snps,arc";
-	clock-frequency = <50000000>;
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-- 
2.5.5
