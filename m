From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 29 Jan 2016 13:06:35 +0530
Subject: [PATCH 1/5] ARC: [intc-compact] Remove IPI setup from ARCompact port
In-Reply-To: <1454052999-5349-1-git-send-email-vgupta@synopsys.com>
References: <1454052999-5349-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454052999-5349-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

There is no real ARC700 based SMP SoC so remove IPI definition.
EZChip's SMP ARC700 is going to use a different intc and IPI provider
anyways.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/irq.h     | 5 +----
 arch/arc/kernel/intc-compact.c | 3 ---
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index 44b6ea85e8fb..c9b4d83c70f7 100644
--- a/arch/arc/include/asm/irq.h
+++ b/arch/arc/include/asm/irq.h
@@ -12,10 +12,7 @@
 #define NR_CPU_IRQS	32  /* number of interrupt lines of ARC770 CPU */
 #define NR_IRQS		128 /* allow some CPU external IRQ handling */
 
-/* Platform Independent IRQs */
-#ifdef CONFIG_ISA_ARCOMPACT
-#define IPI_IRQ		(NR_CPU_IRQS-1) /* dummy to enable SMP build for up hardware */
-#else
+#ifdef CONFIG_ISA_ARCV2
 #define IPI_IRQ         19
 #endif
 
diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index 5d390958d233..2955b39ea2b0 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -83,9 +83,6 @@ static int arc_intc_domain_map(struct irq_domain *d, unsigned int irq,
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
