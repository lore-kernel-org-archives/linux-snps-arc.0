From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Sat, 28 Jan 2017 03:01:42 +0300
Subject: [PATCH 5/6] ARCv2: IRQ: Use build registers for getting numbers of
 interrupts
In-Reply-To: <1485561703-20921-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485561703-20921-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485561703-20921-6-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This enhancement allows to mask all available common interrupts
in IDU interrupt controller in boot time since the kernel can
discover a number of them from the build register. Also now there
is no need to specify in device tree a list of used core interrupts
by IDU. E.g. before:

    idu_intc: idu-interrupt-controller {
        compatible = "snps,archs-idu-intc";
        interrupt-controller;
        interrupt-parent = <&core_intc>;
        #interrupt-cells = <2>;
        interrupts = <24 25 26 27 28 29 30 31>;
    };

and after:

    idu_intc: idu-interrupt-controller {
        compatible = "snps,archs-idu-intc";
        interrupt-controller;
        interrupt-parent = <&core_intc>;
        #interrupt-cells = <2>;
    };

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/include/asm/irq.h   |  3 +++
 arch/arc/kernel/intc-arcv2.c |  7 ++++++-
 arch/arc/kernel/mcip.c       | 31 +++++++++++++++++++------------
 3 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index dfa09e3..1970d78c 100644
--- a/arch/arc/include/asm/irq.h
+++ b/arch/arc/include/asm/irq.h
@@ -18,6 +18,9 @@
  */
 #define NR_CPU_IRQS	240
 
+/* A fixed number of exceptions which occupy first interrupt lines */
+#define NR_EXCEPTIONS	16
+
 /*
  * ARCv2 can support 240 interrupts in the core interrupts controllers and
  * 128 interrupts in IDU. Thus 512 virtual IRQs must be enough for most
diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index a9a7497..b2a6de4 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -123,11 +123,16 @@ static int __init
 init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
 {
 	struct irq_domain *root_domain;
+	struct bcr_irq_arcv2 irq_bcr;
+	unsigned int nr_cpu_irqs;
+
+	READ_BCR(ARC_REG_IRQ_BCR, irq_bcr);
+	nr_cpu_irqs = irq_bcr.irqs + NR_EXCEPTIONS;
 
 	if (parent)
 		panic("DeviceTree incore intc not a root irq controller\n");
 
-	root_domain = irq_domain_add_linear(intc, NR_CPU_IRQS, &arcv2_irq_ops, NULL);
+	root_domain = irq_domain_add_linear(intc, nr_cpu_irqs, &arcv2_irq_ops, NULL);
 	if (!root_domain)
 		panic("root irq domain not avail\n");
 
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index 9988b42..45d45fc 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -157,15 +157,20 @@ static void idu_set_mode(unsigned int cmn_irq, unsigned int lvl,
 	__mcip_cmd_data(CMD_IDU_SET_MODE, cmn_irq, data.word);
 }
 
-static void idu_irq_mask(struct irq_data *data)
+static void idu_irq_mask_raw(irq_hw_number_t hwirq)
 {
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&mcip_lock, flags);
-	__mcip_cmd_data(CMD_IDU_SET_MASK, data->hwirq, 1);
+	__mcip_cmd_data(CMD_IDU_SET_MASK, hwirq, 1);
 	raw_spin_unlock_irqrestore(&mcip_lock, flags);
 }
 
+static void idu_irq_mask(struct irq_data *data)
+{
+	idu_irq_mask_raw(data->hwirq);
+}
+
 static void idu_irq_unmask(struct irq_data *data)
 {
 	unsigned long flags;
@@ -231,14 +236,12 @@ static struct irq_chip idu_irq_chip = {
 
 };
 
-static irq_hw_number_t idu_first_hwirq;
-
 static void idu_cascade_isr(struct irq_desc *desc)
 {
 	struct irq_domain *idu_domain = irq_desc_get_handler_data(desc);
 	struct irq_chip *core_chip = irq_desc_get_chip(desc);
 	irq_hw_number_t core_hwirq = irqd_to_hwirq(irq_desc_get_irq_data(desc));
-	irq_hw_number_t idu_hwirq = core_hwirq - idu_first_hwirq;
+	irq_hw_number_t idu_hwirq = core_hwirq - FIRST_EXT_IRQ;
 
 	chained_irq_enter(core_chip, desc);
 	generic_handle_irq(irq_find_mapping(idu_domain, idu_hwirq));
@@ -284,33 +287,37 @@ static int __init
 idu_of_init(struct device_node *intc, struct device_node *parent)
 {
 	struct irq_domain *domain;
-	/* Read IDU BCR to confirm nr_irqs */
-	int nr_irqs = of_irq_count(intc);
+	int nr_irqs;
 	int i, virq;
 	struct mcip_bcr mp;
+	struct mcip_idu_bcr idu_bcr;
 
 	READ_BCR(ARC_REG_MCIP_BCR, mp);
 
 	if (!mp.idu)
 		panic("IDU not detected, but DeviceTree using it");
 
-	pr_info("MCIP: IDU referenced from Devicetree %d irqs\n", nr_irqs);
+	READ_BCR(ARC_REG_MCIP_IDU_BCR, idu_bcr);
+	nr_irqs = mcip_idu_bcr_to_nr_irqs(idu_bcr);
+
+	pr_info("MCIP: IDU supports %u common irqs\n", nr_irqs);
 
 	domain = irq_domain_add_linear(intc, nr_irqs, &idu_irq_ops, NULL);
 
 	/* Parent interrupts (core-intc) are already mapped */
 
 	for (i = 0; i < nr_irqs; i++) {
+		/* Mask all common interrupts by default */
+		idu_irq_mask_raw(i);
+
 		/*
 		 * Return parent uplink IRQs (towards core intc) 24,25,.....
 		 * this step has been done before already
 		 * however we need it to get the parent virq and set IDU handler
 		 * as first level isr
 		 */
-		virq = irq_of_parse_and_map(intc, i);
-		if (!i)
-			idu_first_hwirq = irqd_to_hwirq(irq_get_irq_data(virq));
-
+		virq = irq_create_mapping(NULL, i + FIRST_EXT_IRQ);
+		BUG_ON(!virq);
 		irq_set_chained_handler_and_data(virq, idu_cascade_isr, domain);
 	}
 
-- 
2.7.4
