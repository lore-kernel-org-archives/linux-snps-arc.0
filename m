From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 20 May 2019 17:43:53 +0000
Subject: [PATCH 2/2] ARC: [plat-hsdk]: Add missing FIFO size entry in GMAC
 node
In-Reply-To: <cdd9b9c36ff1ac3a3b56dff4a90e9bfd89b48866.1558359611.git.joabreu@synopsys.com>
References: <cover.1558359611.git.joabreu@synopsys.com>
 <cdd9b9c36ff1ac3a3b56dff4a90e9bfd89b48866.1558359611.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1558374231.3147.2.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

Tested-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>


On Mon, 2019-05-20@15:43 +0200, Jose Abreu wrote:
> Add the binding for RX/TX fifo size of GMAC node.
> 
> Signed-off-by: Jose Abreu <joabreu at synopsys.com>
> Cc: Joao Pinto <jpinto at synopsys.com>
> Cc: Rob Herring <robh+dt at kernel.org>
> Cc: Mark Rutland <mark.rutland at arm.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>  arch/arc/boot/dts/hsdk.dts | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
> index b0f059377ab0..3bcd1edc4dcc 100644
> --- a/arch/arc/boot/dts/hsdk.dts
> +++ b/arch/arc/boot/dts/hsdk.dts
> @@ -196,6 +196,9 @@
>  			mac-address = [00 00 00 00 00 00]; /* Filled in by U-Boot */
>  			dma-coherent;
>  
> +			tx-fifo-depth = <4096>;
> +			rx-fifo-depth = <4096>;
> +
>  			mdio {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
-- 
 Eugeniy Paltsev
