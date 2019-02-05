From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 5 Feb 2019 11:42:12 +0000
Subject: [PATCH 2/2] arc: hsdk_defconfig: enable CONFIG_ARC_UBOOT_SUPPORT
In-Reply-To: <1549355535-22052-3-git-send-email-clabbe@baylibre.com>
References: <1549355535-22052-1-git-send-email-clabbe@baylibre.com>
 <1549355535-22052-3-git-send-email-clabbe@baylibre.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1549366931.27724.26.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Corentin,

In case of devboards (like HSDK) we really often disable bootloader and load
Linux image in memory via JTAG. Enabling CONFIG_ARC_UBOOT_SUPPORT by
default will break it as we will try to interpret some junk in a registers
as a pointers to bootargs/etc which aren't set by anyone in case of JTAG using.

So it isn't a good idea to have CONFIG_ARC_UBOOT_SUPPORT enabled by default.

On Tue, 2019-02-05@08:32 +0000, Corentin Labbe wrote:
> We have now a HSDK device in our kernelci lab, but kernel builded via
> the hsdk_defconfig ignore bootargs, so it cannot boot kernelci jobs yet.
> Furthermore, I think the probability is that devices will be booted more via
> uboot than by a debugger.
> 
> So this patch enable CONFIG_ARC_UBOOT_SUPPORT in hsdk_defconfig.
> 
> Signed-off-by: Corentin Labbe <clabbe at baylibre.com>
> ---
>  arch/arc/configs/hsdk_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
> index 0e5fd29ed238..b80e3ac5c93c 100644
> --- a/arch/arc/configs/hsdk_defconfig
> +++ b/arch/arc/configs/hsdk_defconfig
> @@ -9,6 +9,7 @@ CONFIG_NAMESPACES=y
>  # CONFIG_PID_NS is not set
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_BLK_DEV_RAM=y
> +CONFIG_ARC_UBOOT_SUPPORT=y
>  CONFIG_EMBEDDED=y
>  CONFIG_PERF_EVENTS=y
>  # CONFIG_VM_EVENT_COUNTERS is not set
-- 
 Eugeniy Paltsev
