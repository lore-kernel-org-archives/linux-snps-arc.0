From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 20 Dec 2016 15:23:51 -0800
Subject: [PATCH] arc: nsim: clean-up defconfigs
In-Reply-To: <1481825556-17182-1-git-send-email-abrodkin@synopsys.com>
References: <1481825556-17182-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4b5b64b1-3418-f4e0-66a0-958427e02531@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/15/2016 10:12 AM, Alexey Brodkin wrote:
> Stand-alone nSIM platform has the only peripheral which is serial port.
> That means support of networking and mice makes no sense for it.
> 
> Moreover removal of networking alone gives us 2 nice benefits:
>  1. Build happens faster
>     On my machine I'm seeing this:
>        Existing defconfig:
>          real	2m37.887s
>          user	8m22.077s
>          sys	0m35.995s
> 
>        New defconfig:
>          real	1m35.351s
>          user	5m11.988s
>          sys	0m25.211s
> 
>     Which gives us ~60% speed-up.
> 
>  2. Memory footprint is smaller:
>     arc-linux-size vmlinux.org
>       text	   data	    bss	    dec	    hex	filename
>       5829381	 798756	 257280	6885417	 691029	vmlinux.org
> 
>     arc-linux-size vmlinux.new
>       text	   data	    bss	    dec	    hex	filename
>       4426769	 526348	 225244	5178361	 4f03f9	vmlinux.new
> 
> Though this has one down-side - UNIX sockets are disabled an so on
> attempt to run hackbench by default user will see:
> --------------------->8-------------------
> hackbench
> Running in process mode with 10 groups using 40 file descriptors each
> (== 400 tasks)
> Each sender will pass 100 messages of 100 bytes
> Creating fdpair (error: Function not implemented)
> --------------------->8-------------------
> 
> Still it's possible to ask hackbench to use pipes instead like this:
> --------------------->8-------------------
> hackbench -p
> Running in process mode with 10 groups using 40 file descriptors each
> (== 400 tasks)
> Each sender will pass 100 messages of 100 bytes
> Time: 9.216
> --------------------->8-------------------

Sorry this part is a no go !

-Vineet


> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>  arch/arc/configs/nsim_700_defconfig    | 16 +---------------
>  arch/arc/configs/nsim_hs_defconfig     | 13 +------------
>  arch/arc/configs/nsim_hs_smp_defconfig | 12 +-----------
>  3 files changed, 3 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
> index b0066a749d4c..80bd8faecb95 100644
> --- a/arch/arc/configs/nsim_700_defconfig
> +++ b/arch/arc/configs/nsim_700_defconfig
> @@ -2,7 +2,6 @@
>  CONFIG_DEFAULT_HOSTNAME="ARCLinux"
>  # CONFIG_SWAP is not set
>  CONFIG_SYSVIPC=y
> -CONFIG_POSIX_MQUEUE=y
>  # CONFIG_CROSS_MEMORY_ATTACH is not set
>  CONFIG_HIGH_RES_TIMERS=y
>  CONFIG_IKCONFIG=y
> @@ -27,22 +26,12 @@ CONFIG_ARC_PLAT_SIM=y
>  CONFIG_ARC_BUILTIN_DTB_NAME="nsim_700"
>  CONFIG_PREEMPT=y
>  # CONFIG_COMPACTION is not set
> -CONFIG_NET=y
> -CONFIG_PACKET=y
> -CONFIG_UNIX=y
> -CONFIG_UNIX_DIAG=y
> -CONFIG_NET_KEY=y
> -CONFIG_INET=y
> -# CONFIG_IPV6 is not set
>  CONFIG_DEVTMPFS=y
>  # CONFIG_STANDALONE is not set
>  # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>  # CONFIG_FIRMWARE_IN_KERNEL is not set
>  # CONFIG_BLK_DEV is not set
> -CONFIG_NETDEVICES=y
> -CONFIG_ARC_EMAC=y
> -CONFIG_LXT_PHY=y
> -# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> +# CONFIG_INPUT_MOUSEDEV is not set
>  # CONFIG_INPUT_KEYBOARD is not set
>  # CONFIG_INPUT_MOUSE is not set
>  # CONFIG_SERIO is not set
> @@ -55,11 +44,8 @@ CONFIG_SERIAL_ARC_CONSOLE=y
>  # CONFIG_HID is not set
>  # CONFIG_USB_SUPPORT is not set
>  # CONFIG_IOMMU_SUPPORT is not set
> -CONFIG_EXT2_FS=y
> -CONFIG_EXT2_FS_XATTR=y
>  CONFIG_TMPFS=y
>  # CONFIG_MISC_FILESYSTEMS is not set
> -CONFIG_NFS_FS=y
>  # CONFIG_ENABLE_WARN_DEPRECATED is not set
>  # CONFIG_ENABLE_MUST_CHECK is not set
>  # CONFIG_DEBUG_PREEMPT is not set
> diff --git a/arch/arc/configs/nsim_hs_defconfig b/arch/arc/configs/nsim_hs_defconfig
> index ebe9ebb92933..ad8e7e53ab26 100644
> --- a/arch/arc/configs/nsim_hs_defconfig
> +++ b/arch/arc/configs/nsim_hs_defconfig
> @@ -2,7 +2,6 @@
>  CONFIG_DEFAULT_HOSTNAME="ARCLinux"
>  # CONFIG_SWAP is not set
>  CONFIG_SYSVIPC=y
> -CONFIG_POSIX_MQUEUE=y
>  # CONFIG_CROSS_MEMORY_ATTACH is not set
>  CONFIG_HIGH_RES_TIMERS=y
>  CONFIG_IKCONFIG=y
> @@ -31,19 +30,12 @@ CONFIG_ISA_ARCV2=y
>  CONFIG_ARC_BUILTIN_DTB_NAME="nsim_hs"
>  CONFIG_PREEMPT=y
>  # CONFIG_COMPACTION is not set
> -CONFIG_NET=y
> -CONFIG_PACKET=y
> -CONFIG_UNIX=y
> -CONFIG_UNIX_DIAG=y
> -CONFIG_NET_KEY=y
> -CONFIG_INET=y
> -# CONFIG_IPV6 is not set
>  CONFIG_DEVTMPFS=y
>  # CONFIG_STANDALONE is not set
>  # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>  # CONFIG_FIRMWARE_IN_KERNEL is not set
>  # CONFIG_BLK_DEV is not set
> -# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> +# CONFIG_INPUT_MOUSEDEV is not set
>  # CONFIG_INPUT_KEYBOARD is not set
>  # CONFIG_INPUT_MOUSE is not set
>  # CONFIG_SERIO is not set
> @@ -56,11 +48,8 @@ CONFIG_SERIAL_ARC_CONSOLE=y
>  # CONFIG_HID is not set
>  # CONFIG_USB_SUPPORT is not set
>  # CONFIG_IOMMU_SUPPORT is not set
> -CONFIG_EXT2_FS=y
> -CONFIG_EXT2_FS_XATTR=y
>  CONFIG_TMPFS=y
>  # CONFIG_MISC_FILESYSTEMS is not set
> -CONFIG_NFS_FS=y
>  # CONFIG_ENABLE_WARN_DEPRECATED is not set
>  # CONFIG_ENABLE_MUST_CHECK is not set
>  # CONFIG_DEBUG_PREEMPT is not set
> diff --git a/arch/arc/configs/nsim_hs_smp_defconfig b/arch/arc/configs/nsim_hs_smp_defconfig
> index 4bde43278be6..d0e609e26bfb 100644
> --- a/arch/arc/configs/nsim_hs_smp_defconfig
> +++ b/arch/arc/configs/nsim_hs_smp_defconfig
> @@ -30,19 +30,12 @@ CONFIG_SMP=y
>  CONFIG_ARC_BUILTIN_DTB_NAME="nsim_hs_idu"
>  CONFIG_PREEMPT=y
>  # CONFIG_COMPACTION is not set
> -CONFIG_NET=y
> -CONFIG_PACKET=y
> -CONFIG_UNIX=y
> -CONFIG_UNIX_DIAG=y
> -CONFIG_NET_KEY=y
> -CONFIG_INET=y
> -# CONFIG_IPV6 is not set
>  CONFIG_DEVTMPFS=y
>  # CONFIG_STANDALONE is not set
>  # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>  # CONFIG_FIRMWARE_IN_KERNEL is not set
>  # CONFIG_BLK_DEV is not set
> -# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> +# CONFIG_INPUT_MOUSEDEV is not set
>  # CONFIG_INPUT_KEYBOARD is not set
>  # CONFIG_INPUT_MOUSE is not set
>  # CONFIG_SERIO is not set
> @@ -55,10 +48,7 @@ CONFIG_SERIAL_ARC_CONSOLE=y
>  # CONFIG_HID is not set
>  # CONFIG_USB_SUPPORT is not set
>  # CONFIG_IOMMU_SUPPORT is not set
> -CONFIG_EXT2_FS=y
> -CONFIG_EXT2_FS_XATTR=y
>  CONFIG_TMPFS=y
>  # CONFIG_MISC_FILESYSTEMS is not set
> -CONFIG_NFS_FS=y
>  # CONFIG_ENABLE_WARN_DEPRECATED is not set
>  # CONFIG_ENABLE_MUST_CHECK is not set
> 
