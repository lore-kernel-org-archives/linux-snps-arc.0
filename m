From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 30 Dec 2015 16:11:40 +0530
Subject: [PATCH v5 05/20] irqchip: add nps Internal and external irqchips
In-Reply-To: <1451222619-3610-6-git-send-email-noamc@ezchip.com>
References: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
 <1451222619-3610-6-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5683B4E4.40101@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Sunday 27 December 2015 06:53 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>

...

> +static struct irq_domain *nps400_root_domain;

This can simply be a local var now !

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
> +
> +	return 0;
> +}
> +IRQCHIP_DECLARE(ezchip_nps400_ic, "ezchip,nps400-ic", nps400_of_init);
> 
