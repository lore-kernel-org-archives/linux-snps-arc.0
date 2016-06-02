From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:12 +0200
Subject: [RFC v3 10/45] cris: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-11-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 arch/cris/arch-v32/drivers/pci/dma.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/pci/dma.c b/arch/cris/arch-v32/drivers/pci/dma.c
index 8d5efa58cce1..1f0636793f0c 100644
--- a/arch/cris/arch-v32/drivers/pci/dma.c
+++ b/arch/cris/arch-v32/drivers/pci/dma.c
@@ -17,7 +17,7 @@
 #include <asm/io.h>
 
 static void *v32_dma_alloc(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp,  struct dma_attrs *attrs)
+		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
 	void *ret;
 
@@ -37,22 +37,21 @@ static void *v32_dma_alloc(struct device *dev, size_t size,
 }
 
 static void v32_dma_free(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, struct dma_attrs *attrs)
+		dma_addr_t dma_handle, unsigned long attrs)
 {
 	free_pages((unsigned long)vaddr, get_order(size));
 }
 
 static inline dma_addr_t v32_dma_map_page(struct device *dev,
 		struct page *page, unsigned long offset, size_t size,
-		enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		enum dma_data_direction direction, unsigned long attrs)
 {
 	return page_to_phys(page) + offset;
 }
 
 static inline int v32_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		int nents, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	printk("Map sg\n");
 	return nents;
-- 
1.9.1
