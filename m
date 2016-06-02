From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:10 +0200
Subject: [RFC v3 08/45] blackfin: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-9-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 arch/blackfin/kernel/dma-mapping.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/blackfin/kernel/dma-mapping.c b/arch/blackfin/kernel/dma-mapping.c
index 771afe6e4264..53fbbb61aa86 100644
--- a/arch/blackfin/kernel/dma-mapping.c
+++ b/arch/blackfin/kernel/dma-mapping.c
@@ -79,7 +79,7 @@ static void __free_dma_pages(unsigned long addr, unsigned int pages)
 }
 
 static void *bfin_dma_alloc(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, struct dma_attrs *attrs)
+		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
 	void *ret;
 
@@ -94,7 +94,7 @@ static void *bfin_dma_alloc(struct device *dev, size_t size,
 }
 
 static void bfin_dma_free(struct device *dev, size_t size, void *vaddr,
-		  dma_addr_t dma_handle, struct dma_attrs *attrs)
+		  dma_addr_t dma_handle, unsigned long attrs)
 {
 	__free_dma_pages((unsigned long)vaddr, get_pages(size));
 }
@@ -111,7 +111,7 @@ EXPORT_SYMBOL(__dma_sync);
 
 static int bfin_dma_map_sg(struct device *dev, struct scatterlist *sg_list,
 		int nents, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
@@ -139,7 +139,7 @@ static void bfin_dma_sync_sg_for_device(struct device *dev,
 
 static dma_addr_t bfin_dma_map_page(struct device *dev, struct page *page,
 		unsigned long offset, size_t size, enum dma_data_direction dir,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	dma_addr_t handle = (dma_addr_t)(page_address(page) + offset);
 
-- 
1.9.1
