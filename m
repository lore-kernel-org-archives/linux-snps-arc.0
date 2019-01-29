From: mpe@ellerman.id.au (Michael Ellerman)
Date: Tue, 29 Jan 2019 20:58:13 +1100
Subject: [PATCH v2 06/21] memblock: memblock_phys_alloc_try_nid(): don't
 panic
In-Reply-To: <87y373rdll.fsf@concordia.ellerman.id.au>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-7-git-send-email-rppt@linux.ibm.com>
 <87y373rdll.fsf@concordia.ellerman.id.au>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87va27rdje.fsf@concordia.ellerman.id.au>
To: linux-snps-arc@lists.infradead.org

Michael Ellerman <mpe at ellerman.id.au> writes:

> Mike Rapoport <rppt at linux.ibm.com> writes:
>
>> diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
>> index ae34e3a..2c61ea4 100644
>> --- a/arch/arm64/mm/numa.c
>> +++ b/arch/arm64/mm/numa.c
>> @@ -237,6 +237,10 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
>>  		pr_info("Initmem setup node %d [<memory-less node>]\n", nid);
>>  
>>  	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
>> +	if (!nd_pa)
>> +		panic("Cannot allocate %zu bytes for node %d data\n",
>> +		      nd_size, nid);
>> +
>>  	nd = __va(nd_pa);

Wrong hunk, O_o

> Acked-by: Michael Ellerman <mpe at ellerman.id.au> (powerpc)

You know what I mean though :)

cheers
