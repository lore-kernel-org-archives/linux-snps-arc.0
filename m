From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Thu,  2 Feb 2017 03:13:33 +0300
Subject: [PATCH 2/2] ARCv2: intc: Delete useless comments in Device Trees
In-Reply-To: <1485994413-14487-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485994413-14487-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485994413-14487-3-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/boot/dts/haps_hs_idu.dts     | 1 -
 arch/arc/boot/dts/nsimosci_hs_idu.dts | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arc/boot/dts/haps_hs_idu.dts b/arch/arc/boot/dts/haps_hs_idu.dts
index 0a857fa..215cddd 100644
--- a/arch/arc/boot/dts/haps_hs_idu.dts
+++ b/arch/arc/boot/dts/haps_hs_idu.dts
@@ -47,7 +47,6 @@
 			compatible = "snps,archs-intc";
 			interrupt-controller;
 			#interrupt-cells = <1>;
-/*			interrupts = <16 17 18 19 20 21 22 23 24 25>; */
 		};
 
 		idu_intc: idu-interrupt-controller {
diff --git a/arch/arc/boot/dts/nsimosci_hs_idu.dts b/arch/arc/boot/dts/nsimosci_hs_idu.dts
index 37be2bb..5052917 100644
--- a/arch/arc/boot/dts/nsimosci_hs_idu.dts
+++ b/arch/arc/boot/dts/nsimosci_hs_idu.dts
@@ -43,7 +43,6 @@
 			compatible = "snps,archs-intc";
 			interrupt-controller;
 			#interrupt-cells = <1>;
-/*			interrupts = <16 17 18 19 20 21 22 23 24 25>; */
 		};
 
 		idu_intc: idu-interrupt-controller {
-- 
2.7.4
