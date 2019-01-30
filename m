From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 30 Jan 2019 16:44:43 +0000
Subject: [PATCH 2/5] ARCv2: introduce unaligned access under a Kconfig
 option
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075014642D58D@US01WEMBX2.internal.synopsys.com>
References: <20190129104942.31705-1-Eugeniy.Paltsev@synopsys.com>
 <20190129104942.31705-3-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075014642D58D@US01WEMBX2.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548866682.29008.31.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2019-01-29@21:44 +0000, Vineet Gupta wrote:
> On 1/29/19 2:49 AM, Eugeniy Paltsev wrote:
> > As of today we enable unaligned access unconditionally on ARCv2.
> > Lets move it under Kconfig option so we can disable it in case of
> > using HW configuration which lacks of it.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> >  arch/arc/Kconfig                      | 8 ++++++++
> >  arch/arc/include/asm/irqflags-arcv2.h | 4 ++++
> >  arch/arc/kernel/intc-arcv2.c          | 4 +++-
> >  3 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arc/include/asm/irqflags-arcv2.h b/arch/arc/include/asm/irqflags-arcv2.h
> > index 8a4f77ea3238..9b911e2c6b31 100644
> > --- a/arch/arc/include/asm/irqflags-arcv2.h
> > +++ b/arch/arc/include/asm/irqflags-arcv2.h
> > @@ -44,8 +44,12 @@
> >  #define ARCV2_IRQ_DEF_PRIO	1
> >  
> >  /* seed value for status register */
> > +#ifdef CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS
> >  #define ISA_INIT_STATUS_BITS	(STATUS_IE_MASK | STATUS_AD_MASK | \
> >  					(ARCV2_IRQ_DEF_PRIO << 1))
> > +#else
> > +#define ISA_INIT_STATUS_BITS	(STATUS_IE_MASK | (ARCV2_IRQ_DEF_PRIO << 1))
> > +#endif /* CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS */
> 
> I'd prefer to change the define of STATUS_AD_MASK itself and keep all of this
> unchanged !
> 

Actually I'd prefer to leave STATUS_AD_MASK untouched. Otherwise we will implicitly assign
wrong value to STATUS_AD_MASK which is quite misleading.

BTW, STATUS_AD_MASK is used in ASM code in v2 patch and it shouldn't be dependent on
CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS.

-- 
 Eugeniy Paltsev
