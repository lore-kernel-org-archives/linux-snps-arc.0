From: rd.dunlab@gmail.com (Randy Dunlap)
Date: Tue, 24 Jul 2018 13:46:20 -0700
Subject: [PATCH 2/4] arc: fix type warnings in arc/mm/cache.c
In-Reply-To: <20180724204622.2366-1-rd.dunlab@gmail.com>
References: <20180724204622.2366-1-rd.dunlab@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180724204622.2366-3-rd.dunlab@gmail.com>
To: linux-snps-arc@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

../arch/arc/mm/cache.c: In function 'flush_anon_page':
../arch/arc/mm/cache.c:1062:55: warning: passing argument 2 of '__flush_dcache_page' makes integer from pointer without a cast [-Wint-conversion]
  __flush_dcache_page((phys_addr_t)page_address(page), page_address(page));
                                                       ^~~~~~~~~~~~~~~~~~
../arch/arc/mm/cache.c:1013:59: note: expected 'long unsigned int' but argument is of type 'void *'
 void __flush_dcache_page(phys_addr_t paddr, unsigned long vaddr)
                                             ~~~~~~~~~~~~~~^~~~~

Signed-off-by: Randy Dunlap <rdunlap at infradead.org>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Ofer Levi <oferle at mellanox.com>
Cc: linux-snps-arc at lists.infradead.org
---
 arch/arc/mm/cache.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

--- linux-next-20180723.orig/arch/arc/mm/cache.c
+++ linux-next-20180723/arch/arc/mm/cache.c
@@ -1038,7 +1038,7 @@ void flush_cache_mm(struct mm_struct *mm
 void flush_cache_page(struct vm_area_struct *vma, unsigned long u_vaddr,
 		      unsigned long pfn)
 {
-	unsigned int paddr = pfn << PAGE_SHIFT;
+	phys_addr_t paddr = pfn << PAGE_SHIFT;
 
 	u_vaddr &= PAGE_MASK;
 
@@ -1058,8 +1058,9 @@ void flush_anon_page(struct vm_area_stru
 		     unsigned long u_vaddr)
 {
 	/* TBD: do we really need to clear the kernel mapping */
-	__flush_dcache_page(page_address(page), u_vaddr);
-	__flush_dcache_page(page_address(page), page_address(page));
+	__flush_dcache_page((phys_addr_t)page_address(page), u_vaddr);
+	__flush_dcache_page((phys_addr_t)page_address(page),
+			    (phys_addr_t)page_address(page));
 
 }
 
@@ -1084,7 +1085,7 @@ void copy_user_highpage(struct page *to,
 	 * addr_not_cache_congruent() is 0
 	 */
 	if (page_mapcount(from) && addr_not_cache_congruent(kfrom, u_vaddr)) {
-		__flush_dcache_page((unsigned long)kfrom, u_vaddr);
+		__flush_dcache_page((phys_addr_t)kfrom, u_vaddr);
 		clean_src_k_mappings = 1;
 	}
 
@@ -1105,7 +1106,7 @@ void copy_user_highpage(struct page *to,
 	 * sync the kernel mapping back to physical page
 	 */
 	if (clean_src_k_mappings) {
-		__flush_dcache_page((unsigned long)kfrom, (unsigned long)kfrom);
+		__flush_dcache_page((phys_addr_t)kfrom, (unsigned long)kfrom);
 		set_bit(PG_dc_clean, &from->flags);
 	} else {
 		clear_bit(PG_dc_clean, &from->flags);
