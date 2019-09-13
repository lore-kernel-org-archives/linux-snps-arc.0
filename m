From: christophe.leroy@c-s.fr (Christophe Leroy)
Date: Fri, 13 Sep 2019 09:11:49 +0200
Subject: [PATCH] mm/pgtable/debug: Fix test validating architecture page
 table helpers
In-Reply-To: <e2b42446-7f91-83f1-ac12-08dff75c4d35@c-s.fr>
References: <1892b37d1fd9a4ed39e76c4b999b6556077201c0.1568355752.git.christophe.leroy@c-s.fr>
 <527dd29d-45fa-4d83-1899-6cbf268dd749@arm.com>
 <e2b42446-7f91-83f1-ac12-08dff75c4d35@c-s.fr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cb226b56-ff20-3136-7ffb-890657e56870@c-s.fr>
To: linux-snps-arc@lists.infradead.org



Le 13/09/2019 ? 09:03, Christophe Leroy a ?crit?:
> 
> 
> Le 13/09/2019 ? 08:58, Anshuman Khandual a ?crit?:
>> On 09/13/2019 11:53 AM, Christophe Leroy wrote:
>>> Fix build failure on powerpc.
>>>
>>> Fix preemption imbalance.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy at c-s.fr>
>>> ---
>>> ? mm/arch_pgtable_test.c | 3 +++
>>> ? 1 file changed, 3 insertions(+)
>>>
>>> diff --git a/mm/arch_pgtable_test.c b/mm/arch_pgtable_test.c
>>> index 8b4a92756ad8..f2b3c9ec35fa 100644
>>> --- a/mm/arch_pgtable_test.c
>>> +++ b/mm/arch_pgtable_test.c
>>> @@ -24,6 +24,7 @@
>>> ? #include <linux/swap.h>
>>> ? #include <linux/swapops.h>
>>> ? #include <linux/sched/mm.h>
>>> +#include <linux/highmem.h>
>>
>> This is okay.
>>
>>> ? #include <asm/pgalloc.h>
>>> ? #include <asm/pgtable.h>
>>> @@ -400,6 +401,8 @@ static int __init arch_pgtable_tests_init(void)
>>> ????? p4d_clear_tests(p4dp);
>>> ????? pgd_clear_tests(mm, pgdp);
>>> +??? pte_unmap(ptep);
>>> +
>>
>> Now the preemption imbalance via pte_alloc_map() path i.e
>>
>> pte_alloc_map() -> pte_offset_map() -> kmap_atomic()
>>
>> Is not this very much powerpc 32 specific or this will be applicable
>> for all platform which uses kmap_XXX() to map high memory ?
>>
> 
> See 
> https://elixir.bootlin.com/linux/v5.3-rc8/source/include/linux/highmem.h#L91 
> 
> 
> I think it applies at least to all arches using the generic implementation.
> 
> Applies also to arm:
> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm/mm/highmem.c#L52
> 
> Applies also to mips:
> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/mips/mm/highmem.c#L47
> 
> Same on sparc:
> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/sparc/mm/highmem.c#L52 
> 
> 
> Same on x86:
> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/x86/mm/highmem_32.c#L34 
> 
> 
> I have not checked others, but I guess it is like that for all.
> 


Seems like I answered too quickly. All kmap_atomic() do 
preempt_disable(), but not all pte_alloc_map() call kmap_atomic().

However, for instance ARM does:

https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm/include/asm/pgtable.h#L200

And X86 as well:

https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/x86/include/asm/pgtable_32.h#L51

Microblaze also:

https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/microblaze/include/asm/pgtable.h#L495

Christophe
