From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Mon, 19 Nov 2018 10:58:39 +0100
Subject: [PATCH v2] clocksource/drivers/arc_timer: Utilize generic
 sched_clock
In-Reply-To: <e31a11c42c21353963bd75c88493e8158316d469.camel@synopsys.com>
References: <20181017113020.7551-1-abrodkin@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B0B1A07@US01WEMBX2.internal.synopsys.com>
 <78ccbb4c-56d0-594b-4032-3eb19202847b@linaro.org>
 <2c46ab6e-f0a9-4857-9772-f3c714284e98@linaro.org>
 <dab866a50e66e73f6010de1487b06019887930c8.camel@synopsys.com>
 <40ada5b3-5824-51fd-501f-ef363f162047@linaro.org>
 <e31a11c42c21353963bd75c88493e8158316d469.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <6bb98a9c-899e-ee9c-d630-da07382c1c16@linaro.org>
To: linux-snps-arc@lists.infradead.org


Hi Alexey,

On 19/11/2018 10:55, Alexey Brodkin wrote:
> Hi Daniel,

[ ... ]

>>> In that case do I understand correctly that we may enable GENERIC_SCHED_CLOCK
>>> for ARC even before proposed change for arc_timer.c gets merged - i.e. with no
>>> special GENERIC_SCHED_CLOCK driver we'll safely fall-back to jiffie-based
>>> sched clock which we anyways use now when GENERIC_SCHED_CLOCK is disabled, right?
>>
>> The ARC's Kconfig part does not apply on tip/timers/core.
> 
> May I have a reference to that tree so I may check what gets in the way there
> and then I'll just move "select GENERIC_SCHED_CLOCK" a bit below so there're no
> clashes any longer.

sure, here it is:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=timers/core


-- 
 <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
