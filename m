From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 3 Nov 2016 23:38:06 +0100
Subject: [PATCH v2 10/10] clocksource: import ARC timer driver
In-Reply-To: <1478208701-30923-11-git-send-email-vgupta@synopsys.com>
References: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
 <1478208701-30923-11-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161103223806.GD15759@mai>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 03, 2016@02:31:41PM -0700, Vineet Gupta wrote:
> This adds support for
> 
>  - CONFIG_ARC_TIMERS : legacy 32-bit TIMER0 and TIMER1 which count UP
>    from @CNT to @LIMIT, before optionally triggering an interrupt.
>    These are programmed using ARC auxiliary register interface.
>    These are present in all ARC cores (ARC700 and ARC HS38)
>    TIMER0 serves as clockevent for all ARC linux builds.
>    TIMER1 is used for clocksource in arc700 builds.
> 
>  - CONFIG_ARC_TIMERS_64BIT: 64-bit counters, RTC and GFRC found in
>    ARC HS38 cores. These are independnet IP blocks with different
>    programming model respectively.
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---

[ ... ]

>  #include <linux/of_irq.h>
> -#include <asm/irq.h>
>  
>  #include <soc/arc/timers.h>
>  #include <soc/arc/mcip.h>
> @@ -263,7 +248,7 @@ static irqreturn_t timer_irq_handler(int irq, void *dev_id)
>  	 * irq_set_chip_and_handler() asked for handle_percpu_devid_irq()
>  	 */
>  	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
> -	int irq_reenable = clockevent_state_periodic(evt);
> +	int irq_reenable __maybe_unused = clockevent_state_periodic(evt);

Why is needed __maybe_unused ? I see in the previous driver 'irq_reenable' is
used or is there a change in the previous patches I missed ?
