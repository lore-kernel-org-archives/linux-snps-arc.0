From: Lada.Trimasova@synopsys.com (Lada Trimasova)
Date: Mon, 14 Mar 2016 17:11:57 +0300
Subject: [PATCH] arc: use ezchip network driver
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457964717-7167-1-git-send-email-ltrimas@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Since ezchip network driver was adapted to little endian architecture
this patch provides the corresponding arch/arc/{boot/dts,configs}/ updates so
we can switch over to this device-model/driver for OSCI platform.

Signed-off-by: Lada Trimasova <ltrimas at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>:
---
 arch/arc/boot/dts/nsimosci.dts             | 5 ++---
 arch/arc/boot/dts/nsimosci_hs.dts          | 5 ++---
 arch/arc/boot/dts/nsimosci_hs_idu.dts      | 5 ++---
 arch/arc/configs/nsimosci_defconfig        | 1 +
 arch/arc/configs/nsimosci_hs_defconfig     | 1 +
 arch/arc/configs/nsimosci_hs_smp_defconfig | 1 +
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arc/boot/dts/nsimosci.dts b/arch/arc/boot/dts/nsimosci.dts
index 1c169dc..d94b4ce 100644
--- a/arch/arc/boot/dts/nsimosci.dts
+++ b/arch/arc/boot/dts/nsimosci.dts
@@ -65,10 +65,9 @@
 		};
 
 		eth0: ethernet at f0003000 {
-			compatible = "snps,oscilan";
+			compatible = "ezchip,nps-mgt-enet";
 			reg = <0xf0003000 0x44>;
-			interrupts = <7>, <8>;
-			interrupt-names = "rx", "tx";
+			interrupts = <7>;
 		};
 	};
 };
diff --git a/arch/arc/boot/dts/nsimosci_hs.dts b/arch/arc/boot/dts/nsimosci_hs.dts
index d64a96f..034a313 100644
--- a/arch/arc/boot/dts/nsimosci_hs.dts
+++ b/arch/arc/boot/dts/nsimosci_hs.dts
@@ -65,10 +65,9 @@
 		};
 
 		eth0: ethernet at f0003000 {
-			compatible = "snps,oscilan";
+			compatible = "ezchip,nps-mgt-enet";
 			reg = <0xf0003000 0x44>;
-			interrupts = <25>, <26>;
-			interrupt-names = "rx", "tx";
+			interrupts = <25>;
 		};
 
 		arcpct0: pct {
diff --git a/arch/arc/boot/dts/nsimosci_hs_idu.dts b/arch/arc/boot/dts/nsimosci_hs_idu.dts
index f6bf0ca..8a1297e 100644
--- a/arch/arc/boot/dts/nsimosci_hs_idu.dts
+++ b/arch/arc/boot/dts/nsimosci_hs_idu.dts
@@ -85,11 +85,10 @@
 		};
 
 		eth0: ethernet at f0003000 {
-			compatible = "snps,oscilan";
+			compatible = "ezchip,nps-mgt-enet";
 			reg = <0xf0003000 0x44>;
 			interrupt-parent = <&idu_intc>;
-			interrupts = <1 2>, <2 2>;
-			interrupt-names = "rx", "tx";
+			interrupts = <1 2>;
 		};
 
 		arcpct0: pct {
diff --git a/arch/arc/configs/nsimosci_defconfig b/arch/arc/configs/nsimosci_defconfig
index 646182e..97dfc30 100644
--- a/arch/arc/configs/nsimosci_defconfig
+++ b/arch/arc/configs/nsimosci_defconfig
@@ -27,6 +27,7 @@ CONFIG_ARC_PLAT_SIM=y
 CONFIG_ARC_BUILTIN_DTB_NAME="nsimosci"
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
+CONFIG_EZCHIP_NPS_MANAGEMENT_ENET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_UNIX_DIAG=y
diff --git a/arch/arc/configs/nsimosci_hs_defconfig b/arch/arc/configs/nsimosci_hs_defconfig
index ceca254..55e2892 100644
--- a/arch/arc/configs/nsimosci_hs_defconfig
+++ b/arch/arc/configs/nsimosci_hs_defconfig
@@ -28,6 +28,7 @@ CONFIG_ISA_ARCV2=y
 CONFIG_ARC_BUILTIN_DTB_NAME="nsimosci_hs"
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
+CONFIG_EZCHIP_NPS_MANAGEMENT_ENET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_UNIX_DIAG=y
diff --git a/arch/arc/configs/nsimosci_hs_smp_defconfig b/arch/arc/configs/nsimosci_hs_smp_defconfig
index 4b6da90..74a3e48 100644
--- a/arch/arc/configs/nsimosci_hs_smp_defconfig
+++ b/arch/arc/configs/nsimosci_hs_smp_defconfig
@@ -25,6 +25,7 @@ CONFIG_ARC_BUILTIN_DTB_NAME="nsimosci_hs_idu"
 CONFIG_PREEMPT=y
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
+CONFIG_EZCHIP_NPS_MANAGEMENT_ENET=y
 CONFIG_PACKET=y
 CONFIG_PACKET_DIAG=y
 CONFIG_UNIX=y
-- 
2.5.0
