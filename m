From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 24 Jan 2019 21:25:24 +0000
Subject: ensure dma_alloc_coherent always returns zeroed memory
References: <1546019189.2822.23.camel@synopsys.com>
 <20181228175806.GA16929@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014642C84B@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/28/18 9:58 AM, hch@lst.de wrote:
> On Fri, Dec 28, 2018@05:46:32PM +0000, Eugeniy Paltsev wrote:
>> What happens:
>>
>> First coherent allocation (PAL#1):
>> 1) allocate page via alloc_pages(__GFP_ZERO), got page vith paddr 0xbf2d6000
>> 2) zero it via memset [deep inside alloc_pages()]
>> 3) remap it as uncached via ioremap_nocache(), got vaddr 0x70004000
>> 4) flush and invalidate L1 and L2 lines which belongs to allocated page.
>> Everything is OK for now.
>>
>> Second coherent allocation (PAL#2):
>> 1) allocate page via alloc_pages(__GFP_ZERO), got page vith paddr 0xbf2d4000
>> 2) zero it via memset [deep inside alloc_pages()].
>> -> Ooops: ARC memset implementation (due to SW bug) calls 'prefetchw' instruction
>> for address which lies outside of memset area (it will be 0xbf2d6000 in this case)
>> So we got one modified (dirty) cache line in the beginning of previous coherent
>> buffer which has been already flushed and invalidated (in PAL#1).
>>
>> So if we put some real data in this buffer [via virtual (uncached) address)]
>> before this line is flushed - we will got corrupted data.
> We could instead do the memset on the remapped address, which would
> work around this prefetching issue:

Right, it probably would, but that would still be too fragile, there are other bad
things in non-dma scenarios which happen due to this.
This needed fixing and Eugeniy's fix is in upstream/master now

    2019-01-14 e6a72b7daeeb ARCv2: lib: memeset: fix doing prefetchw outside of
buffer 


>
> diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
> index 1525ac00fd02..7c3b47019079 100644
> --- a/arch/arc/mm/dma.c
> +++ b/arch/arc/mm/dma.c
> @@ -33,7 +33,7 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
>  	 */
>  	BUG_ON(gfp & __GFP_HIGHMEM);
>  
> -	page = alloc_pages(gfp | __GFP_ZERO, order);
> +	page = alloc_pages(gfp, order);
>  	if (!page)
>  		return NULL;
>  
> @@ -69,6 +69,7 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
>  	if (need_coh)
>  		dma_cache_wback_inv(paddr, size);
>  
> +	memset(kvaddr, 0, size);
>  	return kvaddr;
>  }
