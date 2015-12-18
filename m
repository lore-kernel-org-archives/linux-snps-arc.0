From: noamc@ezchip.com (Noam Camus)
Date: Fri, 18 Dec 2015 14:29:29 +0000
Subject: [PATCH v4 05/19] irqchip: add nps Internal and external irqchips
In-Reply-To: <5673EC2D.5040307@arm.com>
References: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
 <1450228238-4499-6-git-send-email-noamc@ezchip.com>
 <56712F50.6050404@arm.com>
 <DB5PR02MB1141324364E0253DAA030DF1D6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
 <5673EC2D.5040307@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB1141A1E0BE574A713957650BD6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Marc Zyngier [mailto:marc.zyngier at arm.com] 
>Sent: Friday, December 18, 2015 1:21 PM

>> I need this for my per CPU irqs such timer and IPI which do not come 
>> from some external device but from CPUs. For these IRQs I am calling 
>> to irq_create_mapping() from my platform at arch/arc and at that point 
>> I got no irqdomain and using irq_find_host() is not good since I got 
>> no device_node (at most I can have DT root).

>That's a problem. You should never do that for your timer (doing a request_irq will do the right thing, and that's what your timer driver already does).

Please be more specific, from all that I wrote what is the problem?
When I use request_irq() it fail without the mapping and mapping fail without a domain.
Never do what?
What should I do then?

>As for initializing your IPIs, they are usually outside of the IRQ space, so you should handle them separately (and get your irqchip to initialize them).
I am handling all my IRQs within same irqchip, which is the only one I have. So I am not sure what you expect here.
Please be more elaborate.

>> 
>> Another thing I'm not seeing here is where is the interrupt actually taken. This code only contains the EOI part, but not the ACK side, as well as the reverse lookup hwirq -> irq). Where is that code?
>> 
>> ACK is an optional handler and is not needed by my platform.
>> I will add comment that since my IRQs are EOI based I do not need an ACK.

>What I'm talking about is not the irq_ack method that the irqchip can provide, but the action your perform on your interrupt controller to extract the hwirq number and find out what corresponding Linux interrupt has fired.

>> 
>> I do not understand reverse lookup remark, where is it missing?
>> Could you point me to an example for such reverse lookup? 

>See for example:

>https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-sun4i.c#n136

>This is the function (sun4i_handle_irq) that is executed almost immediately after the IRQ is asserted. The CPU reads the hwirq from the interrupt controller, and use handle_domain_irq() to call the corresponding handler (by doing a lookup in the domain).

>I couldn't find out in your platform code where you are doing that.

OK, this is seem much like exclusively ARM stuff.
Note that I am working with ARC (seem alike) here and we do not define CONFIG_HANDLE_DOMAIN_IRQ and do not implement set_handle_irq().

So for ARC this reverse mapping is something we can leave without (maybe because we are kind of a legacy domain).

Note that this patch is part of a set I introduce to ARC as a new platform.
You can view my tree and the patch set at:
https://github.com/EZchip/linux/commits/EZ-arc-for-next-basic-reviewd-DO-NOT-COMMENT

-Noam
