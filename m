From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 30 Jun 2016 10:25:30 +0200
Subject: [PATCH v5 03/44] arc: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1467275171-6298-1-git-send-email-k.kozlowski@samsung.com>
References: <1467275019-30789-1-git-send-email-k.kozlowski@samsung.com>
 <1467275171-6298-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1467275171-6298-3-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
[for arc]
Acked-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/dma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 73d7e4c75b7d..3d1f467d1792 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -22,7 +22,7 @@
 
 
 static void *arc_dma_alloc(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, struct dma_attrs *attrs)
+		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
 	unsigned long order = get_order(size);
 	struct page *page;
@@ -90,7 +90,7 @@ static void *arc_dma_alloc(struct device *dev, size_t size,
 }
 
 static void arc_dma_free(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, struct dma_attrs *attrs)
+		dma_addr_t dma_handle, unsigned long attrs)
 {
 	struct page *page = virt_to_page(dma_handle);
 	int is_non_coh = 1;
@@ -129,7 +129,7 @@ static void _dma_cache_sync(phys_addr_t paddr, size_t size,
 
 static dma_addr_t arc_dma_map_page(struct device *dev, struct page *page,
 		unsigned long offset, size_t size, enum dma_data_direction dir,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	phys_addr_t paddr = page_to_phys(page) + offset;
 	_dma_cache_sync(paddr, size, dir);
@@ -137,7 +137,7 @@ static dma_addr_t arc_dma_map_page(struct device *dev, struct page *page,
 }
 
 static int arc_dma_map_sg(struct device *dev, struct scatterlist *sg,
-	   int nents, enum dma_data_direction dir, struct dma_attrs *attrs)
+	   int nents, enum dma_data_direction dir, unsigned long attrs)
 {
 	struct scatterlist *s;
 	int i;
-- 
1.9.1
