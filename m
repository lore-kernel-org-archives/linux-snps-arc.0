From: robh@kernel.org (Rob Herring)
Date: Mon, 17 Jul 2017 12:38:23 -0500
Subject: [PATCH 3/3 v8] ARC: hsdk: initial port for HSDK board
In-Reply-To: <20170712094023.23226-4-Eugeniy.Paltsev@synopsys.com>
References: <20170712094023.23226-1-Eugeniy.Paltsev@synopsys.com>
 <20170712094023.23226-4-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170717173823.lklxhoyylhdxjawa@rob-hp-laptop>
To: linux-snps-arc@lists.infradead.org

On Wed, Jul 12, 2017@12:40:23PM +0300, Eugeniy Paltsev wrote:
> From: Alexey Brodkin <abrodkin at synopsys.com>
> 
> This initial port adds support of ARC HS Development Kit board with some
> basic features such serial port, USB, SD/MMC and Ethernet.
> 
> Essentially we run Linux kernel on all 4 cores (i.e. utilize SMP) and
> heavily use IO Coherency for speeding-up DMA-aware peripherals.
> 
> Note as opposed to other ARC boards we link Linux kernel to
> 0x9000_0000 intentionally because cores 1 and 3 configured with DCCM
> situated at our more usual link base 0x8000_0000. We still can use
> memory region starting at 0x8000_0000 as we reallocate DCCM in our
> platform code.
> 
> Note that PAE remapping for DMA clients does not work due to an RTL bug,
> so CREG_PAE register must be programmed to all zeroes, otherwise it will
> cause problems with DMA to/from peripherals even if PAE40 is not used.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> Changes v7 -> v8:
>  * DTS: move cpu_intc, idu_intc, arcpct, timer, gfrc nodes to root
>    level and out of the cpus node.
>  * DTS: add vendor-specific compatible for ohci and ehci nodes.
>  * DTS: style fixes

Acked-by: Rob Herring <robh at kernel.org>

> +		ohci at 60000 {
> +			compatible = "snps,hsdk-v1.0-ohci", "generic-ohci";
> +			reg = <0x60000 0x100>;
> +			interrupts = <15>;
> +		};
> +
> +		ehci at 40000 {
> +			compatible = "snps,hsdk-v1.0-ehci", "generic-ehci";
> +			reg = <0x40000 0x100>;
> +			interrupts = <15>;
> +		};

Of course, now these compatibles need to be documented. You can do that 
in a separate follow-up patch.

Rob
