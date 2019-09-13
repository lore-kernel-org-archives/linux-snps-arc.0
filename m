From: kirill@shutemov.name (Kirill A. Shutemov)
Date: Fri, 13 Sep 2019 12:13:05 +0300
Subject: [PATCH V2 2/2] mm/pgtable/debug: Add test validating
 architecture page table helpers
In-Reply-To: <502c497a-9bf1-7d2e-95f2-cfebcd9cf1d9@arm.com>
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
 <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
 <ab0ca38b-1e4f-b636-f8b4-007a15903984@c-s.fr>
 <502c497a-9bf1-7d2e-95f2-cfebcd9cf1d9@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190913091305.rkds4f3fqv3yjhjy@box>
To: linux-snps-arc@lists.infradead.org

On Fri, Sep 13, 2019@02:32:04PM +0530, Anshuman Khandual wrote:
> 
> On 09/12/2019 10:44 PM, Christophe Leroy wrote:
> > 
> > 
> > Le 12/09/2019 ? 08:02, Anshuman Khandual a ?crit?:
> >> This adds a test module which will validate architecture page table helpers
> >> and accessors regarding compliance with generic MM semantics expectations.
> >> This will help various architectures in validating changes to the existing
> >> page table helpers or addition of new ones.
> >>
> >> Test page table and memory pages creating it's entries at various level are
> >> all allocated from system memory with required alignments. If memory pages
> >> with required size and alignment could not be allocated, then all depending
> >> individual tests are skipped.
> >>
> > 
> > [...]
> > 
> >>
> >> Suggested-by: Catalin Marinas <catalin.marinas at arm.com>
> >> Signed-off-by: Anshuman Khandual <anshuman.khandual at arm.com>
> >> ---
> >> ? arch/x86/include/asm/pgtable_64_types.h |?? 2 +
> >> ? mm/Kconfig.debug??????????????????????? |? 14 +
> >> ? mm/Makefile???????????????????????????? |?? 1 +
> >> ? mm/arch_pgtable_test.c????????????????? | 429 ++++++++++++++++++++++++
> >> ? 4 files changed, 446 insertions(+)
> >> ? create mode 100644 mm/arch_pgtable_test.c
> >>
> >> diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
> >> index 52e5f5f2240d..b882792a3999 100644
> >> --- a/arch/x86/include/asm/pgtable_64_types.h
> >> +++ b/arch/x86/include/asm/pgtable_64_types.h
> >> @@ -40,6 +40,8 @@ static inline bool pgtable_l5_enabled(void)
> >> ? #define pgtable_l5_enabled() 0
> >> ? #endif /* CONFIG_X86_5LEVEL */
> >> ? +#define mm_p4d_folded(mm) (!pgtable_l5_enabled())
> >> +
> > 
> > This is specific to x86, should go in a separate patch.
> 
> Thought about it but its just a single line. Kirill suggested this in the
> previous version. There is a generic fallback definition but s390 has it's
> own. This change overrides the generic one for x86 probably as a fix or as
> an improvement. Kirill should be able to help classify it in which case it
> can be a separate patch.

I don't think it worth a separate patch.

-- 
 Kirill A. Shutemov
