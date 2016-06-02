From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:37 +0200
Subject: [RFC v3 35/45] openrisc: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-36-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 arch/openrisc/kernel/dma.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/openrisc/kernel/dma.c b/arch/openrisc/kernel/dma.c
index 0b77ddb1ee07..50eb1f26c540 100644
--- a/arch/openrisc/kernel/dma.c
+++ b/arch/openrisc/kernel/dma.c
@@ -22,7 +22,6 @@
 #include <linux/dma-mapping.h>
 #include <linux/dma-debug.h>
 #include <linux/export.h>
-#include <linux/dma-attrs.h>
 
 #include <asm/cpuinfo.h>
 #include <asm/spr_defs.h>
@@ -83,7 +82,7 @@ page_clear_nocache(pte_t *pte, unsigned long addr,
 static void *
 or1k_dma_alloc(struct device *dev, size_t size,
 	       dma_addr_t *dma_handle, gfp_t gfp,
-	       struct dma_attrs *attrs)
+	       unsigned long attrs)
 {
 	unsigned long va;
 	void *page;
@@ -117,7 +116,7 @@ or1k_dma_alloc(struct device *dev, size_t size,
 
 static void
 or1k_dma_free(struct device *dev, size_t size, void *vaddr,
-	      dma_addr_t dma_handle, struct dma_attrs *attrs)
+	      dma_addr_t dma_handle, unsigned long attrs)
 {
 	unsigned long va = (unsigned long)vaddr;
 	struct mm_walk walk = {
@@ -137,7 +136,7 @@ static dma_addr_t
 or1k_map_page(struct device *dev, struct page *page,
 	      unsigned long offset, size_t size,
 	      enum dma_data_direction dir,
-	      struct dma_attrs *attrs)
+	      unsigned long attrs)
 {
 	unsigned long cl;
 	dma_addr_t addr = page_to_phys(page) + offset;
@@ -170,7 +169,7 @@ or1k_map_page(struct device *dev, struct page *page,
 static void
 or1k_unmap_page(struct device *dev, dma_addr_t dma_handle,
 		size_t size, enum dma_data_direction dir,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	/* Nothing special to do here... */
 }
@@ -178,14 +177,14 @@ or1k_unmap_page(struct device *dev, dma_addr_t dma_handle,
 static int
 or1k_map_sg(struct device *dev, struct scatterlist *sg,
 	    int nents, enum dma_data_direction dir,
-	    struct dma_attrs *attrs)
+	    unsigned long attrs)
 {
 	struct scatterlist *s;
 	int i;
 
 	for_each_sg(sg, s, nents, i) {
 		s->dma_address = or1k_map_page(dev, sg_page(s), s->offset,
-					       s->length, dir, NULL);
+					       s->length, dir, 0);
 	}
 
 	return nents;
@@ -194,13 +193,13 @@ or1k_map_sg(struct device *dev, struct scatterlist *sg,
 static void
 or1k_unmap_sg(struct device *dev, struct scatterlist *sg,
 	      int nents, enum dma_data_direction dir,
-	      struct dma_attrs *attrs)
+	      unsigned long attrs)
 {
 	struct scatterlist *s;
 	int i;
 
 	for_each_sg(sg, s, nents, i) {
-		or1k_unmap_page(dev, sg_dma_address(s), sg_dma_len(s), dir, NULL);
+		or1k_unmap_page(dev, sg_dma_address(s), sg_dma_len(s), dir, 0);
 	}
 }
 
-- 
1.9.1
