From: Evgeniy.Didin@synopsys.com (Evgeniy Didin)
Date: Wed, 28 Mar 2018 15:12:47 +0000
Subject: [PATCH] dma-mapping: don't clear GFP_ZERO in dma_alloc_attrs
In-Reply-To: <20180328133535.17302-2-hch@lst.de>
References: <20180328133535.17302-1-hch@lst.de>
 <20180328133535.17302-2-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1522249966.2593.14.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Adding linux-snps and linux-arch mailing lists.

> Revert the clearing of __GFP_ZERO in dma_alloc_attrs and move it to
> dma_direct_alloc for now.??While most common architectures always zero dma
> cohereny allocations (and x86 did so since day one) this is not documented
> and at least arc and s390 do not zero without the explicit __GFP_ZERO
> argument.
This patch fixed Ethernet issues on ARC HSDK.
https://www.spinics.net/lists/kernel/msg2762054.html

Tested-by: Evgeniy Didin <Evgeniy.Didin at synopsys.com>
> Fixes: 57bf5a8963f8 ("dma-mapping: clear harmful GFP_* flags in common code")
> Reported-by: Evgeniy Didin <Evgeniy.Didin at synopsys.com>
> Reported-by: Sebastian Ott <sebott at linux.vnet.ibm.com>
> Signed-off-by: Christoph Hellwig <hch at lst.de>
> ---
> ?include/linux/dma-mapping.h | 8 ++------
> ?lib/dma-direct.c????????????| 3 +++
> ?2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index eb9eab4ecd6d..12fedcba9a9a 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -518,12 +518,8 @@ static inline void *dma_alloc_attrs(struct device *dev, size_t size,
> ?	if (dma_alloc_from_dev_coherent(dev, size, dma_handle, &cpu_addr))
> ?		return cpu_addr;
> ?
> -	/*
> -	?* Let the implementation decide on the zone to allocate from, and
> -	?* decide on the way of zeroing the memory given that the memory
> -	?* returned should always be zeroed.
> -	?*/
> -	flag &= ~(__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM | __GFP_ZERO);
> +	/* let the implementation decide on the zone to allocate from: */
> +	flag &= ~(__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM);
> 
> ?	if (!arch_dma_alloc_attrs(&dev, &flag))
> ?		return NULL;
> diff --git a/lib/dma-direct.c b/lib/dma-direct.c
> index 1277d293d4da..c0bba30fef0a 100644
> --- a/lib/dma-direct.c
> +++ b/lib/dma-direct.c
> @@ -59,6 +59,9 @@ void *dma_direct_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
> ?	struct page *page = NULL;
> ?	void *ret;
> ?
> +	/* we always manually zero the memory once we are done: */
> +	gfp &= ~__GFP_ZERO;
> +
> ?	/* GFP_DMA32 and GFP_DMA are no ops without the corresponding zones: */
> ?	if (dev->coherent_dma_mask <= DMA_BIT_MASK(ARCH_ZONE_DMA_BITS))
> ?		gfp |= GFP_DMA;
