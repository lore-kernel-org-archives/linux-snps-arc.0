From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 12 Jul 2018 17:36:01 +0000
Subject: [PATCH] ARC: [plat-axs10x] Get rid of auto-selected
 CONFIG_AX10x options
References: <20180711171333.1745-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA230750110F6680C@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 07/11/2018 10:13 AM, Alexey Brodkin wrote:
> Commit 4fbaf649ebbc ("ARC: [plat-axs10x] auto-select AXS101 or AXS103 given the  ISA config")
> made selection of CONFIG_AXS10x option automatic so there's no point
> in keeping them in defconfigs.
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>

Can you regenerate the defconfigs - there seem to be more changes now than just those.

Also for the other patch for FUSE, is this something we will need day in day out -
I'm afraid we will start bloating stuff .

If you insist I can add it - but i's still prefer you build them using modules and
start testing that infra as well.

-Vineet

> ---
>  arch/arc/configs/axs101_defconfig     | 1 -
>  arch/arc/configs/axs103_defconfig     | 1 -
>  arch/arc/configs/axs103_smp_defconfig | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
> index 13500399ea86..55686cc4bb19 100644
> --- a/arch/arc/configs/axs101_defconfig
> +++ b/arch/arc/configs/axs101_defconfig
> @@ -23,7 +23,6 @@ CONFIG_MODULE_UNLOAD=y
>  CONFIG_MODULE_FORCE_UNLOAD=y
>  CONFIG_PARTITION_ADVANCED=y
>  CONFIG_ARC_PLAT_AXS10X=y
> -CONFIG_AXS101=y
>  CONFIG_ARC_CACHE_LINE_SHIFT=5
>  CONFIG_ARC_BUILTIN_DTB_NAME="axs101"
>  CONFIG_PREEMPT=y
> diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
> index a0576308cccd..20fb8e4e7337 100644
> --- a/arch/arc/configs/axs103_defconfig
> +++ b/arch/arc/configs/axs103_defconfig
> @@ -23,7 +23,6 @@ CONFIG_MODULE_UNLOAD=y
>  CONFIG_MODULE_FORCE_UNLOAD=y
>  CONFIG_PARTITION_ADVANCED=y
>  CONFIG_ARC_PLAT_AXS10X=y
> -CONFIG_AXS103=y
>  CONFIG_ISA_ARCV2=y
>  CONFIG_ARC_BUILTIN_DTB_NAME="axs103"
>  CONFIG_PREEMPT=y
> diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
> index 9bd590c22620..51d1e866ce94 100644
> --- a/arch/arc/configs/axs103_smp_defconfig
> +++ b/arch/arc/configs/axs103_smp_defconfig
> @@ -23,7 +23,6 @@ CONFIG_MODULE_UNLOAD=y
>  CONFIG_MODULE_FORCE_UNLOAD=y
>  CONFIG_PARTITION_ADVANCED=y
>  CONFIG_ARC_PLAT_AXS10X=y
> -CONFIG_AXS103=y
>  CONFIG_ISA_ARCV2=y
>  CONFIG_SMP=y
>  CONFIG_ARC_BUILTIN_DTB_NAME="axs103_idu"
