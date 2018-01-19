From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 19 Jan 2018 11:17:19 -0800
Subject: [PATCH v2] ARC: Force disable IOC if we don't want to use it
In-Reply-To: <20171218152920.4696-1-abrodkin@synopsys.com>
References: <20171218152920.4696-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <77182f1e-8dbc-6d82-f940-c2b7e7105570@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/2017 07:29 AM, Alexey Brodkin wrote:
> If software that was executed before Linux kernel [like boot-ROM or
> bootloader] enabled IOC but we'd like to not use it [mostly for
> debugging of weird DMA issues] we essentially need to disable IOC.
> So we do here.
>
> Note we will only disable IOC if "ioc_enable" variable is force set to 0.
> As of today that's only possible either before building right in
> arch/arc/mm/cache.c or via debugger on target reght before execution of
> the kernel starts.
>
> We may make "ioc_enable" a boot-parameter later though.
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>
> Chnages in v2:
>   * Now disabling really works as in v1 we never entered
>     disabling code if ioc_enable=0.
>   * Do nothing if IOC was not enabled
>
>   arch/arc/mm/cache.c | 42 ++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 40 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
> index 69f77c113875..9cadf7b779ed 100644
> --- a/arch/arc/mm/cache.c
> +++ b/arch/arc/mm/cache.c
> @@ -1186,6 +1186,40 @@ noinline void __init arc_ioc_setup(void)
>   	__dc_enable();
>   }
>   
> +/*
> + * Disabling of IOC is quite a tricky action because
> + * nobody knows what happens if there're IOC-ahndled tarnsactions in flight
> + * when we're disabling IOC.
> + *
> + * And the problem is external DMA masters [that were initialized and set in a
> + * bootlaoder that was executed before we got here] might continue to send data
> + * to memory even at this point and we have no way to prevent that.

Isn't this a sufficient red flag to warrant NOT adding this to kernel !

I agree that the use case is bring up of a new RTL version etc with bootloader 
already in there - but in that case can we NOT bypass those and run the kernel 
bare metal ?

> + *
> + * That said it's much safer to not enable IOC at all anywhere before
> + * in boot-ROM, bootloader etc but if we do need to disable it in Linux kernel
> + * it should be done as early as possible and made by master core while all
> + * slaves aren't active.
> + *

Again this is like saying - this is Pandora's Box - don't open it - which is more 
of a invitation for others to actually open it !

> + */
> +noinline void __init arc_ioc_disable(void)
> +{
> +	/* Exit if IOC was never enabled */
> +	if (!read_aux_reg(ARC_REG_IO_COH_ENABLE))
> +		return;
> +
> +	/* Flush + invalidate + disable L1 dcache */
> +	__dc_disable();
> +
> +	/* Flush + invalidate SLC */
> +	if (read_aux_reg(ARC_REG_SLC_BCR))
> +		slc_entire_op(OP_FLUSH_N_INV);
> +
> +	write_aux_reg(ARC_REG_IO_COH_ENABLE, 0);
> +
> +	/* Re-enable L1 dcache */
> +	__dc_enable();
> +}
> +
>   /*
>    * Cache related boot time checks/setups only needed on master CPU:
>    *  - Geometry checks (kernel build and hardware agree: e.g. L1_CACHE_BYTES)
> @@ -1247,8 +1281,12 @@ void __init arc_cache_init_master(void)
>   	if (is_isa_arcv2() && l2_line_sz && !slc_enable)
>   		arc_slc_disable();
>   
> -	if (is_isa_arcv2() && ioc_enable)
> -		arc_ioc_setup();
> +	if (is_isa_arcv2()) {
> +		if (ioc_enable)
> +			arc_ioc_setup();
> +		else if (ioc_exists)
> +			arc_ioc_disable();
> +	}
>   
>   	if (is_isa_arcv2() && ioc_enable) {
>   		__dma_cache_wback_inv = __dma_cache_wback_inv_ioc;
