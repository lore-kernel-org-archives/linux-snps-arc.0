From: rd.dunlab@gmail.com (rd_dunlab)
Date: Thu, 26 Jul 2018 20:16:35 -0700
Subject: [PATCH 2/4 v2] arc: fix type warnings in arc/mm/cache.c
In-Reply-To: <15326613951079@infradead.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1532661395238@infradead.org>
To: linux-snps-arc@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix type warnings in arch/arc/mm/cache.c.

../arch/arc/mm/cache.c: In function 'flush_anon_page':
../arch/arc/mm/cache.c:1062:55: warning: passing argument 2 of '__flush_dcache_page' makes integer from pointer without a cast [-Wint-conversion]
  __flush_dcache_page((phys_addr_t)page_address(page), page_address(page));
                                                       ^~~~~~~~~~~~~~~~~~
../arch/arc/mm/cache.c:1013:59: note: expected 'long unsigned int' but argument is of type 'void *'
 void __flush_dcache_page(phys_addr_t paddr, unsigned long vaddr)
                                             ~~~~~~~~~~~~~~^~~~~

Signed-off-by: Randy Dunlap <rdunlap at infradead.org>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Cc: Elad Kanfi <eladkan at mellanox.com>
Cc: Leon Romanovsky <leonro at mellanox.com>
Cc: Ofer Levi <oferle at mellanox.com>
---
v2: drop some spurious (accidental) patch lines

 arch/arc/mm/cache.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

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
 


-- 
