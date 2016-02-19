From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 19 Feb 2016 12:17:30 +0530
Subject: Interesting csd deadlock on ARC
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56C6BA82.1060909@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter,

I've been debugging a csd_lock_wait() deadlock on SMP+PREEMPT ARC HS38x2 and it
turned out to be lot more interesting than I'd hoped for. This is stock v4.4

Trouble starts with an IPI to self which doesn't get delivered as the inter-core
interrupt providing h/w is not capable of IPI to self (which I found as part of
debugging this). Subsequent IPIs from other cores to this core get elided as well
due to the IPI coalescing optimization in arch/arc/kernel/smp.c: ipi_send_msg_one()

There are ways to use a different h/w mechanism to solve the trigger issue and I'd
hoped to just implement arch_irq_work_raise(). But the trouble is the call stack
for this issue: IPI to self is triggered from

sys_sched_setscheduler
   __balance_callback
       pull_rt_task
         irq_work_queue_on  <-- called with @cpu == self

Looking into irq_work.c, irq_work_queue() is what is semantically needed,
specifically arch_irq_work_raise() will not be called, which means I need
arch_send_call_function_single_ipi() to be able to IPI to self cpu also. Is that
expected from arch code....

Just wanted to understand before writing patches...

Test case triggering is harmless looking LTP: trace_sched -c 1
It is kind of scheduler fizzer as it triggers a whole bunch of sched activity.

Thx,
-Vineet
