From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 2 Nov 2015 06:54:28 +0000
Subject: [PATCH] arc: dts - remove default value if
 CONFIG_ARC_BUILTIN_DTB_NAME is blank
References: <1446333671-32095-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44CFCB9@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Sunday 01 November 2015 04:51 AM, Alexey Brodkin wrote:
> As of today default .dtb will be built (and subsequently will be built-in
> kernel binary) even if CONFIG_ARC_BUILTIN_DTB_NAME is not set.
>
> But it is possible we're going to use external .dtb and so we don't want to
> have .dtb built-in kernel binary.
>
> For example that could be the case with:
>  a) U-Boot which loads .dtb in DDR and passes its address to the kernel
>  b) OpenWRT which embeds .dtb in existing kernel binary
>
> This change excludes .dtb building if CONFIG_ARC_BUILTIN_DTB_NAME is
> blank.
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>

Rob has been doing a series to build all DTBs and he also provided a fix to ARC
makefiles to use common make variables which collides with ur patch.

@Alexey, can u wait until rc1 comes out and rebase it on top, assuming Rob's
series is merged in 4.4 window ?
If his doesn't, I will merge this as it is for rc2 !

-Vineet

> ---
>  arch/arc/Makefile          | 2 ++
>  arch/arc/boot/dts/Makefile | 6 ++----
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index 8a27a48..b0cb6de 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -94,7 +94,9 @@ head-y		:= arch/arc/kernel/head.o
>  core-y		+= arch/arc/
>  
>  # w/o this dtb won't embed into kernel binary
> +ifneq ($(CONFIG_ARC_BUILTIN_DTB_NAME),"")
>  core-y		+= arch/arc/boot/dts/
> +endif
>  
>  core-$(CONFIG_ARC_PLAT_SIM)	+= arch/arc/plat-sim/
>  core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
> diff --git a/arch/arc/boot/dts/Makefile b/arch/arc/boot/dts/Makefile
> index b0e3f19..4dcab5b 100644
> --- a/arch/arc/boot/dts/Makefile
> +++ b/arch/arc/boot/dts/Makefile
> @@ -1,13 +1,11 @@
>  # Built-in dtb
> -builtindtb-y		:= nsim_700
>  
>  ifneq ($(CONFIG_ARC_BUILTIN_DTB_NAME),"")
>  	builtindtb-y	:= $(patsubst "%",%,$(CONFIG_ARC_BUILTIN_DTB_NAME))
> +	obj-y   += $(builtindtb-y).dtb.o
> +	targets += $(builtindtb-y).dtb
>  endif
>  
> -obj-y   += $(builtindtb-y).dtb.o
> -targets += $(builtindtb-y).dtb
> -
>  .SECONDARY: $(obj)/$(builtindtb-y).dtb.S
>  
>  dtbs:  $(addprefix  $(obj)/, $(builtindtb-y).dtb)
