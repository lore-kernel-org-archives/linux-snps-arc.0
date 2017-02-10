From: Yuriy.Kolerov@synopsys.com (Yuriy Kolerov)
Date: Fri, 10 Feb 2017 04:08:37 +0000
Subject: [PATCH] ARCv2: intc: Disable all core interrupts by default
In-Reply-To: <0423cc7d-0b96-2d6d-f02a-67b6951aaa1c@synopsys.com>
References: <1486508647-5997-1-git-send-email-yuriy.kolerov@synopsys.com>
 <0423cc7d-0b96-2d6d-f02a-67b6951aaa1c@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3ABF60118B9B784CA5BF7C841D2F00EC0103AB39@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: Vineet Gupta [mailto:vgupta at synopsys.com]
> Sent: Wednesday, February 08, 2017 7:08 PM
> To: Yuriy Kolerov <yuriy.kolerov at synopsys.com>; linux-snps-
> arc at lists.infradead.org
> Cc: Alexey.Brodkin at synopsys.com; linux-kernel at vger.kernel.org;
> marc.zyngier at arm.com
> Subject: Re: [PATCH] ARCv2: intc: Disable all core interrupts by default
> 
> On 02/07/2017 03:04 PM, Yuriy Kolerov wrote:
> > The kernel emits a lot of warnings about unexpected IRQs when an
> > appropriate driver is not presented. It happens because all interrupts
> > in the core controller are enabled by default after reset. It would be
> > wise to keep all interrupts masked by default.
> >
> > Thus disable all local and common interrupts. If CPU consists of only
> > 1 core without IDU then it is necessary to disable all interrupts in
> > the core interrupt controller. If CPU contains IDU it means that there
> > are may be more than 1 cores and common interrupts (>= FIRST_EXT_IRQ)
> > must be disabled in IDU.
> 
> This is not elegant. core intc needs to do same thing to all interrupts coming
> in
> - irrespective of whether they are funneled via IDU or not.
> 
> 
> > Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> > ---
> >  arch/arc/kernel/intc-arcv2.c | 19 +++++++++++++++++++
> 
> [snip...]
> 
> > +
> >  	for (i = NR_EXCEPTIONS; i < irq_bcr.irqs + NR_EXCEPTIONS; i++) {
> >  		write_aux_reg(AUX_IRQ_SELECT, i);
> >  		write_aux_reg(AUX_IRQ_PRIORITY, ARCV2_IRQ_DEF_PRIO);
> > +
> > +		/*
> > +		 * If IDU exists then all common interrupts >= FIRST_EXT_IRQ
> > +		 * are masked by IDU thus disable only local interrupts (below
> > +		 * FIRST_EXT_IRQ). Otherwise disable all interrupts.
> > +		 */
> > +		if (!mp.idu || i < FIRST_EXT_IRQ)
> > +			write_aux_reg(AUX_IRQ_ENABLE, 0);
> 
> So you seem to assume that anything > FIRST_EXT_IRQ is coming in via IDU
> which may not be case.
> external Interrupts can be wired to core directly - not via IDU
>  - 16 .. 23 are cpu private reserved irq
>  - 24 .. C are common irqs (via IDU)
>  - C + 1 .. N are cpu private external irqs
> 
> so better to disable all irq_bcr.irqs independent of how they are hooked up !

All IRQs >= 24 in ARC are marked as common interrupts and it is reasonable. It means that when "enable" or "mask" is called for hwirq < 24 then these functions are called on all cores. On the other hand these functions are called once only on 1 core for common interrupts. Then we have 3 cases:

1. We have UP and everything is easy. Just disable everything by default. When a driver comes up an appropriate IRQ is enable on single core.
2. We have SMP with IDU. We can enable/disable common interrupts in IDU and keep core interrupts enabled/unmasked by default. But what happens if a device is connected to one of the cores directly (is it even possible on SMP systems?)? Device Tree does not contain such information and the kernel does not know how it enable external IRQ for the specific core (as far as I know).
3. Assume that all core interrupts on all cores are disabled by default. When chained IRQ is created (IDU -> core intc) IDU automatically calls "enable" for an appropriate IRQ of core intc. But this "enable" is called only for 1 core so it is necessary to find a way to call "enable" on the rest of cores. I have a solution which solves this problem using "smp_call_function_single_async" in "enable" function of the core intc for IRQs >= 24 but I think that it may be overkill for such problem. Anyway I cannot find a solution for the same problem in other archs...

> -Vineet
