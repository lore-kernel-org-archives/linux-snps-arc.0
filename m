From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 10 Oct 2017 10:09:28 -0700
Subject: [RFC] ARC: [plat-hsdk]: Increase SDIO CIU frequency to 50000000Hz
In-Reply-To: <20171010161152.5604-1-Eugeniy.Paltsev@synopsys.com>
References: <20171010161152.5604-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a1a4863d-c9e4-5dd0-b4e0-8c5d7e7b32e3@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/10/2017 09:11 AM, Eugeniy Paltsev wrote:
> Increase SDIO CIU frequency from 12500000Hz to 50000000Hz by
> switching from the default divisor value (div-by-8) to the
> minimum possible value of the divisor (div-by-2) in HSDK platform
> code.

Please describe the problem first not the solution. That some SD cards don't work 
blah blah ....
You could add me as reported-by - just for completeness !

While I will test it to see if it cures my issue, I'll need Alexey to sign off / 
ack as well !

-Vineet

>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> NOTE: This patch can possibly fix last issue with SD card initialization
> fault.
>
>   arch/arc/boot/dts/hsdk.dts    | 11 ++++++-----
>   arch/arc/plat-hsdk/platform.c |  7 +++++++
>   2 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
> index 8adde1b..8f627c2 100644
> --- a/arch/arc/boot/dts/hsdk.dts
> +++ b/arch/arc/boot/dts/hsdk.dts
> @@ -137,14 +137,15 @@
>   			/*
>   			 * DW sdio controller has external ciu clock divider
>   			 * controlled via register in SDIO IP. Due to its
> -			 * unexpected default value (it should devide by 1
> -			 * but it devides by 8) SDIO IP uses wrong clock and
> +			 * unexpected default value (it should divide by 1
> +			 * but it divides by 8) SDIO IP uses wrong clock and
>   			 * works unstable (see STAR 9001204800)
> +			 * We switched to the minimum possible value of the
> +			 * divisor (div-by-2) in HSDK platform code.
>   			 * So add temporary fix and change clock frequency
> -			 * from 100000000 to 12500000 Hz until we fix dw sdio
> -			 * driver itself.
> +			 * to 50000000 Hz until we fix dw sdio driver itself.
>   			 */
> -			clock-frequency = <12500000>;
> +			clock-frequency = <50000000>;
>   			#clock-cells = <0>;
>   		};
>   
> diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
> index 744e62e..f0cdb13 100644
> --- a/arch/arc/plat-hsdk/platform.c
> +++ b/arch/arc/plat-hsdk/platform.c
> @@ -74,6 +74,10 @@ static void __init hsdk_set_cpu_freq_1ghz(void)
>   		pr_err("Failed to setup CPU frequency to 1GHz!");
>   }
>   
> +#define SDIO_BASE		(ARC_PERIPHERAL_BASE + 0xA000)
> +#define SDIO_UHS_REG_EXT	(SDIO_BASE + 0x108)
> +#define SDIO_UHS_REG_EXT_DIV_2	(2 << 30)
> +
>   static void __init hsdk_init_early(void)
>   {
>   	/*
> @@ -89,6 +93,9 @@ static void __init hsdk_init_early(void)
>   	/* Really apply settings made above */
>   	writel(1, (void __iomem *) CREG_PAE_UPDATE);
>   
> +	/* Switch SDIO external ciu clock divider from div-by-8 to div-by-2 */
> +	iowrite32(SDIO_UHS_REG_EXT_DIV_2, (void __iomem *) SDIO_UHS_REG_EXT);
> +
>   	/*
>   	 * Setup CPU frequency to 1GHz.
>   	 * TODO: remove it after smart hsdk pll driver will be introduced.
