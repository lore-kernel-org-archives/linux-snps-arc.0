From: alexander.h.duyck@intel.com (Alexander Duyck)
Date: Mon, 24 Oct 2016 08:04:42 -0400
Subject: [net-next PATCH RFC 03/26] arch/arc: Add option to skip sync on DMA
 mapping
In-Reply-To: <20161024115737.16276.71059.stgit@ahduyck-blue-test.jf.intel.com>
References: <20161024115737.16276.71059.stgit@ahduyck-blue-test.jf.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161024120442.16276.95329.stgit@ahduyck-blue-test.jf.intel.com>
To: linux-snps-arc@lists.infradead.org

This change allows us to pass DMA_ATTR_SKIP_CPU_SYNC which allows us to
avoid invoking cache line invalidation if the driver will just handle it
later via a sync_for_cpu or sync_for_device call.

Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Signed-off-by: Alexander Duyck <alexander.h.duyck at intel.com>
---
 arch/arc/mm/dma.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 20afc65..d0c4b28 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -133,7 +133,8 @@ static dma_addr_t arc_dma_map_page(struct device *dev, struct page *page,
 		unsigned long attrs)
 {
 	phys_addr_t paddr = page_to_phys(page) + offset;
-	_dma_cache_sync(paddr, size, dir);
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		_dma_cache_sync(paddr, size, dir);
 	return plat_phys_to_dma(dev, paddr);
 }
 
