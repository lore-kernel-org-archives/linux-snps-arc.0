From: Yuriy.Kolerov@synopsys.com (Yuriy Kolerov)
Date: Wed, 30 Nov 2016 14:21:55 +0000
Subject: [RFC] ARC: mm: Restrict definition of pfn_valid() macro for
 CONFIG_FLATMEM
In-Reply-To: <20161130091637.GC18437@dhcp22.suse.cz>
References: <1480433346-18054-1-git-send-email-yuriy.kolerov@synopsys.com>
 <20161130091637.GC18437@dhcp22.suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3ABF60118B9B784CA5BF7C841D2F00EC01025AC2@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

> -----Original Message-----
> From: Michal Hocko [mailto:mhocko at kernel.org]
> Sent: Wednesday, November 30, 2016 12:17 PM
> To: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org; Vineet.Gupta1 at synopsys.com;
> Alexey.Brodkin at synopsys.com; linux-kernel at vger.kernel.org
> Subject: Re: [RFC] ARC: mm: Restrict definition of pfn_valid() macro for
> CONFIG_FLATMEM
> 
> On Tue 29-11-16 18:29:06, Yuriy Kolerov wrote:
> > Despite the fact that subtraction of unsigned integers is a defined
> > behaviour however such operations can lead to unexpected results. Thus
> > it is better to check both left and right boundaries to avoid
> > potential bugs as it done in the generic page.h.
> 
> Why and which code would use an out of range pfn? Why other arches do
> not need to care?

Actually some arches do care about checking of both left and right boundaries (e.g. avr32, sparc, etc). The problem is that a value of pfn may be calculated incorrectly in some places of the kernel. E.g. not long ago I sent a patch which fixes truncation of the most significant byte in pfn/pte in some cases (in the kernel with PAE40, however it is not a FLATMEM case). So such situations can happens in the most unexpected places.

> >
> > Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> > ---
> >  arch/arc/include/asm/page.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
> > index 296c342..81cfc6c7 100644
> > --- a/arch/arc/include/asm/page.h
> > +++ b/arch/arc/include/asm/page.h
> > @@ -88,7 +88,7 @@ typedef pte_t * pgtable_t;
> >  #define ARCH_PFN_OFFSET
> 	virt_to_pfn(CONFIG_LINUX_LINK_BASE)
> >
> >  #ifdef CONFIG_FLATMEM
> > -#define pfn_valid(pfn)		(((pfn) - ARCH_PFN_OFFSET) <
> max_mapnr)
> > +#define pfn_valid(pfn)		((pfn) >= ARCH_PFN_OFFSET &&
> ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
> >  #endif
> >
> >  /*
> > --
> > 2.7.4
> >
> 
> --
> Michal Hocko
> SUSE Labs
