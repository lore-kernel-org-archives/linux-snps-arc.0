From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:13 +0200
Subject: [RFC v3 11/45] frv: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-12-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 arch/frv/mb93090-mb00/pci-dma-nommu.c | 8 ++++----
 arch/frv/mb93090-mb00/pci-dma.c       | 9 ++++-----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/frv/mb93090-mb00/pci-dma-nommu.c b/arch/frv/mb93090-mb00/pci-dma-nommu.c
index 082be49b5df0..90f2e4cb33d6 100644
--- a/arch/frv/mb93090-mb00/pci-dma-nommu.c
+++ b/arch/frv/mb93090-mb00/pci-dma-nommu.c
@@ -35,7 +35,7 @@ static DEFINE_SPINLOCK(dma_alloc_lock);
 static LIST_HEAD(dma_alloc_list);
 
 static void *frv_dma_alloc(struct device *hwdev, size_t size, dma_addr_t *dma_handle,
-		gfp_t gfp, struct dma_attrs *attrs)
+		gfp_t gfp, unsigned long attrs)
 {
 	struct dma_alloc_record *new;
 	struct list_head *this = &dma_alloc_list;
@@ -86,7 +86,7 @@ static void *frv_dma_alloc(struct device *hwdev, size_t size, dma_addr_t *dma_ha
 }
 
 static void frv_dma_free(struct device *hwdev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, struct dma_attrs *attrs)
+		dma_addr_t dma_handle, unsigned long attrs)
 {
 	struct dma_alloc_record *rec;
 	unsigned long flags;
@@ -107,7 +107,7 @@ static void frv_dma_free(struct device *hwdev, size_t size, void *vaddr,
 
 static int frv_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 		int nents, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	int i;
 	struct scatterlist *sg;
@@ -124,7 +124,7 @@ static int frv_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 
 static dma_addr_t frv_dma_map_page(struct device *dev, struct page *page,
 		unsigned long offset, size_t size,
-		enum dma_data_direction direction, struct dma_attrs *attrs)
+		enum dma_data_direction direction, unsigned long attrs)
 {
 	BUG_ON(direction == DMA_NONE);
 	flush_dcache_page(page);
diff --git a/arch/frv/mb93090-mb00/pci-dma.c b/arch/frv/mb93090-mb00/pci-dma.c
index 316b7b65348d..f585745b1abc 100644
--- a/arch/frv/mb93090-mb00/pci-dma.c
+++ b/arch/frv/mb93090-mb00/pci-dma.c
@@ -19,8 +19,7 @@
 #include <asm/io.h>
 
 static void *frv_dma_alloc(struct device *hwdev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp,
-		struct dma_attrs *attrs)
+		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
 	void *ret;
 
@@ -32,14 +31,14 @@ static void *frv_dma_alloc(struct device *hwdev, size_t size,
 }
 
 static void frv_dma_free(struct device *hwdev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, struct dma_attrs *attrs)
+		dma_addr_t dma_handle, unsigned long attrs)
 {
 	consistent_free(vaddr);
 }
 
 static int frv_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 		int nents, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	unsigned long dampr2;
 	void *vaddr;
@@ -69,7 +68,7 @@ static int frv_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 
 static dma_addr_t frv_dma_map_page(struct device *dev, struct page *page,
 		unsigned long offset, size_t size,
-		enum dma_data_direction direction, struct dma_attrs *attrs)
+		enum dma_data_direction direction, unsigned long attrs)
 {
 	flush_dcache_page(page);
 	return (dma_addr_t) page_to_phys(page) + offset;
-- 
1.9.1
