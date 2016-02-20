From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Sat, 20 Feb 2016 16:04:26 +0300
Subject: [PATCH] arc: get rid of DEVTMPFS dependency on INITRAMFS_SOURCE
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1455973466-15611-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Even though DEVTMPFS is required when our pre-built initramfs
is used it is not the case in general. It is perfectly possible
to use initramfs with device nodes already populated or there
could be other usages, see discussion below for more detials:
http://thread.gmane.org/gmane.comp.embedded.openwrt.devel/37819/focus=37821

This change removes mentioned dependency from arch/arc/Kconfig
updating instead those defconfigs that are usually used with this
kind of pre-build initramfs.

And while at it all touched defconfigs were regenerated via
savedefconfig and some options were removed:
 * USB is selected by other options implicitly
 * VGA_CONSOLE is disableb for ARC since
   031e29b5877f31676739dc2f847d04c2c0732034
 * EXT3_FS automatically selects EXT4_FS
 * MTDxxx and JFFS2_FS make no sense for AXS because
   AXS NAND controller is not upstreamed
 * NET_OSCI_LAN is not in upstream as well
 * ARCPGU_xxx options make no sense because ARC PGU is not yet
   in upstream and when it gets there all config options would
   be taken from devicetree

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/Kconfig                           |  2 --
 arch/arc/configs/axs101_defconfig          |  4 +---
 arch/arc/configs/axs103_defconfig          | 10 +---------
 arch/arc/configs/axs103_smp_defconfig      | 10 +---------
 arch/arc/configs/nsim_700_defconfig        |  5 ++---
 arch/arc/configs/nsim_hs_defconfig         |  3 +--
 arch/arc/configs/nsim_hs_smp_defconfig     |  6 ++----
 arch/arc/configs/nsimosci_defconfig        |  2 +-
 arch/arc/configs/nsimosci_hs_defconfig     |  3 +--
 arch/arc/configs/nsimosci_hs_smp_defconfig | 12 ++----------
 arch/arc/configs/tb10x_defconfig           | 18 ++++++------------
 11 files changed, 18 insertions(+), 57 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 0655495..b2befa4 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -12,8 +12,6 @@ config ARC
 	select BUILDTIME_EXTABLE_SORT
 	select COMMON_CLK
 	select CLONE_BACKWARDS
-	# ARC Busybox based initramfs absolutely relies on DEVTMPFS for /dev
-	select DEVTMPFS if !INITRAMFS_SOURCE=""
 	select GENERIC_ATOMIC64
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_FIND_FIRST_BIT
diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index f1ac981..5d4e2a0 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -39,6 +39,7 @@ CONFIG_IP_PNP_RARP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
+CONFIG_DEVTMPFS=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_FIRMWARE_IN_KERNEL is not set
@@ -73,7 +74,6 @@ CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-# CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
 CONFIG_LOGO=y
@@ -91,12 +91,10 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
-CONFIG_EXT4_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_NTFS_FS=y
 CONFIG_TMPFS=y
-CONFIG_JFFS2_FS=y
 CONFIG_NFS_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index 323486d..87ee46b 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -39,14 +39,10 @@ CONFIG_IP_PNP_RARP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
+CONFIG_DEVTMPFS=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_FIRMWARE_IN_KERNEL is not set
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_AXS=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
@@ -78,14 +74,12 @@ CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-# CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_LOGO_LINUX_CLUT224 is not set
-CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
@@ -97,12 +91,10 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
-CONFIG_EXT4_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_NTFS_FS=y
 CONFIG_TMPFS=y
-CONFIG_JFFS2_FS=y
 CONFIG_NFS_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index 66191cd..d80daf4 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -40,14 +40,10 @@ CONFIG_IP_PNP_RARP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
+CONFIG_DEVTMPFS=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_FIRMWARE_IN_KERNEL is not set
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_AXS=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
@@ -79,14 +75,12 @@ CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-# CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_LOGO_LINUX_CLUT224 is not set
-CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
@@ -98,12 +92,10 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
-CONFIG_EXT4_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_NTFS_FS=y
 CONFIG_TMPFS=y
-CONFIG_JFFS2_FS=y
 CONFIG_NFS_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
index 138f9d8..f410953 100644
--- a/arch/arc/configs/nsim_700_defconfig
+++ b/arch/arc/configs/nsim_700_defconfig
@@ -4,6 +4,7 @@ CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
+# CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
@@ -26,7 +27,6 @@ CONFIG_ARC_PLAT_SIM=y
 CONFIG_ARC_BUILTIN_DTB_NAME="nsim_700"
 CONFIG_PREEMPT=y
 # CONFIG_COMPACTION is not set
-# CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -34,6 +34,7 @@ CONFIG_UNIX_DIAG=y
 CONFIG_NET_KEY=y
 CONFIG_INET=y
 # CONFIG_IPV6 is not set
+CONFIG_DEVTMPFS=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_FIRMWARE_IN_KERNEL is not set
@@ -51,7 +52,6 @@ CONFIG_SERIAL_ARC=y
 CONFIG_SERIAL_ARC_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-# CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
 # CONFIG_IOMMU_SUPPORT is not set
@@ -63,4 +63,3 @@ CONFIG_NFS_FS=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
 # CONFIG_DEBUG_PREEMPT is not set
-CONFIG_XZ_DEC=y
diff --git a/arch/arc/configs/nsim_hs_defconfig b/arch/arc/configs/nsim_hs_defconfig
index f68838e..cfaa33c 100644
--- a/arch/arc/configs/nsim_hs_defconfig
+++ b/arch/arc/configs/nsim_hs_defconfig
@@ -35,6 +35,7 @@ CONFIG_UNIX_DIAG=y
 CONFIG_NET_KEY=y
 CONFIG_INET=y
 # CONFIG_IPV6 is not set
+CONFIG_DEVTMPFS=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_FIRMWARE_IN_KERNEL is not set
@@ -49,7 +50,6 @@ CONFIG_SERIAL_ARC=y
 CONFIG_SERIAL_ARC_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-# CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
 # CONFIG_IOMMU_SUPPORT is not set
@@ -61,4 +61,3 @@ CONFIG_NFS_FS=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
 # CONFIG_DEBUG_PREEMPT is not set
-CONFIG_XZ_DEC=y
diff --git a/arch/arc/configs/nsim_hs_smp_defconfig b/arch/arc/configs/nsim_hs_smp_defconfig
index 96bd1c2..bb2a8dc 100644
--- a/arch/arc/configs/nsim_hs_smp_defconfig
+++ b/arch/arc/configs/nsim_hs_smp_defconfig
@@ -2,6 +2,7 @@ CONFIG_CROSS_COMPILE="arc-linux-"
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
+# CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
@@ -21,13 +22,11 @@ CONFIG_MODULES=y
 # CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_IOSCHED_CFQ is not set
 CONFIG_ARC_PLAT_SIM=y
-CONFIG_ARC_BOARD_ML509=y
 CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
 CONFIG_ARC_BUILTIN_DTB_NAME="nsim_hs_idu"
 CONFIG_PREEMPT=y
 # CONFIG_COMPACTION is not set
-# CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -35,6 +34,7 @@ CONFIG_UNIX_DIAG=y
 CONFIG_NET_KEY=y
 CONFIG_INET=y
 # CONFIG_IPV6 is not set
+CONFIG_DEVTMPFS=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_FIRMWARE_IN_KERNEL is not set
@@ -49,7 +49,6 @@ CONFIG_SERIAL_ARC=y
 CONFIG_SERIAL_ARC_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-# CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
 # CONFIG_IOMMU_SUPPORT is not set
@@ -60,4 +59,3 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
-CONFIG_XZ_DEC=y
diff --git a/arch/arc/configs/nsimosci_defconfig b/arch/arc/configs/nsimosci_defconfig
index 31e1d95..646182e 100644
--- a/arch/arc/configs/nsimosci_defconfig
+++ b/arch/arc/configs/nsimosci_defconfig
@@ -33,6 +33,7 @@ CONFIG_UNIX_DIAG=y
 CONFIG_NET_KEY=y
 CONFIG_INET=y
 # CONFIG_IPV6 is not set
+CONFIG_DEVTMPFS=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_FIRMWARE_IN_KERNEL is not set
@@ -58,7 +59,6 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-# CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_HID is not set
diff --git a/arch/arc/configs/nsimosci_hs_defconfig b/arch/arc/configs/nsimosci_hs_defconfig
index fcae666..ceca254 100644
--- a/arch/arc/configs/nsimosci_hs_defconfig
+++ b/arch/arc/configs/nsimosci_hs_defconfig
@@ -34,12 +34,12 @@ CONFIG_UNIX_DIAG=y
 CONFIG_NET_KEY=y
 CONFIG_INET=y
 # CONFIG_IPV6 is not set
+CONFIG_DEVTMPFS=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_BLK_DEV is not set
 CONFIG_NETDEVICES=y
-CONFIG_NET_OSCI_LAN=y
 CONFIG_INPUT_EVDEV=y
 # CONFIG_MOUSE_PS2_ALPS is not set
 # CONFIG_MOUSE_PS2_LOGIPS2PP is not set
@@ -58,7 +58,6 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-# CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_HID is not set
diff --git a/arch/arc/configs/nsimosci_hs_smp_defconfig b/arch/arc/configs/nsimosci_hs_smp_defconfig
index b01b659..4b6da90 100644
--- a/arch/arc/configs/nsimosci_hs_smp_defconfig
+++ b/arch/arc/configs/nsimosci_hs_smp_defconfig
@@ -2,6 +2,7 @@ CONFIG_CROSS_COMPILE="arc-linux-"
 CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
+# CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_IKCONFIG=y
@@ -18,15 +19,11 @@ CONFIG_MODULES=y
 # CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_IOSCHED_CFQ is not set
 CONFIG_ARC_PLAT_SIM=y
-CONFIG_ARC_BOARD_ML509=y
 CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
-CONFIG_ARC_HAS_LL64=y
-# CONFIG_ARC_HAS_RTSC is not set
 CONFIG_ARC_BUILTIN_DTB_NAME="nsimosci_hs_idu"
 CONFIG_PREEMPT=y
 # CONFIG_COMPACTION is not set
-# CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_PACKET_DIAG=y
@@ -40,6 +37,7 @@ CONFIG_INET=y
 # CONFIG_INET_LRO is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 # CONFIG_FIRMWARE_IN_KERNEL is not set
@@ -56,14 +54,11 @@ CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_STMICRO is not set
 # CONFIG_NET_VENDOR_VIA is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
-CONFIG_NET_OSCI_LAN=y
 # CONFIG_WLAN is not set
 CONFIG_INPUT_EVDEV=y
 CONFIG_MOUSE_PS2_TOUCHKIT=y
 # CONFIG_SERIO_SERPORT is not set
-CONFIG_SERIO_LIBPS2=y
 CONFIG_SERIO_ARC_PS2=y
-CONFIG_VT_HW_CONSOLE_BINDING=y
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
@@ -75,9 +70,6 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-CONFIG_ARCPGU_RGB888=y
-CONFIG_ARCPGU_DISPTYPE=0
-# CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_HID is not set
diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 3b4dc9c..9b342ea 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -3,6 +3,7 @@ CONFIG_CROSS_COMPILE="arc-linux-"
 CONFIG_DEFAULT_HOSTNAME="tb10x"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
+# CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
@@ -26,12 +27,10 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLOCK is not set
 CONFIG_ARC_PLAT_TB10X=y
 CONFIG_ARC_CACHE_LINE_SHIFT=5
-CONFIG_ARC_STACK_NONEXEC=y
 CONFIG_HZ=250
 CONFIG_ARC_BUILTIN_DTB_NAME="abilis_tb100_dvk"
 CONFIG_PREEMPT_VOLUNTARY=y
 # CONFIG_COMPACTION is not set
-# CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -44,8 +43,8 @@ CONFIG_IP_MULTICAST=y
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
-CONFIG_PROC_DEVICETREE=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_CADENCE is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
@@ -55,9 +54,6 @@ CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_NATSEMI is not set
 # CONFIG_NET_VENDOR_SEEQ is not set
 CONFIG_STMMAC_ETH=y
-CONFIG_STMMAC_DEBUG_FS=y
-CONFIG_STMMAC_DA=y
-CONFIG_STMMAC_CHAINED=y
 # CONFIG_NET_VENDOR_WIZNET is not set
 # CONFIG_WLAN is not set
 # CONFIG_INPUT is not set
@@ -91,7 +87,6 @@ CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_LEDS_TRIGGER_TRANSIENT=y
 CONFIG_DMADEVICES=y
 CONFIG_DW_DMAC=y
-CONFIG_NET_DMA=y
 CONFIG_ASYNC_TX_DMA=y
 # CONFIG_IOMMU_SUPPORT is not set
 # CONFIG_DNOTIFY is not set
@@ -100,17 +95,16 @@ CONFIG_TMPFS=y
 CONFIG_CONFIGFS_FS=y
 # CONFIG_MISC_FILESYSTEMS is not set
 # CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_DEBUG_INFO=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
-CONFIG_MAGIC_SYSRQ=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_DEBUG_FS=y
 CONFIG_HEADERS_CHECK=y
 CONFIG_DEBUG_SECTION_MISMATCH=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_MEMORY_INIT=y
+CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_SCHEDSTATS=y
 CONFIG_TIMER_STATS=y
-CONFIG_DEBUG_INFO=y
-CONFIG_DEBUG_MEMORY_INIT=y
-CONFIG_DEBUG_STACKOVERFLOW=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
 # CONFIG_CRYPTO_HW is not set
-- 
2.5.0
