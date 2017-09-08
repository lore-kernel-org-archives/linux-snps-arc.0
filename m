From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 8 Sep 2017 11:56:37 -0700
Subject: [PATCH] ARC: HSDK: DTS: Temporary fix of sdio ciu frequency
In-Reply-To: <20170908184233.1779-1-Eugeniy.Paltsev@synopsys.com>
References: <20170908184233.1779-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3bed30b7-6efe-e3d4-a65a-b6816e87c45e@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/08/2017 11:42 AM, Eugeniy Paltsev wrote:
> DW sdio controller has external ciu clock devider controlled via
> register in SDIO IP. Due to its unexpected default value
> (it should devide by 1 but it devides by 8)
> SDIO IP uses wrong ciu clock and works unstable (see STAR 9001204800)
>
> So add temporary fix and change clock frequency from 100000000
> to 12500000 Hz until we fix dw sdio driver itself.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

Added.

Consider it bike shedding, but for next time, please bracket the platform patches as

ARC: [plat-xxx] abra ka dabra ....

-Vineet

> ---
>   arch/arc/boot/dts/hsdk.dts | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
> index 8412669..b922f3f 100644
> --- a/arch/arc/boot/dts/hsdk.dts
> +++ b/arch/arc/boot/dts/hsdk.dts
> @@ -127,7 +127,17 @@
>   
>   		mmcclk_ciu: mmcclk-ciu {
>   			compatible = "fixed-clock";
> -			clock-frequency = <100000000>;
> +			/*
> +			 * DW sdio controller has external ciu clock divider
> +			 * controlled via register in SDIO IP. Due to its
> +			 * unexpected default value (it should devide by 1
> +			 * but it devides by 8) SDIO IP uses wrong clock and
> +			 * works unstable (see STAR 9001204800)
> +			 * So add temporary fix and change clock frequency
> +			 * from 100000000 to 12500000 Hz until we fix dw sdio
> +			 * driver itself.
> +			 */
> +			clock-frequency = <12500000>;
>   			#clock-cells = <0>;
>   		};
>   
