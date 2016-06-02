From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:23 +0200
Subject: [RFC v3 21/45] swiotlb: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-22-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 include/linux/swiotlb.h | 10 +++++-----
 lib/swiotlb.c           | 13 +++++++------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 017fced60242..5f81f8a187f2 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -6,7 +6,6 @@
 #include <linux/types.h>
 
 struct device;
-struct dma_attrs;
 struct page;
 struct scatterlist;
 
@@ -68,10 +67,10 @@ swiotlb_free_coherent(struct device *hwdev, size_t size,
 extern dma_addr_t swiotlb_map_page(struct device *dev, struct page *page,
 				   unsigned long offset, size_t size,
 				   enum dma_data_direction dir,
-				   struct dma_attrs *attrs);
+				   unsigned long attrs);
 extern void swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 			       size_t size, enum dma_data_direction dir,
-			       struct dma_attrs *attrs);
+			       unsigned long attrs);
 
 extern int
 swiotlb_map_sg(struct device *hwdev, struct scatterlist *sg, int nents,
@@ -83,12 +82,13 @@ swiotlb_unmap_sg(struct device *hwdev, struct scatterlist *sg, int nents,
 
 extern int
 swiotlb_map_sg_attrs(struct device *hwdev, struct scatterlist *sgl, int nelems,
-		     enum dma_data_direction dir, struct dma_attrs *attrs);
+		     enum dma_data_direction dir,
+		     unsigned long attrs);
 
 extern void
 swiotlb_unmap_sg_attrs(struct device *hwdev, struct scatterlist *sgl,
 		       int nelems, enum dma_data_direction dir,
-		       struct dma_attrs *attrs);
+		       unsigned long attrs);
 
 extern void
 swiotlb_sync_single_for_cpu(struct device *hwdev, dma_addr_t dev_addr,
diff --git a/lib/swiotlb.c b/lib/swiotlb.c
index 76f29ecba8f4..22e13a0e19d7 100644
--- a/lib/swiotlb.c
+++ b/lib/swiotlb.c
@@ -738,7 +738,7 @@ swiotlb_full(struct device *dev, size_t size, enum dma_data_direction dir,
 dma_addr_t swiotlb_map_page(struct device *dev, struct page *page,
 			    unsigned long offset, size_t size,
 			    enum dma_data_direction dir,
-			    struct dma_attrs *attrs)
+			    unsigned long attrs)
 {
 	phys_addr_t map, phys = page_to_phys(page) + offset;
 	dma_addr_t dev_addr = phys_to_dma(dev, phys);
@@ -807,7 +807,7 @@ static void unmap_single(struct device *hwdev, dma_addr_t dev_addr,
 
 void swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 			size_t size, enum dma_data_direction dir,
-			struct dma_attrs *attrs)
+			unsigned long attrs)
 {
 	unmap_single(hwdev, dev_addr, size, dir);
 }
@@ -877,7 +877,7 @@ EXPORT_SYMBOL(swiotlb_sync_single_for_device);
  */
 int
 swiotlb_map_sg_attrs(struct device *hwdev, struct scatterlist *sgl, int nelems,
-		     enum dma_data_direction dir, struct dma_attrs *attrs)
+		     enum dma_data_direction dir, unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
@@ -914,7 +914,7 @@ int
 swiotlb_map_sg(struct device *hwdev, struct scatterlist *sgl, int nelems,
 	       enum dma_data_direction dir)
 {
-	return swiotlb_map_sg_attrs(hwdev, sgl, nelems, dir, NULL);
+	return swiotlb_map_sg_attrs(hwdev, sgl, nelems, dir, 0);
 }
 EXPORT_SYMBOL(swiotlb_map_sg);
 
@@ -924,7 +924,8 @@ EXPORT_SYMBOL(swiotlb_map_sg);
  */
 void
 swiotlb_unmap_sg_attrs(struct device *hwdev, struct scatterlist *sgl,
-		       int nelems, enum dma_data_direction dir, struct dma_attrs *attrs)
+		       int nelems, enum dma_data_direction dir,
+		       unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
@@ -941,7 +942,7 @@ void
 swiotlb_unmap_sg(struct device *hwdev, struct scatterlist *sgl, int nelems,
 		 enum dma_data_direction dir)
 {
-	return swiotlb_unmap_sg_attrs(hwdev, sgl, nelems, dir, NULL);
+	return swiotlb_unmap_sg_attrs(hwdev, sgl, nelems, dir, 0);
 }
 EXPORT_SYMBOL(swiotlb_unmap_sg);
 
-- 
1.9.1
