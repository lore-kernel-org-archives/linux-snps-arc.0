From: tglx@linutronix.de (Thomas Gleixner)
Date: Tue, 2 Feb 2016 14:35:12 +0100 (CET)
Subject: [PATCH v2 3/3] irqchip: add nps Internal and external irqchips
In-Reply-To: <1454418899-25500-4-git-send-email-noamc@ezchip.com>
References: <1454418899-25500-1-git-send-email-noamc@ezchip.com>
 <1454418899-25500-4-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.11.1602021425430.25254@nanos>
To: linux-snps-arc@lists.infradead.org

On Tue, 2 Feb 2016, Noam Camus wrote:
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/irqdomain.h>
> +#include <linux/irqchip.h>
> +#include <soc/nps/common.h>
> +
> +#undef NR_CPU_IRQS

What's that #undef for?

> +#define NR_CPU_IRQS	8  /* number of interrupt lines of NPS400 CPU */
> +#define TIMER0_IRQ	3

> +static void nps400_irq_eoi_global(struct irq_data *irqd)
> +{
> +	unsigned int __maybe_unused irq = irqd_to_hwirq(irqd);
> +
> +	write_aux_reg(CTOP_AUX_IACK, 1 << irq);
> +
> +	/* Don't ack before all device access attempts are done */
> +	mb();

And what is that memory barrier for if this is not on ARC?

> +
> +#ifdef __arc__
> +	__asm__ __volatile__ (
> +	"       .word %0\n"

First of all this wants to be .inst not .word.

> +	:
> +	: "i"(CTOP_INST_RSPI_GIC_0_R12)
> +	: "memory");

And this needs be defined as an inline somewhere in arch/arc and not in the
driver. In the driver you do:

#ifdef CONFIG_ARCH_ARC
# include <arch/....>
#else
static inline void arc_ack_gic(void) { }
#endif

static void nps400_irq_eoi_global
{
	....
	arc_ack_gic();
}

Hmm?

> +static int nps400_irq_map(struct irq_domain *d, unsigned int virq,
> +			  irq_hw_number_t hw)
> +{
> +	switch (hw) {
> +	case TIMER0_IRQ:
> +#ifdef CONFIG_SMP
> +	case IPI_IRQ:
> +#endif
> +		irq_set_percpu_devid(virq);
> +		irq_set_chip_and_handler(virq, &nps400_irq_chip_percpu,
> +					 handle_percpu_devid_irq);
> +	break;

		break;
Please

> +	default:
> +		irq_set_chip_and_handler(virq, &nps400_irq_chip_fasteoi,
> +					 handle_fasteoi_irq);
> +	break;

Ditto.

Thanks,

	tglx
