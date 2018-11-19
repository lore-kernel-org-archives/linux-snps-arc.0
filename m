From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 19 Nov 2018 17:33:58 +0000
Subject: [PATCH v3] clocksource/drivers/arc_timer: Utilize generic
 sched_clock
References: <20181119112917.4214-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501464139C4@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/19/18 3:30 AM, Alexey Brodkin wrote:
> It turned out we used to use default implementation of sched_clock()
> from kernel/sched/clock.c which was as precise as 1/HZ, i.e.
> by default we had 10 msec granularity of time measurement.
>
> Now given ARC built-in timers are clocked with the same frequency as
> CPU cores we may get much higher precision of time tracking.
>
> Thus we switch to generic sched_clock which really reads ARC hardware
> counters.
>
> This is especially helpful for measuring short events.
> That's what we used to have:
> ------------------------------>8------------------------
> $ perf stat /bin/sh -c /root/lmbench-master/bin/arc/hello > /dev/null
>
>  Performance counter stats for '/bin/sh -c /root/lmbench-master/bin/arc/hello':
>
>          10.000000      task-clock (msec)         #    2.832 CPUs utilized
>                  1      context-switches          #    0.100 K/sec
>                  1      cpu-migrations            #    0.100 K/sec
>                 63      page-faults               #    0.006 M/sec
>            3049480      cycles                    #    0.305 GHz
>            1091259      instructions              #    0.36  insn per cycle
>             256828      branches                  #   25.683 M/sec
>              27026      branch-misses             #   10.52% of all branches
>
>        0.003530687 seconds time elapsed
>
>        0.000000000 seconds user
>        0.010000000 seconds sys
> ------------------------------>8------------------------
>
> And now we'll see:
> ------------------------------>8------------------------
> $ perf stat /bin/sh -c /root/lmbench-master/bin/arc/hello > /dev/null
>
>  Performance counter stats for '/bin/sh -c /root/lmbench-master/bin/arc/hello':
>
>           3.004322      task-clock (msec)         #    0.865 CPUs utilized
>                  1      context-switches          #    0.333 K/sec
>                  1      cpu-migrations            #    0.333 K/sec
>                 63      page-faults               #    0.021 M/sec
>            2986734      cycles                    #    0.994 GHz
>            1087466      instructions              #    0.36  insn per cycle
>             255209      branches                  #   84.947 M/sec
>              26002      branch-misses             #   10.19% of all branches
>
>        0.003474829 seconds time elapsed
>
>        0.003519000 seconds user
>        0.000000000 seconds sys
> ------------------------------>8------------------------
>
> Note how much more meaningful is the second output - time spent for
> execution pretty much matches number of cycles spent (we're runnign
> @ 1GHz here).
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Thomas Gleixner <tglx at linutronix.de>

Acked-by: Vineet Gupta <vgupta at synopsys.com>

Thx,
-Vineet
