From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Dec 2015 17:50:22 +0530
Subject: percpu irq APIs and perf
In-Reply-To: <566AB24C.3040407@arm.com>
References: <C2D7FE5348E1B147BCA15975FBA23075F44D580B@IN01WEMBXA.internal.synopsys.com>
 <56694C0E.5050707@arm.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D59B9@IN01WEMBXA.internal.synopsys.com>
 <566AB24C.3040407@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <566ABF86.9030308@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Marc,

On Friday 11 December 2015 04:53 PM, Marc Zyngier wrote:
> On Fri, 11 Dec 2015 05:26:02 +0000
>> I think we can make percpu irq API a bit easier to use.
>>
>> (1) First thing which request_percpu_irq() does is check for
>> irq_settings_is_per_cpu_devid(). Thus irq_set_percpu_devid() can be built into the
>> API itself eliding the need to set it apriori.
> 
> I don't think we can. At least in the case I'm concerned about (GIC's
> PPIs), this is a hardware requirement. You cannot turn a global
> interrupt into a per-CPU one, nor the other way around.

Understood.

> We also have
> drivers (at least our PMUs) that do test the state of that interrupt
> (per-CPU or not) to find out how they should be requested.

But they call request_percpu_irq() only after determining that irq is percpu.
Otherwise they will call vanilla request_irq()
e.g. drivers/perf/arm/arc_pmu.c

Which means that request_percpu_irq() can safely assume that caller absolutely
wants percpu semantics and hence do equivalent of irq_set_percpu_devid()
internally - NO. I'm sure I'm missing something.


> I agree that the API is probably not the ideal one, but there is HW
> constraints that we cannot just ignore.

The API is pretty nice :-) there are these quirks which I want to avoid.
My naive'ity in this area of code fails me to see how the hardware constraint is
coming into play.


>> (2) It seems that disabling autoen by default for percpu irq makes sense as
>> evident from drivers/net/ethernet/marvell/mvneta.c where users want to control
>> this. However the comment there is misleading
>>
>>     /* Even though the documentation says that request_percpu_irq
>>      * doesn't enable the interrupts automatically, it actually
>>      * does so on the local CPU.
>>      *
>>      * Make sure it's disabled.
>>      */
>>
>> Either sme core code is clearing NOAUTOEN or calling enable_precpu_irq() making
>> request_percpu_irq() enable it.
> 
> If that's the case, this is a bug. Nobody should enable that interrupt
> until the driver has chosen to do so.

Perhaps Maxim can shed more light as this seems to be his comment.


>> IMHO it makes more sense to make autoen explicit in the API.
>> Perhaps introduce a API flavour, which takes the autoen as arg.
>> It could take flags to make it more extensible / future safe but that will be an
>> overkill I think.
> 
> But auto-enabling cannot be done from a single CPU. It can only be done
> from the core that is going to be delivered that interrupt. This
> requires access to registers that are simply not available to other CPUs.

I'm not talking about eliminating enable_percpu_irq() call from all cores and
still getting the auto-enable semantics. What I mean is doing the equivalent of

     irq_set_status_flags(irq, IRQ_NOAUTOEN);

from within request_percpu_irq_xxx() based on an additional arg (vs. doing it
aprioiri outside).

OTOH, thinking a bit more abt this, I think the current semantics of auto-disable
w/o any arg is just fine. Most percpu irqs in general purpose drivers would want
the auto-disable anyways. Only for core irws such as timer / IPI etc do we want
auto-enable.

Thx,
-Vineet
