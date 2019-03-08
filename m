From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 8 Mar 2019 09:39:28 +0100
Subject: [PATCH] ARCv2: spinlock: remove the extra smp_mb before lock,
 after unlock
In-Reply-To: <1552008946-8008-1-git-send-email-vgupta@synopsys.com>
References: <1552008946-8008-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190308083928.GQ32477@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Thu, Mar 07, 2019@05:35:46PM -0800, Vineet Gupta wrote:
>  - ARCv2 LLSC based spinlocks smp_mb() both before and after the LLSC
>    instructions, which is not required per lkmm ACQ/REL semantics.
>    smp_mb() is only needed _after_ lock and _before_ unlock.
>    So remove the extra barriers.
>    The reason they were there was mainly historical. At the time of
>    initial SMP Linux bringup on HS38 cores, I was too conservative,
>    given the fluidity of both hw and sw. The last attempt to ditch the
>    extra barrier showed some hackbench regression which is apparently
>    not the case now (atleast for LLSC case, read on...)
> 
>  - EX based spinlocks (!CONFIG_ARC_HAS_LLSC) still needs the extra
>    smp_mb(), not due to lkmm, but due to some hardware shenanigans.
>    W/o that, hackbench triggers RCU stall splat. This is not a "real"
>    Linux use case anyways so I'm not worried about it.
> 
>    | [ARCLinux]# for i in (seq 1 1 5) ; do hackbench; done
>    | Running with 10 groups 400 process
>    | INFO: task hackbench:158 blocked for more than 10 seconds.
>    |       Not tainted 4.20.0-00005-g96b18288a88e-dirty #117
>    | "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>    | hackbench       D    0   158    135 0x00000000
>    |
>    | Stack Trace:
>    | watchdog: BUG: soft lockup - CPU#3 stuck for 59s! [hackbench:469]
>    | Modules linked in:
>    | Path: (null)
>    | CPU: 3 PID: 469 Comm: hackbench Not tainted 4.20.0-00005-g96b18288a88e-dirty
>    |
>    | [ECR   ]: 0x00000000 => Check Programmer's Manual
>    | [EFA   ]: 0x00000000
>    | [BLINK ]: do_exit+0x4a6/0x7d0
>    | [ERET  ]: _raw_write_unlock_irq+0x44/0x5c
> 
>  - And while at it, remove the extar smp_mb() from EX based
>    arch_read_trylock() since the spin lock there guarantees a full
>    barrier anyways
> 
>  - For LLSC case, hackbench threads improves with this patch (HAPS @ 50MHz)
> 
>    ---- before ----
>    |
>    | [ARCLinux]# for i in 1 2 3 4 5; do hackbench 10 thread; done
>    | Running with 10 groups 400 threads
>    | Time: 16.253
>    | Time: 16.445
>    | Time: 16.590
>    | Time: 16.721
>    | Time: 16.544
> 
>    ---- after ----
>    |
>    | [ARCLinux]# for i in 1 2 3 4 5; do hackbench 10 thread; done
>    | Running with 10 groups 400 threads
>    | Time: 15.638
>    | Time: 15.730
>    | Time: 15.870
>    | Time: 15.842
>    | Time: 15.729
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

Acked-by: Peter Zijlstra (Intel) <peterz at infradead.org>
