From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 10 Feb 2016 10:26:15 +0530
Subject: [PATCH] mm,thp: khugepaged: call pte flush at the time of collapse
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1455080175-10987-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This showed up on ARC when running LMBench bw_mem tests as
Overlapping TLB Machine Check Exception triggered due to STLB entry
(2M pages) overlapping some NTLB entry (regular 8K page).

bw_mem 2m touches a large chunk of vaddr creating NTLB entries.
In the interim khugepaged kicks in, collapsing the contiguous ptes into
a single pmd. pmdp_collapse_flush()->flush_pmd_tlb_range() is called to
flush out NTLB entries for the ptes. This for ARC (by design) can only
shootdown STLB entries (for pmd). The stray NTLB entries cause the overlap
with the subsequent STLB entry for collapsed page.
So make pmdp_collapse_flush() call pte flush interface not pmd flush.

Note that originally all thp flush call sites in generic code called
flush_tlb_range() leaving it to architecture to implement the flush for
pte and/or pmd. Commit 12ebc1581ad11454 changed this by calling a new
opt-in API flush_pmd_tlb_range() which made the semantics more explicit
but failed to distinguish the pte vs pmd flush in generic code, which is
what this patch fixes.

Note that ARC can fixed w/o touching the generic pmdp_collapse_flush()
by defining a ARC version, but that defeats the purpose of generic
version, plus sementically this is the right thing to do.

Fixes STAR 9000961194: LMBench on AXS103 triggering duplicate TLB
exceptions with super pages

Cc: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>
Cc: Aneesh Kumar K.V <aneesh.kumar at linux.vnet.ibm.com>
Cc: Andrea Arcangeli <aarcange at redhat.com>
Cc: Andrew Morton <akpm at linux-foundation.org>
Cc: <stable at vger.kernel.org> #4.4
Cc: <linux-snps-arc at lists.infradead.org>
Cc: linux-kernel at vger.kernel.org
Cc: linux-mm at kvack.org
Fixes: 12ebc1581ad11454 ("mm,thp: introduce flush_pmd_tlb_range")
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 mm/pgtable-generic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 7d3db0247983..1ba58213ad65 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -210,7 +210,9 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long address,
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
 	VM_BUG_ON(pmd_trans_huge(*pmdp));
 	pmd = pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);
-	flush_pmd_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
+
+	/* collapse entails shooting down ptes not pmd */
+	flush_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
 	return pmd;
 }
 #endif
-- 
2.5.0
