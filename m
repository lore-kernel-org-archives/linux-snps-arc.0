From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 18 Nov 2016 14:22:28 -0800
Subject: [PATCH] ARC: rename Zebu platform support to HAPS
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1479507748-20263-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

There are more ARC Linux HAPS users than Zebu ones.

Same kernel would work fine on both, even with embedded DT, assuming the FPGA
bitfile configuration is same

Suggested-by: Francois Bedard <fbedard at ynopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/boot/dts/{zebu_hs.dts => haps_hs.dts}                    | 0
 arch/arc/boot/dts/{zebu_hs_idu.dts => haps_hs_idu.dts}            | 0
 arch/arc/configs/{zebu_hs_defconfig => haps_hs_defconfig}         | 2 +-
 arch/arc/configs/{zebu_hs_smp_defconfig => haps_hs_smp_defconfig} | 2 +-
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arc/boot/dts/{zebu_hs.dts => haps_hs.dts} (100%)
 rename arch/arc/boot/dts/{zebu_hs_idu.dts => haps_hs_idu.dts} (100%)
 rename arch/arc/configs/{zebu_hs_defconfig => haps_hs_defconfig} (98%)
 rename arch/arc/configs/{zebu_hs_smp_defconfig => haps_hs_smp_defconfig} (98%)

diff --git a/arch/arc/boot/dts/zebu_hs.dts b/arch/arc/boot/dts/haps_hs.dts
similarity index 100%
rename from arch/arc/boot/dts/zebu_hs.dts
rename to arch/arc/boot/dts/haps_hs.dts
diff --git a/arch/arc/boot/dts/zebu_hs_idu.dts b/arch/arc/boot/dts/haps_hs_idu.dts
similarity index 100%
rename from arch/arc/boot/dts/zebu_hs_idu.dts
rename to arch/arc/boot/dts/haps_hs_idu.dts
diff --git a/arch/arc/configs/zebu_hs_defconfig b/arch/arc/configs/haps_hs_defconfig
similarity index 98%
rename from arch/arc/configs/zebu_hs_defconfig
rename to arch/arc/configs/haps_hs_defconfig
index 9f6166be7145..57b3e599322f 100644
--- a/arch/arc/configs/zebu_hs_defconfig
+++ b/arch/arc/configs/haps_hs_defconfig
@@ -23,7 +23,7 @@ CONFIG_MODULES=y
 # CONFIG_IOSCHED_CFQ is not set
 CONFIG_ARC_PLAT_SIM=y
 CONFIG_ISA_ARCV2=y
-CONFIG_ARC_BUILTIN_DTB_NAME="zebu_hs"
+CONFIG_ARC_BUILTIN_DTB_NAME="haps_hs"
 CONFIG_PREEMPT=y
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
diff --git a/arch/arc/configs/zebu_hs_smp_defconfig b/arch/arc/configs/haps_hs_smp_defconfig
similarity index 98%
rename from arch/arc/configs/zebu_hs_smp_defconfig
rename to arch/arc/configs/haps_hs_smp_defconfig
index 44e9693f4257..f85985adebb2 100644
--- a/arch/arc/configs/zebu_hs_smp_defconfig
+++ b/arch/arc/configs/haps_hs_smp_defconfig
@@ -26,7 +26,7 @@ CONFIG_MODULES=y
 CONFIG_ARC_PLAT_SIM=y
 CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
-CONFIG_ARC_BUILTIN_DTB_NAME="zebu_hs_idu"
+CONFIG_ARC_BUILTIN_DTB_NAME="haps_hs_idu"
 CONFIG_PREEMPT=y
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
-- 
2.7.4
