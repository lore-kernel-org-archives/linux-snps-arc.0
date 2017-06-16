From: hch@lst.de (Christoph Hellwig)
Date: Fri, 16 Jun 2017 09:11:43 +0200
Subject: [PATCH] arc: implement DMA_ATTR_NO_KERNEL_MAPPING
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170616071143.16878-1-hch@lst.de>
To: linux-snps-arc@lists.infradead.org

This way allocations like the NVMe HMB don't consume iomap space

Signed-off-by: Christoph Hellwig <hch at lst.de>
---

Note: compile tested only, I stumbled over this when researching dma api
quirks for HMB support.

 arch/arc/mm/dma.c | 42 +++++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 2a07e6ecafbd..d8999ac88879 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -28,13 +28,22 @@ static void *arc_dma_alloc(struct device *dev, size_t size,
 	struct page *page;
 	phys_addr_t paddr;
 	void *kvaddr;
-	int need_coh = 1, need_kvaddr = 0;
+	bool need_cache_sync = true, need_kvaddr = false;
 
 	page = alloc_pages(gfp, order);
 	if (!page)
 		return NULL;
 
 	/*
+	 * No-kernel mapping memoery doesn't need a kernel virtual address.
+	 * But we do the initial cache flush to make sure we don't write back
+	 * to from a previous mapping into the now device owned memory.
+	 */
+	if (attrs & DMA_ATTR_NO_KERNEL_MAPPING) {
+		need_cache_sync = true;
+		need_kvaddr = false;
+
+	/*
 	 * IOC relies on all data (even coherent DMA data) being in cache
 	 * Thus allocate normal cached memory
 	 *
@@ -45,17 +54,19 @@ static void *arc_dma_alloc(struct device *dev, size_t size,
 	 *   -For coherent data, Read/Write to buffers terminate early in cache
 	 *   (vs. always going to memory - thus are faster)
 	 */
-	if ((is_isa_arcv2() && ioc_enable) ||
-	    (attrs & DMA_ATTR_NON_CONSISTENT))
-		need_coh = 0;
+	} else if ((is_isa_arcv2() && ioc_enable) ||
+		   (attrs & DMA_ATTR_NON_CONSISTENT)) {
+		need_cache_sync = false;
+		need_kvaddr = true;
 
 	/*
 	 * - A coherent buffer needs MMU mapping to enforce non-cachability
 	 * - A highmem page needs a virtual handle (hence MMU mapping)
 	 *   independent of cachability
 	 */
-	if (PageHighMem(page) || need_coh)
-		need_kvaddr = 1;
+	} else if (PageHighMem(page)) {
+		need_kvaddr = true;
+	}
 
 	/* This is linear addr (0x8000_0000 based) */
 	paddr = page_to_phys(page);
@@ -83,7 +94,7 @@ static void *arc_dma_alloc(struct device *dev, size_t size,
 	 * Currently flush_cache_vmap nukes the L1 cache completely which
 	 * will be optimized as a separate commit
 	 */
-	if (need_coh)
+	if (need_cache_sync)
 		dma_cache_wback_inv(paddr, size);
 
 	return kvaddr;
@@ -93,14 +104,19 @@ static void arc_dma_free(struct device *dev, size_t size, void *vaddr,
 		dma_addr_t dma_handle, unsigned long attrs)
 {
 	phys_addr_t paddr = plat_dma_to_phys(dev, dma_handle);
-	struct page *page = virt_to_page(paddr);
-	int is_non_coh = 1;
 
-	is_non_coh = (attrs & DMA_ATTR_NON_CONSISTENT) ||
-			(is_isa_arcv2() && ioc_enable);
+	if (!(attrs & DMA_ATTR_NO_KERNEL_MAPPING)) {
+		struct page *page = virt_to_page(paddr);
+		bool need_iounmap = true;
+
+		if (!PageHighMem(page) &&
+		    ((is_isa_arcv2() && ioc_enable) ||
+		     (attrs & DMA_ATTR_NON_CONSISTENT)))
+			need_iounmap = false;
 
-	if (PageHighMem(page) || !is_non_coh)
-		iounmap((void __force __iomem *)vaddr);
+		if (need_iounmap)
+			iounmap((void __force __iomem *)vaddr);
+	}
 
 	__free_pages(page, get_order(size));
 }
-- 
2.11.0
