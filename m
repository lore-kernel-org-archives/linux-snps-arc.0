From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:09 +0200
Subject: [RFC v3 07/45] avr32: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-8-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 arch/avr32/mm/dma-coherent.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/avr32/mm/dma-coherent.c b/arch/avr32/mm/dma-coherent.c
index 92cf1fb2b3e6..fc51f4421933 100644
--- a/arch/avr32/mm/dma-coherent.c
+++ b/arch/avr32/mm/dma-coherent.c
@@ -99,7 +99,7 @@ static void __dma_free(struct device *dev, size_t size,
 }
 
 static void *avr32_dma_alloc(struct device *dev, size_t size,
-		dma_addr_t *handle, gfp_t gfp, struct dma_attrs *attrs)
+		dma_addr_t *handle, gfp_t gfp, unsigned long attrs)
 {
 	struct page *page;
 	dma_addr_t phys;
@@ -119,7 +119,7 @@ static void *avr32_dma_alloc(struct device *dev, size_t size,
 }
 
 static void avr32_dma_free(struct device *dev, size_t size,
-		void *cpu_addr, dma_addr_t handle, struct dma_attrs *attrs)
+		void *cpu_addr, dma_addr_t handle, unsigned long attrs)
 {
 	struct page *page;
 
@@ -142,7 +142,7 @@ static void avr32_dma_free(struct device *dev, size_t size,
 
 static dma_addr_t avr32_dma_map_page(struct device *dev, struct page *page,
 		unsigned long offset, size_t size,
-		enum dma_data_direction direction, struct dma_attrs *attrs)
+		enum dma_data_direction direction, unsigned long attrs)
 {
 	void *cpu_addr = page_address(page) + offset;
 
@@ -152,7 +152,7 @@ static dma_addr_t avr32_dma_map_page(struct device *dev, struct page *page,
 
 static int avr32_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 		int nents, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	int i;
 	struct scatterlist *sg;
-- 
1.9.1
