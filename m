From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 11 Jul 2018 20:02:58 +0300
Subject: [PATCH] ARC: Enable FUSE_FS on devboards
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180711170258.30165-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This allows to use FUSE file-systems such as SSHFS.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/configs/axs101_defconfig     | 1 +
 arch/arc/configs/axs103_defconfig     | 1 +
 arch/arc/configs/axs103_smp_defconfig | 1 +
 arch/arc/configs/hsdk_defconfig       | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 09f85154c5a4..13500399ea86 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -94,6 +94,7 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
+CONFIG_FUSE_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_NTFS_FS=y
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index 09fed3ef22b6..a0576308cccd 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -93,6 +93,7 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
+CONFIG_FUSE_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_NTFS_FS=y
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index ea2f6d817d1a..9bd590c22620 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -96,6 +96,7 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
+CONFIG_FUSE_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_NTFS_FS=y
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 1b54c72f4296..ba101d12515f 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -64,6 +64,7 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
+CONFIG_FUSE_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
-- 
2.17.1
