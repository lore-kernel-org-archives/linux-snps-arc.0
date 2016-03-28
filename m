From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 28 Mar 2016 07:04:08 +0000
Subject: Build error due to commit 458aa76d132dc ("mm/thp/migration:
 switch from flush_tlb_range to flush_pmd_tlb_range")
References: <20160321200035.GA31544@roeck-us.net>
 <87k2kvt7p6.fsf@linux.vnet.ibm.com> <56F12A5D.7040904@roeck-us.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E911A6@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 22 March 2016 04:50 PM, Guenter Roeck wrote:
> On 03/21/2016 10:14 PM, Aneesh Kumar K.V wrote:
>> Guenter Roeck <linux at roeck-us.net> writes:
>>
>>> [ text/plain ]
>>> Hi,
>>>
>>> Your commit 458aa76d132dc1 ("mm/thp/migration: switch from flush_tlb_range
>>> to flush_pmd_tlb_range") causes a build error when building
>>> arcv2:vdk_hs38_smp_defconfig.
>>>
>>> include/asm-generic/pgtable.h:799:45: note: in expansion of macro ?BUILD_BUG?
>>>   #define flush_pmd_tlb_range(vma, addr, end) BUILD_BUG()
>>>                                                ^
>>> ./arch/arc/include/asm/tlbflush.h:37:13: note:
>>> 	in expansion of macro ?flush_pmd_tlb_range?
>>>
>>> The build triggers the newly introduced BUILD_BUG().
>>>
>>> When building the image without the BUILD_BUG(), ie with no definition
>>> of flush_pmd_tlb_range(), the problem is gone. This suggests that the
>>> function is not needed for this build.
>>>
>>> I could submit a patch to remove the BUILD_BUG(), but maybe you had a reason
>>> for introducing it. Can you elaborate why you introduced the BUILD_BUG() ?
>>>
>> Isn't this going to be fixed by an update to ARC tree ?
>>
>> http://article.gmane.org/gmane.linux.kernel.mm/148412
>>
> That wasn't a build error ?

It was an ARC build error for !THP - the issue was definition of
flush_pmd_tlb_range() w/o THP guard

 #define flush_pmd_tlb_range(vma, s, e) local_flush_pmd_tlb_range(vma, s, e)

And BUILD_BUG was nice as it caught this unwarranted code inclusion !

>
>> I also don't understand why we would hit that BUILD_BUG, if we are not
>> calling flush_pmd_tlb_range().
>>
> Good question.

It's not the call but the definition in ARC

-Vineet

>
> I'll wait for the commit window to close and report again if needed.
>
> Guenter
>
>
