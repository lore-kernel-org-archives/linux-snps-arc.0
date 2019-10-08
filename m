From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue,  8 Oct 2019 14:38:36 -0700
Subject: [PATCH] ARC: mm: remove __ARCH_USE_5LEVEL_HACK
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20191008213836.19266-1-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Add the intermediate p4d accessors to make it 5 level compliant.

Thi sis non-functional change anyways since ARC has software page walker
with 2 lookup levels (pgd -> pte)

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/pgtable.h |  1 -
 arch/arc/mm/fault.c            | 10 ++++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 976b5931372e..902d45428cea 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -33,7 +33,6 @@
 #define _ASM_ARC_PGTABLE_H
 
 #include <linux/bits.h>
-#define __ARCH_USE_5LEVEL_HACK
 #include <asm-generic/pgtable-nopmd.h>
 #include <asm/page.h>
 #include <asm/mmu.h>	/* to propagate CONFIG_ARC_MMU_VER <n> */
diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index 3861543b66a0..fb86bc3e9b35 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -30,6 +30,7 @@ noinline static int handle_kernel_vaddr_fault(unsigned long address)
 	 * with the 'reference' page table.
 	 */
 	pgd_t *pgd, *pgd_k;
+	p4d_t *p4d, *p4d_k;
 	pud_t *pud, *pud_k;
 	pmd_t *pmd, *pmd_k;
 
@@ -39,8 +40,13 @@ noinline static int handle_kernel_vaddr_fault(unsigned long address)
 	if (!pgd_present(*pgd_k))
 		goto bad_area;
 
-	pud = pud_offset(pgd, address);
-	pud_k = pud_offset(pgd_k, address);
+	p4d = p4d_offset(pgd, address);
+	p4d_k = p4d_offset(pgd_k, address);
+	if (!p4d_present(*p4d_k))
+		goto bad_area;
+
+	pud = pud_offset(p4d, address);
+	pud_k = pud_offset(p4d_k, address);
 	if (!pud_present(*pud_k))
 		goto bad_area;
 
-- 
2.20.1
