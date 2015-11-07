From: noamc@ezchip.com (Noam Camus)
Date: Sat, 7 Nov 2015 12:52:22 +0200
Subject: [PATCH v2 04/19] irqchip: add nps Internal and external irqchips
In-Reply-To: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446893557-29748-5-git-send-email-noamc@ezchip.com>
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
 .../interrupt-controller/ezchip,nps400-ic.txt      |   17 ++
 drivers/irqchip/Makefile                           |    1 +
 drivers/irqchip/irq-eznps.c                        |  222 ++++++++++++++++++++
 3 files changed, 240 insertions(+), 0 deletions(-)
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
index bb3048f..decfc87 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -55,3 +55,4 @@ obj-$(CONFIG_RENESAS_H8S_INTC)		+= irq-renesas-h8s.o
 obj-$(CONFIG_ARCH_SA1100)		+= irq-sa11x0.o
 obj-$(CONFIG_INGENIC_IRQ)		+= irq-ingenic.o
 obj-$(CONFIG_IMX_GPCV2)			+= irq-imx-gpcv2.o
+obj-$(CONFIG_ARC_PLAT_EZNPS)		+= irq-eznps.o
diff --git a/drivers/irqchip/irq-eznps.c b/drivers/irqchip/irq-eznps.c
new file mode 100644
index 0000000..78f3667
--- /dev/null
+++ b/drivers/irqchip/irq-eznps.c
@@ -0,0 +1,222 @@
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
+#include <plat/mtm.h>
+#include <plat/smp.h>
+
+#define NPS_MSU_EN_CFG	0x80
+
+/* Messaging and Scheduling Unit:
+ * Provides message management for a CPU cluster.
+ */
+static void __init eznps_configure_msu(void)
+{
+	int cpu;
+	struct nps_host_reg_msu_en_cfg {
+		union {
+			struct {
+				u32     __reserved1:11,
+				rtc_en:1, ipc_en:1, gim_1_en:1,
+				gim_0_en:1, ipi_en:1, buff_e_rls_bmuw:1,
+				buff_e_alc_bmuw:1, buff_i_rls_bmuw:1,
+				buff_i_alc_bmuw:1, buff_e_rls_bmue:1,
+				buff_e_alc_bmue:1, buff_i_rls_bmue:1,
+				buff_i_alc_bmue:1, __reserved2:1,
+				buff_e_pre_en:1, buff_i_pre_en:1,
+				pmuw_ja_en:1, pmue_ja_en:1,
+				pmuw_nj_en:1, pmue_nj_en:1, msu_en:1;
+			};
+			u32 value;
+		};
+	};
+	struct nps_host_reg_msu_en_cfg msu_en_cfg = {.value = 0};
+
+	msu_en_cfg.msu_en = 1;
+	msu_en_cfg.ipi_en = 1;
+	msu_en_cfg.gim_0_en = 1;
+	msu_en_cfg.gim_1_en = 1;
+
+	/* Enable IPI and GIM messages on all clusters */
+	for (cpu = 0 ; cpu < eznps_max_cpus; cpu += eznps_cpus_per_cluster)
+		iowrite32be(msu_en_cfg.value,
+			    nps_host_reg(cpu, NPS_MSU_BLKID, NPS_MSU_EN_CFG));
+}
+
+/* Global Interrupt Manager:
+ * Configures and manages up to 64 interrupts from peripherals,
+ * 16 interrupts from CPUs (virtual interrupts) and ECC interrupts.
+ * Receives the interrupts and transmits them to relevant CPU.
+ */
+static void __init eznps_configure_gim(void)
+{
+	u32 reg_value;
+	u32 gim_int_lines;
+	struct nps_host_reg_gim_p_int_dst gim_p_int_dst = {.value = 0};
+
+	gim_int_lines = NPS_GIM_UART_LINE;
+	gim_int_lines |= NPS_GIM_DBG_LAN_TX_DONE_LINE;
+	gim_int_lines |= NPS_GIM_DBG_LAN_RX_RDY_LINE;
+
+	/*
+	 * IRQ polarity
+	 * low or high level
+	 * negative or positive edge
+	 */
+	reg_value = ioread32be(REG_GIM_P_INT_POL_0);
+	reg_value &= ~gim_int_lines;
+	iowrite32be(reg_value, REG_GIM_P_INT_POL_0);
+
+	/* IRQ type level or edge */
+	reg_value = ioread32be(REG_GIM_P_INT_SENS_0);
+	reg_value |= NPS_GIM_DBG_LAN_TX_DONE_LINE;
+	iowrite32be(reg_value, REG_GIM_P_INT_SENS_0);
+
+	/*
+	 * GIM interrupt select type for
+	 * dbg_lan TX and RX interrupts
+	 * should be type 1
+	 * type 0 = IRQ line 6
+	 * type 1 = IRQ line 7
+	 */
+	gim_p_int_dst.is = 1;
+	iowrite32be(gim_p_int_dst.value, REG_GIM_P_INT_DST_10);
+	iowrite32be(gim_p_int_dst.value, REG_GIM_P_INT_DST_11);
+
+	/*
+	 * CTOP IRQ lines should be defined
+	 * as blocking in GIM
+	 */
+	iowrite32be(gim_int_lines, REG_GIM_P_INT_BLK_0);
+
+	/* Enable CTOP IRQ lines in GIM */
+	iowrite32be(gim_int_lines, REG_GIM_P_INT_EN_0);
+}
+
+/*
+ * NPS400 core includes a Interrupt Controller (IC) support.
+ * All cores can deactivate level irqs at first level control
+ * at cores mesh layer called MTM.
+ * For devices out side chip e.g. uart, network there is another
+ * level called Global Interrupt Manager (GIM).
+ * This second level can control level and edge interrupt.
+ */
+
+static void nps400_irq_mask(struct irq_data *data)
+{
+	unsigned int ienb;
+
+	ienb = read_aux_reg(AUX_IENABLE);
+	ienb &= ~(1 << data->irq);
+	write_aux_reg(AUX_IENABLE, ienb);
+}
+
+static void nps400_irq_unmask(struct irq_data *data)
+{
+	unsigned int ienb;
+
+	ienb = read_aux_reg(AUX_IENABLE);
+	ienb |= (1 << data->irq);
+	write_aux_reg(AUX_IENABLE, ienb);
+}
+
+static void nps400_irq_eoi_global(struct irq_data *data)
+{
+	write_aux_reg(CTOP_AUX_IACK, 1 << data->irq);
+
+	/* Don't ack before all device access is done */
+	mb();
+
+	__asm__ __volatile__ (
+	"       .word %0\n"
+	:
+	: "i"(CTOP_INST_RSPI_GIC_0_R12)
+	: "memory");
+}
+
+static void nps400_irq_eoi(struct irq_data *data)
+{
+	write_aux_reg(CTOP_AUX_IACK, 1 << data->irq);
+}
+
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
+static int nps400_irq_map(struct irq_domain *d, unsigned int irq,
+			  irq_hw_number_t hw)
+{
+	switch (irq) {
+	case TIMER0_IRQ:
+#if defined(CONFIG_SMP)
+	case IPI_IRQ:
+#endif
+		irq_set_chip_and_handler(irq, &nps400_irq_chip_percpu,
+					 handle_percpu_irq);
+	break;
+	default:
+		irq_set_chip_and_handler(irq, &nps400_irq_chip_fasteoi,
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
+static int __init nps400_of_init(struct device_node *node,
+				 struct device_node *parent)
+{
+	if (parent)
+		panic("DeviceTree incore ic not a root irq controller\n");
+
+	eznps_configure_msu();
+	eznps_configure_gim();
+
+	nps400_root_domain = irq_domain_add_legacy(node, NR_CPU_IRQS, 0, 0,
+						   &nps400_irq_ops, NULL);
+
+	if (!nps400_root_domain)
+		panic("nps400 root irq domain not avail\n");
+
+	/* with this we don't need to export nps400_root_domain */
+	irq_set_default_host(nps400_root_domain);
+
+	return 0;
+}
+IRQCHIP_DECLARE(ezchip_nps400_ic, "ezchip,nps400-ic", nps400_of_init);
-- 
1.7.1
