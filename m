From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 28 Aug 2017 15:03:58 -0700
Subject: [PATCH] ARCv2: SMP: Mask only private-per-core IRQ lines on boot at
 core intc
In-Reply-To: <1503957838-21505-1-git-send-email-vgupta@synopsys.com>
References: <1503957838-21505-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1503957838-21505-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Alexey Brodkin <abrodkin@synopsys.com>

Recent commit a8ec3ee861b6 "arc: Mask individual IRQ lines during core INTC init"
breaks interrupt handling on ARCv2 SMP systems.

That commit masked all interrupts at onset, as some controllers on some boards
(customer as well as internal), would assert interrutps early before any handlers
were installed. For SMP systems, the masking was done at each cpu's core-intc.
Later, when the IRQ was actually requested, it was unmasked, but only on the
requesting cpu. For "common" interrupts, which were wired up from the
2nd level IDU intc, this was as issue as they needed to be enabled on ALL
the cpus (given that IDU IRQs are by default served Round Robin across
cpus)

So fix that by NOT masking "common" interrupts at core-intc, but instead
at the 2nd level IDU intc (latter already being done in idu_of_init())

Fixes: a8ec3ee861b6 ("arc: Mask individual IRQ lines during core INTC init")
Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
[vgupta: reworked changelog, removed the extraneous idu_irq_mask_raw()]

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/intc-arcv2.c   | 11 +++++++++--
 arch/arc/kernel/intc-compact.c |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index cf90714a676d..067ea362fb3e 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -75,13 +75,20 @@ void arc_init_IRQ(void)
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
+
+		/*
+		 * Only mask cpu private IRQs here.
+		 * "common" interrupts are masked at IDU, otherwise it would
+		 * need to be unmasked at each cpu, with IPIs
+		 */
+		if (i < FIRST_EXT_IRQ)
+			write_aux_reg(AUX_IRQ_ENABLE, 0);
 	}
 
 	/* setup status32, don't enable intr yet as kernel doesn't want */
diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index cef388025adf..47b421fa0147 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -27,7 +27,7 @@
  */
 void arc_init_IRQ(void)
 {
-	int level_mask = 0, i;
+	unsigned int level_mask = 0, i;
 
        /* Is timer high priority Interrupt (Level2 in ARCompact jargon) */
 	level_mask |= IS_ENABLED(CONFIG_ARC_COMPACT_IRQ_LEVELS) << TIMER0_IRQ;
-- 
2.7.4
