From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:36 +0200
Subject: [RFC v3 34/45] nios2: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-35-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 arch/nios2/mm/dma-mapping.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/nios2/mm/dma-mapping.c b/arch/nios2/mm/dma-mapping.c
index 90422c367ed3..d800fad87896 100644
--- a/arch/nios2/mm/dma-mapping.c
+++ b/arch/nios2/mm/dma-mapping.c
@@ -59,7 +59,7 @@ static inline void __dma_sync_for_cpu(void *vaddr, size_t size,
 }
 
 static void *nios2_dma_alloc(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, struct dma_attrs *attrs)
+		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
 	void *ret;
 
@@ -84,7 +84,7 @@ static void *nios2_dma_alloc(struct device *dev, size_t size,
 }
 
 static void nios2_dma_free(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, struct dma_attrs *attrs)
+		dma_addr_t dma_handle, unsigned long attrs)
 {
 	unsigned long addr = (unsigned long) CAC_ADDR((unsigned long) vaddr);
 
@@ -93,7 +93,7 @@ static void nios2_dma_free(struct device *dev, size_t size, void *vaddr,
 
 static int nios2_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		int nents, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	int i;
 
@@ -113,7 +113,7 @@ static int nios2_dma_map_sg(struct device *dev, struct scatterlist *sg,
 static dma_addr_t nios2_dma_map_page(struct device *dev, struct page *page,
 			unsigned long offset, size_t size,
 			enum dma_data_direction direction,
-			struct dma_attrs *attrs)
+			unsigned long attrs)
 {
 	void *addr = page_address(page) + offset;
 
@@ -123,14 +123,14 @@ static dma_addr_t nios2_dma_map_page(struct device *dev, struct page *page,
 
 static void nios2_dma_unmap_page(struct device *dev, dma_addr_t dma_address,
 		size_t size, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	__dma_sync_for_cpu(phys_to_virt(dma_address), size, direction);
 }
 
 static void nios2_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
 		int nhwentries, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	void *addr;
 	int i;
-- 
1.9.1
