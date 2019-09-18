From: gerald.schaefer@de.ibm.com (Gerald Schaefer)
Date: Wed, 18 Sep 2019 20:22:43 +0200
Subject: [PATCH V2 2/2] mm/pgtable/debug: Add test validating
 architecture page table helpers
In-Reply-To: <64504101-d9dd-f273-02f9-e9a8b178eecc@c-s.fr>
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
 <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
 <ab0ca38b-1e4f-b636-f8b4-007a15903984@c-s.fr>
 <502c497a-9bf1-7d2e-95f2-cfebcd9cf1d9@arm.com>
 <95ed9d92-dd43-4c45-2e52-738aed7f2fb5@c-s.fr>
 <f872e6f4-a5cb-069d-2034-78961930cb9f@arm.com>
 <64504101-d9dd-f273-02f9-e9a8b178eecc@c-s.fr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190918202243.37e709df@thinkpad>
To: linux-snps-arc@lists.infradead.org

On Wed, 18 Sep 2019 18:26:03 +0200
Christophe Leroy <christophe.leroy@c-s.fr> wrote:

[..] 
> My suggestion was not to completely drop the #ifdef but to do like you 
> did in pgd_clear_tests() for instance, ie to add the following test on 
> top of the function:
> 
> 	if (mm_pud_folded(mm) || is_defined(__ARCH_HAS_5LEVEL_HACK))
> 		return;
> 

Ah, very nice, this would also fix the remaining issues for s390. Since
we have dynamic page table folding, neither __PAGETABLE_PXX_FOLDED nor
__ARCH_HAS_XLEVEL_HACK is defined, but mm_pxx_folded() will work.

mm_alloc() returns with a 3-level page table by default on s390, so we
will run into issues in p4d_clear/populate_tests(), and also at the end
with p4d/pud_free() (double free).

So, adding the mm_pud_folded() check to p4d_clear/populate_tests(),
and also adding mm_p4d/pud_folded() checks at the end before calling
p4d/pud_free(), would make it all work on s390.

BTW, regarding p4d/pud_free(), I'm not sure if we should rather check
the folding inside our s390 functions, similar to how we do it for
p4d/pud_free_tlb(), instead of relying on not being called for folded
p4d/pud. So far, I see no problem with this behavior, all callers of
p4d/pud_free() should be fine because of our folding check within
p4d/pud_present/none(). But that doesn't mean that it is correct not
to check for the folding inside p4d/pud_free(). At least, with this
test module we do now have a caller of p4d/pud_free() on potentially
folded entries, so instead of adding pxx_folded() checks to this
test module, we could add them to our p4d/pud_free() functions.
Any thoughts on this?

Regards,
Gerald
