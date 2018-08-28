From: gregkh@linuxfoundation.org (gregkh@linuxfoundation.org)
Date: Tue, 28 Aug 2018 16:09:58 +0200
Subject: Patch "arc: fix type warnings in arc/mm/cache.c" has been added to
 the 3.18-stable tree
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1535465398165143@kroah.com>
To: linux-snps-arc@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    arc: fix type warnings in arc/mm/cache.c

to the 3.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arc-fix-type-warnings-in-arc-mm-cache.c.patch
and it can be found in the queue-3.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable at vger.kernel.org> know about it.


>From foo at baz Tue Aug 28 16:08:28 CEST 2018
From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, 26 Jul 2018 20:16:35 -0700
Subject: arc: fix type warnings in arc/mm/cache.c

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
 


Patches currently in stable-queue which might be from rdunlap at infradead.org are

queue-3.18/usb-phy-fix-ppc64-build-errors-in-phy-fsl-usb.c.patch
queue-3.18/arc-fix-build-errors-in-arc-include-asm-delay.h.patch
queue-3.18/media-staging-omap4iss-include-asm-cacheflush.h-after-generic-includes.patch
queue-3.18/arc-fix-type-warnings-in-arc-mm-cache.c.patch
