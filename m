From: Yuriy.Kolerov@synopsys.com (Yuriy Kolerov)
Date: Wed, 1 Feb 2017 12:54:44 +0000
Subject: [PATCH v2 4/4] ARCv2: IRQ: Set a default priority for all core
 interrupts
In-Reply-To: <6dd5743d-cf5b-a65e-86fe-86fff2777e81@synopsys.com>
References: <1485863124-26426-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1485863124-26426-5-git-send-email-yuriy.kolerov@synopsys.com>
 <6dd5743d-cf5b-a65e-86fe-86fff2777e81@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3ABF60118B9B784CA5BF7C841D2F00EC01037938@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: Vineet Gupta [mailto:vgupta at synopsys.com]
> Sent: Tuesday, January 31, 2017 8:54 PM
> To: Yuriy Kolerov <yuriy.kolerov at synopsys.com>; linux-snps-
> arc at lists.infradead.org
> Cc: marc.zyngier at arm.com; Alexey.Brodkin at synopsys.com; linux-
> kernel at vger.kernel.org
> Subject: Re: [PATCH v2 4/4] ARCv2: IRQ: Set a default priority for all core
> interrupts
> 
> On 01/31/2017 03:45 AM, Yuriy Kolerov wrote:
> > After reset all interrupts in the core interrupt controller has the
> > highest priority P0. If the platform supports Fast IRQs and has more
> > than 1 banks of registers then CPU automatically switch banks of
> > registers when P0 interrupt comes.
> >
> > The problem is that the kernel expects that by default switching of
> > banks is not used by all interrupts. It is necessary to set a default
> > nonzero priority for all available interrupts to avoid undefined
> > behaviour.
> >
> > Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> > ---
> >  arch/arc/kernel/intc-arcv2.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arc/kernel/intc-arcv2.c
> > b/arch/arc/kernel/intc-arcv2.c index 31246cc..d4fa4a5 100644
> > --- a/arch/arc/kernel/intc-arcv2.c
> > +++ b/arch/arc/kernel/intc-arcv2.c
> > @@ -22,7 +22,7 @@
> >   */
> >  void arc_init_IRQ(void)
> >  {
> > -	unsigned int tmp, irq_prio;
> > +	unsigned int tmp, irq_prio, i;
> >
> >  	struct bcr_irq_arcv2 irq_bcr;
> >
> > @@ -62,6 +62,16 @@ void arc_init_IRQ(void)
> >  		irq_prio + 1, ARCV2_IRQ_DEF_PRIO,
> >  		irq_bcr.firq ? " FIRQ (not used)":"");
> >
> > +	/*
> > +	 * Set a default priority for all available interrupts to prevent
> > +	 * switching of register banks if Fast IRQ and multiple register banks
> > +	 * are supported by CPU.
> > +	 */
> > +	for (i = NR_EXCEPTIONS; i < irq_bcr.irqs + NR_EXCEPTIONS; i++) {
> > +		write_aux_reg(AUX_IRQ_SELECT, i);
> > +		write_aux_reg(AUX_IRQ_PRIORITY, ARCV2_IRQ_DEF_PRIO);
> > +	}
> > +
> 
> This itself is fine. However going forward can we move to the genirq
> irq_cpu_online() etc instead of doing this in our platform per cpu hook ?
> 
> https://www.linux-mips.org/archives/linux-mips/2011-03/msg00115.html

We need to set a default priority for all interrupts for each CPU before interrupt controller is configured. In other words it this necessary to guaranty a default state of all interrupts before doing something else with interrupts. Moreover as I understand irq_cpu_online() is intended to be used with virtual IRQs (already allocated interrupts) but the configuration of priorities must be done for all hardware interrupts to bring CPU to the default state.

> >  	/* setup status32, don't enable intr yet as kernel doesn't want */
> >  	tmp = read_aux_reg(ARC_REG_STATUS32);
> >  	tmp |= STATUS_AD_MASK | (ARCV2_IRQ_DEF_PRIO << 1);
> >
