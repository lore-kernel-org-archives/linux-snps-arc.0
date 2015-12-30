From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 30 Dec 2015 15:38:24 +0530
Subject: [PATCH v5 05/20] irqchip: add nps Internal and external irqchips
In-Reply-To: <1451222619-3610-6-git-send-email-noamc@ezchip.com>
References: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
 <1451222619-3610-6-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5683AD18.7090603@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Sunday 27 December 2015 06:53 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>

[snip..]

> +
> +static int nps400_irq_map(struct irq_domain *d, unsigned int virq,
> +			  irq_hw_number_t hw)
> +{
> +	switch (hw) {
> +	case TIMER0_IRQ:
> +		irq_set_percpu_devid(virq);
> +		irq_set_chip_and_handler(virq, &nps400_irq_chip_percpu,
> +					 handle_percpu_devid_irq);
> +	break;
> +	default:
> +		irq_set_chip_and_handler(virq, &nps400_irq_chip_fasteoi,
> +					 handle_fasteoi_irq);
> +	break;
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
> +static struct irq_domain *nps400_root_domain;
> +
> +static void nps400_handle_irq(unsigned int hwirq, struct pt_regs *regs)
> +{
> +	handle_domain_irq(nps400_root_domain, hwirq, regs);
> +}
> +
> +static int __init nps400_of_init(struct device_node *node,
> +				 struct device_node *parent)
> +{
> +	if (parent)
> +		panic("DeviceTree incore ic not a root irq controller\n");
> +
> +	nps400_root_domain = irq_domain_add_linear(node, NR_CPU_IRQS,
> +						   &nps400_irq_ops, NULL);
> +
> +	if (!nps400_root_domain)
> +		panic("nps400 root irq domain not avail\n");
> +
> +	set_handle_irq(nps400_handle_irq);


Your series is NOT bisectable - u introduce this call later in series.
But do you need this song and dance anyways. Will handle_domain_irq() NOT work for
ARC in general for the core intc which are instantiated in legacy domain !

I'm ok with extra cost per int handling - given it is the right thing to do which
we've been missing so far !


> +
> +	return 0;
> +}
> +IRQCHIP_DECLARE(ezchip_nps400_ic, "ezchip,nps400-ic", nps400_of_init);
> 
