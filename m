From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 24 Jul 2018 13:43:45 -0700
Subject: [PATCH] ARC: dma [non IOC]: fix arc_dma_sync_single_for_(device|cpu)
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075012B08382A@us01wembx1.internal.synopsys.com>
References: <C2D7FE5348E1B147BCA15975FBA23075012B08382A@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1532465025-15600-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>

ARC backend for dma_sync_single_for_(device|cpu) was broken as it was
not honoring the @dir argument and simply forcing it based on the call:
 - arc_dma_sync_single_for_device(dir) assumed DMA_TO_DEVICE (cache wback)
 - arc_dma_sync_single_for_cpu(dir) assumed DMA_FROM_DEVICE (cache inv)

This is not true given the DMA API programming model and has been
discussed here [1] in some detail.

Interestingly while the deficiency has been there forever, it only started
showing up after 4.17 dma common ops rework, commit a8eb92d02dd7
("arc: fix arc_dma_{map,unmap}_page") which wired up these calls under the
more commonly used dma_map_page API triggering the issue.

[1]: https://lkml.org/lkml/2018/5/18/979
Fixes: commit a8eb92d02dd7 ("arc: fix arc_dma_{map,unmap}_page")
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
[vgupta: reworked changelog]

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
This needs to be added to stable 4.17 but Cc with "4.17+" was causing git-send-email issues.
---
 arch/arc/mm/dma.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 8c1071840979..cefb776a99ff 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -129,14 +129,56 @@ int arch_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 	return ret;
 }
 
+/*
+ * Cache operations depending on function and direction argument, inspired by
+ * https://lkml.org/lkml/2018/5/18/979
+ * "dma_sync_*_for_cpu and direction=TO_DEVICE (was Re: [PATCH 02/20]
+ * dma-mapping: provide a generic dma-noncoherent implementation)"
+ *
+ *          |   map          ==  for_device     |   unmap     ==  for_cpu
+ *          |----------------------------------------------------------------
+ * TO_DEV   |   writeback        writeback      |   none          none
+ * FROM_DEV |   invalidate       invalidate     |   invalidate    invalidate
+ * BIDIR    |   writeback+inv    writeback+inv  |   invalidate    invalidate
+ *
+ * NOTE: we don't check the validity of direction argument as it is done in
+ * upper layer functions (in include/linux/dma-mapping.h)
+ */
+
 void arch_sync_dma_for_device(struct device *dev, phys_addr_t paddr,
 		size_t size, enum dma_data_direction dir)
 {
-	dma_cache_wback(paddr, size);
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		dma_cache_wback(paddr, size);
+		break;
+
+	case DMA_FROM_DEVICE:
+		dma_cache_inv(paddr, size);
+		break;
+
+	case DMA_BIDIRECTIONAL:
+		dma_cache_wback_inv(paddr, size);
+		break;
+
+	default:
+		break;
+	}
 }
 
 void arch_sync_dma_for_cpu(struct device *dev, phys_addr_t paddr,
 		size_t size, enum dma_data_direction dir)
 {
-	dma_cache_inv(paddr, size);
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		break;
+
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		dma_cache_inv(paddr, size);
+		break;
+
+	default:
+		break;
+	}
 }
-- 
2.7.4
