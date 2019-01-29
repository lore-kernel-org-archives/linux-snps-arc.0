From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Jan 2019 09:21:39 -0800
Subject: [PATCH 1/2] ARCv2: Enable unaligned access in early ASM code
In-Reply-To: <20190116112951.10641-1-Eugeniy.Paltsev@synopsys.com>
References: <20190116112951.10641-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3c341dd9-f360-640e-a3c9-3291300d02ae@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 1/16/19 3:29 AM, Eugeniy Paltsev wrote:
> Even though we do enable AD bit in arc_init_IRQ() we need to do
> it in early ASM code otherwise we may face unaligned data until
> we reach arc_init_IRQ() because GCC starting from v8.1.0 actively
> generates unaligned data as it assumes that:
>  * ARCv2 always has support of unaliged data
>  * This support is turned on in runtime
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  arch/arc/kernel/head.S | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
> index 8b90d25a15cc..d5b7a572365a 100644
> --- a/arch/arc/kernel/head.S
> +++ b/arch/arc/kernel/head.S
> @@ -17,6 +17,9 @@
>  #include <asm/entry.h>
>  #include <asm/arcregs.h>
>  #include <asm/cache.h>
> +#ifdef CONFIG_ISA_ARCV2
> +#include <asm/irqflags-arcv2.h>
> +#endif

I presume there is no specific reason to include this conditionally.
irqflags.h already includes the right version.

>  
>  .macro CPU_EARLY_SETUP
>  
> @@ -47,6 +50,13 @@
>  	sr	r5, [ARC_REG_DC_CTRL]
>  
>  1:
> +
> +#ifdef CONFIG_ISA_ARCV2
> +	; Enable handling of unaligned access in the CPU as by default
> +	; this HW feature is disabled while GCC starting from 8.1.0
> +	; unconditionally uses it for ARC HS cores.
> +	flag    1 << STATUS_AD_BIT
> +#endif
>  .endm
>  
>  	.section .init.text, "ax", at progbits
> 
