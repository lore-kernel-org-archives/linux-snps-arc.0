From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:28 +0200
Subject: [RFC v3 26/45] h8300: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-27-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 arch/h8300/kernel/dma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/h8300/kernel/dma.c b/arch/h8300/kernel/dma.c
index eeb13d3f2424..3651da045806 100644
--- a/arch/h8300/kernel/dma.c
+++ b/arch/h8300/kernel/dma.c
@@ -12,7 +12,7 @@
 
 static void *dma_alloc(struct device *dev, size_t size,
 		       dma_addr_t *dma_handle, gfp_t gfp,
-		       struct dma_attrs *attrs)
+		       unsigned long attrs)
 {
 	void *ret;
 
@@ -32,7 +32,7 @@ static void *dma_alloc(struct device *dev, size_t size,
 
 static void dma_free(struct device *dev, size_t size,
 		     void *vaddr, dma_addr_t dma_handle,
-		     struct dma_attrs *attrs)
+		     unsigned long attrs)
 
 {
 	free_pages((unsigned long)vaddr, get_order(size));
@@ -41,14 +41,14 @@ static void dma_free(struct device *dev, size_t size,
 static dma_addr_t map_page(struct device *dev, struct page *page,
 				  unsigned long offset, size_t size,
 				  enum dma_data_direction direction,
-				  struct dma_attrs *attrs)
+				  unsigned long attrs)
 {
 	return page_to_phys(page) + offset;
 }
 
 static int map_sg(struct device *dev, struct scatterlist *sgl,
 		  int nents, enum dma_data_direction direction,
-		  struct dma_attrs *attrs)
+		  unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
-- 
1.9.1
