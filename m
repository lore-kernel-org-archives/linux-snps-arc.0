From: christophe.leroy@c-s.fr (Christophe Leroy)
Date: Fri, 13 Sep 2019 12:01:00 +0200
Subject: [PATCH V2 2/2] mm/pgtable/debug: Add test validating architecture
 page table helpers
In-Reply-To: <502c497a-9bf1-7d2e-95f2-cfebcd9cf1d9@arm.com>
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
 <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
 <ab0ca38b-1e4f-b636-f8b4-007a15903984@c-s.fr>
 <502c497a-9bf1-7d2e-95f2-cfebcd9cf1d9@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <95ed9d92-dd43-4c45-2e52-738aed7f2fb5@c-s.fr>
To: linux-snps-arc@lists.infradead.org



Le 13/09/2019 ? 11:02, Anshuman Khandual a ?crit?:
> 
>>> +#if !defined(__PAGETABLE_PMD_FOLDED) && !defined(__ARCH_HAS_4LEVEL_HACK)
>>
>> #ifdefs have to be avoided as much as possible, see below
> 
> Yeah but it has been bit difficult to avoid all these $ifdef because of the
> availability (or lack of it) for all these pgtable helpers in various config
> combinations on all platforms.

As far as I can see these pgtable helpers should exist everywhere at 
least via asm-generic/ files.

Can you spot a particular config which fails ?

> 
>>

[...]

>>> +#if !defined(__PAGETABLE_PUD_FOLDED) && !defined(__ARCH_HAS_5LEVEL_HACK)
>>
>> The same can be done here.
> 
> IIRC not only the page table helpers but there are data types (pxx_t) which
> were not present on various configs and these wrappers help prevent build
> failures. Any ways will try and see if this can be improved further. But
> meanwhile if you have some suggestions, please do let me know.

pgt_t and pmd_t are everywhere I guess.
then pud_t and p4d_t have fallbacks in asm-generic files.

So it shouldn't be an issue. Maybe if a couple of arches miss them, the 
best would be to fix the arches, since that's the purpose of your 
testsuite isn't it ?


Christophe
