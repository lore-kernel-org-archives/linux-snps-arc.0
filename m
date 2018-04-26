From: zi.yan@sent.com (Zi Yan)
Date: Thu, 26 Apr 2018 10:27:56 -0400
Subject: [RFC PATCH 1/9] arc: mm: migrate: add pmd swap entry to support thp
 migration.
In-Reply-To: <20180426142804.180152-1-zi.yan@sent.com>
References: <20180426142804.180152-1-zi.yan@sent.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180426142804.180152-2-zi.yan@sent.com>
To: linux-snps-arc@lists.infradead.org

From: Zi Yan <zi.yan@cs.rutgers.edu>

Signed-off-by: Zi Yan <zi.yan at cs.rutgers.edu>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Cc: linux-mm at kvack.org
---
 arch/arc/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 08fe33830d4b..246934105e61 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -383,7 +383,9 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 
 /* NOPs, to keep generic kernel happy */
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
+#define __pmd_to_swp_entry(pmd)	((swp_entry_t) { pmd_val(pmd) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
+#define __swp_entry_to_pmd(x)	((pmd_t) { (x).val })
 
 #define kern_addr_valid(addr)	(1)
 
-- 
2.17.0
