From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 11 Jul 2018 20:13:33 +0300
Subject: [PATCH] ARC: [plat-axs10x] Get rid of auto-selected CONFIG_AX10x
 options
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180711171333.1745-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Commit 4fbaf649ebbc ("ARC: [plat-axs10x] auto-select AXS101 or AXS103 given the  ISA config")
made selection of CONFIG_AXS10x option automatic so there's no point
in keeping them in defconfigs.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/configs/axs101_defconfig     | 1 -
 arch/arc/configs/axs103_defconfig     | 1 -
 arch/arc/configs/axs103_smp_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 13500399ea86..55686cc4bb19 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -23,7 +23,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_ARC_PLAT_AXS10X=y
-CONFIG_AXS101=y
 CONFIG_ARC_CACHE_LINE_SHIFT=5
 CONFIG_ARC_BUILTIN_DTB_NAME="axs101"
 CONFIG_PREEMPT=y
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index a0576308cccd..20fb8e4e7337 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -23,7 +23,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_ARC_PLAT_AXS10X=y
-CONFIG_AXS103=y
 CONFIG_ISA_ARCV2=y
 CONFIG_ARC_BUILTIN_DTB_NAME="axs103"
 CONFIG_PREEMPT=y
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index 9bd590c22620..51d1e866ce94 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -23,7 +23,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_ARC_PLAT_AXS10X=y
-CONFIG_AXS103=y
 CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
 CONFIG_ARC_BUILTIN_DTB_NAME="axs103_idu"
-- 
2.17.1
