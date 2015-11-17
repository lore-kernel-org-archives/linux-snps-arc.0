From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 17 Nov 2015 17:07:38 +0530
Subject: [PATCH v2 18/19] ARC: [plat-eznps] replace sync with proper cpu
 barrier
In-Reply-To: <20151117112343.GW3816@twins.programming.kicks-ass.net>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-19-git-send-email-noamc@ezchip.com>
 <564B0BB1.8080709@synopsys.com>
 <20151117112343.GW3816@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <564B1182.7050107@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 17 November 2015 04:53 PM, Peter Zijlstra wrote:
> On Tue, Nov 17, 2015@04:42:49PM +0530, Vineet Gupta wrote:
>> On Saturday 07 November 2015 04:22 PM, Noam Camus wrote:
>>> From: Tal Zilcer <talz at ezchip.com>
>>>
>>> In SMT system like we have the generic "sync" is not working with
>>> HW threads. The replacement is "schd.rw" instruction that is served
>>> as cpu barrier for HW threads.
>>
>> As discussed in v2 of this patch, SYNC or some such in __switch_to is completely
>> superfluous. We don't need this patch, you may instead wanna submit a patch which
>> removes the sync. Also please do that in assembler version of this file as well !
> 
> Do test it though; 

Certainly !

> as is ARC-SMP seems to have a _lot_ of superfluous
> barriers many of which have no explanation yet (I'm thinking of those
> extra smp_mb()s in the lock primitives).

Other than the lock primitives can u think of any more.

I verified that with llock/scond based spinlocks, those smp_mb() can be safely
removed. I didn't send that patch over yet as part of puzzle is why removing them
in EX based locks causes hackbench to jitter on quad core builds. This required
some perf investigation but that seems to be causing some sort of livelock with
callgraph profiling which is what I'm debugging currently :-)

BTW since we are on the topic we have this loop in stack unwinder which can
potentially cause RCU stalls, actual lockups etc. I was planning to add the
following - does that seem fine to you.

------------------>

diff --git a/arch/arc/kernel/stacktrace.c b/arch/arc/kernel/stacktrace.c
index 573ac469f68b..e887f6df7ac9 100644
--- a/arch/arc/kernel/stacktrace.c
+++ b/arch/arc/kernel/stacktrace.c
@@ -138,6 +138,10 @@ arc_unwind_core(struct task_struct *tsk, struct pt_regs *regs,
 		if (consumer_fn(address, arg) == -1)
 			break;

+		cond_resched();
+		if (fatal_signal_pending(current))
+			return -ERESTARTNOHAND;
+
 		ret = arc_unwind(&frame_info);
 		if (ret)
 			break;
