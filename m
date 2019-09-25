From: anshuman.khandual@arm.com (Anshuman Khandual)
Date: Wed, 25 Sep 2019 09:06:23 +0530
Subject: [PATCH V3 0/2] mm/debug: Add tests for architecture exported page
 table helpers
In-Reply-To: <20190924123146.GC5202@linux.ibm.com>
References: <1568961203-18660-1-git-send-email-anshuman.khandual@arm.com>
 <20190924115101.p6y7vpbtgmj5qjku@box> <20190924123146.GC5202@linux.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a5acc1cc-d046-e1d8-f39b-e3e785588d5e@arm.com>
To: linux-snps-arc@lists.infradead.org



On 09/24/2019 06:01 PM, Mike Rapoport wrote:
> On Tue, Sep 24, 2019@02:51:01PM +0300, Kirill A. Shutemov wrote:
>> On Fri, Sep 20, 2019@12:03:21PM +0530, Anshuman Khandual wrote:
>>> This series adds a test validation for architecture exported page table
>>> helpers. Patch in the series adds basic transformation tests at various
>>> levels of the page table. Before that it exports gigantic page allocation
>>> function from HugeTLB.
>>>
>>> This test was originally suggested by Catalin during arm64 THP migration
>>> RFC discussion earlier. Going forward it can include more specific tests
>>> with respect to various generic MM functions like THP, HugeTLB etc and
>>> platform specific tests.
>>>
>>> https://lore.kernel.org/linux-mm/20190628102003.GA56463 at arrakis.emea.arm.com/
>>>
>>> Testing:
>>>
>>> Successfully build and boot tested on both arm64 and x86 platforms without
>>> any test failing. Only build tested on some other platforms. Build failed
>>> on some platforms (known) in pud_clear_tests() as there were no available
>>> __pgd() definitions.
>>>
>>> - ARM32
>>> - IA64
>>
>> Hm. Grep shows __pgd() definitions for both of them. Is it for specific
>> config?
>  
> For ARM32 it's defined only for 3-lelel page tables, i.e with LPAE on.
> For IA64 it's defined for !STRICT_MM_TYPECHECKS which is even not a config
> option, but a define in arch/ia64/include/asm/page.h

Right. So now where we go from here ! We will need help from platform folks to
fix this unless its trivial. I did propose this on last thread (v2), wondering if
it will be a better idea to restrict DEBUG_ARCH_PGTABLE_TEST among architectures
which have fixed all pending issues whether build or run time. Though enabling all
platforms where the test builds at the least might make more sense, we might have
to just exclude arm32 and ia64 for now. Then run time problems can be fixed later
platform by platform. Any thoughts ?

BTW the test is known to run successfully on arm64, x86, ppc32 platforms. Gerald
has been trying to get it working on s390. in the meantime., if there are other
volunteers to test this on ppc64, sparc, riscv, mips, m68k etc platforms, it will
be really helpful.

- Anshuman
