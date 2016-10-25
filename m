From: Yuriy.Kolerov@synopsys.com (Yuriy Kolerov)
Date: Tue, 25 Oct 2016 17:26:04 +0000
Subject: [PATCH v2 1/5] ARC: SMP: Use "unsigned virq" in
 smp_ipi_irq_setup instead of "signed irq"
In-Reply-To: <ceff7ce9-4de3-f0f4-61b9-1afdb3e837a0@synopsys.com>
References: <1477313194-2310-1-git-send-email-yuriy.kolerov@synopsys.com>
 <ceff7ce9-4de3-f0f4-61b9-1afdb3e837a0@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3ABF60118B9B784CA5BF7C841D2F00EC010185E9@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

Yes, I agree with you and I will squash these patches.

> -----Original Message-----
> From: Vineet Gupta [mailto:vgupta at synopsys.com]
> Sent: Tuesday, October 25, 2016 5:29 AM
> To: Yuriy Kolerov <yuriy.kolerov at synopsys.com>; linux-snps-
> arc at lists.infradead.org
> Cc: Alexey.Brodkin at synopsys.com; marc.zyngier at arm.com;
> tglx at linutronix.de; linux-kernel at vger.kernel.org
> Subject: Re: [PATCH v2 1/5] ARC: SMP: Use "unsigned virq" in
> smp_ipi_irq_setup instead of "signed irq"
> 
> On 10/24/2016 05:46 AM, Yuriy Kolerov wrote:
> > This function takes a cpu number and a virq number and registers an
> > appropriate handler per cpu. However smp_ipi_irq_setup is incorrectly
> > used in several places of ARC platform code - hwirq is passed instead
> > of virq. This patch is intended to clarify declaration of virq
> > argument to prevent passing of hwirq instead of virq in future.
> >
> > Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> > ---
> >  arch/arc/include/asm/smp.h | 4 ++--
> >  arch/arc/kernel/smp.c      | 8 ++++----
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arc/include/asm/smp.h b/arch/arc/include/asm/smp.h
> > index 89fdd1b..3ebebbc 100644
> > --- a/arch/arc/include/asm/smp.h
> > +++ b/arch/arc/include/asm/smp.h
> > @@ -37,9 +37,9 @@ extern const char *arc_platform_smp_cpuinfo(void);
> >   * API expected BY platform smp code (FROM arch smp code)
> >   *
> >   * smp_ipi_irq_setup:
> > - *	Takes @cpu and @irq to which the arch-common ISR is hooked up
> > + *	Takes @cpu and @virq to which the arch-common ISR is hooked up
> 
> If you agree to my comment on 2/5, then yeah change here to say hwirq, but
> IMO this can be squashed with 2/5.
> 
> >   */
> > -extern int smp_ipi_irq_setup(int cpu, int irq);
> > +extern int smp_ipi_irq_setup(int cpu, unsigned int virq);
> >
> >  /*
> >   * struct plat_smp_ops	- SMP callbacks provided by platform to ARC
> SMP
> > diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c index
> > f183cc6..ec4d956 100644
> > --- a/arch/arc/kernel/smp.c
> > +++ b/arch/arc/kernel/smp.c
> > @@ -351,7 +351,7 @@ irqreturn_t do_IPI(int irq, void *dev_id)
> >   */
> >  static DEFINE_PER_CPU(int, ipi_dev);
> >
> > -int smp_ipi_irq_setup(int cpu, int irq)
> > +int smp_ipi_irq_setup(int cpu, unsigned int virq)
> >  {
> >  	int *dev = per_cpu_ptr(&ipi_dev, cpu);
> >
> > @@ -359,12 +359,12 @@ int smp_ipi_irq_setup(int cpu, int irq)
> >  	if (!cpu) {
> >  		int rc;
> >
> > -		rc = request_percpu_irq(irq, do_IPI, "IPI Interrupt", dev);
> > +		rc = request_percpu_irq(virq, do_IPI, "IPI Interrupt", dev);
> >  		if (rc)
> > -			panic("Percpu IRQ request failed for %d\n", irq);
> > +			panic("Percpu IRQ request failed for %d\n", virq);
> >  	}
> >
> > -	enable_percpu_irq(irq, 0);
> > +	enable_percpu_irq(virq, 0);
> >
> >  	return 0;
> >  }
> >
