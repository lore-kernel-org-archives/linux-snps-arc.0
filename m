From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Mar 2016 18:25:37 +0530
Subject: [PATCH v6 3/3] irqchip: add nps Internal and external irqchips
In-Reply-To: <1458570272-23037-4-git-send-email-noamca@mellanox.com>
References: <1458570272-23037-1-git-send-email-noamca@mellanox.com>
 <1458570272-23037-4-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56FA7B49.5010803@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Monday 21 March 2016 07:54 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
> 
> Adding EZchip NPS400 support.
> NPS internal interrupts are internally handled at
> Multi Thread Manager (MTM) that is signaled for deactivating
> an interrupt.
> External interrupts is handled also at Global Interrupt
> Controller (GIC) e.g. serial and network devices.
> 
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: Jason Cooper <jason at lakedaemon.net>
> Cc: Marc Zyngier <marc.zyngier at arm.com>

@Noam, this patch is missing the version change metadata - could you please repost
with that added.

@Thomas, @Marc, EZChip platform merge hinges on this patch among others - can I
request one/both of you to please take a look and provide any acks/nacks.

Thx,
-Vineet

> ---
>  .../interrupt-controller/ezchip,nps400-ic.txt      |   17 ++
>  drivers/irqchip/Kconfig                            |    6 +
>  drivers/irqchip/Makefile                           |    1 +
>  drivers/irqchip/irq-eznps.c                        |  165 ++++++++++++++++++++
>  4 files changed, 189 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
>  create mode 100644 drivers/irqchip/irq-eznps.c
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
> new file mode 100644
> index 0000000..888b2b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
> @@ -0,0 +1,17 @@
> +EZchip NPS Interrupt Controller
> +
> +Required properties:
> +
> +- compatible : should be "ezchip,nps400-ic"
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +  interrupt source. The value shall be 1.
> +
> +
> +Example:
> +
> +intc: interrupt-controller {
> +	compatible = "ezchip,nps400-ic";
> +	interrupt-controller;
> +	#interrupt-cells = <1>;
> +};
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 4d7294e..bc5e775 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -193,3 +193,9 @@ config IRQ_MXS
>  	def_bool y if MACH_ASM9260 || ARCH_MXS
>  	select IRQ_DOMAIN
>  	select STMP_DEVICE
> +
> +config EZNPS_GIC
> +	bool "NPS400 Global Interrupt Manager (GIM)"
> +	select IRQ_DOMAIN
> +	help
> +	  Support the EZchip NPS400 global interrupt controller
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 177f78f..1390142 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -55,3 +55,4 @@ obj-$(CONFIG_RENESAS_H8S_INTC)		+= irq-renesas-h8s.o
>  obj-$(CONFIG_ARCH_SA1100)		+= irq-sa11x0.o
>  obj-$(CONFIG_INGENIC_IRQ)		+= irq-ingenic.o
>  obj-$(CONFIG_IMX_GPCV2)			+= irq-imx-gpcv2.o
> +obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
> diff --git a/drivers/irqchip/irq-eznps.c b/drivers/irqchip/irq-eznps.c
> new file mode 100644
> index 0000000..97e4294
> --- /dev/null
> +++ b/drivers/irqchip/irq-eznps.c
> @@ -0,0 +1,165 @@
> +/*
> + * Copyright (c) 2016, Mellanox Technologies. All rights reserved.
> + *
> + * This software is available to you under a choice of one of two
> + * licenses.  You may choose to be licensed under the terms of the GNU
> + * General Public License (GPL) Version 2, available from the file
> + * COPYING in the main directory of this source tree, or the
> + * OpenIB.org BSD license below:
> + *
> + *     Redistribution and use in source and binary forms, with or
> + *     without modification, are permitted provided that the following
> + *     conditions are met:
> + *
> + *      - Redistributions of source code must retain the above
> + *        copyright notice, this list of conditions and the following
> + *        disclaimer.
> + *
> + *      - Redistributions in binary form must reproduce the above
> + *        copyright notice, this list of conditions and the following
> + *        disclaimer in the documentation and/or other materials
> + *        provided with the distribution.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> + * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> + * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> + * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> + * SOFTWARE.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/irqchip.h>
> +#include <soc/nps/common.h>
> +
> +#define NPS_NR_CPU_IRQS 8  /* number of interrupt lines of NPS400 CPU */
> +#define NPS_TIMER0_IRQ  3
> +
> +/*
> + * NPS400 core includes an Interrupt Controller (IC) support.
> + * All cores can deactivate level irqs at first level control
> + * at cores mesh layer called MTM.
> + * For devices out side chip e.g. uart, network there is another
> + * level called Global Interrupt Manager (GIM).
> + * This second level can control level and edge interrupt.
> + *
> + * NOTE: AUX_IENABLE and CTOP_AUX_IACK are auxiliary registers
> + * with private HW copy per CPU.
> + */
> +
> +static void nps400_irq_mask(struct irq_data *irqd)
> +{
> +	unsigned int ienb;
> +	unsigned int irq = irqd_to_hwirq(irqd);
> +
> +	ienb = read_aux_reg(AUX_IENABLE);
> +	ienb &= ~(1 << irq);
> +	write_aux_reg(AUX_IENABLE, ienb);
> +}
> +
> +static void nps400_irq_unmask(struct irq_data *irqd)
> +{
> +	unsigned int ienb;
> +	unsigned int irq = irqd_to_hwirq(irqd);
> +
> +	ienb = read_aux_reg(AUX_IENABLE);
> +	ienb |= (1 << irq);
> +	write_aux_reg(AUX_IENABLE, ienb);
> +}
> +
> +static void nps400_irq_eoi_global(struct irq_data *irqd)
> +{
> +	unsigned int __maybe_unused irq = irqd_to_hwirq(irqd);
> +
> +	write_aux_reg(CTOP_AUX_IACK, 1 << irq);
> +
> +	/* Don't ack GIC before all device access attempts are done */
> +	mb();
> +
> +	nps_ack_gic();
> +}
> +
> +static void nps400_irq_eoi(struct irq_data *irqd)
> +{
> +	unsigned int __maybe_unused irq = irqd_to_hwirq(irqd);
> +
> +	write_aux_reg(CTOP_AUX_IACK, 1 << irq);
> +}
> +
> +static struct irq_chip nps400_irq_chip_fasteoi = {
> +	.name		= "NPS400 IC Global",
> +	.irq_mask	= nps400_irq_mask,
> +	.irq_unmask	= nps400_irq_unmask,
> +	.irq_eoi	= nps400_irq_eoi_global,
> +};
> +
> +static struct irq_chip nps400_irq_chip_percpu = {
> +	.name		= "NPS400 IC",
> +	.irq_mask	= nps400_irq_mask,
> +	.irq_unmask	= nps400_irq_unmask,
> +	.irq_eoi	= nps400_irq_eoi,
> +};
> +
> +static int nps400_irq_map(struct irq_domain *d, unsigned int virq,
> +			  irq_hw_number_t hw)
> +{
> +	switch (hw) {
> +	case NPS_TIMER0_IRQ:
> +#ifdef CONFIG_SMP
> +	case IPI_IRQ:
> +#endif
> +		irq_set_percpu_devid(virq);
> +		irq_set_chip_and_handler(virq, &nps400_irq_chip_percpu,
> +					 handle_percpu_devid_irq);
> +		break;
> +	default:
> +		irq_set_chip_and_handler(virq, &nps400_irq_chip_fasteoi,
> +					 handle_fasteoi_irq);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops nps400_irq_ops = {
> +	.xlate = irq_domain_xlate_onecell,
> +	.map = nps400_irq_map,
> +};
> +
> +static int __init nps400_of_init(struct device_node *node,
> +				 struct device_node *parent)
> +{
> +	static struct irq_domain *nps400_root_domain;
> +
> +	if (parent) {
> +		pr_err("DeviceTree incore ic not a root irq controller\n");
> +		return -EINVAL;
> +	}
> +
> +	nps400_root_domain = irq_domain_add_linear(node, NPS_NR_CPU_IRQS,
> +						   &nps400_irq_ops, NULL);
> +
> +	if (!nps400_root_domain) {
> +		pr_err("nps400 root irq domain not avail\n");
> +		return -ENOMEM;
> +	}
> +
> +	/*
> +	 * Needed for primary domain lookup to succeed
> +	 * This is a primary irqchip, and can never have a parent
> +	 */
> +	irq_set_default_host(nps400_root_domain);
> +
> +#ifdef CONFIG_SMP
> +	irq_create_mapping(nps400_root_domain, IPI_IRQ);
> +#endif
> +
> +	return 0;
> +}
> +IRQCHIP_DECLARE(ezchip_nps400_ic, "ezchip,nps400-ic", nps400_of_init);
> 
