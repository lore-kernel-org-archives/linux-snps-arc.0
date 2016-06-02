From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:11 +0200
Subject: [RFC v3 09/45] c6x: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-10-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 arch/c6x/include/asm/dma-mapping.h | 4 ++--
 arch/c6x/kernel/dma.c              | 9 ++++-----
 arch/c6x/mm/dma-coherent.c         | 4 ++--
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/c6x/include/asm/dma-mapping.h b/arch/c6x/include/asm/dma-mapping.h
index 6b5cd7b0cf32..5717b1e52d96 100644
--- a/arch/c6x/include/asm/dma-mapping.h
+++ b/arch/c6x/include/asm/dma-mapping.h
@@ -26,8 +26,8 @@ static inline struct dma_map_ops *get_dma_ops(struct device *dev)
 
 extern void coherent_mem_init(u32 start, u32 size);
 void *c6x_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
-		gfp_t gfp, struct dma_attrs *attrs);
+		gfp_t gfp, unsigned long attrs);
 void c6x_dma_free(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, struct dma_attrs *attrs);
+		dma_addr_t dma_handle, unsigned long attrs);
 
 #endif	/* _ASM_C6X_DMA_MAPPING_H */
diff --git a/arch/c6x/kernel/dma.c b/arch/c6x/kernel/dma.c
index 8a80f3a250c0..db4a6a301f5e 100644
--- a/arch/c6x/kernel/dma.c
+++ b/arch/c6x/kernel/dma.c
@@ -38,7 +38,7 @@ static void c6x_dma_sync(dma_addr_t handle, size_t size,
 
 static dma_addr_t c6x_dma_map_page(struct device *dev, struct page *page,
 		unsigned long offset, size_t size, enum dma_data_direction dir,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	dma_addr_t handle = virt_to_phys(page_address(page) + offset);
 
@@ -47,13 +47,13 @@ static dma_addr_t c6x_dma_map_page(struct device *dev, struct page *page,
 }
 
 static void c6x_dma_unmap_page(struct device *dev, dma_addr_t handle,
-		size_t size, enum dma_data_direction dir, struct dma_attrs *attrs)
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	c6x_dma_sync(handle, size, dir);
 }
 
 static int c6x_dma_map_sg(struct device *dev, struct scatterlist *sglist,
-		int nents, enum dma_data_direction dir, struct dma_attrs *attrs)
+		int nents, enum dma_data_direction dir, unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
@@ -67,8 +67,7 @@ static int c6x_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 }
 
 static void c6x_dma_unmap_sg(struct device *dev, struct scatterlist *sglist,
-		  int nents, enum dma_data_direction dir,
-		  struct dma_attrs *attrs)
+		  int nents, enum dma_data_direction dir, unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
diff --git a/arch/c6x/mm/dma-coherent.c b/arch/c6x/mm/dma-coherent.c
index f7ee63af2541..95e38ad27c69 100644
--- a/arch/c6x/mm/dma-coherent.c
+++ b/arch/c6x/mm/dma-coherent.c
@@ -74,7 +74,7 @@ static void __free_dma_pages(u32 addr, int order)
  * virtual and DMA address for that space.
  */
 void *c6x_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
-		gfp_t gfp, struct dma_attrs *attrs)
+		gfp_t gfp, unsigned long attrs)
 {
 	u32 paddr;
 	int order;
@@ -99,7 +99,7 @@ void *c6x_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
  * Free DMA coherent memory as defined by the above mapping.
  */
 void c6x_dma_free(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, struct dma_attrs *attrs)
+		dma_addr_t dma_handle, unsigned long attrs)
 {
 	int order;
 
-- 
1.9.1
