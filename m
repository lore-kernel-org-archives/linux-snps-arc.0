From: gustavo@embeddedor.com (Gustavo A. R. Silva)
Date: Thu, 29 Aug 2019 10:05:40 -0500
Subject: [PATCH] ARC: unwind: Mark expected switch fall-through
In-Reply-To: <BY5PR12MB403422F37413E42066FCA9BEDEA20@BY5PR12MB4034.namprd12.prod.outlook.com>
References: <20190821012907.GA29165@embeddedor>
 <2c3ef09b-bd07-6caf-05a9-908700a60afd@embeddedor.com>
 <BY5PR12MB403422F37413E42066FCA9BEDEA20@BY5PR12MB4034.namprd12.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1496d4b7-f07b-01e1-c33d-b2d4c501d9dc@embeddedor.com>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,


On 8/29/19 6:25 AM, Eugeniy Paltsev wrote:
> Hi Gustavo,
> 
> I guess this patch is already sent as a pull request to 'v5.3-rc7' by Vineet:
> https://www.mail-archive.com/linux-snps-arc at lists.infradead.org/msg05854.html
> 

No. This is a different one. Notice that the subject lines differ by one
letter.

Thanks
--
Gustavo


> ---
>  Eugeniy Paltsev
> 
> 
> ________________________________________
> From: linux-snps-arc <linux-snps-arc-bounces at lists.infradead.org> on behalf of Gustavo A. R. Silva <gustavo at embeddedor.com>
> Sent: Thursday, August 29, 2019 04:47
> To: Vineet Gupta
> Cc: linux-snps-arc at lists.infradead.org; linux-kernel at vger.kernel.org
> Subject: Re: [PATCH] ARC: unwind: Mark expected switch fall-through
> 
> Hi,
> 
> Friendly ping:
> 
> Who can take this, please?
> 
> Thanks
> --
> Gustavo
> 
> On 8/20/19 8:29 PM, Gustavo A. R. Silva wrote:
>> Mark switch cases where we are expecting to fall through.
>>
>> This patch fixes the following warnings (Building: haps_hs_defconfig arc):
>>
>> arch/arc/kernel/unwind.c: In function ?read_pointer?:
>> ./include/linux/compiler.h:328:5: warning: this statement may fall through [-Wimplicit-fallthrough=]
>>   do {        \
>>      ^
>> ./include/linux/compiler.h:338:2: note: in expansion of macro ?__compiletime_assert?
>>   __compiletime_assert(condition, msg, prefix, suffix)
>>   ^~~~~~~~~~~~~~~~~~~~
>> ./include/linux/compiler.h:350:2: note: in expansion of macro ?_compiletime_assert?
>>   _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>>   ^~~~~~~~~~~~~~~~~~~
>> ./include/linux/build_bug.h:39:37: note: in expansion of macro ?compiletime_assert?
>>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>>                                      ^~~~~~~~~~~~~~~~~~
>> ./include/linux/build_bug.h:50:2: note: in expansion of macro ?BUILD_BUG_ON_MSG?
>>   BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>>   ^~~~~~~~~~~~~~~~
>> arch/arc/kernel/unwind.c:573:3: note: in expansion of macro ?BUILD_BUG_ON?
>>    BUILD_BUG_ON(sizeof(u32) != sizeof(value));
>>    ^~~~~~~~~~~~
>> arch/arc/kernel/unwind.c:575:2: note: here
>>   case DW_EH_PE_native:
>>   ^~~~
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavo at embeddedor.com>
>> ---
>>  arch/arc/kernel/unwind.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
>> index 445e4d702f43..dc05a63516f5 100644
>> --- a/arch/arc/kernel/unwind.c
>> +++ b/arch/arc/kernel/unwind.c
>> @@ -572,6 +572,7 @@ static unsigned long read_pointer(const u8 **pLoc, const void *end,
>>  #else
>>               BUILD_BUG_ON(sizeof(u32) != sizeof(value));
>>  #endif
>> +             /* Fall through */
>>       case DW_EH_PE_native:
>>               if (end < (const void *)(ptr.pul + 1))
>>                       return 0;
>>
> 
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc at lists.infradead.org
> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-2Dsnps-2Darc&d=DwIGaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=ZlJN1MriPUTkBKCrPSx67GmaplEUGcAEk9yPtCLdUXI&m=GJ6OJTL5qRgb-RdlLBhiFzZH5ZmLXf2lxjuQgwbw7n8&s=1TapZixYsKQRFCCPkofjhki-eZ34KmyqojUdAxceNNA&e=
> 
