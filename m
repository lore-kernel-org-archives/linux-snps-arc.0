From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 10 Nov 2016 17:44:48 +0100
Subject: [PATCH v2 05/11] s390: pci: don't print uninitialized data for
 debugging
In-Reply-To: <20161110164454.293477-1-arnd@arndb.de>
References: <20161110164454.293477-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161110164454.293477-6-arnd@arndb.de>
To: linux-snps-arc@lists.infradead.org

gcc correctly warns about an incorrect use of the 'pa' variable
in case we pass an empty scatterlist to __s390_dma_map_sg:

arch/s390/pci/pci_dma.c: In function '__s390_dma_map_sg':
arch/s390/pci/pci_dma.c:309:13: warning: 'pa' may be used uninitialized in this function [-Wmaybe-uninitialized]

This adds a bogus initialization to the function to sanitize
the debug output.  I would have preferred a solution without
the initialization, but I only got the report from the
kbuild bot after turning on the warning again, and didn't
manage to reproduce it myself.

Signed-off-by: Arnd Bergmann <arnd at arndb.de>
Acked-by: Sebastian Ott <sebott at linux.vnet.ibm.com>
Acked-by: Martin Schwidefsky <schwidefsky at de.ibm.com>
---
 arch/s390/pci/pci_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
index 7350c8b..6b2f72f 100644
--- a/arch/s390/pci/pci_dma.c
+++ b/arch/s390/pci/pci_dma.c
@@ -423,7 +423,7 @@ static int __s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	dma_addr_t dma_addr_base, dma_addr;
 	int flags = ZPCI_PTE_VALID;
 	struct scatterlist *s;
-	unsigned long pa;
+	unsigned long pa = 0;
 	int ret;
 
 	size = PAGE_ALIGN(size);
-- 
2.9.0
