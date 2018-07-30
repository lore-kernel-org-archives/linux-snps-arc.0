From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 30 Jul 2018 10:34:20 +0000
Subject: [PATCH 3/4] ARC: refactor arch/arc/mm/dma.c
In-Reply-To: <20180726091731.GC24209@lst.de>
References: <20180724101001.31965-1-Eugeniy.Paltsev@synopsys.com>
 <20180724101001.31965-4-Eugeniy.Paltsev@synopsys.com>
 <20180726091731.GC24209@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1532946859.3059.8.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 2018-07-26@11:17 +0200, Christoph Hellwig wrote:
> On Tue, Jul 24, 2018@01:10:00PM +0300, Eugeniy Paltsev wrote:
> > Refactoring, no functional change intended.
> >  
[snip]
> >  
> >  	*dma_handle = paddr;
> >  
> > +	/*
> > +	 * - A coherent buffer needs MMU mapping to enforce non-cachability
> > +	 * - A highmem page needs a virtual handle (hence MMU mapping)
> > +	 *   independent of cachability.
> > +	 * kvaddr is kernel Virtual address (0x7000_0000 based)
> > +	 */
> > +	if (PageHighMem(page) || need_coh) {
> 
> dma_alloc_attrs clears __GFP_HIGHMEM from the passed in gfp mask, so
> you'll never get a highmem page here.
> 

Nice catch, thanks.
Will remove check for highmem page in next patch version. 

> That also means you can merge this conditional with the one for the cache
> writeback and invalidation and kill the need_coh flag entirely.
> 
> >  		kvaddr = ioremap_nocache(paddr, size);
> >  		if (kvaddr == NULL) {
> >  			__free_pages(page, order);
> > @@ -81,11 +75,9 @@ void arch_dma_free(struct device *dev, size_t size, void *vaddr,
> >  {
> >  	phys_addr_t paddr = dma_handle;
> >  	struct page *page = virt_to_page(paddr);
> > -	int is_non_coh = 1;
> > -
> > -	is_non_coh = (attrs & DMA_ATTR_NON_CONSISTENT);
> > +	bool is_coh = !(attrs & DMA_ATTR_NON_CONSISTENT);
> >  
> > -	if (PageHighMem(page) || !is_non_coh)
> > +	if (PageHighMem(page) || is_coh)
> >  		iounmap((void __force __iomem *)vaddr);
> >  
> 
> Same here.
> 
> Also if you clean this up it would be great to take the per-device pfn offset
> into account, even if that isn't used anywhere on arc yet, that is call
> phys_to_dma and dma_to_phys to convert to an from the dma address.

Ok, I'll look at it.
Probably I'll implement it as a separate patch as it is irrelevant to this
patch series topic.

-- 
 Eugeniy Paltsev
