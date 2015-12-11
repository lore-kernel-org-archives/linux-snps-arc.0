From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Dec 2015 07:58:51 +0000
Subject: [PATCH v3 04/18] irqchip: add nps Internal and external irqchips
References: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
 <1448974985-11487-5-git-send-email-noamc@ezchip.com>
 <565DA0B6.5080903@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D5A17@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 01 December 2015 06:59 PM, Marc Zyngier wrote:
>> +static int nps400_irq_map(struct irq_domain *d, unsigned int irq,
>> > +			  irq_hw_number_t hw)
>> > +{
>> > +	switch (irq) {
>> > +	case TIMER0_IRQ:
>> > +#if defined(CONFIG_SMP)
>> > +	case IPI_IRQ:
>> > +#endif
>> > +		irq_set_chip_and_handler(irq, &nps400_irq_chip_percpu,
>> > +					 handle_percpu_irq);
>> > +	break;
>> > +	default:
>> > +		irq_set_chip_and_handler(irq, &nps400_irq_chip_fasteoi,
>> > +					 handle_fasteoi_irq);
>> > +	break;
>> > +	}
> No. This is just wrong. Either you get per interrupt information from
> the device tree to configure the interrupt the right way, or you have
> different interrupt controllers for each device.
> 
> But using the Linux irq number is always wrong. You should only consider
> the hwirq.

The source is this incorrectness is ARC core intc code which also does the same
thing and we get away with it because of the legacy domain usage.

I'll fix that up.

Thx,
-Vineet
