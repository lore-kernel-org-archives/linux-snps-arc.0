From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:47:12 +0200
Subject: [PATCH 0079/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114712.3363-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/mm/cache.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index 9e5eddb..5a294b2 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -215,7 +215,7 @@ slc_chk:
  * ------------------
  * This ver of MMU supports variable page sizes (1k-16k): although Linux will
  * only support 8k (default), 16k and 4k.
- * However from hardware perspective, smaller page sizes aggrevate aliasing
+ * However from hardware perspective, smaller page sizes aggravate aliasing
  * meaning more vaddr bits needed to disambiguate the cache-line-op ;
  * the existing scheme of piggybacking won't work for certain configurations.
  * Two new registers IC_PTAG and DC_PTAG inttoduced.
@@ -302,7 +302,7 @@ void __cache_line_loop_v3(phys_addr_t paddr, unsigned long vaddr,
 
 	/*
 	 * This is technically for MMU v4, using the MMU v3 programming model
-	 * Special work for HS38 aliasing I-cache configuratino with PAE40
+	 * Special work for HS38 aliasing I-cache configuration with PAE40
 	 *   - upper 8 bits of paddr need to be written into PTAG_HI
 	 *   - (and needs to be written before the lower 32 bits)
 	 * Note that PTAG_HI is hoisted outside the line loop
@@ -936,7 +936,7 @@ void arc_cache_init(void)
 			      ic->ver, CONFIG_ARC_MMU_VER);
 
 		/*
-		 * In MMU v4 (HS38x) the alising icache config uses IVIL/PTAG
+		 * In MMU v4 (HS38x) the aliasing icache config uses IVIL/PTAG
 		 * pair to provide vaddr/paddr respectively, just as in MMU v3
 		 */
 		if (is_isa_arcv2() && ic->alias)
-- 
2.8.2.534.g1f66975
