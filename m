From: marc.zyngier@arm.com (Marc Zyngier)
Date: Fri, 11 Dec 2015 11:23:56 +0000
Subject: percpu irq APIs and perf
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F44D59B9@IN01WEMBXA.internal.synopsys.com>
References: <C2D7FE5348E1B147BCA15975FBA23075F44D580B@IN01WEMBXA.internal.synopsys.com>
 <56694C0E.5050707@arm.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D59B9@IN01WEMBXA.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <566AB24C.3040407@arm.com>
To: linux-snps-arc@lists.infradead.org

On Fri, 11 Dec 2015 05:26:02 +0000
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

Hi Vineet,

> Hi Marc,
> 
> On Thursday 10 December 2015 03:26 PM, Marc Zyngier wrote:
> > Hi Vinnet,
> >
> > On 10/12/15 09:25, Vineet Gupta wrote:
> >> Hi Marc / Daniel / Jason,
> >>
> >> I had a couple of questions about percpu irq API, hopefully you can help answer.
> >>
> >> On ARM, how do u handle requesting per cpu IRQs - specifically usage
> >> of request_percpu_irq() / enable_percpu_irq() API.
> >> It seems, for using them, we obviously need to explicitly set irq as
> >> percpu and as a consequence explicitly enable autoen (since former
> >> disables that). See arch/arc/kernel/irq.c: arc_request_percpu_irq()
> >> called by ARC per cpu timer setup.
> > Indeed. The interrupt controller code flags these interrupts as being
> > per-cpu, and we do rely on each CPU performing an enable_percpu_irq().
> >
> > So the way the whole thing flows is as such:
> > - Interrupt controller (GIC) flags the PPIs (Private Peripheral
> > Interrupt) as per-CPU (hwirq 16 to 31 are replicated per CPU) very early
> > in the boot process
> 
> Thx for your reply and the pointers
> 
> irq-gic.c seems to be doing
> 
>    irq_set_status_flags(irq, IRQ_NOAUTOEN);
> 
> So it is setting NOAUTOEN, which is already the case per side effect of
> irq_set_percpu_devid(). No harm in making it explicit.

Indeed, this looks completely superfluous. I'll fix that.

> So this will make __setup_irq() skip irq_startup() and instead rely on
> enable_precpu_irq() to be called even for the local core.
> 
> I think we can make percpu irq API a bit easier to use.
> 
> (1) First thing which request_percpu_irq() does is check for
> irq_settings_is_per_cpu_devid(). Thus irq_set_percpu_devid() can be built into the
> API itself eliding the need to set it apriori.

I don't think we can. At least in the case I'm concerned about (GIC's
PPIs), this is a hardware requirement. You cannot turn a global
interrupt into a per-CPU one, nor the other way around. We also have
drivers (at least our PMUs) that do test the state of that interrupt
(per-CPU or not) to find out how they should be requested.

I agree that the API is probably not the ideal one, but there is HW
constraints that we cannot just ignore.

> (2) It seems that disabling autoen by default for percpu irq makes sense as
> evident from drivers/net/ethernet/marvell/mvneta.c where users want to control
> this. However the comment there is misleading
> 
>     /* Even though the documentation says that request_percpu_irq
>      * doesn't enable the interrupts automatically, it actually
>      * does so on the local CPU.
>      *
>      * Make sure it's disabled.
>      */
> 
> Either sme core code is clearing NOAUTOEN or calling enable_precpu_irq() making
> request_percpu_irq() enable it.

If that's the case, this is a bug. Nobody should enable that interrupt
until the driver has chosen to do so.

> IMHO it makes more sense to make autoen explicit in the API.
> Perhaps introduce a API flavour, which takes the autoen as arg.
> It could take flags to make it more extensible / future safe but that will be an
> overkill I think.

But auto-enabling cannot be done from a single CPU. It can only be done
from the core that is going to be delivered that interrupt. This
requires access to registers that are simply not available to other CPUs.

> Do let me know what you think and I can send RFC patches to same effect.

If you can find an elegant way to do this and keep the existing
semantics, I'm all ear!

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny.
