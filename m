From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 29 Jun 2017 10:27:57 +0300
Subject: [PATCH 3/3 v6] ARC: hsdk: initial port for HSDK board
In-Reply-To: <20170626151118.19507-4-Eugeniy.Paltsev@synopsys.com>
References: <20170626151118.19507-1-Eugeniy.Paltsev@synopsys.com>
 <20170626151118.19507-4-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2ed0a454-0de1-cdb6-25d1-d61967c94709@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/26/2017 06:11 PM, Eugeniy Paltsev wrote:
> From: Alexey Brodkin <abrodkin at synopsys.com>

> diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
> new file mode 100644
> index 0000000..53bc9f3
> --- /dev/null
> +++ b/arch/arc/configs/hsdk_defconfig
> @@ -0,0 +1,75 @@
> +CONFIG_DEFAULT_HOSTNAME="ARCLinux"
> +CONFIG_SYSVIPC=y
> +# CONFIG_CROSS_MEMORY_ATTACH is not set
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y
> +CONFIG_NAMESPACES=y
> +# CONFIG_UTS_NS is not set
> +# CONFIG_PID_NS is not set
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_INITRAMFS_SOURCE="../../arc_initramfs_hs/"
> +CONFIG_EMBEDDED=y
> +CONFIG_PERF_EVENTS=y
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLAB=y
> +CONFIG_ARC_PLAT_HSDK=y
> +CONFIG_ISA_ARCV2=y
> +CONFIG_SMP=y
> +CONFIG_LINUX_LINK_BASE=0x90000000
> +CONFIG_KERNEL_RAM_BASE_ADDRESS=0x80000000
> +CONFIG_ARC_BUILTIN_DTB_NAME="hsdk"
> +CONFIG_PREEMPT=y
> +# CONFIG_COMPACTION is not set
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +CONFIG_DEVTMPFS=y
> +# CONFIG_STANDALONE is not set
> +# CONFIG_PREVENT_FIRMWARE_BUILD is not set
> +# CONFIG_FIRMWARE_IN_KERNEL is not set
> +CONFIG_SCSI=y
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_NETDEVICES=y
> +CONFIG_STMMAC_ETH=y
> +CONFIG_MICREL_PHY=y
> +# CONFIG_INPUT_KEYBOARD is not set
> +# CONFIG_INPUT_MOUSE is not set
> +# CONFIG_SERIO is not set
> +# CONFIG_LEGACY_PTYS is not set
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_DW=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +# CONFIG_HW_RANDOM is not set
> +# CONFIG_HWMON is not set
> +CONFIG_FB=y
> +CONFIG_FB_UDL=y
> +CONFIG_FRAMEBUFFER_CONSOLE=y
> +CONFIG_USB=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_HCD_PLATFORM=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_OHCI_HCD_PLATFORM=y
> +CONFIG_USB_STORAGE=y
> +CONFIG_MMC=y
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_DW=y
> +# CONFIG_IOMMU_SUPPORT is not set
> +CONFIG_EXT3_FS=y
> +CONFIG_VFAT_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_ISO8859_1=y
> +# CONFIG_ENABLE_WARN_DEPRECATED is not set
> +# CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_STRIP_ASM_SYMS=y
> +CONFIG_LOCKUP_DETECTOR=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
> +# CONFIG_SCHED_DEBUG is not set
> +# CONFIG_DEBUG_PREEMPT is not set
> +# CONFIG_FTRACE is not set

For the next iteration please also enable loadable modules, module unloading and 
NFS client as defaults !

Thx,
-Vineet
