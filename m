From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Wed,  8 Feb 2017 02:04:07 +0300
Subject: [PATCH] ARCv2: intc: Disable all core interrupts by default
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1486508647-5997-1-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The kernel emits a lot of warnings about unexpected IRQs when
an appropriate driver is not presented. It happens because all
interrupts in the core controller are enabled by default after
reset. It would be wise to keep all interrupts masked by default.

Thus disable all local and common interrupts. If CPU consists of
only 1 core without IDU then it is necessary to disable all
interrupts in the core interrupt controller. If CPU contains IDU
it means that there are may be more than 1 cores and common
interrupts (>= FIRST_EXT_IRQ) must be disabled in IDU.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/kernel/intc-arcv2.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index f928795..ac84d09 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -12,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/irqdomain.h>
 #include <linux/irqchip.h>
+#include <soc/arc/mcip.h>
 #include <asm/irq.h>
 
 #define NR_EXCEPTIONS	16
@@ -34,6 +35,7 @@ void arc_init_IRQ(void)
 {
 	unsigned int tmp, irq_prio, i;
 	struct bcr_irq_arcv2 irq_bcr;
+	struct mcip_bcr mp;
 
 	struct aux_irq_ctrl {
 #ifdef CONFIG_CPU_BIG_ENDIAN
@@ -75,10 +77,27 @@ void arc_init_IRQ(void)
 	 * Set a default priority for all available interrupts to prevent
 	 * switching of register banks if Fast IRQ and multiple register banks
 	 * are supported by CPU.
+	 *
+	 * Disable all local and common interrupts. If CPU consists of only 1
+	 * core without IDU then it is necessary to disable all interrupts
+	 * in the core interrupt controller. If CPU contains IDU it means that
+	 * there are may be more than 1 cores and common interrupts
+	 * (>= FIRST_EXT_IRQ) must be disabled in IDU.
 	 */
+
+	READ_BCR(ARC_REG_MCIP_BCR, mp);
+
 	for (i = NR_EXCEPTIONS; i < irq_bcr.irqs + NR_EXCEPTIONS; i++) {
 		write_aux_reg(AUX_IRQ_SELECT, i);
 		write_aux_reg(AUX_IRQ_PRIORITY, ARCV2_IRQ_DEF_PRIO);
+
+		/*
+		 * If IDU exists then all common interrupts >= FIRST_EXT_IRQ
+		 * are masked by IDU thus disable only local interrupts (below
+		 * FIRST_EXT_IRQ). Otherwise disable all interrupts.
+		 */
+		if (!mp.idu || i < FIRST_EXT_IRQ)
+			write_aux_reg(AUX_IRQ_ENABLE, 0);
 	}
 
 	/* setup status32, don't enable intr yet as kernel doesn't want */
-- 
2.7.4
