From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 12 Sep 2017 11:38:23 -0700
Subject: [PATCH] ARC: [plat-axs10x]: DTS: fix sdio ciu frequency
In-Reply-To: <20170912182045.20941-1-Eugeniy.Paltsev@synopsys.com>
References: <20170912182045.20941-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4df1bb54-5fa1-5089-7d96-799ccfc78fce@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/12/2017 11:20 AM, Eugeniy Paltsev wrote:
> DW sdio controller has external ciu clock divider controlled
> via register in SDIO IP. It divides sdio_ref_clk
> (which comes from CGU) by 16 for default. So default mmcclk
> clock (which comes to sdk_in) is 25000000 Hz.
>
> So fix wrong current value (50000000 Hz) to actual 25000000 Hz.

Is this a preventive fix or there are known issues with what we have today.
Is this triggered after addition of AXS clk driver ?

>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>   arch/arc/boot/dts/axs10x_mb.dtsi | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
> index 0ff7e07..7bdf581 100644
> --- a/arch/arc/boot/dts/axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
> @@ -44,7 +44,14 @@
>   
>   			mmcclk: mmcclk {
>   				compatible = "fixed-clock";
> -				clock-frequency = <50000000>;
> +				/*
> +				 * DW sdio controller has external ciu clock divider
> +				 * controlled via register in SDIO IP. It divides
> +				 * sdio_ref_clk (which comes from CGU) by 16 for
> +				 * default. So default mmcclk clock (which comes
> +				 * to sdk_in) is 25000000 Hz.
> +				 */
> +				clock-frequency = <25000000>;
>   				#clock-cells = <0>;
>   			};
>   
