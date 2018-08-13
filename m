From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 13 Aug 2018 17:08:10 +0000
Subject: [PATCH v2 2/4] ARC: allow to use IOC and non-IOC DMA devices
 simultaneously
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075012B08C83D@us01wembx1.internal.synopsys.com>
References: <20180730162636.3556-1-Eugeniy.Paltsev@synopsys.com>
 <20180730162636.3556-3-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B08C83D@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1534180089.3962.68.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Mon, 2018-08-13@16:24 +0000, Vineet Gupta wrote:
> On 07/30/2018 09:26 AM, Eugeniy Paltsev wrote:
> > @@ -1263,11 +1254,7 @@ void __init arc_cache_init_master(void)
> >  	if (is_isa_arcv2() && ioc_enable)
> >  		arc_ioc_setup();
> >  
> > -	if (is_isa_arcv2() && ioc_enable) {
> > -		__dma_cache_wback_inv = __dma_cache_wback_inv_ioc;
> > -		__dma_cache_inv = __dma_cache_inv_ioc;
> > -		__dma_cache_wback = __dma_cache_wback_ioc;
> > -	} else if (is_isa_arcv2() && l2_line_sz && slc_enable) {
> > +	if (is_isa_arcv2() && l2_line_sz && slc_enable) {
> >  		__dma_cache_wback_inv = __dma_cache_wback_inv_slc;
> >  		__dma_cache_inv = __dma_cache_inv_slc;
> >  		__dma_cache_wback = __dma_cache_wback_slc;
> > diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
> > index cefb776a99ff..4d1466905e48 100644
> > --- a/arch/arc/mm/dma.c
> > +++ b/arch/arc/mm/dma.c
> > @@ -33,19 +33,7 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
> >  	if (!page)
> >  		return NULL;
> >  
> > -	/*
> > -	 * IOC relies on all data (even coherent DMA data) being in cache
> > -	 * Thus allocate normal cached memory
> > -	 *
> > -	 * The gains with IOC are two pronged:
> > -	 *   -For streaming data, elides need for cache maintenance, saving
> > -	 *    cycles in flush code, and bus bandwidth as all the lines of a
> > -	 *    buffer need to be flushed out to memory
> > -	 *   -For coherent data, Read/Write to buffers terminate early in cache
> > -	 *   (vs. always going to memory - thus are faster)
> > -	 */
> > -	if ((is_isa_arcv2() && ioc_enable) ||
> > -	    (attrs & DMA_ATTR_NON_CONSISTENT))
> > +	if (attrs & DMA_ATTR_NON_CONSISTENT)
> >  		need_coh = 0;
> >  
> >  	/*
> > @@ -95,8 +83,7 @@ void arch_dma_free(struct device *dev, size_t size, void *vaddr,
> >  	struct page *page = virt_to_page(paddr);
> >  	int is_non_coh = 1;
> >  
> > -	is_non_coh = (attrs & DMA_ATTR_NON_CONSISTENT) ||
> > -			(is_isa_arcv2() && ioc_enable);
> > +	is_non_coh = (attrs & DMA_ATTR_NON_CONSISTENT);
> >  
> >  	if (PageHighMem(page) || !is_non_coh)
> >  		iounmap((void __force __iomem *)vaddr);
> > @@ -182,3 +169,20 @@ void arch_sync_dma_for_cpu(struct device *dev, phys_addr_t paddr,
> >  		break;
> >  	}
> >  }
> 
> I think we have some shenanigans with @ioc_enable now.
> Do note that it was more of a debug hack using when the hw feature was introduced
> to be able to run same kernel on various FPGA bitfiles but just flicking a global
> variable via the debugger.
> 
> So per code below, if @ioc_enable is NOT set, we still use software assisted cache
> maintenance, but dma_{alloc,free} don't do use that variable. Have you tried
> testing the combination when @ioc_enable is set to 0 before boot ? And is that works ?

Yep, I tested that.
And it works fine with both @ioc_enable == 0 and @ioc_enable == 1
Note that we check this variable in arch_setup_dma_ops() function now.

So this arch_dma_{alloc,free} are used ONLY in case of software assisted cache maintenance.
That's why we had to do MMU mapping to enforce non-cachability regardless of @ioc_enable.


Previously [before this patch] we used this ops for both HW/SW assisted cache maintenance
that's why we checked @ioc_enable in arch_dma_{alloc,free}. (in case of HW assisted cache
maintenance we only allocate memory, and in case of SW assisted cache maintenance we 
allocate memory and do MMU mapping to enforce non-cachability)

> > +
> > +void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> > +			const struct iommu_ops *iommu, bool coherent)
> > +{
> > +	/*
> > +	 * IOC hardware snoops all DMA traffic keeping the caches consistent
> > +	 * with memory - eliding need for any explicit cache maintenance of
> > +	 * DMA buffers - so we can use dma_direct cache ops.
> > +	 */
> > +	if (is_isa_arcv2() && ioc_enable && coherent) {
> > +		set_dma_ops(dev, &dma_direct_ops);
> > +		dev_info(dev, "use dma_direct_ops cache ops\n");
> > +	} else {
> > +		set_dma_ops(dev, &dma_noncoherent_ops);
> > +		dev_info(dev, "use dma_noncoherent_ops cache ops\n");
> > +	}
> > +}
> 
> 
-- 
 Eugeniy Paltsev
