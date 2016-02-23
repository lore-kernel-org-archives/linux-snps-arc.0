From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 23 Feb 2016 14:41:42 +0530
Subject: [PATCH 5/5] ARC: SMP: No need for CONFIG_ARC_IPI_DBG
In-Reply-To: <1456218702-11911-1-git-send-email-vgupta@synopsys.com>
References: <1456218702-11911-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1456218702-11911-6-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This was more relevant during SMP bringup.

The warning for bogus msg better be visible always.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Kconfig       | 8 --------
 arch/arc/kernel/mcip.c | 9 +--------
 arch/arc/kernel/smp.c  | 3 ---
 3 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 4abc81907071..8a188bc1786a 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -532,14 +532,6 @@ config ARC_DBG_TLB_MISS_COUNT
 	  Counts number of I and D TLB Misses and exports them via Debugfs
 	  The counters can be cleared via Debugfs as well
 
-if SMP
-
-config ARC_IPI_DBG
-	bool "Debug Inter Core interrupts"
-	default n
-
-endif
-
 endif
 
 config ARC_UBOOT_SUPPORT
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index 7afc3c703ed1..7b4af70ffd18 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -65,7 +65,6 @@ static void mcip_ipi_clear(int irq)
 {
 	unsigned int cpu, c;
 	unsigned long flags;
-	unsigned int __maybe_unused copy;
 
 	if (unlikely(irq == SOFTIRQ_IRQ)) {
 		arc_softirq_clear(irq);
@@ -77,7 +76,7 @@ static void mcip_ipi_clear(int irq)
 	/* Who sent the IPI */
 	__mcip_cmd(CMD_INTRPT_CHECK_SOURCE, 0);
 
-	copy = cpu = read_aux_reg(ARC_REG_MCIP_READBACK);	/* 1,2,4,8... */
+	cpu = read_aux_reg(ARC_REG_MCIP_READBACK);	/* 1,2,4,8... */
 
 	/*
 	 * In rare case, multiple concurrent IPIs sent to same target can
@@ -91,12 +90,6 @@ static void mcip_ipi_clear(int irq)
 	} while (cpu);
 
 	raw_spin_unlock_irqrestore(&mcip_lock, flags);
-
-#ifdef CONFIG_ARC_IPI_DBG
-	if (c != __ffs(copy))
-		pr_info("IPIs from %x coalesced to %x\n",
-			copy, raw_smp_processor_id());
-#endif
 }
 
 static void mcip_probe_n_setup(void)
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index ef6e9e15b82a..424e937da5c8 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -336,11 +336,8 @@ irqreturn_t do_IPI(int irq, void *dev_id)
 		int rc;
 
 		rc = __do_IPI(msg);
-#ifdef CONFIG_ARC_IPI_DBG
-		/* IPI received but no valid @msg */
 		if (rc)
 			pr_info("IPI with bogus msg %ld in %ld\n", msg, copy);
-#endif
 		pending &= ~(1U << msg);
 	} while (pending);
 
-- 
2.5.0
