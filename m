From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 18 Jun 2018 15:20:46 +0000
Subject: [PATCH] ARC: Add PCIe support for ARC HSDK platform
In-Reply-To: <3e9a2f384fd831fb2639ad99ec43ce0f019ac17c.1529333762.git.gustavo.pimentel@synopsys.com>
References: <3e9a2f384fd831fb2639ad99ec43ce0f019ac17c.1529333762.git.gustavo.pimentel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ba4b10e967fb39d18eba7a5c70abb167308481f5.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Gustavo,

On Mon, 2018-06-18@15:59 +0100, Gustavo Pimentel wrote:
> Add PCI support to the ARC HSDK platform allowing to use the generic PCI
> setup functions.

This is the first logically independent change, so put it in a separate patch.

> Add GPIO interrupt configuration function on ARC HSDK platform and
> configures it to PCI support.

That's the second change which is not directly tied to the first one
so please put it in a separate patch.

Than as compared to the first [very simple and obvious] change this
one warrants more verbose justification.

1. IMHO it worth adding more info to commit message explaining what problem
   you're solving and why you do it in this particular way.
   In case of HSDK we have intermediate INTC in for of DW APB GPIO controller
   which is used as a de-bounce logic for interrupt wires that come from outside the board.
   We cannot use existing "irq-dw-apb-ictl" driver here because all input lines
   are routed to corresponding output lines but not muxed into one line (this is
   configured in RTL and we cannot change this in software). But even if we add such
   a feature to "irq-dw-apb-ictl" driver that won't benefit us as higher-level INTC
   (in case of HSDK it is IDU) anyways has per-input control so adding fully-controller
   intermediate INTC will only bring some overhead on interrupt processing but no other
   benefits.
   Thus we just do one-time configuration of DW APP GPIO controller and forget about it.


> Signed-off-by: Gustavo Pimentel <gustavo.pimentel at synopsys.com>
> ---
>  arch/arc/plat-hsdk/Kconfig    |  1 +
>  arch/arc/plat-hsdk/platform.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/arch/arc/plat-hsdk/Kconfig b/arch/arc/plat-hsdk/Kconfig
> index 19ab3cf..556bc5e 100644
> --- a/arch/arc/plat-hsdk/Kconfig
> +++ b/arch/arc/plat-hsdk/Kconfig
> @@ -9,3 +9,4 @@ menuconfig ARC_SOC_HSDK
>  	bool "ARC HS Development Kit SOC"
>  	select CLK_HSDK
>  	select RESET_HSDK
> +	select MIGHT_HAVE_PCI
> diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
> index 2958aed..31adda7 100644
> --- a/arch/arc/plat-hsdk/platform.c
> +++ b/arch/arc/plat-hsdk/platform.c
> @@ -42,6 +42,45 @@ static void __init hsdk_init_per_cpu(unsigned int cpu)
>  #define SDIO_UHS_REG_EXT	(SDIO_BASE + 0x108)
>  #define SDIO_UHS_REG_EXT_DIV_2	(2 << 30)
>  
> +#define HSDK_GPIO_INTC          (ARC_PERIPHERAL_BASE + 0x3000)
> +#define GPIO_INTEN              (HSDK_GPIO_INTC + 0x30)
> +#define GPIO_INTMASK            (HSDK_GPIO_INTC + 0x34)
> +#define GPIO_INTTYPE_LEVEL      (HSDK_GPIO_INTC + 0x38)
> +#define GPIO_INT_POLARITY       (HSDK_GPIO_INTC + 0x3c)
> +
> +#define GPIO_BLUETOOTH_INT	0x00000001
> +#define GPIO_HAPS_INT		0x00000004
> +#define GPIO_AUDIO_INT		0x00000008
> +/* PMOD_A header */
> +#define GPIO_PIN_08_INT		0x00000100
> +#define GPIO_PIN_09_INT		0x00000200
> +#define GPIO_PIN_10_INT		0x00000400
> +#define GPIO_PIN_11_INT		0x00000800
> +/* PMOD_B header */
> +#define GPIO_PIN_12_INT		0x00001000
> +#define GPIO_PIN_13_INT		0x00002000
> +#define GPIO_PIN_14_INT		0x00004000
> +#define GPIO_PIN_15_INT		0x00008000
> +/* PMOD_C header */
> +#define GPIO_PIN_16_INT		0x00010000
> +#define GPIO_PIN_17_INT		0x00020000
> +#define GPIO_PIN_18_INT		0x00040000
> +#define GPIO_PIN_19_INT		0x00080000
> +#define GPIO_PIN_20_INT		0x00100000
> +#define GPIO_PIN_21_INT		0x00200000
> +#define GPIO_PIN_22_INT		0x00400000
> +#define GPIO_PIN_23_INT		0x00800000

Could you please run your patch through checkpatch.pl?
Here I guss newline is missing.

Also why adding those many defines if they are not really used
anywhere?

Instead maybe just add more informative pseudo-graphics as we
have in axs10x platform? See
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arc/plat-axs10x/axs10x.c

> +static void __init hsdk_enable_gpio_intc_wire(void)
> +{
> +	u32 val = GPIO_HAPS_INT;
> +
> +	iowrite32(0xffffffff, (void __iomem *) GPIO_INTMASK);
> +	iowrite32(~val, (void __iomem *) GPIO_INTMASK);
> +	iowrite32(0x00000000, (void __iomem *) GPIO_INTTYPE_LEVEL);
> +	iowrite32(0xffffffff, (void __iomem *) GPIO_INT_POLARITY);
> +	iowrite32(val, (void __iomem *) GPIO_INTEN);
> +}

I would suggest to have a map of really used lines and enable all of them
instead of adding one-by-one occasionally.

-Alexey
