From: noamc@ezchip.com (Noam Camus)
Date: Fri, 18 Dec 2015 10:37:03 +0000
Subject: [PATCH v4 05/19] irqchip: add nps Internal and external irqchips
In-Reply-To: <56712F50.6050404@arm.com>
References: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
 <1450228238-4499-6-git-send-email-noamc@ezchip.com>
 <56712F50.6050404@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB1141324364E0253DAA030DF1D6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

From: Marc Zyngier [mailto:marc.zyngier@arm.com] 
Sent: Wednesday, December 16, 2015 11:31 AM

>> +static int __init nps400_of_init(struct device_node *node,
>> +				 struct device_node *parent)
>> +{
>> +	if (parent)
>> +		panic("DeviceTree incore ic not a root irq controller\n");
>> +
>> +	nps400_root_domain = irq_domain_add_linear(node, NR_CPU_IRQS,
>> +						   &nps400_irq_ops, NULL);
>> +
>> +	if (!nps400_root_domain)
>> +		panic("nps400 root irq domain not avail\n");
>> +
>> +	/* with this we don't need to export nps400_root_domain */
>> +	irq_set_default_host(nps400_root_domain);

>Why do you need this? Devices should have their interrupt-parent pointing to this node, and irq_find_host should sort it >out. I must be missing some information (only being CC'd on this single patch).
Sorry, I will CC you by my next version, in the meantime please refer to:
https://lkml.org/lkml/2015/12/15/864

I need this for my per CPU irqs such timer and IPI which do not come from some external device but from CPUs.
For these IRQs I am calling to irq_create_mapping() from my platform at arch/arc and at that point I got no irqdomain and using irq_find_host() is not good since I got no device_node (at most I can have DT root).
Is there device_node for DT root? 
Please advise what to do?

>> +
>> +	return 0;
>> +}
>> +IRQCHIP_DECLARE(ezchip_nps400_ic, "ezchip,nps400-ic", 
>> +nps400_of_init);
>> 

>Another thing I'm not seeing here is where is the interrupt actually taken. This code only contains the EOI part, but not the ACK side, as well as the reverse lookup hwirq -> irq). Where is that code?

ACK is an optional handler and is not needed by my platform.
I will add comment that since my IRQs are EOI based I do not need an ACK.

I do not understand reverse lookup remark, where is it missing?
Could you point me to an example for such reverse lookup? 

Regards,
Noam
