From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 16 Jun 2017 11:28:04 -0700
Subject: [PATCH] arc: implement DMA_ATTR_NO_KERNEL_MAPPING
In-Reply-To: <20170616071143.16878-1-hch@lst.de>
References: <20170616071143.16878-1-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b48e5b75-5403-223e-d963-da97a09992be@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/16/2017 12:11 AM, Christoph Hellwig wrote:
> This way allocations like the NVMe HMB don't consume iomap space
> 
> Signed-off-by: Christoph Hellwig <hch at lst.de>
> ---
> 
> Note: compile tested only, I stumbled over this when researching dma api
> quirks for HMB support.
> 
>   arch/arc/mm/dma.c | 42 +++++++++++++++++++++++++++++-------------
>   1 file changed, 29 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
> index 2a07e6ecafbd..d8999ac88879 100644
> --- a/arch/arc/mm/dma.c
> +++ b/arch/arc/mm/dma.c
> @@ -28,13 +28,22 @@ static void *arc_dma_alloc(struct device *dev, size_t size,
>   	struct page *page;
>   	phys_addr_t paddr;
>   	void *kvaddr;
> -	int need_coh = 1, need_kvaddr = 0;
> +	bool need_cache_sync = true, need_kvaddr = false;
>   
>   	page = alloc_pages(gfp, order);
>   	if (!page)
>   		return NULL;
>   
>   	/*
> +	 * No-kernel mapping memoery doesn't need a kernel virtual address.
> +	 * But we do the initial cache flush to make sure we don't write back
> +	 * to from a previous mapping into the now device owned memory.
> +	 */
> +	if (attrs & DMA_ATTR_NO_KERNEL_MAPPING) {
> +		need_cache_sync = true;
> +		need_kvaddr = false;

This is re-setting to init values. I do understand that a reasonable compiler will 
elide those away. And maybe keeping them here just clarifies the semantics more. 
So ok !


> +
> +	/*
>   	 * IOC relies on all data (even coherent DMA data) being in cache
>   	 * Thus allocate normal cached memory
>   	 *
> @@ -45,17 +54,19 @@ static void *arc_dma_alloc(struct device *dev, size_t size,
>   	 *   -For coherent data, Read/Write to buffers terminate early in cache
>   	 *   (vs. always going to memory - thus are faster)
>   	 */
> -	if ((is_isa_arcv2() && ioc_enable) ||
> -	    (attrs & DMA_ATTR_NON_CONSISTENT))
> -		need_coh = 0;
> +	} else if ((is_isa_arcv2() && ioc_enable) ||
> +		   (attrs & DMA_ATTR_NON_CONSISTENT)) {
> +		need_cache_sync = false;
> +		need_kvaddr = true;

The conditions here can't really help decide need_kvaddr so best to leave it out 
and not use the "else if" construct. Let the various conditions set and reset 
these 2 knobs based on what is over-riding. e.g. DMA_ATTR_NO_KERNEL_MAPPING seems 
like an optimization hint from a subsys, but might be needed after all given the 
constraints of the architecture.


>   
>   	/*
>   	 * - A coherent buffer needs MMU mapping to enforce non-cachability
>   	 * - A highmem page needs a virtual handle (hence MMU mapping)
>   	 *   independent of cachability
>   	 */
> -	if (PageHighMem(page) || need_coh)
> -		need_kvaddr = 1;
> +	} else if (PageHighMem(page)) {
> +		need_kvaddr = true;
> +	}

Again why "else if".

Also need_coh mandates a kvaddr on ARC (despite DMA_ATTR_NO_KERNEL_MAPPING) since 
the uncached kernel mmu mapping is how you get the coherent semantics.

Also now I think about it, I don't like the name change from need_coh to 
need_cache_sync. conceptually we have dma_alloc_coherent() -> arc_dma_alloc()
to get coherent mem and those semantics are only guaranteed with a kernel mapping.

>   
>   	/* This is linear addr (0x8000_0000 based) */
>   	paddr = page_to_phys(page);
> @@ -83,7 +94,7 @@ static void *arc_dma_alloc(struct device *dev, size_t size,
>   	 * Currently flush_cache_vmap nukes the L1 cache completely which
>   	 * will be optimized as a separate commit
>   	 */
> -	if (need_coh)
> +	if (need_cache_sync)
>   		dma_cache_wback_inv(paddr, size);
>   
>   	return kvaddr;
> @@ -93,14 +104,19 @@ static void arc_dma_free(struct device *dev, size_t size, void *vaddr,
>   		dma_addr_t dma_handle, unsigned long attrs)
>   {
>   	phys_addr_t paddr = plat_dma_to_phys(dev, dma_handle);
> -	struct page *page = virt_to_page(paddr);
> -	int is_non_coh = 1;
>   
> -	is_non_coh = (attrs & DMA_ATTR_NON_CONSISTENT) ||
> -			(is_isa_arcv2() && ioc_enable);
> +	if (!(attrs & DMA_ATTR_NO_KERNEL_MAPPING)) {

Again by similar reasoning as above, arch can be forced to ignore 
DMA_ATTR_NO_KERNEL_MAPPING so it alone can't be used to decide whether the mapping 
exists or not.


> +		struct page *page = virt_to_page(paddr);
> +		bool need_iounmap = true;
> +
> +		if (!PageHighMem(page) &&
> +		    ((is_isa_arcv2() && ioc_enable) ||
> +		     (attrs & DMA_ATTR_NON_CONSISTENT)))
> +			need_iounmap = false;
>   
> -	if (PageHighMem(page) || !is_non_coh)
> -		iounmap((void __force __iomem *)vaddr);
> +		if (need_iounmap)
> +			iounmap((void __force __iomem *)vaddr);
> +	}
>   
>   	__free_pages(page, get_order(size));
>   }
