From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 10 Feb 2016 10:59:23 +0530
Subject: [PATCH] mm,
 thp: fix spellos in describing __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1455082163-11588-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Cc: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>
Cc: Aneesh Kumar K.V <aneesh.kumar at linux.vnet.ibm.com>
Cc: Andrea Arcangeli <aarcange at redhat.com>
Cc: Andrew Morton <akpm at linux-foundation.org>
Cc: <linux-snps-arc at lists.infradead.org>
Cc: linux-kernel at vger.kernel.org
Cc: linux-mm at kvack.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 mm/pgtable-generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 1ba58213ad65..75664ed7e3ab 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -90,9 +90,9 @@ pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
  * ARCHes with special requirements for evicting THP backing TLB entries can
  * implement this. Otherwise also, it can help optimize normal TLB flush in
  * THP regime. stock flush_tlb_range() typically has optimization to nuke the
- * entire TLB TLB if flush span is greater than a threshhold, which will
+ * entire TLB if flush span is greater than a threshhold, which will
  * likely be true for a single huge page. Thus a single thp flush will
- * invalidate the entire TLB which is not desitable.
+ * invalidate the entire TLB which is not desirable.
  * e.g. see arch/arc: flush_pmd_tlb_range
  */
 #define flush_pmd_tlb_range(vma, addr, end)	flush_tlb_range(vma, addr, end)
-- 
2.5.0
