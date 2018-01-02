From: arnd@arndb.de (Arnd Bergmann)
Date: Tue,  2 Jan 2018 12:01:24 +0100
Subject: [PATCH] arc: fix iounmap prototype
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180102110141.1853608-1-arnd@arndb.de>
To: linux-snps-arc@lists.infradead.org

The missing 'volatile' keyword on the iounmap argument leads to lots of
harmless warnings in an allmodconfig build:

sound/pci/echoaudio/echoaudio.c:1879:10: warning: passing argument 1 of 'iounmap' discards 'volatile' qualifier f
pointer target type [-Wdiscarded-qualifiers]

Signed-off-by: Arnd Bergmann <arnd at arndb.de>
---
 arch/arc/include/asm/io.h | 4 ++--
 arch/arc/mm/ioremap.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arc/include/asm/io.h b/arch/arc/include/asm/io.h
index c22b181e8206..2c9b98fabf82 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -30,11 +30,11 @@ static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
 	return (void __iomem *)port;
 }
 
-static inline void ioport_unmap(void __iomem *addr)
+static inline void ioport_unmap(volatile void __iomem *addr)
 {
 }
 
-extern void iounmap(const void __iomem *addr);
+extern void iounmap(const volatile void __iomem *addr);
 
 #define ioremap_nocache(phy, sz)	ioremap(phy, sz)
 #define ioremap_wc(phy, sz)		ioremap(phy, sz)
diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
index 9881bd740ccc..94d0116063a8 100644
--- a/arch/arc/mm/ioremap.c
+++ b/arch/arc/mm/ioremap.c
@@ -95,7 +95,7 @@ void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
 EXPORT_SYMBOL(ioremap_prot);
 
 
-void iounmap(const void __iomem *addr)
+void iounmap(volatile const void __iomem *addr)
 {
 	/* weird double cast to handle phys_addr_t > 32 bits */
 	if (arc_uncached_addr_space((phys_addr_t)(u32)addr))
-- 
2.9.0
