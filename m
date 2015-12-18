From: marc.zyngier@arm.com (Marc Zyngier)
Date: Fri, 18 Dec 2015 16:31:27 +0000
Subject: [PATCH v4 05/19] irqchip: add nps Internal and external irqchips
In-Reply-To: <DB5PR02MB1141A1E0BE574A713957650BD6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
References: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
 <1450228238-4499-6-git-send-email-noamc@ezchip.com>
 <56712F50.6050404@arm.com>
 <DB5PR02MB1141324364E0253DAA030DF1D6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
 <5673EC2D.5040307@arm.com>
 <DB5PR02MB1141A1E0BE574A713957650BD6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <567434DF.2030201@arm.com>
To: linux-snps-arc@lists.infradead.org

On 18/12/15 14:29, Noam Camus wrote:
>> From: Marc Zyngier [mailto:marc.zyngier at arm.com] 
>> Sent: Friday, December 18, 2015 1:21 PM
> 
>>> I need this for my per CPU irqs such timer and IPI which do not come 
>>> from some external device but from CPUs. For these IRQs I am calling 
>>> to irq_create_mapping() from my platform at arch/arc and at that point 
>>> I got no irqdomain and using irq_find_host() is not good since I got 
>>> no device_node (at most I can have DT root).
> 
>> That's a problem. You should never do that for your timer (doing a request_irq will do the right thing, and that's what your timer driver already does).
> 
> Please be more specific, from all that I wrote what is the problem?

Calling irq_create_mapping out of the blue like you do it here:

+static void eznps_init_per_cpu(int cpu)
+{
+	/* Create mapping for all per cpu IRQs */
+	if (cpu == 0) {
+		irq_create_mapping(NULL, TIMER0_IRQ);
+		irq_create_mapping(NULL, IPI_IRQ);
+	}

is simply not acceptable.

> When I use request_irq() it fail without the mapping and mapping fail without a domain.

Grmbl...

That's not completely surprising:

+		timer {
+			compatible = "ezchip,nps400-timer";
+			clocks = <&sysclk>;
+			clock-names="sysclk";
+		};

Where is the interrupt?

> Never do what?
> What should I do then?

Maybe you should start by looking how the other architectures have
solved that exact problem at least half a dozen time.

> 
>> As for initializing your IPIs, they are usually outside of the IRQ
>> space, so you should handle them separately (and get your irqchip
>> to initialize them).
> I am handling all my IRQs within same irqchip, which is the only one 
> I have. So I am not sure what you expect here. Please be more 
> elaborate.

Do not create a mapping for IPIs. Full stop. Handle them independently
from your normal IRQs.

>>>
>>> Another thing I'm not seeing here is where is the interrupt actually taken. This code only contains the EOI part, but not the ACK side, as well as the reverse lookup hwirq -> irq). Where is that code?
>>>
>>> ACK is an optional handler and is not needed by my platform.
>>> I will add comment that since my IRQs are EOI based I do not need an ACK.
> 
>> What I'm talking about is not the irq_ack method that the irqchip can provide, but the action your perform on your interrupt controller to extract the hwirq number and find out what corresponding Linux interrupt has fired.
> 
>>>
>>> I do not understand reverse lookup remark, where is it missing?
>>> Could you point me to an example for such reverse lookup? 
> 
>> See for example:
> 
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-sun4i.c#n136
> 
>> This is the function (sun4i_handle_irq) that is executed almost immediately after the IRQ is asserted. The CPU reads the hwirq from the interrupt controller, and use handle_domain_irq() to call the corresponding handler (by doing a lookup in the domain).
> 
>> I couldn't find out in your platform code where you are doing that.
> 
> OK, this is seem much like exclusively ARM stuff.

No, this is not. Can you please stop looking at the surface of things
and start taking an interest in how things actually *work*? Almost
*nothing* in the interrupt handling code is architecture specific.

> Note that I am working with ARC (seem alike) here and we do not
> define CONFIG_HANDLE_DOMAIN_IRQ and do not implement
> set_handle_irq().
> 
> So for ARC this reverse mapping is something we can leave without
> (maybe because we are kind of a legacy domain).

Yeah, I just located the crap: arch_do_IRQ() happily takes a hwirq (the
vector number), and uses that as a Linux IRQ. This looks a lot like ARM
pre-DT, about 10 years ago.

Well, time to meet the 21st century. If you intend to use DT, please fix
your arch port. Otherwise, just hardcode everything in your platform and
don't pretend to support device tree.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
