From: Yuriy.Kolerov@synopsys.com (Yuriy Kolerov)
Date: Mon, 23 Jan 2017 12:21:24 +0000
Subject: [PATCH v3 3/3] ARCv2: MCIP: Deprecate setting of affinity in
 Device Tree
In-Reply-To: <f3fe3e75-b66a-c628-89d2-df405d8241f1@synopsys.com>
References: <1482914786-10490-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1482914786-10490-4-git-send-email-yuriy.kolerov@synopsys.com>
 <f3fe3e75-b66a-c628-89d2-df405d8241f1@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3ABF60118B9B784CA5BF7C841D2F00EC010351A2@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org



> -----Original Message-----
> From: Vineet Gupta [mailto:vgupta at synopsys.com]
> Sent: Tuesday, January 03, 2017 9:11 PM
> To: Yuriy Kolerov <yuriy.kolerov at synopsys.com>; linux-snps-
> arc at lists.infradead.org
> Cc: Alexey.Brodkin at synopsys.com; linux-kernel at vger.kernel.org;
> marc.zyngier at arm.com
> Subject: Re: [PATCH v3 3/3] ARCv2: MCIP: Deprecate setting of affinity in
> Device Tree
> 
> On 12/28/2016 12:47 AM, Yuriy Kolerov wrote:
> > Ignore value of interrupt distribution mode for common interrupts in
> > IDU since setting of affinity using value from Device Tree is
> > deprecated in ARC. Originally it is done in idu_irq_xlate() function
> > and it is semantically wrong and does not guaranty that an affinity
> > value will be set properly. idu_irq_enable() function is better place
> > for initialization of common interrupts.
> >
> > By default send all common interrupts to all available online CPUs.
> 
> Is this a departure from our original idea to route everything only to boot cpu
> ?
> Otherwise this looks OK to me !

I have come to the conclusion that now there is no way to route all interrupts to the boot CPU in a right manner. It may be implemented properly in the future.

> -Vineet
> 
> > The affinity of common interrupts in IDU must be set manually since in
> > some cases the kernel will not call irq_set_affinity() by itself:
> >
> >   1. When the kernel is not configured with support of SMP.
> >   2. When the kernel is configured with support of SMP but upper
> >      interrupt controllers does not support setting of the affinity
> >      and cannot propagate it to IDU.
> >
> > Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> > ---
> >  .../interrupt-controller/snps,archs-idu-intc.txt   |  3 ++
> >  arch/arc/kernel/mcip.c                             | 52 +++++++++-------------
> >  2 files changed, 25 insertions(+), 30 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-id
> > u-intc.txt
> > b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-id
> > u-intc.txt
> > index 0dcb7c7..9446576 100644
> > ---
> > a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-id
> > u-intc.txt
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/snps,arch
> > +++ s-idu-intc.txt
> > @@ -15,6 +15,9 @@ Properties:
> >    Second cell specifies the irq distribution mode to cores
> >       0=Round Robin; 1=cpu0, 2=cpu1, 4=cpu2, 8=cpu3
> >
> > +  The second cell in interrupts property is deprecated and may be
> > + ignored by  the kernel.
> > +
> >    intc accessed via the special ARC AUX register interface, hence "reg"
> property
> >    is not specified.
> >
> > diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c index
> > be131b2..d492a3c 100644
> > --- a/arch/arc/kernel/mcip.c
> > +++ b/arch/arc/kernel/mcip.c
> > @@ -175,7 +175,6 @@ static void idu_irq_unmask(struct irq_data *data)
> >  	raw_spin_unlock_irqrestore(&mcip_lock, flags);  }
> >
> > -#ifdef CONFIG_SMP
> >  static int
> >  idu_irq_set_affinity(struct irq_data *data, const struct cpumask
> *cpumask,
> >  		     bool force)
> > @@ -205,12 +204,27 @@ idu_irq_set_affinity(struct irq_data *data,
> > const struct cpumask *cpumask,
> >
> >  	return IRQ_SET_MASK_OK;
> >  }
> > -#endif
> > +
> > +static void idu_irq_enable(struct irq_data *data) {
> > +	/*
> > +	 * By default send all common interrupts to all available online CPUs.
> > +	 * The affinity of common interrupts in IDU must be set manually
> since
> > +	 * in some cases the kernel will not call irq_set_affinity() by itself:
> > +	 *   1. When the kernel is not configured with support of SMP.
> > +	 *   2. When the kernel is configured with support of SMP but upper
> > +	 *      interrupt controllers does not support setting of the affinity
> > +	 *      and cannot propagate it to IDU.
> > +	 */
> > +	idu_irq_set_affinity(data, cpu_online_mask, false);
> > +	idu_irq_unmask(data);
> > +}
> >
> >  static struct irq_chip idu_irq_chip = {
> >  	.name			= "MCIP IDU Intc",
> >  	.irq_mask		= idu_irq_mask,
> >  	.irq_unmask		= idu_irq_unmask,
> > +	.irq_enable		= idu_irq_enable,
> >  #ifdef CONFIG_SMP
> >  	.irq_set_affinity       = idu_irq_set_affinity,
> >  #endif
> > @@ -243,36 +257,14 @@ static int idu_irq_xlate(struct irq_domain *d,
> struct device_node *n,
> >  			 const u32 *intspec, unsigned int intsize,
> >  			 irq_hw_number_t *out_hwirq, unsigned int
> *out_type)  {
> > -	irq_hw_number_t hwirq = *out_hwirq = intspec[0];
> > -	int distri = intspec[1];
> > -	unsigned long flags;
> > -
> > +	/*
> > +	 * Ignore value of interrupt distribution mode for common interrupts
> in
> > +	 * IDU which resides in intspec[1] since setting an affinity using value
> > +	 * from Device Tree is deprecated in ARC.
> > +	 */
> > +	*out_hwirq = intspec[0];
> >  	*out_type = IRQ_TYPE_NONE;
> >
> > -	/* XXX: validate distribution scheme again online cpu mask */
> > -	if (distri == 0) {
> > -		/* 0 - Round Robin to all cpus, otherwise 1 bit per core */
> > -		raw_spin_lock_irqsave(&mcip_lock, flags);
> > -		idu_set_dest(hwirq, BIT(num_online_cpus()) - 1);
> > -		idu_set_mode(hwirq, IDU_M_TRIG_LEVEL,
> IDU_M_DISTRI_RR);
> > -		raw_spin_unlock_irqrestore(&mcip_lock, flags);
> > -	} else {
> > -		/*
> > -		 * DEST based distribution for Level Triggered intr can only
> > -		 * have 1 CPU, so generalize it to always contain 1 cpu
> > -		 */
> > -		int cpu = ffs(distri);
> > -
> > -		if (cpu != fls(distri))
> > -			pr_warn("IDU irq %lx distri mode set to cpu %x\n",
> > -				hwirq, cpu);
> > -
> > -		raw_spin_lock_irqsave(&mcip_lock, flags);
> > -		idu_set_dest(hwirq, cpu);
> > -		idu_set_mode(hwirq, IDU_M_TRIG_LEVEL,
> IDU_M_DISTRI_DEST);
> > -		raw_spin_unlock_irqrestore(&mcip_lock, flags);
> > -	}
> > -
> >  	return 0;
> >  }
> >
