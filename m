From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:44 +0200
Subject: [RFC v3 42/45] unicore32: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-43-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 arch/unicore32/mm/dma-swiotlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/unicore32/mm/dma-swiotlb.c b/arch/unicore32/mm/dma-swiotlb.c
index 16c08b2143a7..3e9f6489ba38 100644
--- a/arch/unicore32/mm/dma-swiotlb.c
+++ b/arch/unicore32/mm/dma-swiotlb.c
@@ -19,14 +19,14 @@
 
 static void *unicore_swiotlb_alloc_coherent(struct device *dev, size_t size,
 					    dma_addr_t *dma_handle, gfp_t flags,
-					    struct dma_attrs *attrs)
+					    unsigned long attrs)
 {
 	return swiotlb_alloc_coherent(dev, size, dma_handle, flags);
 }
 
 static void unicore_swiotlb_free_coherent(struct device *dev, size_t size,
 					  void *vaddr, dma_addr_t dma_addr,
-					  struct dma_attrs *attrs)
+					  unsigned long attrs)
 {
 	swiotlb_free_coherent(dev, size, vaddr, dma_addr);
 }
-- 
1.9.1
