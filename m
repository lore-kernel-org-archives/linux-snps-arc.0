From: rdunlap@infradead.org (Randy Dunlap)
Date: Tue, 24 Jul 2018 17:46:50 -0700
Subject: [PATCH 2/4] arc: fix type warnings in arc/mm/cache.c
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075012B0839C0@us01wembx1.internal.synopsys.com>
References: <20180724204622.2366-1-rd.dunlab@gmail.com>
 <20180724204622.2366-3-rd.dunlab@gmail.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B0839C0@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8fc4281e-604b-46e3-a6ad-320b370fea91@infradead.org>
To: linux-snps-arc@lists.infradead.org

On 07/24/2018 05:02 PM, Vineet Gupta wrote:
> On 07/24/2018 01:46 PM, Randy Dunlap wrote:
>> From: Randy Dunlap <rdunlap at infradead.org>
>>
>> ../arch/arc/mm/cache.c: In function 'flush_anon_page':
>> ../arch/arc/mm/cache.c:1062:55: warning: passing argument 2 of '__flush_dcache_page' makes integer from pointer without a cast [-Wint-conversion]
>>   __flush_dcache_page((phys_addr_t)page_address(page), page_address(page));
>>                                                        ^~~~~~~~~~~~~~~~~~
>> ../arch/arc/mm/cache.c:1013:59: note: expected 'long unsigned int' but argument is of type 'void *'
>>  void __flush_dcache_page(phys_addr_t paddr, unsigned long vaddr)
>>                                              ~~~~~~~~~~~~~~^~~~~
>>
>> Signed-off-by: Randy Dunlap <rdunlap at infradead.org>
>> Cc: Vineet Gupta <vgupta at synopsys.com>
>> Cc: Ofer Levi <oferle at mellanox.com>
>> Cc: linux-snps-arc at lists.infradead.org
>> ---
>>  arch/arc/mm/cache.c |   11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> --- linux-next-20180723.orig/arch/arc/mm/cache.c
>> +++ linux-next-20180723/arch/arc/mm/cache.c
>> @@ -1038,7 +1038,7 @@ void flush_cache_mm(struct mm_struct *mm
>>  void flush_cache_page(struct vm_area_struct *vma, unsigned long u_vaddr,
>>  		      unsigned long pfn)
>>  {
>> -	unsigned int paddr = pfn << PAGE_SHIFT;
>> +	phys_addr_t paddr = pfn << PAGE_SHIFT;
>>  
>>  	u_vaddr &= PAGE_MASK;
>>  
>> @@ -1058,8 +1058,9 @@ void flush_anon_page(struct vm_area_stru
>>  		     unsigned long u_vaddr)
>>  {
>>  	/* TBD: do we really need to clear the kernel mapping */
>> -	__flush_dcache_page(page_address(page), u_vaddr);
>> -	__flush_dcache_page(page_address(page), page_address(page));
>> +	__flush_dcache_page((phys_addr_t)page_address(page), u_vaddr);
>> +	__flush_dcache_page((phys_addr_t)page_address(page),
>> +			    (phys_addr_t)page_address(page));
> 
> CONFIG_ARC_CACHE_VIPT_ALIASING is a total bitrot and I'm considering removing it
> as no sane systems should use it. There's none which I know are using it.
> But for now this will do.
> 
> 
>>  
>>  }
>>  
>> @@ -1084,7 +1085,7 @@ void copy_user_highpage(struct page *to,
>>  	 * addr_not_cache_congruent() is 0
>>  	 */
>>  	if (page_mapcount(from) && addr_not_cache_congruent(kfrom, u_vaddr)) {
>> -		__flush_dcache_page((unsigned long)kfrom, u_vaddr);
>> +		__flush_dcache_page((phys_addr_t)kfrom, u_vaddr);
> 
> Was this needed really ? I can't seem to trigger any warnings here.

Nope.. glad you caught that.  I can't explain it.  :(

I can only say that if I had _meant_ to patch that, I would have also included
the warning messages from gcc.

> All of this (original code before your change) is technically incorrect due to the
> combination of CONFIG_ARC_CACHE_VIPT_ALIASING and CONFIG_HIGHMEM. @kfrom is
> returned by kmap_atomic() and in highmem regime it could be a kernel virtual
> address, so calling the low level cache flush interface with a kvaddr, pretending
> it is paddr (whethe runsigned long or phys_addr_t) is just not right. This
> combinations needs to be disallowed from Kconfig !
> 
>>  		clean_src_k_mappings = 1;
>>  	}
>>  
>> @@ -1105,7 +1106,7 @@ void copy_user_highpage(struct page *to,
>>  	 * sync the kernel mapping back to physical page
>>  	 */
>>  	if (clean_src_k_mappings) {
>> -		__flush_dcache_page((unsigned long)kfrom, (unsigned long)kfrom);
>> +		__flush_dcache_page((phys_addr_t)kfrom, (unsigned long)kfrom);
>>  		set_bit(PG_dc_clean, &from->flags);
>>  	} else {
>>  		clear_bit(PG_dc_clean, &from->flags);
>>
> 
> Ditto !
> 

Thanks.
-- 
~Randy
