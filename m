From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Tue, 31 Jan 2017 14:45:24 +0300
Subject: [PATCH v2 4/4] ARCv2: IRQ: Set a default priority for all core
 interrupts
In-Reply-To: <1485863124-26426-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485863124-26426-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485863124-26426-5-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

After reset all interrupts in the core interrupt controller has
the highest priority P0. If the platform supports Fast IRQs and
has more than 1 banks of registers then CPU automatically switch
banks of registers when P0 interrupt comes.

The problem is that the kernel expects that by default switching
of banks is not used by all interrupts. It is necessary to set a
default nonzero priority for all available interrupts to avoid
undefined behaviour.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/kernel/intc-arcv2.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index 31246cc..d4fa4a5 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -22,7 +22,7 @@
  */
 void arc_init_IRQ(void)
 {
-	unsigned int tmp, irq_prio;
+	unsigned int tmp, irq_prio, i;
 
 	struct bcr_irq_arcv2 irq_bcr;
 
@@ -62,6 +62,16 @@ void arc_init_IRQ(void)
 		irq_prio + 1, ARCV2_IRQ_DEF_PRIO,
 		irq_bcr.firq ? " FIRQ (not used)":"");
 
+	/*
+	 * Set a default priority for all available interrupts to prevent
+	 * switching of register banks if Fast IRQ and multiple register banks
+	 * are supported by CPU.
+	 */
+	for (i = NR_EXCEPTIONS; i < irq_bcr.irqs + NR_EXCEPTIONS; i++) {
+		write_aux_reg(AUX_IRQ_SELECT, i);
+		write_aux_reg(AUX_IRQ_PRIORITY, ARCV2_IRQ_DEF_PRIO);
+	}
+
 	/* setup status32, don't enable intr yet as kernel doesn't want */
 	tmp = read_aux_reg(ARC_REG_STATUS32);
 	tmp |= STATUS_AD_MASK | (ARCV2_IRQ_DEF_PRIO << 1);
-- 
2.7.4
