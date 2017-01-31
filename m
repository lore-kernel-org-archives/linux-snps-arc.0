From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Tue, 31 Jan 2017 14:45:23 +0300
Subject: [PATCH v2 3/4] ARCv2: IRQ: Use build registers for getting numbers of
 interrupts
In-Reply-To: <1485863124-26426-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485863124-26426-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485863124-26426-4-git-send-email-yuriy.kolerov@synopsys.com>
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
 arch/arc/include/asm/irq.h   |  4 ++++
 arch/arc/kernel/intc-arcv2.c |  9 +++++++--
 arch/arc/kernel/mcip.c       | 31 +++++++++++++++++++------------
 include/soc/arc/mcip.h       | 17 +++++++++++++++++
 4 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index d28499a..1970d78c 100644
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
@@ -28,6 +31,7 @@
 /* Platform Independent IRQs */
 #define IPI_IRQ		19
 #define SOFTIRQ_IRQ	21
+#define FIRST_EXT_IRQ	24
 
 #else
 
diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index 9de0665..31246cc 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -109,7 +109,7 @@ static int arcv2_irq_map(struct irq_domain *d, unsigned int irq,
 	 * core intc IRQs [16, 23]:
 	 * Statically assigned always private-per-core (Timers, WDT, IPI, PCT)
 	 */
-	if (hw < 24) {
+	if (hw < FIRST_EXT_IRQ) {
 		/*
 		 * A subsequent request_percpu_irq() fails if percpu_devid is
 		 * not set. That in turns sets NOAUTOEN, meaning each core needs
@@ -134,11 +134,16 @@ static int __init
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
 
diff --git a/include/soc/arc/mcip.h b/include/soc/arc/mcip.h
index 6902c2a..798c01b 100644
--- a/include/soc/arc/mcip.h
+++ b/include/soc/arc/mcip.h
@@ -14,6 +14,7 @@
 #include <soc/arc/aux.h>
 
 #define ARC_REG_MCIP_BCR	0x0d0
+#define ARC_REG_MCIP_IDU_BCR	0x0D5
 #define ARC_REG_MCIP_CMD	0x600
 #define ARC_REG_MCIP_WDATA	0x601
 #define ARC_REG_MCIP_READBACK	0x602
@@ -69,6 +70,22 @@ struct mcip_bcr {
 #endif
 };
 
+struct mcip_idu_bcr {
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	unsigned int pad:21, cirqnum:3, ver:8;
+#else
+	unsigned int ver:8, cirqnum:3, pad:21;
+#endif
+};
+
+
+/*
+ * Build register for IDU contains not an actual number of supported common
+ * interrupts but an exponent of 2 which must be multiplied by 4 to
+ * get a number of supported common interrupts.
+ */
+#define mcip_idu_bcr_to_nr_irqs(bcr) (4 * (1 << (bcr).cirqnum))
+
 /*
  * MCIP programming model
  *
-- 
2.7.4
