From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 13 Apr 2016 17:10:04 +0530
Subject: [PATCH v4 4/5] ARC: [intc-*] Do a domain lookup in primary handler
 for hwirq -> linux virq
In-Reply-To: <1460547605-26184-1-git-send-email-vgupta@synopsys.com>
References: <1460547605-26184-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1460547605-26184-5-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The primary interrupt handler arch_do_IRQ() was passing hwirq as linux
virq to core code. This was fragile and worked so far as we only had legacy/linear
domains.

This came out of a rant by Marc Zyngier.
http://lists.infradead.org/pipermail/linux-snps-arc/2015-December/000298.html

Cc: Marc Zyngier <marc.zyngier at arm.com>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Noam Camus <noamc at ezchip.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Kconfig               |  1 +
 arch/arc/kernel/intc-arcv2.c   |  9 ++++++---
 arch/arc/kernel/intc-compact.c | 10 ++++++----
 arch/arc/kernel/irq.c          |  9 ++-------
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 80b222651a90..bf0a4fd45d25 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -31,6 +31,7 @@ config ARC
 	select HAVE_MOD_ARCH_SPECIFIC if ARC_DW2_UNWIND
 	select HAVE_OPROFILE
 	select HAVE_PERF_EVENTS
+	select HANDLE_DOMAIN_IRQ
 	select IRQ_DOMAIN
 	select MODULES_USE_ELF_RELA
 	select NO_BOOTMEM
diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index 942526322ae7..592cc977151e 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -137,21 +137,24 @@ static const struct irq_domain_ops arcv2_irq_ops = {
 	.map = arcv2_irq_map,
 };
 
-static struct irq_domain *root_domain;
 
 static int __init
 init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
 {
+	struct irq_domain *root_domain;
+
 	if (parent)
 		panic("DeviceTree incore intc not a root irq controller\n");
 
 	root_domain = irq_domain_add_legacy(intc, NR_CPU_IRQS, 0, 0,
 					    &arcv2_irq_ops, NULL);
-
 	if (!root_domain)
 		panic("root irq domain not avail\n");
 
-	/* with this we don't need to export root_domain */
+	/*
+	 * Needed for primary domain lookup to succeed
+	 * This is a primary irqchip, and can never have a parent
+	 */
 	irq_set_default_host(root_domain);
 
 	return 0;
diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index d31bc647146d..48a8b24de23e 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -97,21 +97,23 @@ static const struct irq_domain_ops arc_intc_domain_ops = {
 	.map = arc_intc_domain_map,
 };
 
-static struct irq_domain *root_domain;
-
 static int __init
 init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
 {
+	struct irq_domain *root_domain;
+
 	if (parent)
 		panic("DeviceTree incore intc not a root irq controller\n");
 
 	root_domain = irq_domain_add_legacy(intc, NR_CPU_IRQS, 0, 0,
 					    &arc_intc_domain_ops, NULL);
-
 	if (!root_domain)
 		panic("root irq domain not avail\n");
 
-	/* with this we don't need to export root_domain */
+	/*
+	 * Needed for primary domain lookup to succeed
+	 * This is a primary irqchip, and can never have a parent
+	 */
 	irq_set_default_host(root_domain);
 
 	return 0;
diff --git a/arch/arc/kernel/irq.c b/arch/arc/kernel/irq.c
index fb6dede9d05f..538b36afe89e 100644
--- a/arch/arc/kernel/irq.c
+++ b/arch/arc/kernel/irq.c
@@ -41,12 +41,7 @@ void __init init_IRQ(void)
  * "C" Entry point for any ARC ISR, called from low level vector handler
  * @irq is the vector number read from ICAUSE reg of on-chip intc
  */
-void arch_do_IRQ(unsigned int irq, struct pt_regs *regs)
+void arch_do_IRQ(unsigned int hwirq, struct pt_regs *regs)
 {
-	struct pt_regs *old_regs = set_irq_regs(regs);
-
-	irq_enter();
-	generic_handle_irq(irq);
-	irq_exit();
-	set_irq_regs(old_regs);
+	handle_domain_irq(NULL, hwirq, regs);
 }
-- 
2.5.0
