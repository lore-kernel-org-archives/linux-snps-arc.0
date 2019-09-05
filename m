From: gerald.schaefer@de.ibm.com (Gerald Schaefer)
Date: Thu, 5 Sep 2019 19:06:29 +0200
Subject: [PATCH 1/1] mm/pgtable/debug: Add test validating architecture
 page table helpers
In-Reply-To: <20e3044d-2af5-b27b-7653-cec53bdec941@arm.com>
References: <1567497706-8649-1-git-send-email-anshuman.khandual@arm.com>
 <1567497706-8649-2-git-send-email-anshuman.khandual@arm.com>
 <20190904221618.1b624a98@thinkpad>
 <20e3044d-2af5-b27b-7653-cec53bdec941@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190905190629.523bdb87@thinkpad>
To: linux-snps-arc@lists.infradead.org

On Thu, 5 Sep 2019 14:48:14 +0530
Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> > [...]  
> >> +
> >> +#if !defined(__PAGETABLE_PMD_FOLDED) && !defined(__ARCH_HAS_4LEVEL_HACK)
> >> +static void pud_clear_tests(pud_t *pudp)
> >> +{
> >> +	memset(pudp, RANDOM_NZVALUE, sizeof(pud_t));
> >> +	pud_clear(pudp);
> >> +	WARN_ON(!pud_none(READ_ONCE(*pudp)));
> >> +}  
> > 
> > For pgd/p4d/pud_clear(), we only clear if the page table level is present
> > and not folded. The memset() here overwrites the table type bits, so
> > pud_clear() will not clear anything on s390 and the pud_none() check will
> > fail.
> > Would it be possible to OR a (larger) random value into the table, so that
> > the lower 12 bits would be preserved?  
> 
> So the suggestion is instead of doing memset() on entry with RANDOM_NZVALUE,
> it should OR a large random value preserving lower 12 bits. Hmm, this should
> still do the trick for other platforms, they just need non zero value. So on
> s390, the lower 12 bits on the page table entry already has valid value while
> entering this function which would make sure that pud_clear() really does
> clear the entry ?

Yes, in theory the table entry on s390 would have the type set in the last
4 bits, so preserving those would be enough. If it does not conflict with
others, I would still suggest preserving all 12 bits since those would contain
arch-specific flags in general, just to be sure. For s390, the pte/pmd tests
would also work with the memset, but for consistency I think the same logic
should be used in all pxd_clear_tests.

However, there is another issue on s390 which will make this only work
for pud_clear_tests(), and not for the p4d/pgd_tests. The problem is that
mm_alloc() will only give you a 3-level page table initially on s390.
This means that pudp == p4dp == pgdp, and so the p4d/pgd_tests will
both see the pud level (of course this also affects other tests).

Not sure yet how to fix this, i.e. how to initialize/update the page table
to 5 levels. We can handle 5 level page tables, and it would be good if
all levels could be tested, but using mm_alloc() to establish the page
tables might not work on s390. One option could be to provide an arch-hook
or weak function to allocate/initialize the mm.

IIUC, the (dummy) mm is really only needed to provide an mm->pgd as starting
point, right?

Regards,
Gerald
