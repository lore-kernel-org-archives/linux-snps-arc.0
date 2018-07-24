From: rdunlap@infradead.org (Randy Dunlap)
Date: Tue, 24 Jul 2018 15:07:19 -0700
Subject: [PATCH 1/4] arc: fix some build issues in delay.h
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075012B08394D@us01wembx1.internal.synopsys.com>
References: <20180724204622.2366-1-rd.dunlab@gmail.com>
 <20180724204622.2366-2-rd.dunlab@gmail.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B08394D@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c265f489-9c7a-5002-68ea-755c090756cc@infradead.org>
To: linux-snps-arc@lists.infradead.org

On 07/24/2018 03:04 PM, Vineet Gupta wrote:
> On 07/24/2018 01:46 PM, Randy Dunlap wrote:
>> From: Randy Dunlap <rdunlap at infradead.org>
>>
>> Fix build errors in arch/arc/'s delay.h:
>> - add <linux/delay.h> for loops_per_jiffy
>> - add <asm-generic/types.h> for "u64"
>>
>> In file included from ../drivers/infiniband/hw/cxgb3/cxio_hal.c:32:
>> ../arch/arc/include/asm/delay.h: In function '__udelay':
>> ../arch/arc/include/asm/delay.h:61:12: error: 'u64' undeclared (first use in this function)
>>   loops = ((u64) usecs * 4295 * HZ * loops_per_jiffy) >> 32;
>>             ^~~
>>
>> In file included from ../drivers/infiniband/hw/cxgb3/cxio_hal.c:32:
>> ../arch/arc/include/asm/delay.h: In function '__udelay':
>> ../arch/arc/include/asm/delay.h:63:37: error: 'loops_per_jiffy' undeclared (first use in this function)
>>   loops = ((u64) usecs * 4295 * HZ * loops_per_jiffy) >> 32;
>>                                      ^~~~~~~~~~~~~~~
>>
>> Signed-off-by: Randy Dunlap <rdunlap at infradead.org>
>> Cc: Vineet Gupta <vgupta at synopsys.com>
>> Cc: Ofer Levi <oferle at mellanox.com>
>> Cc: linux-snps-arc at lists.infradead.org
>> ---
>>  arch/arc/include/asm/delay.h |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> --- linux-next-20180723.orig/arch/arc/include/asm/delay.h
>> +++ linux-next-20180723/arch/arc/include/asm/delay.h
>> @@ -17,6 +17,8 @@
>>  #ifndef __ASM_ARC_UDELAY_H
>>  #define __ASM_ARC_UDELAY_H
>>  
>> +#include <linux/delay.h>
> 
> this file in turn includes asm/delay.h - the header guards will catch nested
> inclusion still seems ugly. Should we just reference loops_per_jiffy here like
> other arches do in theur delay.h

Yes, that's a good idea.  I'll do that.

>> +#include <asm-generic/types.h>
>>  #include <asm/param.h>		/* HZ */
>>  
>>  static inline void __delay(unsigned long loops)
>>
> 


-- 
~Randy
