From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 9 Nov 2015 10:22:27 +0000
Subject: [PATCH v2 16/19] ARC: [plat-eznps] Use dedicated cpu_relax()
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-17-git-send-email-noamc@ezchip.com>
 <20151109100503.GH17308@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D1200@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Monday 09 November 2015 03:35 PM, Peter Zijlstra wrote:
> On Sat, Nov 07, 2015@12:52:34PM +0200, Noam Camus wrote:
>> diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
>> index 7266ede..50f9bae 100644
>> --- a/arch/arc/include/asm/processor.h
>> +++ b/arch/arc/include/asm/processor.h
>> @@ -58,12 +58,21 @@ struct task_struct;
>>   * get optimised away by gcc
>>   */
>>  #ifdef CONFIG_SMP
>> +#ifndef CONFIG_EZNPS_MTM_EXT
>>  #define cpu_relax()	__asm__ __volatile__ ("" : : : "memory")
>>  #else
>> +#define cpu_relax()     \
>> +	__asm__ __volatile__ (".word %0" : : "i"(CTOP_INST_SCHD_RW) : "memory")
>> +#endif
>> +#else
>>  #define cpu_relax()	do { } while (0)
> I'm fairly sure this is incorrect. Even on UP we expect cpu_relax() to
> be a compiler barrier.

We discussed this a while back (why do https:/lkml.org/lkml/<year>/.... links work
psuedo randomly)

http://marc.info/?l=linux-kernel&m=140350765530113


>
>>  #endif
>>  
>> +#ifndef CONFIG_EZNPS_MTM_EXT
>>  #define cpu_relax_lowlatency() cpu_relax()
>> +#else
>> +#define cpu_relax_lowlatency() barrier()
>> +#endif
> At which point you can unconditionally use that definition.
>
>>  
>>  #define copy_segments(tsk, mm)      do { } while (0)
>>  #define release_segments(mm)        do { } while (0)
>> -- 
>> 1.7.1
>>
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc
>
