From: hch@lst.de (Christoph Hellwig)
Date: Sat, 17 Aug 2019 09:32:36 +0200
Subject: [PATCH 09/26] alpha: remove the unused __ioremap wrapper
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190817073253.27819-10-hch@lst.de>
To: linux-snps-arc@lists.infradead.org

No need for the additional namespace pollution.

Signed-off-by: Christoph Hellwig <hch at lst.de>
---
 arch/alpha/include/asm/io.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index af2c0063dc75..1989b946a28d 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -283,12 +283,6 @@ static inline void __iomem *ioremap(unsigned long port, unsigned long size)
 	return IO_CONCAT(__IO_PREFIX,ioremap) (port, size);
 }
 
-static inline void __iomem *__ioremap(unsigned long port, unsigned long size,
-				      unsigned long flags)
-{
-	return ioremap(port, size);
-}
-
 static inline void __iomem * ioremap_nocache(unsigned long offset,
 					     unsigned long size)
 {
-- 
2.20.1
