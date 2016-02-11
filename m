From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 11 Feb 2016 14:58:27 +0530
Subject: [PATCH 2/2] ARC: mm: THP: use generic THP deposit/withdraw
In-Reply-To: <1455182907-15445-1-git-send-email-vgupta@synopsys.com>
References: <1455182907-15445-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1455182907-15445-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Generic code can now cope with pgtable_t != struct page *

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/hugepage.h |  8 --------
 arch/arc/mm/tlb.c               | 37 -------------------------------------
 2 files changed, 45 deletions(-)

diff --git a/arch/arc/include/asm/hugepage.h b/arch/arc/include/asm/hugepage.h
index c5094de86403..8653ed2f2ec5 100644
--- a/arch/arc/include/asm/hugepage.h
+++ b/arch/arc/include/asm/hugepage.h
@@ -66,14 +66,6 @@ extern void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
 
 #define has_transparent_hugepage() 1
 
-/* Generic variants assume pgtable_t is struct page *, hence need for these */
-#define __HAVE_ARCH_PGTABLE_DEPOSIT
-extern void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				       pgtable_t pgtable);
-
-#define __HAVE_ARCH_PGTABLE_WITHDRAW
-extern pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
-
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 extern void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 				unsigned long end);
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 2e731c87011e..b300479b8ad3 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -663,43 +663,6 @@ void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
 	update_mmu_cache(vma, addr, &pte);
 }
 
-void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				pgtable_t pgtable)
-{
-	struct list_head *lh = (struct list_head *) pgtable;
-
-	assert_spin_locked(&mm->page_table_lock);
-
-	/* FIFO */
-	if (!pmd_huge_pte(mm, pmdp))
-		INIT_LIST_HEAD(lh);
-	else
-		list_add(lh, (struct list_head *) pmd_huge_pte(mm, pmdp));
-	pmd_huge_pte(mm, pmdp) = pgtable;
-}
-
-pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
-{
-	struct list_head *lh;
-	pgtable_t pgtable;
-
-	assert_spin_locked(&mm->page_table_lock);
-
-	pgtable = pmd_huge_pte(mm, pmdp);
-	lh = (struct list_head *) pgtable;
-	if (list_empty(lh))
-		pmd_huge_pte(mm, pmdp) = NULL;
-	else {
-		pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
-		list_del(lh);
-	}
-
-	pte_val(pgtable[0]) = 0;
-	pte_val(pgtable[1]) = 0;
-
-	return pgtable;
-}
-
 void local_flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			       unsigned long end)
 {
-- 
2.5.0
