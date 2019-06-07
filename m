From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 7 Jun 2019 15:29:45 +0000
Subject: [PATCH] ARC: [plat-hsdk]: enable DW SPI controller
In-Reply-To: <20190607144800.19234-1-Eugeniy.Paltsev@synopsys.com>
References: <20190607144800.19234-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB0120F4FE7C0E000AAAC5762DA1100@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

> -----Original Message-----
> From: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> Sent: Friday, June 7, 2019 5:48 PM
> To: linux-snps-arc at lists.infradead.org; Vineet Gupta <vgupta at synopsys.com>
> Cc: linux-kernel at vger.kernel.org; Alexey Brodkin <abrodkin at synopsys.com>; Eugeniy Paltsev
> <Eugeniy.Paltsev at synopsys.com>
> Subject: [PATCH] ARC: [plat-hsdk]: enable DW SPI controller
> 
> HSDK SoC has DW SPI controller. Enable it in preparation of
> enabling on-board SPI peripherals.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

Adding Rob and...

Acked-by: Alexey Brodkin <abrodkin at synopsys.com>

>  arch/arc/boot/dts/hsdk.dts      | 14 ++++++++++++++
>  arch/arc/configs/hsdk_defconfig |  3 +++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
> index e57b24dd02e7..42e1c961ba48 100644
> --- a/arch/arc/boot/dts/hsdk.dts
> +++ b/arch/arc/boot/dts/hsdk.dts
> @@ -11,6 +11,7 @@
>   */
>  /dts-v1/;
> 
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/reset/snps,hsdk-reset.h>
> 
>  / {
> @@ -233,6 +234,19 @@
>  			dma-coherent;
>  		};
> 
> +		spi0: spi at 20000 {
> +			compatible = "snps,dw-apb-ssi";
> +			reg = <0x20000 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <16>;
> +			num-cs = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&input_clk>;
> +			cs-gpios = <&creg_gpio 0 GPIO_ACTIVE_LOW>,
> +				   <&creg_gpio 1 GPIO_ACTIVE_LOW>;
> +		};
> +
>  		creg_gpio: gpio at 14b0 {
>  			compatible = "snps,creg-gpio-hsdk";
>  			reg = <0x14b0 0x4>;
> diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
> index 0c4411f50948..ccfa744fe755 100644
> --- a/arch/arc/configs/hsdk_defconfig
> +++ b/arch/arc/configs/hsdk_defconfig
> @@ -46,6 +46,9 @@ CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_8250_DW=y
>  CONFIG_SERIAL_OF_PLATFORM=y
>  # CONFIG_HW_RANDOM is not set
> +CONFIG_SPI=y
> +CONFIG_SPI_DESIGNWARE=y
> +CONFIG_SPI_DW_MMIO=y
>  CONFIG_GPIOLIB=y
>  CONFIG_GPIO_SYSFS=y
>  CONFIG_GPIO_DWAPB=y
> --
> 2.21.0
