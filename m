From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 16 Sep 2019 14:32:05 -0700
Subject: [PATCH 4/6] ARC: mm: tlb flush optim: Make TLBWriteNI fallback to
 TLBWrite if not available
In-Reply-To: <20190916213207.12792-1-vgupta@synopsys.com>
References: <20190916213207.12792-1-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190916213207.12792-5-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

TLBWriteNI was introduced in MMUv2 (to not invalidate uTLBs in Fast Path
TLB Refill Handler). To avoid #ifdef'ery make it fallback to TLBWrite availabel on all MMUs. This will also help with next change

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/mmu.h | 2 ++
 arch/arc/mm/tlbex.S        | 4 ----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/mmu.h b/arch/arc/include/asm/mmu.h
index 0abacb82a72b..26b731d32a2b 100644
--- a/arch/arc/include/asm/mmu.h
+++ b/arch/arc/include/asm/mmu.h
@@ -67,6 +67,8 @@
 #if (CONFIG_ARC_MMU_VER >= 2)
 #define TLBWriteNI  0x5		/* write JTLB without inv uTLBs */
 #define TLBIVUTLB   0x6		/* explicitly inv uTLBs */
+#else
+#define TLBWriteNI  TLBWrite	/* Not present in hardware, fallback */
 #endif
 
 #if (CONFIG_ARC_MMU_VER >= 4)
diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index 4c88148d4cd1..2efaf6ca0c06 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -292,11 +292,7 @@ ex_saved_reg1:
 	sr  TLBGetIndex, [ARC_REG_TLBCOMMAND]
 
 	/* Commit the Write */
-#if (CONFIG_ARC_MMU_VER >= 2)   /* introduced in v2 */
 	sr TLBWriteNI, [ARC_REG_TLBCOMMAND]
-#else
-	sr TLBWrite, [ARC_REG_TLBCOMMAND]
-#endif
 
 #else
 	sr TLBInsertEntry, [ARC_REG_TLBCOMMAND]
-- 
2.20.1
