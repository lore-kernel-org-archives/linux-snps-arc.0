From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 22 Apr 2016 10:46:16 +0530
Subject: [PATCH 02/23] arc: select GPIOLIB directly
In-Reply-To: <1461142701-21096-3-git-send-email-linus.walleij@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
 <1461142701-21096-3-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5719B3A0.4060001@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Wednesday 20 April 2016 02:28 PM, Linus Walleij wrote:
> Instead of indirectly selecting GPIOLIB via the
> ARCH_REQUIRE_GPIOLIB symbol, just select GPIOLIB.
> 
> Cc: Michael B?sch <m at bues.ch>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org
> Signed-off-by: Linus Walleij <linus.walleij at linaro.org>
> ---
> Various arch maintainers:

It would be nice to get the cover latter as well to get more context. The whole
series didn't seem to be CCed to lkml either. Anyhow I found some reference on
linux-gpio patchworks and seems like a nice cleanup.

So for arch/arc/*

Acked-by: Vineet Gupta <vgupt at synopsys.com>

Thx,
-Vineet

> 
> either ACK this and I will merge it into the GPIO tree for v4.7
> anticipating no clashes, or you wait until I have the enabling patch
> upstream (patch 1 in this series, removing deps on
> ARCH_[WANTS_OPTIONAL|REQUIRES]_GPIOLIB), and you will be able to
> merge it to your arch trees yourselves for late v4.7
> (post GPIO tree merge) or for v4.8.
> 
> You can also ask me for an immutable branch if you prefer that, I
> will put the enabling patch on a branch and the patch for your arch
> on top and ask you to pull it.
> 
> Select your option from the menu, silence probably means I will
> merge it to the GPIO tree. Unless you are X86 or ARM in which case
> I will be cautious.
> ---
>  arch/arc/plat-axs10x/Kconfig | 2 +-
>  arch/arc/plat-tb10x/Kconfig  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arc/plat-axs10x/Kconfig b/arch/arc/plat-axs10x/Kconfig
> index 426ac4b8bb39..c54d1ae57fe0 100644
> --- a/arch/arc/plat-axs10x/Kconfig
> +++ b/arch/arc/plat-axs10x/Kconfig
> @@ -13,7 +13,7 @@ menuconfig ARC_PLAT_AXS10X
>  	select OF_GPIO
>  	select MIGHT_HAVE_PCI
>  	select GENERIC_IRQ_CHIP
> -	select ARCH_REQUIRE_GPIOLIB
> +	select GPIOLIB
>  	help
>  	  Support for the ARC AXS10x Software Development Platforms.
>  
> diff --git a/arch/arc/plat-tb10x/Kconfig b/arch/arc/plat-tb10x/Kconfig
> index d14b3d3c5dfd..149e0917645d 100644
> --- a/arch/arc/plat-tb10x/Kconfig
> +++ b/arch/arc/plat-tb10x/Kconfig
> @@ -21,7 +21,7 @@ menuconfig ARC_PLAT_TB10X
>  	select PINCTRL
>  	select PINCTRL_TB10X
>  	select PINMUX
> -	select ARCH_REQUIRE_GPIOLIB
> +	select GPIOLIB
>  	select GPIO_TB10X
>  	select TB10X_IRQC
>  	help
> 
