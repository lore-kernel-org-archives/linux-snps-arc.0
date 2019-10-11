From: kirill@shutemov.name (Kirill A. Shutemov)
Date: Fri, 11 Oct 2019 15:19:51 +0300
Subject: [PATCH 0/3] eldie generated code for folded p4d/pud
In-Reply-To: <8ba067a6-8b6a-2414-0f04-b251cd6bb47c@gmail.com>
References: <20191009222658.961-1-vgupta@synopsys.com>
 <20191010085609.xgwkrbzea253wmfg@black.fi.intel.com>
 <8ba067a6-8b6a-2414-0f04-b251cd6bb47c@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20191011121951.nxna6hruuskvdxod@box>
To: linux-snps-arc@lists.infradead.org

On Thu, Oct 10, 2019@01:05:56PM -0700, Vineet Gupta wrote:
> 
> Hi Kirill,
> 
> On 10/10/19 1:56 AM, Kirill A. Shutemov wrote:
> > On Wed, Oct 09, 2019@10:26:55PM +0000, Vineet Gupta wrote:
> >>
> >> This series elides extraneous generate code for folded p4d/pud.
> >> This came up when trying to remove __ARCH_USE_5LEVEL_HACK from ARC port.
> >> The code saving are not a while lot, but still worthwhile IMHO.
> > 
> > Agreed.
> 
> Thx.
> 
> So given we are folding pmd too, it seemed we could do the following as well.
> 
> +#ifndef __PAGETABLE_PMD_FOLDED
>  void pmd_clear_bad(pmd_t *);
> +#else
> +#define pmd_clear_bad(pmd)        do { } while (0)
> +#endif
> 
> +#ifndef __PAGETABLE_PMD_FOLDED
>  void pmd_clear_bad(pmd_t *pmd)
>  {
>         pmd_ERROR(*pmd);
>         pmd_clear(pmd);
>  }
> +#endif
> 
> I stared at generated code and it seems a bit wrong.
> free_pgd_range() -> pgd_none_or_clear_bad() is no longer checking for unmapped pgd
> entries as pgd_none/pgd_bad are all stubs returning 0.
> 
> This whole pmd folding is a bit confusing considering I only revisit it every few
> years :-) Abstraction wise, __PAGETABLE_PMD_FOLDED only has pgd, pte but even in
> this regime bunch of pmd macros are still valid
> 
>     pmd_set(pmdp, ptep) {
>         *pmdp.pud.p4d.pgd = (unsigned long)ptep
>     }
> 
> Is there a better way to make a mental model of this code folding.

I don't have any. PMD folding predates me and have never looked at it
closely. Quick look brings more confusion than clarity. :P

> In an ideal world pmd folded would have meant pmd_* routines just vanish - poof.
> So in that sense I like your implementation under #[45]LEVEL_HACK where the level
> simply vanishes by code like #define p4d_t pgd_t. Perhaps there is lot of historic
> baggage, proliferated into arch code so hard to untangle.

In ideal world all these pgd/p4d/pud/pmd/pte should die and we have
something more flexible to begin with.

I played with this before:

https://lore.kernel.org/lkml/20180424154355.mfjgkf47kdp2by4e at black.fi.intel.com/

-- 
 Kirill A. Shutemov
