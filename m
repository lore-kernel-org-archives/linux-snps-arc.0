From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 16 Oct 2018 16:03:27 +0000
Subject: [PATCH] clocksource/drivers/arc_timer: Utilize generic sched_clock
References: <20181016074504.2042-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B0AE356@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/16/2018 12:45 AM, Alexey Brodkin wrote:
> It turned out we used to use default implementation of sched_clock()
> from kernel/sched/clock.c which was as precise as 1/HZ, i.e.
> by default we had 10 msec granularity of time measurement.
>
> Now given ARC built-in timers are clocked with the same frequency as
> CPU cores we may get much higher precision of time tracking.

Can you do LMBench runs with and w/o and see if there's any other changes. I'm
hoping lat_ctx will be more consistent.

> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index dec0dd88ec15..3268dad4effe 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -290,6 +290,7 @@ config CLKSRC_MPS2
>  
>  config ARC_TIMERS
>  	bool "Support for 32-bit TIMERn counters in ARC Cores" if COMPILE_TEST
> +	depends on GENERIC_SCHED_CLOCK

It needs to select, not depends on

> @@ -88,6 +89,11 @@ static u64 arc_read_gfrc(struct clocksource *cs)
>  	return (((u64)h) << 32) | l;
>  }
>  
> +static u64 arc_gfrc_clock_read(void)

Needs to be notrace like other such routines.

>
> +
>  static struct clocksource arc_counter_timer1 = {
>  	.name   = "ARC Timer1",
>  	.rating = 300,
> @@ -209,6 +229,8 @@ static int __init arc_cs_setup_timer1(struct device_node *node)
>  	write_aux_reg(ARC_REG_TIMER1_CNT, 0);
>  	write_aux_reg(ARC_REG_TIMER1_CTRL, TIMER_CTRL_NH);
>  
> +	sched_clock_register(arc_timer1_clock_read, 64, arc_timer_freq);

TIMER1 is 32 bits wide.

-Vineet
