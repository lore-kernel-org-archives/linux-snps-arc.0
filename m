From: steven.price@arm.com (Steven Price)
Date: Thu, 21 Mar 2019 14:19:35 +0000
Subject: [PATCH v5 01/19] arc: mm: Add p?d_large() definitions
In-Reply-To: <20190321141953.31960-1-steven.price@arm.com>
References: <20190321141953.31960-1-steven.price@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190321141953.31960-2-steven.price@arm.com>
To: linux-snps-arc@lists.infradead.org

walk_page_range() is going to be allowed to walk page tables other than
those of user space. For this it needs to know when it has reached a
'leaf' entry in the page tables. This information will be provided by the
p?d_large() functions/macros.

For arc, we only have two levels, so only pmd_large() is needed.

CC: Vineet Gupta <vgupta at synopsys.com>
CC: linux-snps-arc at lists.infradead.org
Signed-off-by: Steven Price <steven.price at arm.com>
Acked-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/pgtable.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index cf4be70d5892..0edd27bc7018 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -277,6 +277,7 @@ static inline void pmd_set(pmd_t *pmdp, pte_t *ptep)
 #define pmd_none(x)			(!pmd_val(x))
 #define	pmd_bad(x)			((pmd_val(x) & ~PAGE_MASK))
 #define pmd_present(x)			(pmd_val(x))
+#define pmd_large(x)			(pmd_val(pmd) & _PAGE_HW_SZ)
 #define pmd_clear(xp)			do { pmd_val(*(xp)) = 0; } while (0)
 
 #define pte_page(pte)		pfn_to_page(pte_pfn(pte))
-- 
2.20.1
