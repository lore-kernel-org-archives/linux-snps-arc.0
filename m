From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 15 Aug 2016 15:56:16 +0300
Subject: [PATCH] arc: Add "model" properly in device tree description of all
 boards
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471265776-29495-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As it was discussed quite some time ago (see
https://lkml.org/lkml/2015/11/5/862) it's a good practice to add
"model" property in .dts. Moreover as per ePAPR "model" property is
required and should look like "manufacturer,model" so we do here.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Jonas Gorski <jonas.gorski at gmail.com>
Cc: Arnd Bergmann <arnd at arndb.de>
Cc: Rob Herring <robh at kernel.org>
Cc: Christian Ruppert <christian.ruppert at alitech.com>
---
 arch/arc/boot/dts/abilis_tb100_dvk.dts | 1 +
 arch/arc/boot/dts/abilis_tb101_dvk.dts | 1 +
 arch/arc/boot/dts/axs101.dts           | 1 +
 arch/arc/boot/dts/axs103.dts           | 1 +
 arch/arc/boot/dts/axs103_idu.dts       | 1 +
 arch/arc/boot/dts/nsim_700.dts         | 1 +
 arch/arc/boot/dts/nsim_hs.dts          | 1 +
 arch/arc/boot/dts/nsim_hs_idu.dts      | 1 +
 arch/arc/boot/dts/nsimosci.dts         | 1 +
 arch/arc/boot/dts/nsimosci_hs.dts      | 1 +
 arch/arc/boot/dts/nsimosci_hs_idu.dts  | 1 +
 arch/arc/boot/dts/vdk_hs38.dts         | 1 +
 arch/arc/boot/dts/vdk_hs38_smp.dts     | 1 +
 13 files changed, 13 insertions(+)

diff --git a/arch/arc/boot/dts/abilis_tb100_dvk.dts b/arch/arc/boot/dts/abilis_tb100_dvk.dts
index 3dd6ed9..3acf04d 100644
--- a/arch/arc/boot/dts/abilis_tb100_dvk.dts
+++ b/arch/arc/boot/dts/abilis_tb100_dvk.dts
@@ -24,6 +24,7 @@
 /include/ "abilis_tb100.dtsi"
 
 / {
+	model = "abilis,tb100";
 	chosen {
 		bootargs = "earlycon=uart8250,mmio32,0xff100000,9600n8 console=ttyS0,9600n8";
 	};
diff --git a/arch/arc/boot/dts/abilis_tb101_dvk.dts b/arch/arc/boot/dts/abilis_tb101_dvk.dts
index 1cf51c2..37d88c5 100644
--- a/arch/arc/boot/dts/abilis_tb101_dvk.dts
+++ b/arch/arc/boot/dts/abilis_tb101_dvk.dts
@@ -24,6 +24,7 @@
 /include/ "abilis_tb101.dtsi"
 
 / {
+	model = "abilis,tb101";
 	chosen {
 		bootargs = "earlycon=uart8250,mmio32,0xff100000,9600n8 console=ttyS0,9600n8";
 	};
diff --git a/arch/arc/boot/dts/axs101.dts b/arch/arc/boot/dts/axs101.dts
index 3f9b058..d9b9b9d 100644
--- a/arch/arc/boot/dts/axs101.dts
+++ b/arch/arc/boot/dts/axs101.dts
@@ -13,6 +13,7 @@
 /include/ "axs10x_mb.dtsi"
 
 / {
+	model = "snps,axs101";
 	compatible = "snps,axs101", "snps,arc-sdp";
 
 	chosen {
diff --git a/arch/arc/boot/dts/axs103.dts b/arch/arc/boot/dts/axs103.dts
index e6d0e31..ec7fb27 100644
--- a/arch/arc/boot/dts/axs103.dts
+++ b/arch/arc/boot/dts/axs103.dts
@@ -16,6 +16,7 @@
 /include/ "axs10x_mb.dtsi"
 
 / {
+	model = "snps,axs103";
 	compatible = "snps,axs103", "snps,arc-sdp";
 
 	chosen {
diff --git a/arch/arc/boot/dts/axs103_idu.dts b/arch/arc/boot/dts/axs103_idu.dts
index f999fef..070c297 100644
--- a/arch/arc/boot/dts/axs103_idu.dts
+++ b/arch/arc/boot/dts/axs103_idu.dts
@@ -16,6 +16,7 @@
 /include/ "axs10x_mb.dtsi"
 
 / {
+	model = "snps,axs103-smp";
 	compatible = "snps,axs103", "snps,arc-sdp";
 
 	chosen {
diff --git a/arch/arc/boot/dts/nsim_700.dts b/arch/arc/boot/dts/nsim_700.dts
index 6397051..ce0ccd20 100644
--- a/arch/arc/boot/dts/nsim_700.dts
+++ b/arch/arc/boot/dts/nsim_700.dts
@@ -10,6 +10,7 @@
 /include/ "skeleton.dtsi"
 
 / {
+	model = "snps,nsim";
 	compatible = "snps,nsim";
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/arch/arc/boot/dts/nsim_hs.dts b/arch/arc/boot/dts/nsim_hs.dts
index bf05fe5..fa6fde8 100644
--- a/arch/arc/boot/dts/nsim_hs.dts
+++ b/arch/arc/boot/dts/nsim_hs.dts
@@ -10,6 +10,7 @@
 /include/ "skeleton_hs.dtsi"
 
 / {
+	model = "snps,nsim";
 	compatible = "snps,nsim_hs";
 	#address-cells = <2>;
 	#size-cells = <2>;
diff --git a/arch/arc/boot/dts/nsim_hs_idu.dts b/arch/arc/boot/dts/nsim_hs_idu.dts
index 99eabe1..1f02808 100644
--- a/arch/arc/boot/dts/nsim_hs_idu.dts
+++ b/arch/arc/boot/dts/nsim_hs_idu.dts
@@ -10,6 +10,7 @@
 /include/ "skeleton_hs_idu.dtsi"
 
 / {
+	model = "snps,nsim-smp";
 	compatible = "snps,nsim_hs";
 	interrupt-parent = <&core_intc>;
 
diff --git a/arch/arc/boot/dts/nsimosci.dts b/arch/arc/boot/dts/nsimosci.dts
index e659a34..bcf6031 100644
--- a/arch/arc/boot/dts/nsimosci.dts
+++ b/arch/arc/boot/dts/nsimosci.dts
@@ -10,6 +10,7 @@
 /include/ "skeleton.dtsi"
 
 / {
+	model = "snps,nsimosci";
 	compatible = "snps,nsimosci";
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/arch/arc/boot/dts/nsimosci_hs.dts b/arch/arc/boot/dts/nsimosci_hs.dts
index 16ce5d6..6609240 100644
--- a/arch/arc/boot/dts/nsimosci_hs.dts
+++ b/arch/arc/boot/dts/nsimosci_hs.dts
@@ -10,6 +10,7 @@
 /include/ "skeleton_hs.dtsi"
 
 / {
+	model = "snps,nsimosci";
 	compatible = "snps,nsimosci_hs";
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/arch/arc/boot/dts/nsimosci_hs_idu.dts b/arch/arc/boot/dts/nsimosci_hs_idu.dts
index ce8dfbc..4926c73 100644
--- a/arch/arc/boot/dts/nsimosci_hs_idu.dts
+++ b/arch/arc/boot/dts/nsimosci_hs_idu.dts
@@ -10,6 +10,7 @@
 /include/ "skeleton_hs_idu.dtsi"
 
 / {
+	model = "snps,nsimosci-smp";
 	compatible = "snps,nsimosci_hs";
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/arch/arc/boot/dts/vdk_hs38.dts b/arch/arc/boot/dts/vdk_hs38.dts
index 5d803dd..ab2968e 100644
--- a/arch/arc/boot/dts/vdk_hs38.dts
+++ b/arch/arc/boot/dts/vdk_hs38.dts
@@ -13,6 +13,7 @@
 /include/ "vdk_axs10x_mb.dtsi"
 
 / {
+	model = "snps,vdk";
 	compatible = "snps,axs103";
 
 	chosen {
diff --git a/arch/arc/boot/dts/vdk_hs38_smp.dts b/arch/arc/boot/dts/vdk_hs38_smp.dts
index 2ba60c39..a39fd38 100644
--- a/arch/arc/boot/dts/vdk_hs38_smp.dts
+++ b/arch/arc/boot/dts/vdk_hs38_smp.dts
@@ -13,6 +13,7 @@
 /include/ "vdk_axs10x_mb.dtsi"
 
 / {
+	model = "snps,vdk-smp";
 	compatible = "snps,axs103";
 
 	chosen {
-- 
2.7.4
