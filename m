From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 14 Dec 2015 05:50:39 +0000
Subject: percpu irq APIs and perf
References: <C2D7FE5348E1B147BCA15975FBA23075F44D580B@IN01WEMBXA.internal.synopsys.com>
 <56694C0E.5050707@arm.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D59B9@IN01WEMBXA.internal.synopsys.com>
 <566AB24C.3040407@arm.com> <566ABF86.9030308@synopsys.com>
 <566B0EC4.5060000@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D5D39@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 11 December 2015 11:28 PM, Marc Zyngier wrote:
>>> But auto-enabling cannot be done from a single CPU. It can only be done
>>> >> from the core that is going to be delivered that interrupt. This
>>> >> requires access to registers that are simply not available to other CPUs.
>> > 
>> > I'm not talking about eliminating enable_percpu_irq() call from all cores and
>> > still getting the auto-enable semantics. What I mean is doing the equivalent of
>> > 
>> >      irq_set_status_flags(irq, IRQ_NOAUTOEN);
>> > 
>> > from within request_percpu_irq_xxx() based on an additional arg (vs. doing it
>> > aprioiri outside).
>> > 
>> > OTOH, thinking a bit more abt this, I think the current semantics of auto-disable
>> > w/o any arg is just fine. Most percpu irqs in general purpose drivers would want
>> > the auto-disable anyways. Only for core irws such as timer / IPI etc do we want
>> > auto-enable.
> So assuming we can do this (forgetting about any form of HW limitation):
> CPU0 request the per-CPU IRQ with an AUTOEN flag. What happens on CPU1?
> Are you expecting it to immediately be able to take interrupts? What
> handler data gets passed to it?

Right - autoen=true will only help on CPU0. Others will still need to call enable
- for register tinkling etc. A true autoen API should have done that across the
board which it clearly can't and hence is pointless.

Thx,
-Vineet
