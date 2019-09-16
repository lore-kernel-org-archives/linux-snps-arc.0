From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 16 Sep 2019 14:32:04 -0700
Subject: [PATCH 3/6] ARC: mm: TLB Miss optim: avoid re-reading ECR
In-Reply-To: <20190916213207.12792-1-vgupta@synopsys.com>
References: <20190916213207.12792-1-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190916213207.12792-4-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

For setting PTE Dirty bit, reuse the prior test for ST miss.

No need to reload ECR and test for ST cause code as the prev
condition code is still valid (uncloberred)

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/tlbex.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index 110c72536e8b..4c88148d4cd1 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -380,9 +380,7 @@ ENTRY(EV_TLBMissD)
 
 	;----------------------------------------------------------------
 	; UPDATE_PTE: Let Linux VM know that page was accessed/dirty
-	lr      r3, [ecr]
 	or      r0, r0, _PAGE_ACCESSED        ; Accessed bit always
-	btst_s  r3,  ECR_C_BIT_DTLB_ST_MISS   ; See if it was a Write Access ?
 	or.nz   r0, r0, _PAGE_DIRTY           ; if Write, set Dirty bit as well
 	st_s    r0, [r1]                      ; Write back PTE
 
-- 
2.20.1
