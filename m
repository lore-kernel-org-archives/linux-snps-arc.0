From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 18 Jan 2017 09:25:02 -0800
Subject: [PATCH] ARC: fix allnoconfig builds
In-Reply-To: <20170118115650.14591-1-abrodkin@synopsys.com>
References: <20170118115650.14591-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <77d1ee62-0cd8-bb2c-9397-f75b3dddb6bc@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 01/18/2017 03:57 AM, Alexey Brodkin wrote:
> In case of allnoconfig HAVE_MOD_ARCH_SPECIFIC=no
> because ARC_DW2_UNWIND=no as well.
>
> This enables default "struct mod_arch_specific" from
> ./include/asm-generic/module.h which clashes with ARC's one.
>
> Before e514943bbfe1 ("ARC: module: Fix !CONFIG_ARC_DW2_UNWIND builds")
> ARC's "struct mod_arch_specific" was hidden for !CONFIG_ARC_DW2_UNWIND
> builds but not anymore.
>
> So to make our life easier and escape more complicated ifdeffed constructions in
> sources let's unconditionally select CONFIG_HAVE_MOD_ARCH_SPECIFIC for ARC.
>
> Reported-by: Anton Kolesov <akolesov at synopsys.com>
> Fixes: e514943bbfe1 ("ARC: module: Fix !CONFIG_ARC_DW2_UNWIND builds")
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>

Thx for the fix Alexey. Since the offending patch is marked for stable inclusion
and not yet hit upstream, I'll squash this with that and can add your Tested-by /
Reviewed-by, SOB - which one would you prefer !

Thx,
-Vineet

> ---
>  arch/arc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index c75d290..283099c 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -29,7 +29,7 @@ config ARC
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
>  	select HAVE_MEMBLOCK
> -	select HAVE_MOD_ARCH_SPECIFIC if ARC_DW2_UNWIND
> +	select HAVE_MOD_ARCH_SPECIFIC
>  	select HAVE_OPROFILE
>  	select HAVE_PERF_EVENTS
>  	select HANDLE_DOMAIN_IRQ
