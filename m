From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 22 Nov 2018 00:03:01 +0300
Subject: [PATCH] arc: [nsim] Disable NFS
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181121210301.7010-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Pure nSIM models only CPU core and serial port thus
no point in having NFS enabled.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/configs/nsim_700_defconfig    | 1 -
 arch/arc/configs/nsim_hs_defconfig     | 1 -
 arch/arc/configs/nsim_hs_smp_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
index 8e0b8b134cd9..4754145f6e1b 100644
--- a/arch/arc/configs/nsim_700_defconfig
+++ b/arch/arc/configs/nsim_700_defconfig
@@ -54,7 +54,6 @@ CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_TMPFS=y
 # CONFIG_MISC_FILESYSTEMS is not set
-CONFIG_NFS_FS=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
 # CONFIG_DEBUG_PREEMPT is not set
diff --git a/arch/arc/configs/nsim_hs_defconfig b/arch/arc/configs/nsim_hs_defconfig
index 739b90e5e893..38525155773b 100644
--- a/arch/arc/configs/nsim_hs_defconfig
+++ b/arch/arc/configs/nsim_hs_defconfig
@@ -55,7 +55,6 @@ CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_TMPFS=y
 # CONFIG_MISC_FILESYSTEMS is not set
-CONFIG_NFS_FS=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
 # CONFIG_DEBUG_PREEMPT is not set
diff --git a/arch/arc/configs/nsim_hs_smp_defconfig b/arch/arc/configs/nsim_hs_smp_defconfig
index b5895bdf3a93..c5d35069a35c 100644
--- a/arch/arc/configs/nsim_hs_smp_defconfig
+++ b/arch/arc/configs/nsim_hs_smp_defconfig
@@ -54,6 +54,5 @@ CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_TMPFS=y
 # CONFIG_MISC_FILESYSTEMS is not set
-CONFIG_NFS_FS=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
-- 
2.16.2
