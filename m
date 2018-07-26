From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 26 Jul 2018 17:30:40 +0000
Subject: [PATCH v2 2/2] ARC: add SMP_CACHE_BYTES value validate
References: <20180726131544.3780-1-Eugeniy.Paltsev@synopsys.com>
 <20180726131544.3780-2-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B08404E@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 07/26/2018 06:15 AM, Eugeniy Paltsev wrote:
> Check that SMP_CACHE_BYTES (and hence ARCH_DMA_MINALIGN) is larger
> or equal to any cache line length by comparing it with values
> previously read from ARC cache BCR registers.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> Changes v1->v2:
>  * None.
>
>  arch/arc/mm/cache.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
> index 9dbe645ee127..b95365e1253a 100644
> --- a/arch/arc/mm/cache.c
> +++ b/arch/arc/mm/cache.c
> @@ -1246,6 +1246,16 @@ void __init arc_cache_init_master(void)
>  		}
>  	}
>  
> +	/*
> +	 * Check that SMP_CACHE_BYTES (and hence ARCH_DMA_MINALIGN) is larger
> +	 * or equal to any cache line length.
> +	 */
> +	BUILD_BUG_ON_MSG(L1_CACHE_BYTES > SMP_CACHE_BYTES,
> +			 "SMP_CACHE_BYTES must be >= any cache line length");
> +	if (is_isa_arcv2() && (l2_line_sz > SMP_CACHE_BYTES))
> +		panic("L2 Cache line [%d] > kernel Config [%d]\n",
> +		      l2_line_sz, SMP_CACHE_BYTES);
> +
>  	/* Note that SLC disable not formally supported till HS 3.0 */
>  	if (is_isa_arcv2() && l2_line_sz && !slc_enable)
>  		arc_slc_disable();

LGTM. Both applied.

Thx,
-Vineet
