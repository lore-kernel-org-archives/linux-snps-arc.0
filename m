From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Mon, 19 Nov 2018 10:43:00 +0100
Subject: [PATCH v2] clocksource/drivers/arc_timer: Utilize generic
 sched_clock
In-Reply-To: <dab866a50e66e73f6010de1487b06019887930c8.camel@synopsys.com>
References: <20181017113020.7551-1-abrodkin@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B0B1A07@US01WEMBX2.internal.synopsys.com>
 <78ccbb4c-56d0-594b-4032-3eb19202847b@linaro.org>
 <2c46ab6e-f0a9-4857-9772-f3c714284e98@linaro.org>
 <dab866a50e66e73f6010de1487b06019887930c8.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <40ada5b3-5824-51fd-501f-ef363f162047@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 19/11/2018 10:31, Alexey Brodkin wrote:
> Hi Daniel,
> 
> On Sun, 2018-11-18@03:17 +0100, Daniel Lezcano wrote:
>> On 05/11/2018 15:39, Daniel Lezcano wrote:
>>> On 24/10/2018 00:33, Vineet Gupta wrote:
>>>> On 10/17/2018 04:30 AM, Alexey Brodkin wrote:
>>>>> It turned out we used to use default implementation of sched_clock()
>>>>> from kernel/sched/clock.c which was as precise as 1/HZ, i.e.
>>>>> by default we had 10 msec granularity of time measurement.
>>>>>
>>>>> Now given ARC built-in timers are clocked with the same frequency as
>>>>> CPU cores we may get much higher precision of time tracking.
>>>>>
>>>>> Thus we switch to generic sched_clock which really reads ARC hardware
>>>>> counters.
>>>>>
>>>>> This is especially helpful for measuring short events.
>>>>> That's what we used to have:
>>>>> ------------------------------>8------------------------
>>>>> $ perf stat /bin/sh -c /root/lmbench-master/bin/arc/hello > /dev/null
>>>>>
>>>>>  Performance counter stats for '/bin/sh -c /root/lmbench-master/bin/arc/hello':
>>>>>
>>>>>          10.000000      task-clock (msec)         #    2.832 CPUs utilized
>>>>>                  1      context-switches          #    0.100 K/sec
>>>>>                  1      cpu-migrations            #    0.100 K/sec
>>>>>                 63      page-faults               #    0.006 M/sec
>>>>>            3049480      cycles                    #    0.305 GHz
>>>>>            1091259      instructions              #    0.36  insn per cycle
>>>>>             256828      branches                  #   25.683 M/sec
>>>>>              27026      branch-misses             #   10.52% of all branches
>>>>>
>>>>>        0.003530687 seconds time elapsed
>>>>>
>>>>>        0.000000000 seconds user
>>>>>        0.010000000 seconds sys
>>>>> ------------------------------>8------------------------
>>>>>
>>>>> And now we'll see:
>>>>> ------------------------------>8------------------------
>>>>> $ perf stat /bin/sh -c /root/lmbench-master/bin/arc/hello > /dev/null
>>>>>
>>>>>  Performance counter stats for '/bin/sh -c /root/lmbench-master/bin/arc/hello':
>>>>>
>>>>>           3.004322      task-clock (msec)         #    0.865 CPUs utilized
>>>>>                  1      context-switches          #    0.333 K/sec
>>>>>                  1      cpu-migrations            #    0.333 K/sec
>>>>>                 63      page-faults               #    0.021 M/sec
>>>>>            2986734      cycles                    #    0.994 GHz
>>>>>            1087466      instructions              #    0.36  insn per cycle
>>>>>             255209      branches                  #   84.947 M/sec
>>>>>              26002      branch-misses             #   10.19% of all branches
>>>>>
>>>>>        0.003474829 seconds time elapsed
>>>>>
>>>>>        0.003519000 seconds user
>>>>>        0.000000000 seconds sys
>>>>> ------------------------------>8------------------------
>>>>>
>>>>> Note how much more meaningful is the second output - time spent for
>>>>> execution pretty much matches number of cycles spent (we're running
>>>>> @ 1GHz here).
>>>>>
>>>>> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
>>>>> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
>>>>> Cc: Vineet Gupta <vgupta at synopsys.com>
>>>>> Cc: Thomas Gleixner <tglx at linutronix.de>
>>>>> ---
>>>>
>>>> Acked-by: Vineet Gupta <vgupta at synopsys.com>
>>>>
>>>> @Daniel is this going via timer tree or you want me to pick it up.
>>>
>>> I will take care of it.
>>
>> Please resend without the arch Kconfig change
> 
> I'm wondering if there's a problem with arc/arc/Kconfig change going
> through your tree? This way it will be really atomic change and it will be
> much easier to back-port (and that's what we'd really like to happen).
> 
> If Vineet is OK with that IMHO it's safe to keep it in the one and only commit.
> 
> Otherwise should I just split this patch in 2 and still submit them as series or
> have 2 completely not-related patches one for you and one for Vineet?
> 
> In that case do I understand correctly that we may enable GENERIC_SCHED_CLOCK
> for ARC even before proposed change for arc_timer.c gets merged - i.e. with no
> special GENERIC_SCHED_CLOCK driver we'll safely fall-back to jiffie-based
> sched clock which we anyways use now when GENERIC_SCHED_CLOCK is disabled, right?

The ARC's Kconfig part does not apply on tip/timers/core.

As you described, sending a separate arc timer change is fine IMO.





-- 
 <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
