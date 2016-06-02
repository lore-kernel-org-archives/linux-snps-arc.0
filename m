From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:29 +0200
Subject: [RFC v3 27/45] hexagon: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-28-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 arch/hexagon/include/asm/dma-mapping.h | 1 -
 arch/hexagon/kernel/dma.c              | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/hexagon/include/asm/dma-mapping.h b/arch/hexagon/include/asm/dma-mapping.h
index aa6203464520..7ef58df909fc 100644
--- a/arch/hexagon/include/asm/dma-mapping.h
+++ b/arch/hexagon/include/asm/dma-mapping.h
@@ -26,7 +26,6 @@
 #include <linux/mm.h>
 #include <linux/scatterlist.h>
 #include <linux/dma-debug.h>
-#include <linux/dma-attrs.h>
 #include <asm/io.h>
 
 struct device;
diff --git a/arch/hexagon/kernel/dma.c b/arch/hexagon/kernel/dma.c
index 9e3ddf792bd3..b9017785fb71 100644
--- a/arch/hexagon/kernel/dma.c
+++ b/arch/hexagon/kernel/dma.c
@@ -51,7 +51,7 @@ static struct gen_pool *coherent_pool;
 
 static void *hexagon_dma_alloc_coherent(struct device *dev, size_t size,
 				 dma_addr_t *dma_addr, gfp_t flag,
-				 struct dma_attrs *attrs)
+				 unsigned long attrs)
 {
 	void *ret;
 
@@ -84,7 +84,7 @@ static void *hexagon_dma_alloc_coherent(struct device *dev, size_t size,
 }
 
 static void hexagon_free_coherent(struct device *dev, size_t size, void *vaddr,
-				  dma_addr_t dma_addr, struct dma_attrs *attrs)
+				  dma_addr_t dma_addr, unsigned long attrs)
 {
 	gen_pool_free(coherent_pool, (unsigned long) vaddr, size);
 }
@@ -105,7 +105,7 @@ static int check_addr(const char *name, struct device *hwdev,
 
 static int hexagon_map_sg(struct device *hwdev, struct scatterlist *sg,
 			  int nents, enum dma_data_direction dir,
-			  struct dma_attrs *attrs)
+			  unsigned long attrs)
 {
 	struct scatterlist *s;
 	int i;
@@ -172,7 +172,7 @@ static inline void dma_sync(void *addr, size_t size,
 static dma_addr_t hexagon_map_page(struct device *dev, struct page *page,
 				   unsigned long offset, size_t size,
 				   enum dma_data_direction dir,
-				   struct dma_attrs *attrs)
+				   unsigned long attrs)
 {
 	dma_addr_t bus = page_to_phys(page) + offset;
 	WARN_ON(size == 0);
-- 
1.9.1
