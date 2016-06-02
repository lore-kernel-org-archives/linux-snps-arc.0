From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:22 +0200
Subject: [RFC v3 20/45] xen: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-21-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 drivers/xen/swiotlb-xen.c | 14 +++++++-------
 include/xen/swiotlb-xen.h | 12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 7399782c0998..87e6035c9e81 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -294,7 +294,7 @@ error:
 void *
 xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 			   dma_addr_t *dma_handle, gfp_t flags,
-			   struct dma_attrs *attrs)
+			   unsigned long attrs)
 {
 	void *ret;
 	int order = get_order(size);
@@ -346,7 +346,7 @@ EXPORT_SYMBOL_GPL(xen_swiotlb_alloc_coherent);
 
 void
 xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
-			  dma_addr_t dev_addr, struct dma_attrs *attrs)
+			  dma_addr_t dev_addr, unsigned long attrs)
 {
 	int order = get_order(size);
 	phys_addr_t phys;
@@ -378,7 +378,7 @@ EXPORT_SYMBOL_GPL(xen_swiotlb_free_coherent);
 dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 				unsigned long offset, size_t size,
 				enum dma_data_direction dir,
-				struct dma_attrs *attrs)
+				unsigned long attrs)
 {
 	phys_addr_t map, phys = page_to_phys(page) + offset;
 	dma_addr_t dev_addr = xen_phys_to_bus(phys);
@@ -434,7 +434,7 @@ EXPORT_SYMBOL_GPL(xen_swiotlb_map_page);
  */
 static void xen_unmap_single(struct device *hwdev, dma_addr_t dev_addr,
 			     size_t size, enum dma_data_direction dir,
-				 struct dma_attrs *attrs)
+			     unsigned long attrs)
 {
 	phys_addr_t paddr = xen_bus_to_phys(dev_addr);
 
@@ -462,7 +462,7 @@ static void xen_unmap_single(struct device *hwdev, dma_addr_t dev_addr,
 
 void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 			    size_t size, enum dma_data_direction dir,
-			    struct dma_attrs *attrs)
+			    unsigned long attrs)
 {
 	xen_unmap_single(hwdev, dev_addr, size, dir, attrs);
 }
@@ -538,7 +538,7 @@ EXPORT_SYMBOL_GPL(xen_swiotlb_sync_single_for_device);
 int
 xen_swiotlb_map_sg_attrs(struct device *hwdev, struct scatterlist *sgl,
 			 int nelems, enum dma_data_direction dir,
-			 struct dma_attrs *attrs)
+			 unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
@@ -599,7 +599,7 @@ EXPORT_SYMBOL_GPL(xen_swiotlb_map_sg_attrs);
 void
 xen_swiotlb_unmap_sg_attrs(struct device *hwdev, struct scatterlist *sgl,
 			   int nelems, enum dma_data_direction dir,
-			   struct dma_attrs *attrs)
+			   unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index 8b2eb93ae8ba..7c35e279d1e3 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -9,30 +9,30 @@ extern int xen_swiotlb_init(int verbose, bool early);
 extern void
 *xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 			    dma_addr_t *dma_handle, gfp_t flags,
-			    struct dma_attrs *attrs);
+			    unsigned long attrs);
 
 extern void
 xen_swiotlb_free_coherent(struct device *hwdev, size_t size,
 			  void *vaddr, dma_addr_t dma_handle,
-			  struct dma_attrs *attrs);
+			  unsigned long attrs);
 
 extern dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 				       unsigned long offset, size_t size,
 				       enum dma_data_direction dir,
-				       struct dma_attrs *attrs);
+				       unsigned long attrs);
 
 extern void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 				   size_t size, enum dma_data_direction dir,
-				   struct dma_attrs *attrs);
+				   unsigned long attrs);
 extern int
 xen_swiotlb_map_sg_attrs(struct device *hwdev, struct scatterlist *sgl,
 			 int nelems, enum dma_data_direction dir,
-			 struct dma_attrs *attrs);
+			 unsigned long attrs);
 
 extern void
 xen_swiotlb_unmap_sg_attrs(struct device *hwdev, struct scatterlist *sgl,
 			   int nelems, enum dma_data_direction dir,
-			   struct dma_attrs *attrs);
+			   unsigned long attrs);
 
 extern void
 xen_swiotlb_sync_single_for_cpu(struct device *hwdev, dma_addr_t dev_addr,
-- 
1.9.1
