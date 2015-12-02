From: noamc@ezchip.com (Noam Camus)
Date: Wed, 2 Dec 2015 15:08:51 +0000
Subject: [PATCH v3 04/18] irqchip: add nps Internal and external irqchips
In-Reply-To: <565DA0B6.5080903@arm.com>
References: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
 <1448974985-11487-5-git-send-email-noamc@ezchip.com>
 <565DA0B6.5080903@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB114150510832BA29D46A8A4AD60E0@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Marc Zyngier [mailto:marc.zyngier at arm.com] 
>Sent: Tuesday, December 01, 2015 3:29 PM

> +  interrupt source. The value shall be 1.

>So you never have to encode the interrupt trigger type? Do you only support edge or level?
I Always use level sensitive.

> +
> +#define NPS_GIM_P_EN	0x100	/* Peripheral interrupts source enable */
> +#define NPS_GIM_P_BLK	0x118	/* Peripheral interrupts blocking for sources */

>>Are these the interrupts the peripherals are using? If yes, they really have nothing to do here...
I will move this from here 
>> +	__asm__ __volatile__ (
>> +	"       .word %0\n"
>> +	:
>> +	: "i"(CTOP_INST_RSPI_GIC_0_R12)
>> +	: "memory");

>Silly question: why cannot you just write the actual instruction instead of shoving the instruction like this? Also, .inst would be more appropriate...
[Noam Camus] Since this is instruction that yet is not part of up-streamed binutils of ARC.  Now ARC maintainer can build our kernel with generic ARC toolchain. 

>> +static int nps400_irq_map(struct irq_domain *d, unsigned int irq,
>> +			  irq_hw_number_t hw)
>> +{
>> +	switch (irq) {
>> +	case TIMER0_IRQ:
>> +#if defined(CONFIG_SMP)
>> +	case IPI_IRQ:
>> +#endif
>> +		irq_set_chip_and_handler(irq, &nps400_irq_chip_percpu,
>> +					 handle_percpu_irq);
>> +	break;
>> +	default:
>> +		irq_set_chip_and_handler(irq, &nps400_irq_chip_fasteoi,
>> +					 handle_fasteoi_irq);
>> +	break;
>> +	}

>No. This is just wrong. Either you get per interrupt information from the device tree to configure the interrupt the right way, or you have different interrupt controllers for each device.
I am not sure how you want me to get it from DTB? Please refer to some reference.

>But using the Linux irq number is always wrong. You should only consider the hwirq.
I will change

> +
> +	nps400_root_domain = irq_domain_add_legacy(node, NR_CPU_IRQS, 0, 0,
> +						   &nps400_irq_ops, NULL);

>And that's why you can get away with the above horror. Don't use legacy domains. This stuff is by no mean legacy.
So what is my alternative here?

-Noam
