From: christophe.leroy@c-s.fr (Christophe Leroy)
Date: Thu, 19 Sep 2019 07:44:36 +0200
Subject: [PATCH] mm/pgtable/debug: Fix test validating architecture page
 table helpers
In-Reply-To: <cb338e2e-23b1-b8af-811c-57feb6f4e7b4@arm.com>
References: <1892b37d1fd9a4ed39e76c4b999b6556077201c0.1568355752.git.christophe.leroy@c-s.fr>
 <cb338e2e-23b1-b8af-811c-57feb6f4e7b4@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cc28ebaf-4167-6bc7-54a7-630cd5ab827c@c-s.fr>
To: linux-snps-arc@lists.infradead.org



Le 18/09/2019 ? 09:32, Anshuman Khandual a ?crit?:
> 
> 
> On 09/13/2019 11:53 AM, Christophe Leroy wrote:
>> Fix build failure on powerpc.
>>
>> Fix preemption imbalance.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy at c-s.fr>
>> ---
>>   mm/arch_pgtable_test.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/mm/arch_pgtable_test.c b/mm/arch_pgtable_test.c
>> index 8b4a92756ad8..f2b3c9ec35fa 100644
>> --- a/mm/arch_pgtable_test.c
>> +++ b/mm/arch_pgtable_test.c
>> @@ -24,6 +24,7 @@
>>   #include <linux/swap.h>
>>   #include <linux/swapops.h>
>>   #include <linux/sched/mm.h>
>> +#include <linux/highmem.h>
>>   #include <asm/pgalloc.h>
>>   #include <asm/pgtable.h>
>>   
>> @@ -400,6 +401,8 @@ static int __init arch_pgtable_tests_init(void)
>>   	p4d_clear_tests(p4dp);
>>   	pgd_clear_tests(mm, pgdp);
>>   
>> +	pte_unmap(ptep);
>> +
>>   	pmd_populate_tests(mm, pmdp, saved_ptep);
>>   	pud_populate_tests(mm, pudp, saved_pmdp);
>>   	p4d_populate_tests(mm, p4dp, saved_pudp);
>>
> 
> Hello Christophe,
> 
> I am planning to fold this fix into the current patch and retain your
> Signed-off-by. Are you okay with it ?
> 

No problem, do whatever is convenient for you. You can keep the 
signed-off-by, or use tested-by: as I tested it on PPC32.

Christophe
