From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:47:19 +0200
Subject: [PATCH 0080/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114719.3420-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/mm/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 8c8e36f..73d7e4c 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -10,7 +10,7 @@
  * DMA Coherent API Notes
  *
  * I/O is inherently non-coherent on ARC. So a coherent DMA buffer is
- * implemented by accessintg it using a kernel virtual address, with
+ * implemented by accessing it using a kernel virtual address, with
  * Cache bit off in the TLB entry.
  *
  * The default DMA address == Phy address which is 0x8000_0000 based.
-- 
2.8.2.534.g1f66975
