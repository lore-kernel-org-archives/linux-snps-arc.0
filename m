From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Sat, 15 Jul 2017 18:24:03 -0700
Subject: semantics of dma_map_single()
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <dc128260-6641-828a-3bb6-c2f0b4f09f78@synopsys.com>
To: linux-snps-arc@lists.infradead.org

P.S. Apologies in advance for the explicit TO list, it seemed adding people who've 
touched the dma mapping code (for ARC atleast), would respond sooner ;-)

The question is does dma_map_single() imply a single region (possibly > PAGE_SIZE) 
or does it imply PAGE_SIZE. Documentation/DMA-API* is not explicit about one or 
the other and the code below seems to point to "a" struct page, although it could 
also mean multiple pages, specially if the pages are contiguous, say as those 
returned by alloc_pages(with order > 0)


	static inline dma_addr_t dma_map_single_attrs(dev, size, dir, attrs)
	{
		addr = ops->map_page(dev,
			virt_to_page(ptr), <--- this is one struct page
			offset_in_page(ptr), size, dir, attrs);
	}

ARC dma_map_single() currently only handles cache coherency for only one struct 
page or PAGE_SIZE worth of memory, and we have a customer who seem to assume that 
it handles a region.

Looking at other arches dma mapping backend, it is not clear either what the 
semantics are.

Thx,
-Vineet
