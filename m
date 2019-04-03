From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 3 Apr 2019 16:34:02 +0000
Subject: [PATCH] ARC: [hsdk] Make it easier to add PAE40 region to DTB
In-Reply-To: <1554232683-8173-1-git-send-email-vgupta@synopsys.com>
References: <1554232683-8173-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1554309241.2797.20.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Tue, 2019-04-02@12:18 -0700, Vineet Gupta wrote:
> 1. Bump top level address-cells/size-cells nodes to 2 (to ensure all
>    down stream addresses are 64-bits, unless explicitly specified
>    otherwise (in "soc" bus with all peripherals)
> 
> 2. "memory" also specified with address/size 2
> 
> 3. Add a commented reference for PAE40 region beyond 4GB physical
>    address space

[see below]

> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/boot/dts/hsdk.dts | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
> index 69bc1c9e8e50..7425bb0f2d1b 100644
> --- a/arch/arc/boot/dts/hsdk.dts
> +++ b/arch/arc/boot/dts/hsdk.dts
> @@ -18,8 +18,8 @@
>  	model = "snps,hsdk";
>  	compatible = "snps,hsdk";
>  
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
>  
>  	chosen {
>  		bootargs = "earlycon=uart8250,mmio32,0xf0005000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1";
> @@ -105,7 +105,7 @@
>  		#size-cells = <1>;
>  		interrupt-parent = <&idu_intc>;
>  
> -		ranges = <0x00000000 0xf0000000 0x10000000>;
> +		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
>  
>  		cgu_rst: reset-controller at 8a0 {
>  			compatible = "snps,hsdk-reset";
> @@ -269,9 +269,10 @@
>  	};
>  
>  	memory at 80000000 {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
>  		device_type = "memory";
> -		reg = <0x80000000 0x40000000>;  /* 1 GiB */
> +		reg = <0x0 0x80000000 0x0 0x40000000>;  /* 1 GB lowmem */
> +		/*     0x1 0x00000000 0x0 0x40000000>;     1 GB highmem */

Could you please get rid of comment with reference for PAE40/HIGHMEM region in this patch?
It gives wrong expectations that if we uncomment it and enable PAE40 in config we'll get working system.
But it isn't true - we also need to remap AXI apertures appropriately.

Otherwise kernel will crush somewhere. Moreover kernel will crush for different reasons in case of launch
via U-boot and via MDB (because we remap AXI apertures in U-boot for internal purposes).

If you really want to keep this - I can send you patch with AXI apertures remapping we need to apply firstly.

Thanks.

>  	};
>  };
-- 
 Eugeniy Paltsev
