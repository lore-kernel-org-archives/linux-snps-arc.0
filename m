From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 16 Sep 2019 14:32:07 -0700
Subject: [PATCH 6/6] ARC: mm: tlb flush optim: elide redundant uTLB
 invalidates for MMUv3
In-Reply-To: <20190916213207.12792-1-vgupta@synopsys.com>
References: <20190916213207.12792-1-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190916213207.12792-7-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

For MMUv3 (and prior) the flush_tlb_{range,mm,page} API use the MMU
TLBWrite cmd which already nukes the entire uTLB, so NO need for
additional IVUTLB cmd from utlb_invalidate() - hence this patch

local_flush_tlb_all() is special since it uses a weaker TLBWriteNI
cmd (prec commit) to shoot down JTLB, hence we retain the explicit
uTLB flush

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/tlb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 210d807983dd..c340acd989a0 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -339,8 +339,6 @@ void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		}
 	}
 
-	utlb_invalidate();
-
 	local_irq_restore(flags);
 }
 
@@ -369,8 +367,6 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 		start += PAGE_SIZE;
 	}
 
-	utlb_invalidate();
-
 	local_irq_restore(flags);
 }
 
@@ -391,7 +387,6 @@ void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
 
 	if (asid_mm(vma->vm_mm, cpu) != MM_CTXT_NO_ASID) {
 		tlb_entry_erase((page & PAGE_MASK) | hw_pid(vma->vm_mm, cpu));
-		utlb_invalidate();
 	}
 
 	local_irq_restore(flags);
-- 
2.20.1
