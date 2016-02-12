From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 12 Feb 2016 16:11:01 +0530
Subject: [PATCH] ARC, thp: remove infrastructure for handling splitting PMDs
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1455273661-1918-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

With THP refcounting work, no need to mark PMDs splitting.

(ARC got missed under the sweeping arch change as THP support was likely
not present in orig baseline)

Cc: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>
Cc: Andrew Morton <akpm at linux-foundation.org>
Cc: linux-snps-arc at lists.infradead.org
Cc: linux-kernel at vger.kernel.org
Cc: linux-mm at kvack.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/hugepage.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arc/include/asm/hugepage.h b/arch/arc/include/asm/hugepage.h
index c5094de86403..7afe3356b770 100644
--- a/arch/arc/include/asm/hugepage.h
+++ b/arch/arc/include/asm/hugepage.h
@@ -30,19 +30,16 @@ static inline pmd_t pte_pmd(pte_t pte)
 #define pmd_mkyoung(pmd)	pte_pmd(pte_mkyoung(pmd_pte(pmd)))
 #define pmd_mkhuge(pmd)		pte_pmd(pte_mkhuge(pmd_pte(pmd)))
 #define pmd_mknotpresent(pmd)	pte_pmd(pte_mknotpresent(pmd_pte(pmd)))
-#define pmd_mksplitting(pmd)	pte_pmd(pte_mkspecial(pmd_pte(pmd)))
 #define pmd_mkclean(pmd)	pte_pmd(pte_mkclean(pmd_pte(pmd)))
 
 #define pmd_write(pmd)		pte_write(pmd_pte(pmd))
 #define pmd_young(pmd)		pte_young(pmd_pte(pmd))
 #define pmd_pfn(pmd)		pte_pfn(pmd_pte(pmd))
 #define pmd_dirty(pmd)		pte_dirty(pmd_pte(pmd))
-#define pmd_special(pmd)	pte_special(pmd_pte(pmd))
 
 #define mk_pmd(page, prot)	pte_pmd(mk_pte(page, prot))
 
 #define pmd_trans_huge(pmd)	(pmd_val(pmd) & _PAGE_HW_SZ)
-#define pmd_trans_splitting(pmd)	(pmd_trans_huge(pmd) && pmd_special(pmd))
 
 #define pfn_pmd(pfn, prot)	(__pmd(((pfn) << PAGE_SHIFT) | pgprot_val(prot)))
 
-- 
2.5.0
