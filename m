From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:32 +0200
Subject: [RFC v3 30/45] metag: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-31-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 arch/metag/kernel/dma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/metag/kernel/dma.c b/arch/metag/kernel/dma.c
index e12368d02155..d68f498e82a1 100644
--- a/arch/metag/kernel/dma.c
+++ b/arch/metag/kernel/dma.c
@@ -172,7 +172,7 @@ out:
  * virtual and bus address for that space.
  */
 static void *metag_dma_alloc(struct device *dev, size_t size,
-		dma_addr_t *handle, gfp_t gfp, struct dma_attrs *attrs)
+		dma_addr_t *handle, gfp_t gfp, unsigned long attrs)
 {
 	struct page *page;
 	struct metag_vm_region *c;
@@ -268,7 +268,7 @@ no_page:
  * free a page as defined by the above mapping.
  */
 static void metag_dma_free(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, struct dma_attrs *attrs)
+		dma_addr_t dma_handle, unsigned long attrs)
 {
 	struct metag_vm_region *c;
 	unsigned long flags, addr;
@@ -331,7 +331,7 @@ no_area:
 
 static int metag_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	unsigned long flags, user_size, kern_size;
 	struct metag_vm_region *c;
@@ -482,7 +482,7 @@ static void dma_sync_for_cpu(void *vaddr, size_t size, int dma_direction)
 
 static dma_addr_t metag_dma_map_page(struct device *dev, struct page *page,
 		unsigned long offset, size_t size,
-		enum dma_data_direction direction, struct dma_attrs *attrs)
+		enum dma_data_direction direction, unsigned long attrs)
 {
 	dma_sync_for_device((void *)(page_to_phys(page) + offset), size,
 			    direction);
@@ -491,14 +491,14 @@ static dma_addr_t metag_dma_map_page(struct device *dev, struct page *page,
 
 static void metag_dma_unmap_page(struct device *dev, dma_addr_t dma_address,
 		size_t size, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	dma_sync_for_cpu(phys_to_virt(dma_address), size, direction);
 }
 
 static int metag_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 		int nents, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
@@ -516,7 +516,7 @@ static int metag_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 
 static void metag_dma_unmap_sg(struct device *dev, struct scatterlist *sglist,
 		int nhwentries, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	struct scatterlist *sg;
 	int i;
-- 
1.9.1
