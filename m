From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed,  1 Feb 2017 19:42:51 +0300
Subject: [PATCH 1/3] arc: vdk: Disable halt on reset
In-Reply-To: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
References: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485967373-15273-2-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

In recent VDKs ARC cores are configured as "run on reset"
which made existing kernel configuration outdated to effect that
slave cores never start execution of the code keeping only master
online.

With that fix we're again in sync with VDK platform.

And while at it we regenerate defconfig via savedefconfig so default
options are now excluded.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/configs/vdk_hs38_smp_defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
index 573028f19de7..f6361de41eec 100644
--- a/arch/arc/configs/vdk_hs38_smp_defconfig
+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
@@ -15,7 +15,7 @@ CONFIG_ARC_PLAT_AXS10X=y
 CONFIG_AXS103=y
 CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
-# CONFIG_ARC_TIMERS_64BIT is not set
+# CONFIG_ARC_SMP_HALT_ON_RESET is not set
 CONFIG_ARC_UBOOT_SUPPORT=y
 CONFIG_ARC_BUILTIN_DTB_NAME="vdk_hs38_smp"
 CONFIG_PREEMPT=y
@@ -56,7 +56,6 @@ CONFIG_NATIONAL_PHY=y
 CONFIG_MOUSE_PS2_TOUCHKIT=y
 CONFIG_SERIO_ARC_PS2=y
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
@@ -80,7 +79,6 @@ CONFIG_USB_STORAGE=y
 CONFIG_USB_SERIAL=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
-CONFIG_EXT4_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_NTFS_FS=y
-- 
2.7.4
