From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Mon, 9 May 2016 10:12:18 +0100
Subject: [RESEND PATCH 2/2 v6] arc: axs10x: Add DT bindings for I2S PLL
 Clock
In-Reply-To: <e98c3f738b3a8f6755793959d89b4e43c9410fb1.1461258787.git.joabreu@synopsys.com>
References: <cover.1461258787.git.joabreu@synopsys.com>
 <e98c3f738b3a8f6755793959d89b4e43c9410fb1.1461258787.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57305472.2000507@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,


On 02-05-2016 10:39, Jose Abreu wrote:
> Add device tree bindings for AXS10X I2S PLL Clock driver.
>
> Signed-off-by: Jose Abreu <joabreu at synopsys.com>
> Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
> Acked-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>
> Changes v5 -> v6:
> * Added 'clocks' field
>
> This patch was only introduced in v5.
>
> Cc: Carlos Palminha <palminha at synopsys.com>
> Cc: Rob Herring <robh at kernel.org>
> Cc: Pawel Moll <pawel.moll at arm.com>
> Cc: Mark Rutland <mark.rutland at arm.com>
> Cc: Ian Campbell <ijc+devicetree at hellion.org.uk>
> Cc: Kumar Gala <galak at codeaurora.org>
> Cc: Michael Turquette <mturquette at baylibre.com>
> Cc: Stephen Boyd <sboyd at codeaurora.org>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org
> Cc: devicetree at vger.kernel.org
> Cc: linux-kernel at vger.kernel.org
> Cc: linux-clk at vger.kernel.org
>
>  arch/arc/boot/dts/axs10x_mb.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
> index ab5d570..5c6489e 100644
> --- a/arch/arc/boot/dts/axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
> @@ -16,7 +16,20 @@
>  		ranges = <0x00000000 0xe0000000 0x10000000>;
>  		interrupt-parent = <&mb_intc>;
>  
> +		i2sclk: i2sclk at 100a0 {
> +			compatible = "snps,axs10x-i2s-pll-clock";
> +			reg = <0x100a0 0x10>;
> +			clocks = <&i2spll_clk>;
> +			#clock-cells = <0>;
> +		};
> +
>  		clocks {
> +			i2spll_clk: i2spll_clk {
> +				compatible = "fixed-clock";
> +				clock-frequency = <27000000>;
> +				#clock-cells = <0>;
> +			};
> +
>  			i2cclk: i2cclk {
>  				compatible = "fixed-clock";
>  				clock-frequency = <50000000>;

Can you apply this to arc-next? Main driver was already merged into clk-next. We
still have to check how to deal with the parent clock frequency that will change
in the next firmware release.

Best regards,
Jose Miguel Abreu
