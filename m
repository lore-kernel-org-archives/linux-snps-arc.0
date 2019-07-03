From: arnd@arndb.de (Arnd Bergmann)
Date: Wed,  3 Jul 2019 15:39:25 +0200
Subject: [PATCH] ARC: hide unused function unw_hdr_alloc
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190703133940.1493249-1-arnd@arndb.de>
To: linux-snps-arc@lists.infradead.org

As kernelci.org reports, this function is not used in
vdk_hs38_defconfig:

arch/arc/kernel/unwind.c:188:14: warning: 'unw_hdr_alloc' defined but not used [-Wunused-function]

Fixes: bc79c9a72165 ("ARC: dw2 unwind: Reinstante unwinding out of modules")
Link: https://kernelci.org/build/id/5d1cae3f59b514300340c132/logs/
Cc: stable at vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd at arndb.de>
---
 arch/arc/kernel/unwind.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 182ce67dfe10..c2663fce7f6c 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -181,11 +181,6 @@ static void *__init unw_hdr_alloc_early(unsigned long sz)
 	return memblock_alloc_from(sz, sizeof(unsigned int), MAX_DMA_ADDRESS);
 }
 
-static void *unw_hdr_alloc(unsigned long sz)
-{
-	return kmalloc(sz, GFP_KERNEL);
-}
-
 static void init_unwind_table(struct unwind_table *table, const char *name,
 			      const void *core_start, unsigned long core_size,
 			      const void *init_start, unsigned long init_size,
@@ -366,6 +361,10 @@ static void init_unwind_hdr(struct unwind_table *table,
 }
 
 #ifdef CONFIG_MODULES
+static void *unw_hdr_alloc(unsigned long sz)
+{
+	return kmalloc(sz, GFP_KERNEL);
+}
 
 static struct unwind_table *last_table;
 
-- 
2.20.0
