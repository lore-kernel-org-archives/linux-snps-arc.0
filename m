From: vgupta@synopsys.com (Vineet Gupta)
Date: Mon, 9 Nov 2015 17:57:25 +0530
Subject: [PATCH v2 16/19] ARC: [plat-eznps] Use dedicated cpu_relax()
In-Reply-To: <20151109104533.GT3604@twins.programming.kicks-ass.net>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-17-git-send-email-noamc@ezchip.com>
 <20151109100503.GH17308@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA23075F44D1200@IN01WEMBXA.internal.synopsys.com>
 <20151109104533.GT3604@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5640912D.3010504@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Monday 09 November 2015 04:15 PM, Peter Zijlstra wrote:
> On Mon, Nov 09, 2015@10:22:27AM +0000, Vineet Gupta wrote:
>> On Monday 09 November 2015 03:35 PM, Peter Zijlstra wrote:
>>> On Sat, Nov 07, 2015@12:52:34PM +0200, Noam Camus wrote:
>>>> diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
>>>> index 7266ede..50f9bae 100644
>>>> --- a/arch/arc/include/asm/processor.h
>>>> +++ b/arch/arc/include/asm/processor.h
>>>> @@ -58,12 +58,21 @@ struct task_struct;
>>>>   * get optimised away by gcc
>>>>   */
>>>>  #ifdef CONFIG_SMP
>>>> +#ifndef CONFIG_EZNPS_MTM_EXT
>>>>  #define cpu_relax()	__asm__ __volatile__ ("" : : : "memory")
>>>>  #else
>>>> +#define cpu_relax()     \
>>>> +	__asm__ __volatile__ (".word %0" : : "i"(CTOP_INST_SCHD_RW) : "memory")
>>>> +#endif
>>>> +#else
>>>>  #define cpu_relax()	do { } while (0)
>>> I'm fairly sure this is incorrect. Even on UP we expect cpu_relax() to
>>> be a compiler barrier.
>>
>> We discussed this a while back (why do https:/lkml.org/lkml/<year>/.... links work
>> psuedo randomly)
>>
>> http://marc.info/?l=linux-kernel&m=140350765530113
> 
> Hurm.. you have a better memory than me ;-)
> 
> So in general we assume cpu_relax() implies a barrier() and I think we
> have loops like:
> 
> 	while (!var)
> 		cpu_relax();
> 
> where var isn't volatile (or casted using READ_ONCE etc).
> 
> See for instance: kernel/time/timer.c:lock_timer_base() which has:
> 
> 	for (;;) {
> 		u32 tf = timer->flags;
> 
> 		if (!(tf & TIMER_MIGRATING)) {
> 		 ...
> 		}
> 
> 		cpu_relax();
> 	}
> 
> So while TIMER_MIGRATING is set, it will only ever do regular loads,
> which GCC is permitted to lift out if cpu_relax() is not a barrier.

I'll just bite the bullet and make it a compiler barrier and send Linus way in
4.4. Care to provide an Ack or some such.

-------------------->
>From e29de8efa621b825891dcc744c84965b38f6b868 Mon Sep 17 00:00:00 2001
From: Vineet Gupta <vgupta@synopsys.com>
Date: Mon, 9 Nov 2015 17:48:34 +0530
Subject: [PATCH] ARC: cpu_relax() to be compiler barrier even for UP

cpu_relax() on ARC has been barrier only for SMP (and no-op for UP). Per
recent discussions, it is safer to make it a compiler barrier
unconditionally.

Link: http://lkml.kernel.org/r/53A7D3AA.9020100 at synopsys.com
Cc: Peter Zijlstra <peterz at infradead.org>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/processor.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index 44545354e9e8..1d694c1ef6d6 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -57,11 +57,7 @@ struct task_struct;
  * A lot of busy-wait loops in SMP are based off of non-volatile data otherwise
  * get optimised away by gcc
  */
-#ifdef CONFIG_SMP
 #define cpu_relax()	__asm__ __volatile__ ("" : : : "memory")
-#else
-#define cpu_relax()	do { } while (0)
-#endif

 #define cpu_relax_lowlatency() cpu_relax()

-- 
1.9.1
