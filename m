From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 16 Sep 2019 14:32:06 -0700
Subject: [PATCH 5/6] ARC: mm: tlb flush optim: elide repeated uTLB invalidate
 in loop
In-Reply-To: <20190916213207.12792-1-vgupta@synopsys.com>
References: <20190916213207.12792-1-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190916213207.12792-6-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The unconditional full TLB flush (on say ASID rollover) iterates over each
entry and uses TLBWrite to zero it out. TLBWrite by design also invalidates
the uTLBs thus we end up invalidating it as many times as numbe rof
entries (512 or 1k)

Optimize this by using a weaker TLBWriteNI cmd in loop, which doesn't
tinker with uTLBs and an explicit one time IVUTLB, outside the loop to
invalidate them all once.

And given the optimiztion, the IVUTLB is now needed on MMUv4 too where
the uTLBs and JTLBs are otherwise coherent given the TLBInsertEntry /
TLBDeleteEntry commands

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/tlb.c | 74 +++++++++++++++++++----------------------------
 1 file changed, 29 insertions(+), 45 deletions(-)

diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 417f05ac4397..210d807983dd 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -118,6 +118,33 @@ static inline void __tlb_entry_erase(void)
 	write_aux_reg(ARC_REG_TLBCOMMAND, TLBWrite);
 }
 
+static void utlb_invalidate(void)
+{
+#if (CONFIG_ARC_MMU_VER >= 2)
+
+#if (CONFIG_ARC_MMU_VER == 2)
+	/* MMU v2 introduced the uTLB Flush command.
+	 * There was however an obscure hardware bug, where uTLB flush would
+	 * fail when a prior probe for J-TLB (both totally unrelated) would
+	 * return lkup err - because the entry didn't exist in MMU.
+	 * The Workround was to set Index reg with some valid value, prior to
+	 * flush. This was fixed in MMU v3
+	 */
+	unsigned int idx;
+
+	/* make sure INDEX Reg is valid */
+	idx = read_aux_reg(ARC_REG_TLBINDEX);
+
+	/* If not write some dummy val */
+	if (unlikely(idx & TLB_LKUP_ERR))
+		write_aux_reg(ARC_REG_TLBINDEX, 0xa);
+#endif
+
+	write_aux_reg(ARC_REG_TLBCOMMAND, TLBIVUTLB);
+#endif
+
+}
+
 #if (CONFIG_ARC_MMU_VER < 4)
 
 static inline unsigned int tlb_entry_lkup(unsigned long vaddr_n_asid)
@@ -149,44 +176,6 @@ static void tlb_entry_erase(unsigned int vaddr_n_asid)
 	}
 }
 
-/****************************************************************************
- * ARC700 MMU caches recently used J-TLB entries (RAM) as uTLBs (FLOPs)
- *
- * New IVUTLB cmd in MMU v2 explictly invalidates the uTLB
- *
- * utlb_invalidate ( )
- *  -For v2 MMU calls Flush uTLB Cmd
- *  -For v1 MMU does nothing (except for Metal Fix v1 MMU)
- *      This is because in v1 TLBWrite itself invalidate uTLBs
- ***************************************************************************/
-
-static void utlb_invalidate(void)
-{
-#if (CONFIG_ARC_MMU_VER >= 2)
-
-#if (CONFIG_ARC_MMU_VER == 2)
-	/* MMU v2 introduced the uTLB Flush command.
-	 * There was however an obscure hardware bug, where uTLB flush would
-	 * fail when a prior probe for J-TLB (both totally unrelated) would
-	 * return lkup err - because the entry didn't exist in MMU.
-	 * The Workround was to set Index reg with some valid value, prior to
-	 * flush. This was fixed in MMU v3 hence not needed any more
-	 */
-	unsigned int idx;
-
-	/* make sure INDEX Reg is valid */
-	idx = read_aux_reg(ARC_REG_TLBINDEX);
-
-	/* If not write some dummy val */
-	if (unlikely(idx & TLB_LKUP_ERR))
-		write_aux_reg(ARC_REG_TLBINDEX, 0xa);
-#endif
-
-	write_aux_reg(ARC_REG_TLBCOMMAND, TLBIVUTLB);
-#endif
-
-}
-
 static void tlb_entry_insert(unsigned int pd0, pte_t pd1)
 {
 	unsigned int idx;
@@ -219,11 +208,6 @@ static void tlb_entry_insert(unsigned int pd0, pte_t pd1)
 
 #else	/* CONFIG_ARC_MMU_VER >= 4) */
 
-static void utlb_invalidate(void)
-{
-	/* No need since uTLB is always in sync with JTLB */
-}
-
 static void tlb_entry_erase(unsigned int vaddr_n_asid)
 {
 	write_aux_reg(ARC_REG_TLBPD0, vaddr_n_asid | _PAGE_PRESENT);
@@ -267,7 +251,7 @@ noinline void local_flush_tlb_all(void)
 	for (entry = 0; entry < num_tlb; entry++) {
 		/* write this entry to the TLB */
 		write_aux_reg(ARC_REG_TLBINDEX, entry);
-		write_aux_reg(ARC_REG_TLBCOMMAND, TLBWrite);
+		write_aux_reg(ARC_REG_TLBCOMMAND, TLBWriteNI);
 	}
 
 	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
@@ -278,7 +262,7 @@ noinline void local_flush_tlb_all(void)
 
 		for (entry = stlb_idx; entry < stlb_idx + 16; entry++) {
 			write_aux_reg(ARC_REG_TLBINDEX, entry);
-			write_aux_reg(ARC_REG_TLBCOMMAND, TLBWrite);
+			write_aux_reg(ARC_REG_TLBCOMMAND, TLBWriteNI);
 		}
 	}
 
-- 
2.20.1
