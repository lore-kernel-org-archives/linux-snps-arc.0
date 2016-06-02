From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:43 +0200
Subject: [RFC v3 41/45] tile: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-42-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 arch/tile/kernel/pci-dma.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/tile/kernel/pci-dma.c b/arch/tile/kernel/pci-dma.c
index b6bc0547a4f6..09bb774b39cd 100644
--- a/arch/tile/kernel/pci-dma.c
+++ b/arch/tile/kernel/pci-dma.c
@@ -34,7 +34,7 @@
 
 static void *tile_dma_alloc_coherent(struct device *dev, size_t size,
 				     dma_addr_t *dma_handle, gfp_t gfp,
-				     struct dma_attrs *attrs)
+				     unsigned long attrs)
 {
 	u64 dma_mask = (dev && dev->coherent_dma_mask) ?
 		dev->coherent_dma_mask : DMA_BIT_MASK(32);
@@ -78,7 +78,7 @@ static void *tile_dma_alloc_coherent(struct device *dev, size_t size,
  */
 static void tile_dma_free_coherent(struct device *dev, size_t size,
 				   void *vaddr, dma_addr_t dma_handle,
-				   struct dma_attrs *attrs)
+				   unsigned long attrs)
 {
 	homecache_free_pages((unsigned long)vaddr, get_order(size));
 }
@@ -202,7 +202,7 @@ static void __dma_complete_pa_range(dma_addr_t dma_addr, size_t size,
 
 static int tile_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 			   int nents, enum dma_data_direction direction,
-			   struct dma_attrs *attrs)
+			   unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
@@ -224,7 +224,7 @@ static int tile_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 
 static void tile_dma_unmap_sg(struct device *dev, struct scatterlist *sglist,
 			      int nents, enum dma_data_direction direction,
-			      struct dma_attrs *attrs)
+			      unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
@@ -240,7 +240,7 @@ static void tile_dma_unmap_sg(struct device *dev, struct scatterlist *sglist,
 static dma_addr_t tile_dma_map_page(struct device *dev, struct page *page,
 				    unsigned long offset, size_t size,
 				    enum dma_data_direction direction,
-				    struct dma_attrs *attrs)
+				    unsigned long attrs)
 {
 	BUG_ON(!valid_dma_direction(direction));
 
@@ -252,7 +252,7 @@ static dma_addr_t tile_dma_map_page(struct device *dev, struct page *page,
 
 static void tile_dma_unmap_page(struct device *dev, dma_addr_t dma_address,
 				size_t size, enum dma_data_direction direction,
-				struct dma_attrs *attrs)
+				unsigned long attrs)
 {
 	BUG_ON(!valid_dma_direction(direction));
 
@@ -343,7 +343,7 @@ EXPORT_SYMBOL(tile_dma_map_ops);
 
 static void *tile_pci_dma_alloc_coherent(struct device *dev, size_t size,
 					 dma_addr_t *dma_handle, gfp_t gfp,
-					 struct dma_attrs *attrs)
+					 unsigned long attrs)
 {
 	int node = dev_to_node(dev);
 	int order = get_order(size);
@@ -368,14 +368,14 @@ static void *tile_pci_dma_alloc_coherent(struct device *dev, size_t size,
  */
 static void tile_pci_dma_free_coherent(struct device *dev, size_t size,
 				       void *vaddr, dma_addr_t dma_handle,
-				       struct dma_attrs *attrs)
+				       unsigned long attrs)
 {
 	homecache_free_pages((unsigned long)vaddr, get_order(size));
 }
 
 static int tile_pci_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 			       int nents, enum dma_data_direction direction,
-			       struct dma_attrs *attrs)
+			       unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
@@ -400,7 +400,7 @@ static int tile_pci_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 static void tile_pci_dma_unmap_sg(struct device *dev,
 				  struct scatterlist *sglist, int nents,
 				  enum dma_data_direction direction,
-				  struct dma_attrs *attrs)
+				  unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
@@ -416,7 +416,7 @@ static void tile_pci_dma_unmap_sg(struct device *dev,
 static dma_addr_t tile_pci_dma_map_page(struct device *dev, struct page *page,
 					unsigned long offset, size_t size,
 					enum dma_data_direction direction,
-					struct dma_attrs *attrs)
+					unsigned long attrs)
 {
 	BUG_ON(!valid_dma_direction(direction));
 
@@ -429,7 +429,7 @@ static dma_addr_t tile_pci_dma_map_page(struct device *dev, struct page *page,
 static void tile_pci_dma_unmap_page(struct device *dev, dma_addr_t dma_address,
 				    size_t size,
 				    enum dma_data_direction direction,
-				    struct dma_attrs *attrs)
+				    unsigned long attrs)
 {
 	BUG_ON(!valid_dma_direction(direction));
 
@@ -531,7 +531,7 @@ EXPORT_SYMBOL(gx_pci_dma_map_ops);
 #ifdef CONFIG_SWIOTLB
 static void *tile_swiotlb_alloc_coherent(struct device *dev, size_t size,
 					 dma_addr_t *dma_handle, gfp_t gfp,
-					 struct dma_attrs *attrs)
+					 unsigned long attrs)
 {
 	gfp |= GFP_DMA;
 	return swiotlb_alloc_coherent(dev, size, dma_handle, gfp);
@@ -539,7 +539,7 @@ static void *tile_swiotlb_alloc_coherent(struct device *dev, size_t size,
 
 static void tile_swiotlb_free_coherent(struct device *dev, size_t size,
 				       void *vaddr, dma_addr_t dma_addr,
-				       struct dma_attrs *attrs)
+				       unsigned long attrs)
 {
 	swiotlb_free_coherent(dev, size, vaddr, dma_addr);
 }
-- 
1.9.1
