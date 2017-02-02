From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Thu,  2 Feb 2017 03:13:32 +0300
Subject: [PATCH 1/2] ARCv2: IDU-intc: Delete deprecated parameters in Device
 Trees
In-Reply-To: <1485994413-14487-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485994413-14487-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485994413-14487-2-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

No need for specifying a list of interrupts in the declaration
of IDU interrupt controller anymore since the kernel can obtain
a number of supported interrupts from the build register.

Also delete support of the second parameter for devices which
are connected to IDU because it is not used anywhere.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 .../interrupt-controller/snps,archs-idu-intc.txt   | 24 ++++++----------------
 arch/arc/boot/dts/axc003_idu.dtsi                  | 23 +++------------------
 arch/arc/boot/dts/haps_hs_idu.dts                  | 10 ++-------
 arch/arc/boot/dts/nsim_hs_idu.dts                  | 15 ++------------
 arch/arc/boot/dts/nsimosci_hs_idu.dts              | 20 ++++--------------
 arch/arc/boot/dts/vdk_axc003_idu.dtsi              | 13 +++---------
 arch/arc/kernel/mcip.c                             | 17 +--------------
 7 files changed, 21 insertions(+), 101 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
index 9446576..8b46a34 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
@@ -8,15 +8,11 @@ Properties:
 - compatible: "snps,archs-idu-intc"
 - interrupt-controller: This is an interrupt controller.
 - interrupt-parent: <reference to parent core intc>
-- #interrupt-cells: Must be <2>.
-- interrupts: <...> specifies the upstream core irqs
+- #interrupt-cells: Must be <1>.
 
-  First cell specifies the "common" IRQ from peripheral to IDU
-  Second cell specifies the irq distribution mode to cores
-     0=Round Robin; 1=cpu0, 2=cpu1, 4=cpu2, 8=cpu3
-
-  The second cell in interrupts property is deprecated and may be ignored by
-  the kernel.
+  Value of the cell specifies the "common" IRQ from peripheral to IDU. Number N
+  of the particular interrupt line of IDU corresponds to the line N+24 of the
+  core interrupt controller.
 
   intc accessed via the special ARC AUX register interface, hence "reg" property
   is not specified.
@@ -32,18 +28,10 @@ Example:
 		compatible = "snps,archs-idu-intc";
 		interrupt-controller;
 		interrupt-parent = <&core_intc>;
-
-		/*
-		 * <hwirq  distribution>
-		 * distribution: 0=RR; 1=cpu0, 2=cpu1, 4=cpu2, 8=cpu3
-		 */
-		#interrupt-cells = <2>;
-
-		/* upstream core irqs: downstream these are "COMMON" irq 0,1..  */
-		interrupts = <24 25 26 27 28 29 30 31>;
+		#interrupt-cells = <1>;
 	};
 
 	some_device: serial at c0fc1000 {
 		interrupt-parent = <&idu_intc>;
-		interrupts = <0 0>;	/* upstream idu IRQ #24, Round Robin */
+		interrupts = <0>;	/* upstream idu IRQ #24 */
 	};
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 3d6cfa3..695f9fa 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -40,18 +40,7 @@
 			compatible = "snps,archs-idu-intc";
 			interrupt-controller;
 			interrupt-parent = <&core_intc>;
-
-			/*
-			 * <hwirq  distribution>
-			 * distribution: 0=RR; 1=cpu0, 2=cpu1, 4=cpu2, 8=cpu3
-			 */
-			#interrupt-cells = <2>;
-
-			/*
-			 * upstream irqs to core intc - downstream these are
-			 * "COMMON" irq 0,1..
-			 */
-			interrupts = <24 25>;
+			#interrupt-cells = <1>;
 		};
 
 		/*
@@ -73,12 +62,7 @@
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				interrupt-parent = <&idu_intc>;
-
-				/*
-				 * cmn irq 1 -> cpu irq 25
-				 * Distribute to cpu0 only
-				 */
-				interrupts = <1 1>;
+				interrupts = <1>;
 			};
 		};
 
@@ -119,8 +103,7 @@
 		reg = < 0xe0012000 0x200 >;
 		interrupt-controller;
 		interrupt-parent = <&idu_intc>;
-		interrupts = <0 1>;	/* cmn irq 0 -> cpu irq 24
-					   distribute to cpu0 only */
+		interrupts = <0>;
 	};
 
 	memory {
diff --git a/arch/arc/boot/dts/haps_hs_idu.dts b/arch/arc/boot/dts/haps_hs_idu.dts
index 65204b4..0a857fa 100644
--- a/arch/arc/boot/dts/haps_hs_idu.dts
+++ b/arch/arc/boot/dts/haps_hs_idu.dts
@@ -54,11 +54,7 @@
 			compatible = "snps,archs-idu-intc";
 			interrupt-controller;
 			interrupt-parent = <&core_intc>;
-			/* <hwirq  distribution>
-			distribution: 0=RR; 1=cpu0, 2=cpu1, 4=cpu2, 8=cpu3 */
-			#interrupt-cells = <2>;
-			interrupts = <24 25 26 27 28 29 30 31>;
-
+			#interrupt-cells = <1>;
 		};
 
 		uart0: serial at f0000000 {
@@ -66,9 +62,7 @@
 			compatible = "ns16550a";
 			reg = <0xf0000000 0x2000>;
 			interrupt-parent = <&idu_intc>;
-			/* interrupts = <0 1>;  DEST=1*/
-			/* interrupts = <0 2>;  DEST=2*/
-			interrupts = <0 0>;  /* RR*/
+			interrupts = <0>;
 			clock-frequency = <50000000>;
 			baud = <115200>;
 			reg-shift = <2>;
diff --git a/arch/arc/boot/dts/nsim_hs_idu.dts b/arch/arc/boot/dts/nsim_hs_idu.dts
index 48434d7c..4f98ebf 100644
--- a/arch/arc/boot/dts/nsim_hs_idu.dts
+++ b/arch/arc/boot/dts/nsim_hs_idu.dts
@@ -46,25 +46,14 @@
 			compatible = "snps,archs-idu-intc";
 			interrupt-controller;
 			interrupt-parent = <&core_intc>;
-
-			/*
-			 * <hwirq  distribution>
-			 * distribution: 0=RR; 1=cpu0, 2=cpu1, 4=cpu2, 8=cpu3
-			 */
-			#interrupt-cells = <2>;
-
-			/*
-			 * upstream irqs to core intc - downstream these are
-			 * "COMMON" irq 0,1..
-			 */
-			interrupts = <24 25 26 27 28 29 30 31>;
+			#interrupt-cells = <1>;
 		};
 
 		arcuart0: serial at c0fc1000 {
 			compatible = "snps,arc-uart";
 			reg = <0xc0fc1000 0x100>;
 			interrupt-parent = <&idu_intc>;
-			interrupts = <0 0>;
+			interrupts = <0>;
 			clock-frequency = <80000000>;
 			current-speed = <115200>;
 			status = "okay";
diff --git a/arch/arc/boot/dts/nsimosci_hs_idu.dts b/arch/arc/boot/dts/nsimosci_hs_idu.dts
index cbf65b6..37be2bb 100644
--- a/arch/arc/boot/dts/nsimosci_hs_idu.dts
+++ b/arch/arc/boot/dts/nsimosci_hs_idu.dts
@@ -50,26 +50,14 @@
 			compatible = "snps,archs-idu-intc";
 			interrupt-controller;
 			interrupt-parent = <&core_intc>;
-
-			/*
-			 * <hwirq  distribution>
-			 * distribution: 0=RR; 1=cpu0, 2=cpu1, 4=cpu2, 8=cpu3
-			 */
-			#interrupt-cells = <2>;
-
-			/*
-			 * upstream irqs to core intc - downstream these are
-			 * "COMMON" irq 0,1..
-			 */
-			interrupts = <24 25 26 27 28 29 30 31>;
+			#interrupt-cells = <1>;
 		};
 
 		uart0: serial at f0000000 {
 			compatible = "ns8250";
 			reg = <0xf0000000 0x2000>;
 			interrupt-parent = <&idu_intc>;
-			interrupts = <0 0>; /* cmn irq 0 -> cpu irq 24
-						RR distribute to all cpus */
+			interrupts = <0>;
 			clock-frequency = <3686400>;
 			baud = <115200>;
 			reg-shift = <2>;
@@ -93,7 +81,7 @@
 		ps2: ps2 at f9001000 {
 			compatible = "snps,arc_ps2";
 			reg = <0xf9000400 0x14>;
-			interrupts = <3 0>;
+			interrupts = <3>;
 			interrupt-parent = <&idu_intc>;
 			interrupt-names = "arc_ps2_irq";
 		};
@@ -102,7 +90,7 @@
 			compatible = "ezchip,nps-mgt-enet";
 			reg = <0xf0003000 0x44>;
 			interrupt-parent = <&idu_intc>;
-			interrupts = <1 2>;
+			interrupts = <1>;
 		};
 
 		arcpct0: pct {
diff --git a/arch/arc/boot/dts/vdk_axc003_idu.dtsi b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
index 82214cd..28956f9 100644
--- a/arch/arc/boot/dts/vdk_axc003_idu.dtsi
+++ b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
@@ -41,14 +41,7 @@
 			compatible = "snps,archs-idu-intc";
 			interrupt-controller;
 			interrupt-parent = <&core_intc>;
-
-			/*
-			 * <hwirq  distribution>
-			 * distribution: 0=RR; 1=cpu0, 2=cpu1, 4=cpu2, 8=cpu3
-			 */
-			#interrupt-cells = <2>;
-
-			interrupts = <24 25 26 27>;
+			#interrupt-cells = <1>;
 		};
 
 		debug_uart: dw-apb-uart at 0x5000 {
@@ -56,7 +49,7 @@
 			reg = <0x5000 0x100>;
 			clock-frequency = <2403200>;
 			interrupt-parent = <&idu_intc>;
-			interrupts = <2 0>;
+			interrupts = <2>;
 			baud = <115200>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
@@ -70,7 +63,7 @@
 		reg = < 0xe0012000 0x200 >;
 		interrupt-controller;
 		interrupt-parent = <&idu_intc>;
-		interrupts = < 0 0 >;
+		interrupts = <0>;
 	};
 
 	memory {
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index b91d833..f61a52b 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -255,23 +255,8 @@ static int idu_irq_map(struct irq_domain *d, unsigned int virq, irq_hw_number_t
 	return 0;
 }
 
-static int idu_irq_xlate(struct irq_domain *d, struct device_node *n,
-			 const u32 *intspec, unsigned int intsize,
-			 irq_hw_number_t *out_hwirq, unsigned int *out_type)
-{
-	/*
-	 * Ignore value of interrupt distribution mode for common interrupts in
-	 * IDU which resides in intspec[1] since setting an affinity using value
-	 * from Device Tree is deprecated in ARC.
-	 */
-	*out_hwirq = intspec[0];
-	*out_type = IRQ_TYPE_NONE;
-
-	return 0;
-}
-
 static const struct irq_domain_ops idu_irq_ops = {
-	.xlate	= idu_irq_xlate,
+	.xlate	= irq_domain_xlate_onecell,
 	.map	= idu_irq_map,
 };
 
-- 
2.7.4
