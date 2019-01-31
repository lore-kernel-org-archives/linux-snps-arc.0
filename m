From: christophe.leroy@c-s.fr (Christophe Leroy)
Date: Thu, 31 Jan 2019 07:44:14 +0100
Subject: [PATCH v2 19/21] treewide: add checks for the return value of
 memblock_alloc*()
In-Reply-To: <20190131064139.GB28876@rapoport-lnx>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-20-git-send-email-rppt@linux.ibm.com>
 <b7c12014-14ae-2a38-900c-41fd145307bc@c-s.fr>
 <20190131064139.GB28876@rapoport-lnx>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8838f7ab-998b-6d78-02a8-a53f8a3619d9@c-s.fr>
To: linux-snps-arc@lists.infradead.org



Le 31/01/2019 ? 07:41, Mike Rapoport a ?crit?:
> On Thu, Jan 31, 2019@07:07:46AM +0100, Christophe Leroy wrote:
>>
>>
>> Le 21/01/2019 ? 09:04, Mike Rapoport a ?crit?:
>>> Add check for the return value of memblock_alloc*() functions and call
>>> panic() in case of error.
>>> The panic message repeats the one used by panicing memblock allocators with
>>> adjustment of parameters to include only relevant ones.
>>>
>>> The replacement was mostly automated with semantic patches like the one
>>> below with manual massaging of format strings.
>>>
>>> @@
>>> expression ptr, size, align;
>>> @@
>>> ptr = memblock_alloc(size, align);
>>> + if (!ptr)
>>> + 	panic("%s: Failed to allocate %lu bytes align=0x%lx\n", __func__,
>>> size, align);
>>>
>>> Signed-off-by: Mike Rapoport <rppt at linux.ibm.com>
>>> Reviewed-by: Guo Ren <ren_guo at c-sky.com>             # c-sky
>>> Acked-by: Paul Burton <paul.burton at mips.com>	     # MIPS
>>> Acked-by: Heiko Carstens <heiko.carstens at de.ibm.com> # s390
>>> Reviewed-by: Juergen Gross <jgross at suse.com>         # Xen
>>> ---
>>
>> [...]
>>
>>> diff --git a/mm/sparse.c b/mm/sparse.c
>>> index 7ea5dc6..ad94242 100644
>>> --- a/mm/sparse.c
>>> +++ b/mm/sparse.c
>>
>> [...]
>>
>>> @@ -425,6 +436,10 @@ static void __init sparse_buffer_init(unsigned long size, int nid)
>>>   		memblock_alloc_try_nid_raw(size, PAGE_SIZE,
>>>   						__pa(MAX_DMA_ADDRESS),
>>>   						MEMBLOCK_ALLOC_ACCESSIBLE, nid);
>>> +	if (!sparsemap_buf)
>>> +		panic("%s: Failed to allocate %lu bytes align=0x%lx nid=%d from=%lx\n",
>>> +		      __func__, size, PAGE_SIZE, nid, __pa(MAX_DMA_ADDRESS));
>>> +
>>
>> memblock_alloc_try_nid_raw() does not panic (help explicitly says: Does not
>> zero allocated memory, does not panic if request cannot be satisfied.).
> 
> "Does not panic" does not mean it always succeeds.

I agree, but at least here you are changing the behaviour by making it 
panic explicitly. Are we sure there are not cases where the system could 
just continue functionning ? Maybe a WARN_ON() would be enough there ?

Christophe

>   
>> Stephen Rothwell reports a boot failure due to this change.
> 
> Please see my reply on that thread.
> 
>> Christophe
>>
>>>   	sparsemap_buf_end = sparsemap_buf + size;
>>>   }
>>>
>>
> 
