From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed,  9 Oct 2019 15:26:56 -0700
Subject: [PATCH 1/3] asm-generic/tlb: stub out pud_free_tlb() if
 __PAGETABLE_PUD_FOLDED ...
In-Reply-To: <20191009222658.961-1-vgupta@synopsys.com>
References: <20191009222658.961-1-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20191009222658.961-2-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

... independent of __ARCH_HAS_4LEVEL_HACK

This came up when removing __ARCH_HAS_5LEVEL_HACK for ARC as code bloat
from pud_free_tlb() despite pud being folded (with 2 levels on ARC)

| bloat-o-meter2 vmlinux-B-elide-ARCH_USE_5LEVEL_HACK vmlinux-C-elide-pud_free_tlb
| add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-104 (-104)
| function                                     old     new   delta
| free_pgd_range                               656     552    -104
| Total: Before=4137276, After=4137172, chg -1.000000%

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 include/asm-generic/4level-fixup.h | 2 --
 include/asm-generic/tlb.h          | 4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/4level-fixup.h b/include/asm-generic/4level-fixup.h
index e3667c9a33a5..d7c5ba1968d3 100644
--- a/include/asm-generic/4level-fixup.h
+++ b/include/asm-generic/4level-fixup.h
@@ -27,8 +27,6 @@
 #define pud_page(pud)			pgd_page(pud)
 #define pud_page_vaddr(pud)		pgd_page_vaddr(pud)
 
-#undef pud_free_tlb
-#define pud_free_tlb(tlb, x, addr)	do { } while (0)
 #define pud_free(mm, x)			do { } while (0)
 #define __pud_free_tlb(tlb, x, addr)	do { } while (0)
 
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 04c0644006fd..1f83188cb331 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -584,7 +584,7 @@ static inline void tlb_end_vma(struct mmu_gather *tlb, struct vm_area_struct *vm
 	} while (0)
 #endif
 
-#ifndef __ARCH_HAS_4LEVEL_HACK
+#ifndef __PAGETABLE_PUD_FOLDED
 #ifndef pud_free_tlb
 #define pud_free_tlb(tlb, pudp, address)			\
 	do {							\
@@ -594,6 +594,8 @@ static inline void tlb_end_vma(struct mmu_gather *tlb, struct vm_area_struct *vm
 		__pud_free_tlb(tlb, pudp, address);		\
 	} while (0)
 #endif
+#else
+#define pud_free_tlb(tlb, pudp, address)	do { } while (0)
 #endif
 
 #ifndef __ARCH_HAS_5LEVEL_HACK
-- 
2.20.1
