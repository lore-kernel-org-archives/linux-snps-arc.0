From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 1 Sep 2017 11:06:02 -0700
Subject: [PATCH] ARC: Machine Check Exception: enable MMU in single place
In-Reply-To: <d0f55ba3b94de5c1bb7c93cbadb9829fa6889fed.1504281896.git.joabreu@synopsys.com>
References: <d0f55ba3b94de5c1bb7c93cbadb9829fa6889fed.1504281896.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1504289162-25977-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Machine check Exception is handled in distinc ways depending on cause
 - Duplicate TLB Entry (relevent mostly for ARC700)
 - everything else

Currently we re-enable MMU seperately for each of these cases, which can
be consolidated by dign this before we fork off the handling in low
level handler.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/entry.S | 6 ++++++
 arch/arc/kernel/traps.c | 6 ------
 arch/arc/mm/tlb.c       | 3 ---
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index 1eea99beecc3..85d9ea4a0acc 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -92,6 +92,12 @@ ENTRY(EV_MachineCheck)
 	lr  r0, [efa]
 	mov r1, sp
 
+	; hardware auto-disables MMU, re-enable it to allow kernel vaddr
+	; access for say stack unwinding of modules for crash dumps
+	lr	r3, [ARC_REG_PID]
+	or	r3, r3, MMU_ENABLE
+	sr	r3, [ARC_REG_PID]
+
 	lsr  	r3, r2, 8
 	bmsk 	r3, r3, 7
 	brne    r3, ECR_C_MCHK_DUP_TLB, 1f
diff --git a/arch/arc/kernel/traps.c b/arch/arc/kernel/traps.c
index b636dfe8ee9e..b03daa7a9a2b 100644
--- a/arch/arc/kernel/traps.c
+++ b/arch/arc/kernel/traps.c
@@ -105,12 +105,6 @@ int do_misaligned_access(unsigned long address, struct pt_regs *regs,
  */
 void do_machine_check_fault(unsigned long address, struct pt_regs *regs)
 {
-	/*
-	 * Hardware auto-disables MMU upon this exception hence re-enabled
-	 * for ksym lookup in modules to work (in kernel vaddr space)
-	 */
-	write_aux_reg(ARC_REG_PID, MMU_ENABLE | read_aux_reg(ARC_REG_PID));
-
 	die("Unhandled Machine Check Exception", regs, address);
 }
 
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index edc59a0a9c9b..8ceefbf72fb0 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -908,9 +908,6 @@ void do_tlb_overlap_fault(unsigned long cause, unsigned long address,
 
 	local_irq_save(flags);
 
-	/* re-enable the MMU */
-	write_aux_reg(ARC_REG_PID, MMU_ENABLE | read_aux_reg(ARC_REG_PID));
-
 	/* loop thru all sets of TLB */
 	for (set = 0; set < mmu->sets; set++) {
 
-- 
2.7.4
