From: hch@lst.de (Christoph Hellwig)
Date: Mon, 11 Feb 2019 14:35:47 +0100
Subject: [PATCH 05/12] dma-mapping: remove an incorrect __iommem annotation
In-Reply-To: <20190211133554.30055-1-hch@lst.de>
References: <20190211133554.30055-1-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190211133554.30055-6-hch@lst.de>
To: linux-snps-arc@lists.infradead.org

memmap return a regular void pointer, not and __iomem one.

Signed-off-by: Christoph Hellwig <hch at lst.de>
---
 kernel/dma/coherent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 66f0fb7e9a3a..4b76aba574c2 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -43,7 +43,7 @@ static int dma_init_coherent_memory(
 	struct dma_coherent_mem **mem)
 {
 	struct dma_coherent_mem *dma_mem = NULL;
-	void __iomem *mem_base = NULL;
+	void *mem_base = NULL;
 	int pages = size >> PAGE_SHIFT;
 	int bitmap_size = BITS_TO_LONGS(pages) * sizeof(long);
 	int ret;
-- 
2.20.1
