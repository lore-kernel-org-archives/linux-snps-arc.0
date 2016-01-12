From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 12 Jan 2016 12:30:31 +0530
Subject: [PATCH v4 05/19] irqchip: add nps Internal and external irqchips
In-Reply-To: <5683C178.7080706@synopsys.com>
References: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
 <1450228238-4499-6-git-send-email-noamc@ezchip.com>
 <56712F50.6050404@arm.com>
 <DB5PR02MB1141324364E0253DAA030DF1D6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
 <5673EC2D.5040307@arm.com>
 <DB5PR02MB1141A1E0BE574A713957650BD6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
 <567434DF.2030201@arm.com> <5683C178.7080706@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5694A48F.5000800@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Marc,

On Wednesday 30 December 2015 05:05 PM, Vineet Gupta wrote:
> On Friday 18 December 2015 10:01 PM, Marc Zyngier wrote:
>> On 18/12/15 14:29, Noam Camus wrote:
>>>> From: Marc Zyngier [mailto:marc.zyngier at arm.com] 
>>>> Sent: Friday, December 18, 2015 1:21 PM
>>>
>>>>> I need this for my per CPU irqs such timer and IPI which do not come 
>>>>> from some external device but from CPUs. For these IRQs I am calling 
>>>>> to irq_create_mapping() from my platform at arch/arc and at that point 
>>>>> I got no irqdomain and using irq_find_host() is not good since I got 
>>>>> no device_node (at most I can have DT root).
>>>
>>>> That's a problem. You should never do that for your timer (doing a request_irq will do the right thing, and that's what your timer driver already does).
>>>
>>> Please be more specific, from all that I wrote what is the problem?
>>
>> Calling irq_create_mapping out of the blue like you do it here:
>>
>> +static void eznps_init_per_cpu(int cpu)
>> +{
>> +	/* Create mapping for all per cpu IRQs */
>> +	if (cpu == 0) {
>> +		irq_create_mapping(NULL, TIMER0_IRQ);
>> +		irq_create_mapping(NULL, IPI_IRQ);
>> +	}
>>
>> is simply not acceptable.
>>
>>> When I use request_irq() it fail without the mapping and mapping fail without a domain.
>>
>> Grmbl...
>>
>> That's not completely surprising:
>>
>> +		timer {
>> +			compatible = "ezchip,nps400-timer";
>> +			clocks = <&sysclk>;
>> +			clock-names="sysclk";
>> +		};
>>
>> Where is the interrupt?
>>
>>> Never do what?
>>> What should I do then?
>>
>> Maybe you should start by looking how the other architectures have
>> solved that exact problem at least half a dozen time.
>>
>>>
>>>> As for initializing your IPIs, they are usually outside of the IRQ
>>>> space, so you should handle them separately (and get your irqchip
>>>> to initialize them).
>>> I am handling all my IRQs within same irqchip, which is the only one 
>>> I have. So I am not sure what you expect here. Please be more 
>>> elaborate.
>>
>> Do not create a mapping for IPIs. Full stop. Handle them independently
>> from your normal IRQs.
>>
>>>>>
>>>>> Another thing I'm not seeing here is where is the interrupt actually taken. This code only contains the EOI part, but not the ACK side, as well as the reverse lookup hwirq -> irq). Where is that code?
>>>>>
>>>>> ACK is an optional handler and is not needed by my platform.
>>>>> I will add comment that since my IRQs are EOI based I do not need an ACK.
>>>
>>>> What I'm talking about is not the irq_ack method that the irqchip can provide, but the action your perform on your interrupt controller to extract the hwirq number and find out what corresponding Linux interrupt has fired.
>>>
>>>>>
>>>>> I do not understand reverse lookup remark, where is it missing?
>>>>> Could you point me to an example for such reverse lookup? 
>>>
>>>> See for example:
>>>
>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-sun4i.c#n136
>>>
>>>> This is the function (sun4i_handle_irq) that is executed almost immediately after the IRQ is asserted. The CPU reads the hwirq from the interrupt controller, and use handle_domain_irq() to call the corresponding handler (by doing a lookup in the domain).
>>>
>>>> I couldn't find out in your platform code where you are doing that.
>>>
>>> OK, this is seem much like exclusively ARM stuff.
>>
>> No, this is not. Can you please stop looking at the surface of things
>> and start taking an interest in how things actually *work*? Almost
>> *nothing* in the interrupt handling code is architecture specific.
>>
>>> Note that I am working with ARC (seem alike) here and we do not
>>> define CONFIG_HANDLE_DOMAIN_IRQ and do not implement
>>> set_handle_irq().
>>>
>>> So for ARC this reverse mapping is something we can leave without
>>> (maybe because we are kind of a legacy domain).
>>
>> Yeah, I just located the crap: arch_do_IRQ() happily takes a hwirq (the
>> vector number), and uses that as a Linux IRQ. This looks a lot like ARM
>> pre-DT, about 10 years ago.
>>
>> Well, time to meet the 21st century. If you intend to use DT, please fix
>> your arch port. Otherwise, just hardcode everything in your platform and
>> don't pretend to support device tree.
> 
> Hi Marc,
> 
> Taking your rant in a positive stride and I'm all up for making this as
> nice/modern as possible. I don't have issues with enabling
> CONFIG_HANDLE_DOMAIN_IRQ for ARC (although it might add a few cycles o/h to each ISR)
> 
> However currently (4.4-rcX) it is only enabled for arm/arm64/openrisc and from the
> looks of it in drivers/irqchip, only ARM based SoCs use the handle_domain_irq()
> calls by plugging into ARM top level handler.
> 
> Why is that not a problem for other arches like PPC/MIPS which also use DT
> heavily. Or perhaps they are also subtly broken as ARC is !
> 
> What am I missing ?

Marc, I hope you are back from holidays. When u get a chance could you please
respond to above.

Also I tool a stab at it anyways.
1. Enabled HANDLE_DOMAIN_IRQ
2. arch_do_IRQ() calls handle_domain_irq(NULL, hwirq, regs) since that code
doesn't know about domains.

It fails w/o irq_set_default_host() being called.

If we go back to sunxi example you quoted above, it relies on driver passing the
domain to handle_domain_irq(). IMHO it is simpler if we had the default domain.

So long story short, ARC can be made to use handle_domain_irq() w/o the song and
dance of registering another callback from irqchip code if we retained the default
domain setting.

-Vineet
