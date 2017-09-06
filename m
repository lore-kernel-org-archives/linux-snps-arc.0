From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 6 Sep 2017 12:54:59 -0700
Subject: [PATCH] ARC: AXS10x: Add temporary quirk to reset ethernet IP
In-Reply-To: <20170906182108.16765-1-Eugeniy.Paltsev@synopsys.com>
References: <20170906182108.16765-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <948bc9d9-7cef-4574-2ec9-0e9b0e5e0772@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/06/2017 11:21 AM, Eugeniy Paltsev wrote:
> DW ethernet controller on AXS10x hangs sometimes after SW reset, so
> add temporary quirk to reset DW ethernet controller IP core.
> This quirk can be removed after axs10x reset driver
> (see http://patchwork.ozlabs.org/patch/800273/)
> or simple reset driver
> (see https://patchwork.kernel.org/patch/9903375/)
> will be available in upstream.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

Added to for-next !

Thx,

> ---
>   arch/arc/plat-axs10x/axs10x.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
> index f1ac679..cf14ebc 100644
> --- a/arch/arc/plat-axs10x/axs10x.c
> +++ b/arch/arc/plat-axs10x/axs10x.c
> @@ -111,6 +111,13 @@ static void __init axs10x_early_init(void)
>   
>   	axs10x_enable_gpio_intc_wire();
>   
> +	/*
> +	 * Reset ethernet IP core.
> +	 * TODO: get rid of this quirk after axs10x reset driver (or simple
> +	 * reset driver) will be available in upstream.
> +	 */
> +	iowrite32((1 << 5), (void __iomem *) CREG_MB_SW_RESET);
> +
>   	scnprintf(mb, 32, "MainBoard v%d", mb_rev);
>   	axs10x_print_board_ver(CREG_MB_VER, mb);
>   }
> 
