From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 25 Aug 2017 17:22:41 +0300
Subject: [PATCHi v2] arc: Mask individual IRQ lines during core INTC init
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1503670961-16781-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>

ARC cores on reset have all interrupt lines of built-in INTC enabled.
Which means once we globally enable interrupts (very early on boot)
faulty hardware blocks may trigger an interrupt that Linux kernel
cannot handle yet as corresponding handler is not yet installed.

In that case system falls in "interrupt storm" and basically never
does anything useful except entering and exiting generic IRQ handling
code.

One real example of that kind of problematic hardware is DW GMAC which
also has interrupts enabled on reset and if Ethernet PHY informs GMAC
about link state, GMAC immediately reports that upstream to ARC core
and here we are.

Now with that change we mask all individual IRQ lines making entire
system more fool-proof.

[This patch was motivated by Adaptrum platform support]

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Eugeniy Paltsev <paltsev at synopsys.com>
Tested-by: Alexandru Gagniuc <alex.g at adaptrum.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---

Changes v1 -> v2:
  Fixed arcv2 SMP case.
  1. IDU simply routes signals from its inputs to a particular IRQ lines of
     ARC core in SMP cluster. Moreover with IRQ affinity IDU could be set such
     that it routes intrrupt signals every time to a different core
     (round-robin) or always to a dedicated core. So it is not practical to
     manage common interrupts on ARC cores but instead set IDU properly.
     That said on ARC cores we unconditinally enable all "common" interrupt
     lines expecting IDU to only routes interrupts expectedly (i.e. not before
     a corresponding handler was installed).
  2. All priveta-per-core interrupt lines are not covered by IDU so we have to
     manage them right in the ARC's INTC and so we do now
     (hwirq < FIRST_EXT_IRQ).

 arch/arc/kernel/intc-arcv2.c   |  4 ++++
 arch/arc/kernel/intc-compact.c | 14 +++++++++++++-
 arch/arc/kernel/mcip.c         | 15 +++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index f928795fd07a..2db639874849 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -75,10 +75,14 @@ void arc_init_IRQ(void)
 	 * Set a default priority for all available interrupts to prevent
 	 * switching of register banks if Fast IRQ and multiple register banks
 	 * are supported by CPU.
+	 * Also disable private-per-core IRQ lines so faulty external HW won't
+	 * trigger interrupt that kernel is not ready to handle.
 	 */
 	for (i = NR_EXCEPTIONS; i < irq_bcr.irqs + NR_EXCEPTIONS; i++) {
 		write_aux_reg(AUX_IRQ_SELECT, i);
 		write_aux_reg(AUX_IRQ_PRIORITY, ARCV2_IRQ_DEF_PRIO);
+		if (i < FIRST_EXT_IRQ)
+			write_aux_reg(AUX_IRQ_ENABLE, 0);
 	}
 
 	/* setup status32, don't enable intr yet as kernel doesn't want */
diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index 7e608c6b0a01..cef388025adf 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -27,7 +27,7 @@
  */
 void arc_init_IRQ(void)
 {
-	int level_mask = 0;
+	int level_mask = 0, i;
 
        /* Is timer high priority Interrupt (Level2 in ARCompact jargon) */
 	level_mask |= IS_ENABLED(CONFIG_ARC_COMPACT_IRQ_LEVELS) << TIMER0_IRQ;
@@ -40,6 +40,18 @@ void arc_init_IRQ(void)
 
 	if (level_mask)
 		pr_info("Level-2 interrupts bitset %x\n", level_mask);
+
+	/*
+	 * Disable all IRQ lines so faulty external hardware won't
+	 * trigger interrupt that kernel is not ready to handle.
+	 */
+	for (i = TIMER0_IRQ; i < NR_CPU_IRQS; i++) {
+		unsigned int ienb;
+
+		ienb = read_aux_reg(AUX_IENABLE);
+		ienb &= ~(1 << i);
+		write_aux_reg(AUX_IENABLE, ienb);
+	}
 }
 
 /*
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
