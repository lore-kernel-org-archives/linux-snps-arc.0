From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 25 Aug 2017 23:27:39 +0300
Subject: [PATCH] arc: arcv2: Mask only private-per-core IRQ lines on boot
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1503692859-11187-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This fixes a8ec3ee861b6 "arc: Mask individual IRQ lines during core INTC init".
Above commit breaks interrupt handling on ARCv2 SMP systems because
slave cores are left with common interrupts (those coming form IDU) disabled.
And given by default IDU distributes incoming IRQs to all cores following
round-robin routine 3 out of 4 interrupts from a particular peripheral
won't be served.

Solution here is simple but 2-folded:
  1. Unconditionally enable all "common" interrupt lines expecting IDU to only
     route interrupts expectedly (i.e. not before a corresponding handler
     was installed).
  2. All privete-per-core interrupt lines are not covered by IDU so we have to
     manage them right in the ARC's INTC and so we do now
     (hwirq < FIRST_EXT_IRQ).

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/kernel/intc-arcv2.c |  5 +++--
 arch/arc/kernel/mcip.c       | 15 +++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index cf90714a676d..2db639874849 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -75,13 +75,14 @@ void arc_init_IRQ(void)
 	 * Set a default priority for all available interrupts to prevent
 	 * switching of register banks if Fast IRQ and multiple register banks
 	 * are supported by CPU.
-	 * Also disable all IRQ lines so faulty external hardware won't
+	 * Also disable private-per-core IRQ lines so faulty external HW won't
 	 * trigger interrupt that kernel is not ready to handle.
 	 */
 	for (i = NR_EXCEPTIONS; i < irq_bcr.irqs + NR_EXCEPTIONS; i++) {
 		write_aux_reg(AUX_IRQ_SELECT, i);
 		write_aux_reg(AUX_IRQ_PRIORITY, ARCV2_IRQ_DEF_PRIO);
-		write_aux_reg(AUX_IRQ_ENABLE, 0);
+		if (i < FIRST_EXT_IRQ)
+			write_aux_reg(AUX_IRQ_ENABLE, 0);
 	}
 
 	/* setup status32, don't enable intr yet as kernel doesn't want */
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index f61a52b01625..6a889828db4f 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -303,6 +303,21 @@ idu_of_init(struct device_node *intc, struct device_node *parent)
 		virq = irq_create_mapping(NULL, i + FIRST_EXT_IRQ);
 		BUG_ON(!virq);
 		irq_set_chained_handler_and_data(virq, idu_cascade_isr, domain);
+		/*
+		 * irq_set_chained_handler_and_data() silently executes
+		 * idu_irq_enable() which leaves us with all common interrupts
+		 * enabled right on start which allows faulty HW to generate
+		 * an interrupt which we are not ready to support yet.
+		 * So explicitly mask freshly set IRQ.
+		 * Note we have to do all that magic because IDU is not a real
+		 * cascaded INTC with N inputs and one upstream output.
+		 * What IDU really does it just mirrors its N inputs to
+		 * N*core_num outputs so we either need to selectively disable
+		 * or enable IRQ lines on upstream INTCs of ARC cores (and do
+		 * it for each and every ARC core in the cluster) or simply mask
+		 * inputs of the IDU just in one place here.
+		 */
+		idu_irq_mask_raw(i);
 	}
 
 	__mcip_cmd(CMD_IDU_ENABLE, 0);
-- 
2.7.5
