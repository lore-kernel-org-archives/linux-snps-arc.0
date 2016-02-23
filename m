From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 23 Feb 2016 14:41:39 +0530
Subject: [PATCH 2/5] ARC: [intc-compact] Remove IPI setup from ARCompact port
In-Reply-To: <1456218702-11911-1-git-send-email-vgupta@synopsys.com>
References: <1456218702-11911-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1456218702-11911-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

There is no real ARC700 based SMP SoC so remove IPI definition.
EZChip's SMP ARC700 is going to use a different intc and IPI provider
anyways.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/irq.h     | 1 -
 arch/arc/kernel/intc-compact.c | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index 4fd7d62a6e30..bc5103637326 100644
--- a/arch/arc/include/asm/irq.h
+++ b/arch/arc/include/asm/irq.h
@@ -16,7 +16,6 @@
 #ifdef CONFIG_ISA_ARCOMPACT
 #define TIMER0_IRQ      3
 #define TIMER1_IRQ      4
-#define IPI_IRQ		(NR_CPU_IRQS-1) /* dummy to enable SMP build for up hardware */
 #else
 #define TIMER0_IRQ      16
 #define TIMER1_IRQ      17
diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index 06bcedf19b62..224d1c3aa9c4 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -81,9 +81,6 @@ static int arc_intc_domain_map(struct irq_domain *d, unsigned int irq,
 {
 	switch (irq) {
 	case TIMER0_IRQ:
-#ifdef CONFIG_SMP
-	case IPI_IRQ:
-#endif
 		irq_set_chip_and_handler(irq, &onchip_intc, handle_percpu_irq);
 		break;
 	default:
-- 
2.5.0
