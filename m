From: linux@roeck-us.net (Guenter Roeck)
Date: Tue, 22 Mar 2016 04:19:57 -0700
Subject: Build error due to commit 458aa76d132dc ("mm/thp/migration:
 switch from flush_tlb_range to flush_pmd_tlb_range")
In-Reply-To: <87k2kvt7p6.fsf@linux.vnet.ibm.com>
References: <20160321200035.GA31544@roeck-us.net>
 <87k2kvt7p6.fsf@linux.vnet.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56F12A5D.7040904@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

On 03/21/2016 10:14 PM, Aneesh Kumar K.V wrote:
> Guenter Roeck <linux at roeck-us.net> writes:
>
>> [ text/plain ]
>> Hi,
>>
>> Your commit 458aa76d132dc1 ("mm/thp/migration: switch from flush_tlb_range
>> to flush_pmd_tlb_range") causes a build error when building
>> arcv2:vdk_hs38_smp_defconfig.
>>
>> include/asm-generic/pgtable.h:799:45: note: in expansion of macro ?BUILD_BUG?
>>   #define flush_pmd_tlb_range(vma, addr, end) BUILD_BUG()
>>                                                ^
>> ./arch/arc/include/asm/tlbflush.h:37:13: note:
>> 	in expansion of macro ?flush_pmd_tlb_range?
>>
>> The build triggers the newly introduced BUILD_BUG().
>>
>> When building the image without the BUILD_BUG(), ie with no definition
>> of flush_pmd_tlb_range(), the problem is gone. This suggests that the
>> function is not needed for this build.
>>
>> I could submit a patch to remove the BUILD_BUG(), but maybe you had a reason
>> for introducing it. Can you elaborate why you introduced the BUILD_BUG() ?
>>
>
> Isn't this going to be fixed by an update to ARC tree ?
>
> http://article.gmane.org/gmane.linux.kernel.mm/148412
>

That wasn't a build error ?

> I also don't understand why we would hit that BUILD_BUG, if we are not
> calling flush_pmd_tlb_range().
>
Good question.

I'll wait for the commit window to close and report again if needed.

Guenter
