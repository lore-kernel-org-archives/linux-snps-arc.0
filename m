From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 24 Jul 2018 18:34:22 +0000
Subject: [PATCH] ARC: fix broken noncoherent cache ops
References: <20180724141302.4305-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B08382A@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 07/24/2018 07:13 AM, Eugeniy Paltsev wrote:
> All DMA devices on ARC haven't worked with SW cache control
> since commit a8eb92d02dd7 ("arc: fix arc_dma_{map,unmap}_page")
> This happens because we don't check direction argument at all in
> new implementation. Fix that.

Good find and I presume painful to debug.

Interesting though how the error tricked finally as the root cause was
arc_dma_sync_single*() were broken to begin with.

Prior to common ops rework, arc_dma_sync_single_for_device() would unconditionally
do cache wback, independent of the direction (by calling _dma_cache_sync helper
with TO_DEVICE). In 713a74624bba ("arc: simplify
arc_dma_sync_single_for_{cpu,device}") Christoph changed this to skip the helper.
And then in a8eb92d02dd7, the usage of these routines was prolifirated to the more
common kernel API dma_*map_page() API and that is where the original deficiency
showed up. I'll add this bit of history to changelog to remember this better.


> Fixies: commit a8eb92d02dd7 ("arc: fix arc_dma_{map,unmap}_page")
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> NOTE:
>  * This patch was stress tested on HSDK with bonie++ (usb and sdio)
>    with IOC disabled. The ethernet wasn't tested because it doesn't
>    work with SW cache control as for today (see STAR 9001336019)
>
>  arch/arc/mm/dma.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
> index 8c1071840979..cefb776a99ff 100644
> --- a/arch/arc/mm/dma.c
> +++ b/arch/arc/mm/dma.c
> @@ -129,14 +129,56 @@ int arch_dma_mmap(struct device *dev, struct vm_area_struct *vma,
>  	return ret;
>  }
>  
> +/*
> + * Cache operations depending on function and direction argument, inspired by
> + * https://lkml.org/lkml/2018/5/18/979
> + * "dma_sync_*_for_cpu and direction=TO_DEVICE (was Re: [PATCH 02/20]
> + * dma-mapping: provide a generic dma-noncoherent implementation)"
> + *
> + *          |   map          ==  for_device     |   unmap     ==  for_cpu
> + *          |----------------------------------------------------------------
> + * TO_DEV   |   writeback        writeback      |   none          none
> + * FROM_DEV |   invalidate       invalidate     |   invalidate    invalidate
> + * BIDIR    |   writeback+inv    writeback+inv  |   invalidate    invalidate
> + *
> + * NOTE: we don't check the validity of direction argument as it is done in
> + * upper layer functions (in include/linux/dma-mapping.h)
> + */
> +

Very nice !  Added to for-curr

Thx,
-Vineet

>  void arch_sync_dma_for_device(struct device *dev, phys_addr_t paddr,
>  		size_t size, enum dma_data_direction dir)
>  {
> -	dma_cache_wback(paddr, size);
> +	switch (dir) {
> +	case DMA_TO_DEVICE:
> +		dma_cache_wback(paddr, size);
> +		break;
> +
> +	case DMA_FROM_DEVICE:
> +		dma_cache_inv(paddr, size);
> +		break;
> +
> +	case DMA_BIDIRECTIONAL:
> +		dma_cache_wback_inv(paddr, size);
> +		break;
> +
> +	default:
> +		break;
> +	}
>  }
>  
>  void arch_sync_dma_for_cpu(struct device *dev, phys_addr_t paddr,
>  		size_t size, enum dma_data_direction dir)
>  {
> -	dma_cache_inv(paddr, size);
> +	switch (dir) {
> +	case DMA_TO_DEVICE:
> +		break;
> +
> +	case DMA_FROM_DEVICE:
> +	case DMA_BIDIRECTIONAL:
> +		dma_cache_inv(paddr, size);
> +		break;
> +
> +	default:
> +		break;
> +	}
>  }
