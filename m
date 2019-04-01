From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 1 Apr 2019 18:04:48 +0000
Subject: [PATCH] ARC: PAE40: don't panic and instead turn off hw ioc
In-Reply-To: <1553892336-29596-1-git-send-email-vgupta@synopsys.com>
References: <1553892336-29596-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1554141887.2797.3.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Fri, 2019-03-29@13:45 -0700, Vineet Gupta wrote:
> HSDK currently panics when built for HIGHMEM/ARC_HAS_PAE40 because ioc
> is enabled with default which doesn't for the 2 non contiguous memory
> nodes.
> 
> So get PAE working with ioc disabled instead
> 
> Tested with !PAE40 by forcing @ioc_enable=0 and running the glibc
> testsuite over ssh
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/mm/cache.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
> index 4135abec3fb0..63e6e6504699 100644
> --- a/arch/arc/mm/cache.c
> +++ b/arch/arc/mm/cache.c
> @@ -113,10 +113,24 @@ static void read_decode_cache_bcr_arcv2(int cpu)
>  	}
>  
>  	READ_BCR(ARC_REG_CLUSTER_BCR, cbcr);
> -	if (cbcr.c)
> +	if (cbcr.c) {
>  		ioc_exists = 1;
> -	else
> +
> +		/*
> +		 * As for today we don't support both IOC and ZONE_HIGHMEM enabled
> +		 * simultaneously. This happens because as of today IOC aperture covers
> +		 * only ZONE_NORMAL (low mem) and any dma transactions outside this
> +		 * region won't be HW coherent.
> +		 * If we want to use both IOC and ZONE_HIGHMEM we can use
> +		 * bounce_buffer to handle dma transactions to HIGHMEM.
> +		 * Also it is possible to modify dma_direct cache ops or increase IOC
> +		 * aperture size if we are planning to use HIGHMEM without PAE.
> +		 */
> +		if (IS_ENABLED(CONFIG_HIGHMEM) || is_pae40_enabled())

As for today PAE40 couldn't be enabled without HIGHMEM for ARC, so probably we can
simplify this to

----------------------------->8----------------------------------
if (IS_ENABLED(CONFIG_HIGHMEM))
	ioc_enable = 0;
----------------------------->8----------------------------------

> +			ioc_enable = 0;
> +	} else {
>  		ioc_enable = 0;
> +	}
>  
>  	/* HS 2.0 didn't have AUX_VOL */
>  	if (cpuinfo_arc700[cpu].core.family > 0x51) {
> @@ -1158,19 +1172,6 @@ noinline void __init arc_ioc_setup(void)
>  	if (!ioc_enable)
>  		return;
>  
> -	/*
> -	 * As for today we don't support both IOC and ZONE_HIGHMEM enabled
> -	 * simultaneously. This happens because as of today IOC aperture covers
> -	 * only ZONE_NORMAL (low mem) and any dma transactions outside this
> -	 * region won't be HW coherent.
> -	 * If we want to use both IOC and ZONE_HIGHMEM we can use
> -	 * bounce_buffer to handle dma transactions to HIGHMEM.
> -	 * Also it is possible to modify dma_direct cache ops or increase IOC
> -	 * aperture size if we are planning to use HIGHMEM without PAE.
> -	 */
> -	if (IS_ENABLED(CONFIG_HIGHMEM))
> -		panic("IOC and HIGHMEM can't be used simultaneously");
> -
>  	/* Flush + invalidate + disable L1 dcache */
>  	__dc_disable();
>  
-- 
 Eugeniy Paltsev
