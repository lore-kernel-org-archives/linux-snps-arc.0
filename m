From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Tue, 29 Nov 2016 17:30:17 +0300
Subject: [PATCH v2] ARC: mm: Fix invalid page mapping in kernel with PAE40
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1480429817-16163-1-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Originally pfn_pte(pfn, prot) macro is implemented incorrectly
and truncates the most significant byte in the value of PTE
(Page Table Entry). It leads to the creation of invalid page
mapping in the kernel with PAE40 if the physical page frame
resides in the memory above of 4GB boundary.

The behaviour of the system with such corrupted mappings is
undefined. The kernel can crash when such pages are unmapped
because the kernel can try to get access to bad address.

For example if the kernel with 8KB pages will try to create
a mapping of the virtual page to the physical frame (pfn) at
0x110000 then the value of pte will be truncated (0x10000000)
and the invalid mapping will be created.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 89eeb37..e94ca72 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -280,7 +280,7 @@ static inline void pmd_set(pmd_t *pmdp, pte_t *ptep)
 
 #define pte_page(pte)		pfn_to_page(pte_pfn(pte))
 #define mk_pte(page, prot)	pfn_pte(page_to_pfn(page), prot)
-#define pfn_pte(pfn, prot)	__pte(((pfn) << PAGE_SHIFT) | pgprot_val(prot))
+#define pfn_pte(pfn, prot)	__pte(__pfn_to_phys(pfn) | pgprot_val(prot))
 
 /* Don't use virt_to_pfn for macros below: could cause truncations for PAE40*/
 #define pte_pfn(pte)		(pte_val(pte) >> PAGE_SHIFT)
-- 
2.7.4
