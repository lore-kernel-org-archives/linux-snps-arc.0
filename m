From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Mon,  3 Sep 2018 18:49:21 +0200
Subject: [PATCH 3.18 31/56] arc: fix type warnings in arc/mm/cache.c
In-Reply-To: <20180903164924.078355019@linuxfoundation.org>
References: <20180903164924.078355019@linuxfoundation.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180903164925.622323083@linuxfoundation.org>
To: linux-snps-arc@lists.infradead.org

3.18-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit ec837d620c750c0d4996a907c8c4f7febe1bbeee ]

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
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Sasha Levin <alexander.levin at microsoft.com>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
---
 arch/arc/mm/cache_arc700.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- a/arch/arc/mm/cache_arc700.c
+++ b/arch/arc/mm/cache_arc700.c
@@ -642,7 +642,7 @@ void flush_cache_mm(struct mm_struct *mm
 void flush_cache_page(struct vm_area_struct *vma, unsigned long u_vaddr,
 		      unsigned long pfn)
 {
-	unsigned int paddr = pfn << PAGE_SHIFT;
+	phys_addr_t paddr = pfn << PAGE_SHIFT;
 
 	u_vaddr &= PAGE_MASK;
 
@@ -662,8 +662,9 @@ void flush_anon_page(struct vm_area_stru
 		     unsigned long u_vaddr)
 {
 	/* TBD: do we really need to clear the kernel mapping */
-	__flush_dcache_page(page_address(page), u_vaddr);
-	__flush_dcache_page(page_address(page), page_address(page));
+	__flush_dcache_page((phys_addr_t)page_address(page), u_vaddr);
+	__flush_dcache_page((phys_addr_t)page_address(page),
+			    (phys_addr_t)page_address(page));
 
 }
 
