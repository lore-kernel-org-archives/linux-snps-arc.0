From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 24 Nov 2015 04:21:28 +0000
Subject: + arc-convert-to-dma_map_ops.patch added to -mm tree
References: <564b9e3a.DaXj5xWV8Mzu1fPX%akpm@linux-foundation.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D2EEF@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Wednesday 18 November 2015 03:08 AM, akpm@linux-foundation.org wrote:
> The patch titled
>      Subject: arc: convert to dma_map_ops
> has been added to the -mm tree.  Its filename is
>      arc-convert-to-dma_map_ops.patch
>
> This patch should soon appear at
>     http://ozlabs.org/~akpm/mmots/broken-out/arc-convert-to-dma_map_ops.patch
> and later at
>     http://ozlabs.org/~akpm/mmotm/broken-out/arc-convert-to-dma_map_ops.patch
>
> Before you just go and hit "reply", please:
>    a) Consider who else should be cc'ed
>    b) Prefer to cc a suitable mailing list as well
>    c) Ideally: find the original patch on the mailing list and do a
>       reply-to-all to that, adding suitable additional cc's
>
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
>
> The -mm tree is included into linux-next and is updated
> there every 3-4 working days
>
> ------------------------------------------------------
> From: Christoph Hellwig <hch at lst.de>
> Subject: arc: convert to dma_map_ops
>
> Signed-off-by: Christoph Hellwig <hch at lst.de>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Signed-off-by: Andrew Morton <akpm at linux-foundation.org>
> ---
>
>  arch/arc/Kconfig                   |    1 
>  arch/arc/include/asm/dma-mapping.h |  187 ---------------------------
>  arch/arc/mm/dma.c                  |  151 +++++++++++++++------
>  3 files changed, 109 insertions(+), 230 deletions(-)
>
> diff -puN arch/arc/Kconfig~arc-convert-to-dma_map_ops arch/arc/Kconfig
> --- a/arch/arc/Kconfig~arc-convert-to-dma_map_ops
> +++ a/arch/arc/Kconfig
> @@ -38,6 +38,7 @@ config ARC
>  	select OF_EARLY_FLATTREE
>  	select PERF_USE_VMALLOC
>  	select HAVE_DEBUG_STACKOVERFLOW
> +	select HAVE_DMA_ATTRS
>  
>  config TRACE_IRQFLAGS_SUPPORT
>  	def_bool y
> diff -puN arch/arc/include/asm/dma-mapping.h~arc-convert-to-dma_map_ops arch/arc/include/asm/dma-mapping.h
> --- a/arch/arc/include/asm/dma-mapping.h~arc-convert-to-dma_map_ops
> +++ a/arch/arc/include/asm/dma-mapping.h
> @@ -11,192 +11,13 @@
>  #ifndef ASM_ARC_DMA_MAPPING_H
>  #define ASM_ARC_DMA_MAPPING_H
>  
> -#include <asm-generic/dma-coherent.h>
> -#include <asm/cacheflush.h>
> +extern struct dma_map_ops arc_dma_ops;
>  
> -void *dma_alloc_noncoherent(struct device *dev, size_t size,
> -			    dma_addr_t *dma_handle, gfp_t gfp);
> -
> -void dma_free_noncoherent(struct device *dev, size_t size, void *vaddr,
> -			  dma_addr_t dma_handle);
> -
> -void *dma_alloc_coherent(struct device *dev, size_t size,
> -			 dma_addr_t *dma_handle, gfp_t gfp);
> -
> -void dma_free_coherent(struct device *dev, size_t size, void *kvaddr,
> -		       dma_addr_t dma_handle);
> -
> -/* drivers/base/dma-mapping.c */
> -extern int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
> -			   void *cpu_addr, dma_addr_t dma_addr, size_t size);
> -extern int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
> -				  void *cpu_addr, dma_addr_t dma_addr,
> -				  size_t size);
> -
> -#define dma_mmap_coherent(d, v, c, h, s) dma_common_mmap(d, v, c, h, s)
> -#define dma_get_sgtable(d, t, v, h, s) dma_common_get_sgtable(d, t, v, h, s)
> -
> -/*
> - * streaming DMA Mapping API...
> - * CPU accesses page via normal paddr, thus needs to explicitly made
> - * consistent before each use
> - */
> -
> -static inline void __inline_dma_cache_sync(unsigned long paddr, size_t size,
> -					   enum dma_data_direction dir)
> -{
> -	switch (dir) {
> -	case DMA_FROM_DEVICE:
> -		dma_cache_inv(paddr, size);
> -		break;
> -	case DMA_TO_DEVICE:
> -		dma_cache_wback(paddr, size);
> -		break;
> -	case DMA_BIDIRECTIONAL:
> -		dma_cache_wback_inv(paddr, size);
> -		break;
> -	default:
> -		pr_err("Invalid DMA dir [%d] for OP @ %lx\n", dir, paddr);
> -	}
> -}
> -
> -void __arc_dma_cache_sync(unsigned long paddr, size_t size,
> -			  enum dma_data_direction dir);
> -
> -#define _dma_cache_sync(addr, sz, dir)			\
> -do {							\
> -	if (__builtin_constant_p(dir))			\
> -		__inline_dma_cache_sync(addr, sz, dir);	\
> -	else						\
> -		__arc_dma_cache_sync(addr, sz, dir);	\
> -}							\
> -while (0);
> -
> -static inline dma_addr_t
> -dma_map_single(struct device *dev, void *cpu_addr, size_t size,
> -	       enum dma_data_direction dir)
> -{
> -	_dma_cache_sync((unsigned long)cpu_addr, size, dir);
> -	return (dma_addr_t)cpu_addr;
> -}
> -
> -static inline void
> -dma_unmap_single(struct device *dev, dma_addr_t dma_addr,
> -		 size_t size, enum dma_data_direction dir)
> -{
> -}
> -
> -static inline dma_addr_t
> -dma_map_page(struct device *dev, struct page *page,
> -	     unsigned long offset, size_t size,
> -	     enum dma_data_direction dir)
> -{
> -	unsigned long paddr = page_to_phys(page) + offset;
> -	return dma_map_single(dev, (void *)paddr, size, dir);
> -}
> -
> -static inline void
> -dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
> -	       size_t size, enum dma_data_direction dir)
> -{
> -}
> -
> -static inline int
> -dma_map_sg(struct device *dev, struct scatterlist *sg,
> -	   int nents, enum dma_data_direction dir)
> -{
> -	struct scatterlist *s;
> -	int i;
> -
> -	for_each_sg(sg, s, nents, i)
> -		s->dma_address = dma_map_page(dev, sg_page(s), s->offset,
> -					       s->length, dir);
> -
> -	return nents;
> -}
> -
> -static inline void
> -dma_unmap_sg(struct device *dev, struct scatterlist *sg,
> -	     int nents, enum dma_data_direction dir)
> -{
> -	struct scatterlist *s;
> -	int i;
> -
> -	for_each_sg(sg, s, nents, i)
> -		dma_unmap_page(dev, sg_dma_address(s), sg_dma_len(s), dir);
> -}
> -
> -static inline void
> -dma_sync_single_for_cpu(struct device *dev, dma_addr_t dma_handle,
> -			size_t size, enum dma_data_direction dir)
> -{
> -	_dma_cache_sync(dma_handle, size, DMA_FROM_DEVICE);
> -}
> -
> -static inline void
> -dma_sync_single_for_device(struct device *dev, dma_addr_t dma_handle,
> -			   size_t size, enum dma_data_direction dir)
> -{
> -	_dma_cache_sync(dma_handle, size, DMA_TO_DEVICE);
> -}
> -
> -static inline void
> -dma_sync_single_range_for_cpu(struct device *dev, dma_addr_t dma_handle,
> -			      unsigned long offset, size_t size,
> -			      enum dma_data_direction direction)
> -{
> -	_dma_cache_sync(dma_handle + offset, size, DMA_FROM_DEVICE);
> -}
> -
> -static inline void
> -dma_sync_single_range_for_device(struct device *dev, dma_addr_t dma_handle,
> -				 unsigned long offset, size_t size,
> -				 enum dma_data_direction direction)
> -{
> -	_dma_cache_sync(dma_handle + offset, size, DMA_TO_DEVICE);
> -}
> -
> -static inline void
> -dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sglist, int nelems,
> -		    enum dma_data_direction dir)
> +static inline struct dma_map_ops *get_dma_ops(struct device *dev)
>  {
> -	int i;
> -	struct scatterlist *sg;
> -
> -	for_each_sg(sglist, sg, nelems, i)
> -		_dma_cache_sync((unsigned int)sg_virt(sg), sg->length, dir);
> -}
> -
> -static inline void
> -dma_sync_sg_for_device(struct device *dev, struct scatterlist *sglist,
> -		       int nelems, enum dma_data_direction dir)
> -{
> -	int i;
> -	struct scatterlist *sg;
> -
> -	for_each_sg(sglist, sg, nelems, i)
> -		_dma_cache_sync((unsigned int)sg_virt(sg), sg->length, dir);
> -}
> -
> -static inline int dma_supported(struct device *dev, u64 dma_mask)
> -{
> -	/* Support 32 bit DMA mask exclusively */
> -	return dma_mask == DMA_BIT_MASK(32);
> +	return &arc_dma_ops;
>  }
>  
> -static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
> -{
> -	return 0;
> -}
> -
> -static inline int dma_set_mask(struct device *dev, u64 dma_mask)
> -{
> -	if (!dev->dma_mask || !dma_supported(dev, dma_mask))
> -		return -EIO;
> -
> -	*dev->dma_mask = dma_mask;
> -
> -	return 0;
> -}
> +#include <asm-generic/dma-mapping-common.h>
>  
>  #endif
> diff -puN arch/arc/mm/dma.c~arc-convert-to-dma_map_ops arch/arc/mm/dma.c
> --- a/arch/arc/mm/dma.c~arc-convert-to-dma_map_ops
> +++ a/arch/arc/mm/dma.c
> @@ -17,18 +17,14 @@
>   */
>  
>  #include <linux/dma-mapping.h>
> -#include <linux/dma-debug.h>
> -#include <linux/export.h>
>  #include <asm/cache.h>
>  #include <asm/cacheflush.h>
>  
> -/*
> - * Helpers for Coherent DMA API.
> - */
> -void *dma_alloc_noncoherent(struct device *dev, size_t size,
> -			    dma_addr_t *dma_handle, gfp_t gfp)
> +
> +static void *arc_dma_alloc(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, gfp_t gfp, struct dma_attrs *attrs)
>  {
> -	void *paddr;
> +	void *paddr, *kvaddr;
>  
>  	/* This is linear addr (0x8000_0000 based) */
>  	paddr = alloc_pages_exact(size, gfp);
> @@ -38,22 +34,6 @@ void *dma_alloc_noncoherent(struct devic
>  	/* This is bus address, platform dependent */
>  	*dma_handle = (dma_addr_t)paddr;
>  
> -	return paddr;
> -}
> -EXPORT_SYMBOL(dma_alloc_noncoherent);
> -
> -void dma_free_noncoherent(struct device *dev, size_t size, void *vaddr,
> -			  dma_addr_t dma_handle)
> -{
> -	free_pages_exact((void *)dma_handle, size);
> -}
> -EXPORT_SYMBOL(dma_free_noncoherent);
> -
> -void *dma_alloc_coherent(struct device *dev, size_t size,
> -			 dma_addr_t *dma_handle, gfp_t gfp)
> -{
> -	void *paddr, *kvaddr;
> -
>  	/*
>  	 * IOC relies on all data (even coherent DMA data) being in cache
>  	 * Thus allocate normal cached memory
> @@ -65,22 +45,15 @@ void *dma_alloc_coherent(struct device *
>  	 *   -For coherent data, Read/Write to buffers terminate early in cache
>  	 *   (vs. always going to memory - thus are faster)
>  	 */
> -	if (is_isa_arcv2() && ioc_exists)
> -		return dma_alloc_noncoherent(dev, size, dma_handle, gfp);
> -
> -	/* This is linear addr (0x8000_0000 based) */
> -	paddr = alloc_pages_exact(size, gfp);
> -	if (!paddr)
> -		return NULL;
> +	if ((is_isa_arcv2() && ioc_exists) ||
> +	    dma_get_attr(DMA_ATTR_NON_CONSISTENT, attrs)
> +		return paddr;
>  
>  	/* This is kernel Virtual address (0x7000_0000 based) */
>  	kvaddr = ioremap_nocache((unsigned long)paddr, size);
>  	if (kvaddr == NULL)
>  		return NULL;
>  
> -	/* This is bus address, platform dependent */
> -	*dma_handle = (dma_addr_t)paddr;
> -
>  	/*
>  	 * Evict any existing L1 and/or L2 lines for the backing page
>  	 * in case it was used earlier as a normal "cached" page.
> @@ -95,26 +68,110 @@ void *dma_alloc_coherent(struct device *
>  
>  	return kvaddr;
>  }
> -EXPORT_SYMBOL(dma_alloc_coherent);
>  
> -void dma_free_coherent(struct device *dev, size_t size, void *kvaddr,
> -		       dma_addr_t dma_handle)
> +static void arc_dma_free(struct device *dev, size_t size, void *vaddr,
> +		dma_addr_t dma_handle, struct dma_attrs *attrs)
>  {
> -	if (is_isa_arcv2() && ioc_exists)
> -		return dma_free_noncoherent(dev, size, kvaddr, dma_handle);
> -
> -	iounmap((void __force __iomem *)kvaddr);
> +	if (!(is_isa_arcv2() && ioc_exists) ||
> +	    dma_get_attr(DMA_ATTR_NON_CONSISTENT, attrs))
> +		iounmap((void __force __iomem *)kvaddr);
>  
>  	free_pages_exact((void *)dma_handle, size);
>  }
> -EXPORT_SYMBOL(dma_free_coherent);
>  
>  /*
> - * Helper for streaming DMA...
> + * streaming DMA Mapping API...
> + * CPU accesses page via normal paddr, thus needs to explicitly made
> + * consistent before each use
>   */
> -void __arc_dma_cache_sync(unsigned long paddr, size_t size,
> -			  enum dma_data_direction dir)
> +static void _dma_cache_sync(unsigned long paddr, size_t size,
> +		enum dma_data_direction dir)
> +{
> +	switch (dir) {
> +	case DMA_FROM_DEVICE:
> +		dma_cache_inv(paddr, size);
> +		break;
> +	case DMA_TO_DEVICE:
> +		dma_cache_wback(paddr, size);
> +		break;
> +	case DMA_BIDIRECTIONAL:
> +		dma_cache_wback_inv(paddr, size);
> +		break;
> +	default:
> +		pr_err("Invalid DMA dir [%d] for OP @ %lx\n", dir, paddr);
> +	}
> +}
> +
> +static dma_addr_t arc_dma_map_page(struct device *dev, struct page *page,
> +		unsigned long offset, size_t size, enum dma_data_direction dir,
> +		struct dma_attrs *attrs)
> +{
> +	unsigned long paddr = page_to_phys(page) + offset;
> +	return dma_map_single(dev, (void *)paddr, size, dir);
> +}
> +
> +static int arc_dma_map_sg(struct device *dev, struct scatterlist *sg,
> +	   int nents, enum dma_data_direction dir, struct dma_attrs *attrs)
> +{
> +	struct scatterlist *s;
> +	int i;
> +
> +	for_each_sg(sg, s, nents, i)
> +		s->dma_address = dma_map_page(dev, sg_page(s), s->offset,
> +					       s->length, dir);
> +
> +	return nents;
> +}
> +
> +static void arc_dma_sync_single_for_cpu(struct device *dev,
> +		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
> +{
> +	_dma_cache_sync(dma_handle, size, DMA_FROM_DEVICE);
> +}
> +
> +static void arc_dma_sync_single_for_device(struct device *dev,
> +		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
>  {
> -	__inline_dma_cache_sync(paddr, size, dir);
> +	_dma_cache_sync(dma_handle, size, DMA_TO_DEVICE);
>  }
> -EXPORT_SYMBOL(__arc_dma_cache_sync);
> +
> +static void arm_dma_sync_sg_for_cpu(struct device *dev,
> +		struct scatterlist *sglist, int nelems,
> +		enum dma_data_direction dir)
> +{
> +	int i;
> +	struct scatterlist *sg;
> +
> +	for_each_sg(sglist, sg, nelems, i)
> +		_dma_cache_sync((unsigned int)sg_virt(sg), sg->length, dir);
> +}
> +
> +static void arc_dma_sync_sg_for_device(struct device *dev,
> +		struct scatterlist *sglist, int nelems,
> +		enum dma_data_direction dir)
> +{
> +	int i;
> +	struct scatterlist *sg;
> +
> +	for_each_sg(sglist, sg, nelems, i)
> +		_dma_cache_sync((unsigned int)sg_virt(sg), sg->length, dir);
> +}
> +
> +static int arc_dma_supported(struct device *dev, u64 dma_mask)
> +{
> +	/* Support 32 bit DMA mask exclusively */
> +	return dma_mask == DMA_BIT_MASK(32);
> +}
> +
> +struct dma_map_ops arc_dma_ops = {
> +	.alloc			= arc_dma_alloc,
> +	.free			= arc_dma_free,
> +	.map_page		= arc_dma_map_page,
> +	.map_sg			= arc_dma_map_sg,
> +	.sync_single_for_device	= arc_dma_sync_single_for_device,
> +	.sync_single_for_cpu	= arc_dma_sync_single_for_cpu,
> +	.sync_sg_for_cpu	= arc_dma_sync_sg_for_cpu,
> +	.sync_sg_for_dev	= arc_dma_sync_sg_for_device,
> +	.dma_supported		= arc_dma_supported,
> +};
> +EXPORT_SYMBOL(arc_dma_ops);
> _
>
> Patches currently in -mm which might be from hch at lst.de are
>
> dma-mapping-make-the-generic-coherent-dma-mmap-implementation-optional.patch
> arc-convert-to-dma_map_ops.patch
> avr32-convert-to-dma_map_ops.patch
> blackfin-convert-to-dma_map_ops.patch
> c6x-convert-to-dma_map_ops.patch
> cris-convert-to-dma_map_ops.patch
> nios2-convert-to-dma_map_ops.patch
> frv-convert-to-dma_map_ops.patch
> parisc-convert-to-dma_map_ops.patch
> mn10300-convert-to-dma_map_ops.patch
> m68k-convert-to-dma_map_ops.patch
> metag-convert-to-dma_map_ops.patch
> sparc-use-generic-dma_set_mask.patch
> tile-uninline-dma_set_mask.patch
> dma-mapping-always-provide-the-dma_map_ops-based-implementation.patch
> dma-mapping-remove-asm-generic-dma-coherenth.patch

Hi Christoph,

This patch in linux-next breaks ARC build.

Below is fixup patch which u can probably fold into your tree
------------>
>From d924a26542660cd1ac68f8f86f8b646835ef5179 Mon Sep 17 00:00:00 2001
From: Vineet Gupta <vgupta@synopsys.com>
Date: Tue, 24 Nov 2015 09:46:05 +0530
Subject: [PATCH] arc: fix wreakage of conversion to dma_map_ops

Obviously the initial patch was not build tested.

Reported-by: Anton Kolesov <akolesov at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/dma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index da289cb30ca5..695029f41a48 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -46,7 +46,7 @@ static void *arc_dma_alloc(struct device *dev, size_t size,
      *   (vs. always going to memory - thus are faster)
      */
     if ((is_isa_arcv2() && ioc_exists) ||
-        dma_get_attr(DMA_ATTR_NON_CONSISTENT, attrs)
+        dma_get_attr(DMA_ATTR_NON_CONSISTENT, attrs))
         return paddr;
 
     /* This is kernel Virtual address (0x7000_0000 based) */
@@ -74,7 +74,7 @@ static void arc_dma_free(struct device *dev, size_t size, void
*vaddr,
 {
     if (!(is_isa_arcv2() && ioc_exists) ||
         dma_get_attr(DMA_ATTR_NON_CONSISTENT, attrs))
-        iounmap((void __force __iomem *)kvaddr);
+        iounmap((void __force __iomem *)vaddr);
 
     free_pages_exact((void *)dma_handle, size);
 }
@@ -135,7 +135,7 @@ static void arc_dma_sync_single_for_device(struct device *dev,
     _dma_cache_sync(dma_handle, size, DMA_TO_DEVICE);
 }
 
-static void arm_dma_sync_sg_for_cpu(struct device *dev,
+static void arc_dma_sync_sg_for_cpu(struct device *dev,
         struct scatterlist *sglist, int nelems,
         enum dma_data_direction dir)
 {
@@ -171,7 +171,7 @@ struct dma_map_ops arc_dma_ops = {
     .sync_single_for_device    = arc_dma_sync_single_for_device,
     .sync_single_for_cpu    = arc_dma_sync_single_for_cpu,
     .sync_sg_for_cpu    = arc_dma_sync_sg_for_cpu,
-    .sync_sg_for_dev    = arc_dma_sync_sg_for_device,
+    .sync_sg_for_device    = arc_dma_sync_sg_for_device,
     .dma_supported        = arc_dma_supported,
 };
 EXPORT_SYMBOL(arc_dma_ops);
-- 
1.9.1


-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-arc-fix-wreakage-of-conversion-to-dma_map_ops.patch
Type: text/x-patch
Size: 2005 bytes
Desc: 0001-arc-fix-wreakage-of-conversion-to-dma_map_ops.patch
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20151124/046c337f/attachment.bin>
