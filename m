From: hch@lst.de (Christoph Hellwig)
Date: Fri, 18 May 2018 15:45:42 +0200
Subject: [PATCH 3/6] arc: simplify arc_dma_sync_single_for_{cpu,device}
In-Reply-To: <20180518134545.5036-1-hch@lst.de>
References: <20180518134545.5036-1-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180518134545.5036-4-hch@lst.de>
To: linux-snps-arc@lists.infradead.org

Remove the indirection through _dma_cache_sync.  Also move the functions
up a bit in the source file as we'll need them in more places soon.

Signed-off-by: Christoph Hellwig <hch at lst.de>
---
 arch/arc/mm/dma.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 1dcc404b5aec..98e21ce526be 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -153,6 +153,18 @@ static void _dma_cache_sync(phys_addr_t paddr, size_t size,
 	}
 }
 
+static void arc_dma_sync_single_for_device(struct device *dev,
+		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
+{
+	dma_cache_wback(dma_handle, size);
+}
+
+static void arc_dma_sync_single_for_cpu(struct device *dev,
+		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
+{
+	dma_cache_inv(dma_handle, size);
+}
+
 /*
  * arc_dma_map_page - map a portion of a page for streaming DMA
  *
@@ -221,18 +233,6 @@ static void arc_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
 				   attrs);
 }
 
-static void arc_dma_sync_single_for_cpu(struct device *dev,
-		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
-{
-	_dma_cache_sync(dma_handle, size, DMA_FROM_DEVICE);
-}
-
-static void arc_dma_sync_single_for_device(struct device *dev,
-		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
-{
-	_dma_cache_sync(dma_handle, size, DMA_TO_DEVICE);
-}
-
 static void arc_dma_sync_sg_for_cpu(struct device *dev,
 		struct scatterlist *sglist, int nelems,
 		enum dma_data_direction dir)
-- 
2.17.0
