From: marc.zyngier@arm.com (Marc Zyngier)
Date: Tue, 22 Nov 2016 11:22:45 +0000
Subject: [PATCH] ARCv2: MCIP: Deprecate setting of affinity in Device Tree
In-Reply-To: <3ABF60118B9B784CA5BF7C841D2F00EC0101D90B@de02wembxa.internal.synopsys.com>
References: <1478875124-23787-1-git-send-email-yuriy.kolerov@synopsys.com>
 <d5cb9467-a6d7-e47d-7b25-15396c4d65cb@arm.com>
 <3ABF60118B9B784CA5BF7C841D2F00EC0101D90B@de02wembxa.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8548fefd-15e1-5ce4-0e23-05022286841f@arm.com>
To: linux-snps-arc@lists.infradead.org

Hi Yuriy,

On 14/11/16 14:35, Yuriy Kolerov wrote:
> Hi Marc,
> 
>> -----Original Message-----
>> From: Marc Zyngier [mailto:marc.zyngier at arm.com]
>> Sent: Friday, November 11, 2016 6:29 PM
>> To: Yuriy Kolerov <yuriy.kolerov at synopsys.com>; linux-snps-
>> arc at lists.infradead.org
>> Cc: Vineet.Gupta1 at synopsys.com; Alexey.Brodkin at synopsys.com;
>> tglx at linutronix.de; linux-kernel at vger.kernel.org
>> Subject: Re: [PATCH] ARCv2: MCIP: Deprecate setting of affinity in Device
>> Tree
>>
>> Hi Yuriy,
>>
>> On 11/11/16 14:38, Yuriy Kolerov wrote:
>>> Ignore value of interrupt distribution mode for common interrupts in
>>> IDU since setting of affinity using value from Device Tree is
>>> deprecated in ARC. Originally it is done in idu_irq_xlate() function
>>> and it is semantically wrong and does not guaranty that an affinity
>>> value will be set properly.
>>>
>>> However it is necessary to set a default affinity value manually for
>>> all common interrupts since initially all of them are disabled by IDU
>>> (a CPU mask for common interrupts is set to 0 after CPU reset) and in
>>> some cases the kernel cannot do it itself after initialization of
>>> endpoint devices (e.g. when IRQ chip below of IDU does not support
>>> setting of affinity and it cannot propagate an affinity value to IDU).
>>>
>>> By default send all common interrupts to the first online CPU.
>>> Usually it is a boot CPU. If the kernel is built without support of
>>> SMP then idu_irq_set_affinity() must be called manually since
>>> irq_set_affinity() does nothing in this case.
>>>
>>> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
>>> ---
>>>  .../interrupt-controller/snps,archs-idu-intc.txt   |  3 ++
>>>  arch/arc/kernel/mcip.c                             | 51 +++++++++-------------
>>>  2 files changed, 24 insertions(+), 30 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-id
>>> u-intc.txt
>>> b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-id
>>> u-intc.txt
>>> index 0dcb7c7..0607bab 100644
>>> ---
>>> a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-id
>>> u-intc.txt
>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/snps,arch
>>> +++ s-idu-intc.txt
>>> @@ -15,6 +15,9 @@ Properties:
>>>    Second cell specifies the irq distribution mode to cores
>>>       0=Round Robin; 1=cpu0, 2=cpu1, 4=cpu2, 8=cpu3
>>>
>>> +  The second cell in interrupts property is deprecated and ignored.
>>> + All common  interrupts are sent to the boot CPU core by default.
>>> +
>>
>> <pedantic hat on>
>> This comment only affects the behaviour of the driver, and not the
>> hardware. I'd rather see something along the lines of:
>>
>> "The second cell is only a hint, and an operating system is free to ignore it."
>>
>>>    intc accessed via the special ARC AUX register interface, hence "reg"
>> property
>>>    is not specified.
>>>
>>> diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c index
>>> 6d90e4b..f36b8d7 100644
>>> --- a/arch/arc/kernel/mcip.c
>>> +++ b/arch/arc/kernel/mcip.c
>>> @@ -174,7 +174,6 @@ static void idu_irq_unmask(struct irq_data *data)
>>>  	raw_spin_unlock_irqrestore(&mcip_lock, flags);  }
>>>
>>> -#ifdef CONFIG_SMP
>>>  static int
>>>  idu_irq_set_affinity(struct irq_data *data, const struct cpumask
>> *cpumask,
>>>  		     bool force)
>>> @@ -204,7 +203,6 @@ idu_irq_set_affinity(struct irq_data *data, const
>>> struct cpumask *cpumask,
>>>
>>>  	return IRQ_SET_MASK_OK;
>>>  }
>>> -#endif
>>>
>>>  static struct irq_chip idu_irq_chip = {
>>>  	.name			= "MCIP IDU Intc",
>>> @@ -228,9 +226,24 @@ static void idu_cascade_isr(struct irq_desc
>>> *desc)
>>>
>>>  static int idu_irq_map(struct irq_domain *d, unsigned int virq,
>>> irq_hw_number_t hwirq)  {
>>> +	cpumask_t affinity;
>>> +
>>>  	irq_set_chip_and_handler(virq, &idu_irq_chip, handle_level_irq);
>>>  	irq_set_status_flags(virq, IRQ_MOVE_PCNTXT);
>>>
>>> +	/* By default send all common interrupts to the first online CPU.
>>> +	 * Usually it is a boot CPU. If the kernel is built without support
>>> +	 * of SMP then idu_irq_set_affinity() must be called manually since
>>> +	 * irq_set_affinity() does nothing in this case.
>>> +	 */
>>> +	cpumask_copy(&affinity,
>> cpumask_of(cpumask_first(cpu_online_mask)));
>>> +
>>> +#ifdef CONFIG_SMP
>>> +	irq_set_affinity(virq, &affinity);
>>
>> Ghhhaaaaahhhh. Please don't do that. You are now re-entering the IRQ
>> framework, and there is no guarantee that this is safe (what locks are being
>> held???). At that stage, you don't even know if the irq_desc exists yet. And
>> since you're not testing the return value, you can't even know if that worked.
> 
> However functions like irq_set_chip_and_handler() and
> irq_set_status_flags() which are used above set a lock on irq_desc
> and seems like this structure must exists on this stage. And
> irq_set_affinity() has the same behavior - it locks irq_desc and

irq_set_chip_and_handler() and co are designed to be used when setting
up the interrupt. irq_set_affinity() is (at least conceptually) designed
to be called at runtime, once everything has been setup. This may be a
harmless violation at the moment, but not something we can guarantee to
be future proof.

> modifies it. I know that no one calls irq_set_affinity() in such
> situations (I mean in irq_map() function) but:
> 
> 1. The default affinity on ARC is always 0xf. I don't know why... By
> the way that's why we always check an affinity value in
> idu_irq_set_affinity():
> 
> if (!cpumask_and(&online, cpumask, cpu_online_mask)) return -EINVAL;
> 
> And by default affinity will never be set to just boot core. Moreover
> I am not sure that an affinity value in irq_desc will always match a
> real affinity of common interrupts. May be this is the root problem?

I think we're mixing two different things here: what the kernel think of
the affinity, and what it is actually set to. Of course, things should
more or less match.

By default, Linux assumes that all interrupts are routed to CPU0. That's
the *boot* CPU, and not necessary what is the HW view of CPU0 (think of
kexec from a secondary CPU). What is expected is that you perform the
initial affinity configuration so that the interrupt is routed to this
boot CPU. After that, userspace is in charge.

> 2. The kernel will not call idu_irq_set_affinity() for IDU interrupt
> controller in some cases. It happens when the top interrupt
> controller does not support setting of the affinity and does not even
> support propagating of it (e.g. a GPIO interrupt controller on top of
> IDU which funnels all interrupts in one line). However
> idu_irq_set_affinity() must be called to unmask common interrupts in
> IDU. And if I want to make an affinity in irq_desc to match a real
> affinity I must call irq_set_affinity() instead of just
> idu_irq_set_affinity() .

My brain has just melted. Can you describe this a bit more, possibly
using some ASCII diagrams? I really don't understand what the affinity
settings have to do with unmasking the interrupt... It is that you mask
an interrupt by routing it to a dummy CPU?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
