From: noamc@ezchip.com (Noam Camus)
Date: Sun, 27 Dec 2015 15:23:24 +0200
Subject: [PATCH v5 05/20] irqchip: add nps Internal and external irqchips
In-Reply-To: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
References: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1451222619-3610-6-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

Adding EZchip NPS400 support.
NPS internal interrupts are internally handled at
Multi Thread Manager (MTM) that is signaled for deactivating
an interrupt.
External interrupts is handled also at Global Interrupt
Controller (GIC) e.g. serial and network devices.

Signed-off-by: Noam Camus <noamc at ezchip.com>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Jason Cooper <jason at lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier at arm.com>
---
 .../interrupt-controller/ezchip,nps400-ic.txt      |   17 +++
 drivers/irqchip/Makefile                           |    1 +
 drivers/irqchip/irq-eznps.c                        |  139 ++++++++++++++++++++
 3 files changed, 157 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
 create mode 100644 drivers/irqchip/irq-eznps.c

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
new file mode 100644
index 0000000..888b2b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
@@ -0,0 +1,17 @@
+EZchip NPS Interrupt Controller
+
+Required properties:
+
+- compatible : should be "ezchip,nps400-ic"
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value shall be 1.
+
+
+Example:
+
+intc: interrupt-controller {
+	compatible = "ezchip,nps400-ic";
+	interrupt-controller;
+	#interrupt-cells = <1>;
+};
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 177f78f..b95b954 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -55,3 +55,4 @@ obj-$(CONFIG_RENESAS_H8S_INTC)		+= irq-renesas-h8s.o
 obj-$(CONFIG_ARCH_SA1100)		+= irq-sa11x0.o
 obj-$(CONFIG_INGENIC_IRQ)		+= irq-ingenic.o
 obj-$(CONFIG_IMX_GPCV2)			+= irq-imx-gpcv2.o
+obj-$(CONFIG_ARC_PLAT_EZNPS)		+= irq-eznps.o
diff --git a/drivers/irqchip/irq-eznps.c b/drivers/irqchip/irq-eznps.c
new file mode 100644
index 0000000..5a5d649
--- /dev/null
+++ b/drivers/irqchip/irq-eznps.c
@@ -0,0 +1,139 @@
+/*
+ * Copyright(c) 2015 EZchip Technologies.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * The full GNU General Public License is included in this distribution in
+ * the file called "COPYING".
+ */
+
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip.h>
+#include <asm/irq.h>
+
+/*
+ * NPS400 core includes an Interrupt Controller (IC) support.
+ * All cores can deactivate level irqs at first level control
+ * at cores mesh layer called MTM.
+ * For devices out side chip e.g. uart, network there is another
+ * level called Global Interrupt Manager (GIM).
+ * This second level can control level and edge interrupt.
+ *
+ * NOTE: AUX_IENABLE and CTOP_AUX_IACK are auxiliary registers
+ * with private HW copy per CPU.
+ */
+
+static void nps400_irq_mask(struct irq_data *irqd)
+{
+	unsigned int ienb;
+	unsigned int irq = irqd_to_hwirq(irqd);
+
+	ienb = read_aux_reg(AUX_IENABLE);
+	ienb &= ~(1 << irq);
+	write_aux_reg(AUX_IENABLE, ienb);
+}
+
+static void nps400_irq_unmask(struct irq_data *irqd)
+{
+	unsigned int ienb;
+	unsigned int irq = irqd_to_hwirq(irqd);
+
+	ienb = read_aux_reg(AUX_IENABLE);
+	ienb |= (1 << irq);
+	write_aux_reg(AUX_IENABLE, ienb);
+}
+
+static void nps400_irq_eoi_global(struct irq_data *irqd)
+{
+	unsigned int irq = irqd_to_hwirq(irqd);
+
+	write_aux_reg(CTOP_AUX_IACK, 1 << irq);
+
+	/* Don't ack before all device access attempts are done */
+	mb();
+
+	__asm__ __volatile__ (
+	"       .word %0\n"
+	:
+	: "i"(CTOP_INST_RSPI_GIC_0_R12)
+	: "memory");
+}
+
+static void nps400_irq_eoi(struct irq_data *irqd)
+{
+	unsigned int irq = irqd_to_hwirq(irqd);
+
+	write_aux_reg(CTOP_AUX_IACK, 1 << irq);
+}
+
+static struct irq_chip nps400_irq_chip_fasteoi = {
+	.name		= "NPS400 IC Global",
+	.irq_mask	= nps400_irq_mask,
+	.irq_unmask	= nps400_irq_unmask,
+	.irq_eoi	= nps400_irq_eoi_global,
+};
+
+static struct irq_chip nps400_irq_chip_percpu = {
+	.name		= "NPS400 IC",
+	.irq_mask	= nps400_irq_mask,
+	.irq_unmask	= nps400_irq_unmask,
+	.irq_eoi	= nps400_irq_eoi,
+};
+
+static int nps400_irq_map(struct irq_domain *d, unsigned int virq,
+			  irq_hw_number_t hw)
+{
+	switch (hw) {
+	case TIMER0_IRQ:
+		irq_set_percpu_devid(virq);
+		irq_set_chip_and_handler(virq, &nps400_irq_chip_percpu,
+					 handle_percpu_devid_irq);
+	break;
+	default:
+		irq_set_chip_and_handler(virq, &nps400_irq_chip_fasteoi,
+					 handle_fasteoi_irq);
+	break;
+	}
+
+	return 0;
+}
+
+static const struct irq_domain_ops nps400_irq_ops = {
+	.xlate = irq_domain_xlate_onecell,
+	.map = nps400_irq_map,
+};
+
+static struct irq_domain *nps400_root_domain;
+
+static void nps400_handle_irq(unsigned int hwirq, struct pt_regs *regs)
+{
+	handle_domain_irq(nps400_root_domain, hwirq, regs);
+}
+
+static int __init nps400_of_init(struct device_node *node,
+				 struct device_node *parent)
+{
+	if (parent)
+		panic("DeviceTree incore ic not a root irq controller\n");
+
+	nps400_root_domain = irq_domain_add_linear(node, NR_CPU_IRQS,
+						   &nps400_irq_ops, NULL);
+
+	if (!nps400_root_domain)
+		panic("nps400 root irq domain not avail\n");
+
+	set_handle_irq(nps400_handle_irq);
+
+	return 0;
+}
+IRQCHIP_DECLARE(ezchip_nps400_ic, "ezchip,nps400-ic", nps400_of_init);
-- 
1.7.1
