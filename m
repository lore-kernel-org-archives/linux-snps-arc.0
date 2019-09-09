From: kirill@shutemov.name (Kirill A. Shutemov)
Date: Mon, 9 Sep 2019 18:13:44 +0300
Subject: [PATCH 1/1] mm/pgtable/debug: Add test validating architecture
 page table helpers
In-Reply-To: <3d5de35f-8192-1c75-50a9-03e66e3b8e5c@arm.com>
References: <1567497706-8649-1-git-send-email-anshuman.khandual@arm.com>
 <1567497706-8649-2-git-send-email-anshuman.khandual@arm.com>
 <20190904221618.1b624a98@thinkpad>
 <20e3044d-2af5-b27b-7653-cec53bdec941@arm.com>
 <20190905190629.523bdb87@thinkpad>
 <3c609e33-afbb-ffaf-481a-6d225a06d1d0@arm.com>
 <20190906210346.5ecbff01@thinkpad>
 <3d5de35f-8192-1c75-50a9-03e66e3b8e5c@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190909151344.ghfypjbgxyosjdk3@box>
To: linux-snps-arc@lists.infradead.org

On Mon, Sep 09, 2019@11:56:50AM +0530, Anshuman Khandual wrote:
> 
> 
> On 09/07/2019 12:33 AM, Gerald Schaefer wrote:
> > On Fri, 6 Sep 2019 11:58:59 +0530
> > Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> > 
> >> On 09/05/2019 10:36 PM, Gerald Schaefer wrote:
> >>> On Thu, 5 Sep 2019 14:48:14 +0530
> >>> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> >>>   
> >>>>> [...]    
> >>>>>> +
> >>>>>> +#if !defined(__PAGETABLE_PMD_FOLDED) && !defined(__ARCH_HAS_4LEVEL_HACK)
> >>>>>> +static void pud_clear_tests(pud_t *pudp)
> >>>>>> +{
> >>>>>> +	memset(pudp, RANDOM_NZVALUE, sizeof(pud_t));
> >>>>>> +	pud_clear(pudp);
> >>>>>> +	WARN_ON(!pud_none(READ_ONCE(*pudp)));
> >>>>>> +}    
> >>>>>
> >>>>> For pgd/p4d/pud_clear(), we only clear if the page table level is present
> >>>>> and not folded. The memset() here overwrites the table type bits, so
> >>>>> pud_clear() will not clear anything on s390 and the pud_none() check will
> >>>>> fail.
> >>>>> Would it be possible to OR a (larger) random value into the table, so that
> >>>>> the lower 12 bits would be preserved?    
> >>>>
> >>>> So the suggestion is instead of doing memset() on entry with RANDOM_NZVALUE,
> >>>> it should OR a large random value preserving lower 12 bits. Hmm, this should
> >>>> still do the trick for other platforms, they just need non zero value. So on
> >>>> s390, the lower 12 bits on the page table entry already has valid value while
> >>>> entering this function which would make sure that pud_clear() really does
> >>>> clear the entry ?  
> >>>
> >>> Yes, in theory the table entry on s390 would have the type set in the last
> >>> 4 bits, so preserving those would be enough. If it does not conflict with
> >>> others, I would still suggest preserving all 12 bits since those would contain
> >>> arch-specific flags in general, just to be sure. For s390, the pte/pmd tests
> >>> would also work with the memset, but for consistency I think the same logic
> >>> should be used in all pxd_clear_tests.  
> >>
> >> Makes sense but..
> >>
> >> There is a small challenge with this. Modifying individual bits on a given
> >> page table entry from generic code like this test case is bit tricky. That
> >> is because there are not enough helpers to create entries with an absolute
> >> value. This would have been easier if all the platforms provided functions
> >> like __pxx() which is not the case now. Otherwise something like this should
> >> have worked.
> >>
> >>
> >> pud_t pud = READ_ONCE(*pudp);
> >> pud = __pud(pud_val(pud) | RANDOM_VALUE (keeping lower 12 bits 0))
> >> WRITE_ONCE(*pudp, pud);
> >>
> >> But __pud() will fail to build in many platforms.
> > 
> > Hmm, I simply used this on my system to make pud_clear_tests() work, not
> > sure if it works on all archs:
> > 
> > pud_val(*pudp) |= RANDOM_NZVALUE;
> 
> Which compiles on arm64 but then fails on x86 because of the way pmd_val()
> has been defined there.

Use instead

	*pudp = __pud(pud_val(*pudp) | RANDOM_NZVALUE);

It *should* be more portable.

-- 
 Kirill A. Shutemov
