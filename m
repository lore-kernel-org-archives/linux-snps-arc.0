From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Wed, 13 Apr 2016 14:59:22 +0200
Subject: [PATCH v4 1/5] ARC: clockevent: DT based probe
In-Reply-To: <1460547605-26184-2-git-send-email-vgupta@synopsys.com>
References: <1460547605-26184-1-git-send-email-vgupta@synopsys.com>
 <1460547605-26184-2-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160413125922.GA14715@linaro.org>
To: linux-snps-arc@lists.infradead.org

On Wed, Apr 13, 2016@05:10:01PM +0530, Vineet Gupta wrote:
>  - timer frequency is derived from DT (no longer rely on top level
>    DT "clock-frequency" probed early and exported by asm/clk.h)
> 
>  - TIMER0_IRQ need not be exported across arch code, confined to intc as
>    it is property of same
> 
> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---

[ ... ]

> +static void noinline arc_get_timer_clk(struct device_node *node)
> +{
> +	struct clk *clk;
> +	int ret;
> +
> +	clk = of_clk_get(node, 0);
> +	if (IS_ERR(clk))
> +		panic("Can't get timer clock");
> +

Don't panic here. Change the function to return an error and let the
caller to handle it.

> +	ret = clk_prepare_enable(clk);
> +	if (ret)
> +		pr_err("Couldn't enable parent clock\n");
> +
> +	arc_timer_freq = clk_get_rate(clk);
> +}
> +

[ ... ]

> +static void __init arc_clockevent_setup(struct device_node *node)
>  {
>  	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
>  	int ret;
>  
>  	register_cpu_notifier(&arc_timer_cpu_nb);
>  
> +	arc_timer_irq = irq_of_parse_and_map(node, 0);
> +	if (arc_timer_irq <= 0)
> +		panic("Can't parse IRQ");
> +
> +	arc_get_timer_clk(node);

Connected to the comment above, check the return code.

> +
> +	evt->irq = arc_timer_irq;
>  	evt->cpumask = cpumask_of(smp_processor_id());
> -	clockevents_config_and_register(evt, arc_get_core_freq(),
> +	clockevents_config_and_register(evt, arc_timer_freq,
>  					0, ARC_TIMER_MAX);
>  
>  	/* Needs apriori irq_set_percpu_devid() done in intc map function */
> @@ -291,6 +312,7 @@ static void __init arc_clockevent_setup(void)
>  
>  	enable_percpu_irq(arc_timer_irq, 0);
>  }
> +CLOCKSOURCE_OF_DECLARE(arc_clkevt, "snps,arc-timer", arc_clockevent_setup);
>  
>  /*
>   * Called from start_kernel() - boot CPU only
> @@ -299,7 +321,6 @@ static void __init arc_clockevent_setup(void)
>   * -Also sets up any global state needed for timer subsystem:
>   *    - for "counting" timer, registers a clocksource, usable across CPUs
>   *      (provided that underlying counter h/w is synchronized across cores)
> - *    - for "event" timer, sets up TIMER0 IRQ (as that is platform agnostic)
>   */
>  void __init time_init(void)
>  {
> @@ -315,7 +336,5 @@ void __init time_init(void)
>  		 * CLK upto 4.29 GHz can be safely represented in 32 bits
>  		 * because Max 32 bit number is 4,294,967,295
>  		 */
> -		clocksource_register_hz(&arc_counter, arc_get_core_freq());
> -
> -	arc_clockevent_setup();
> +		clocksource_register_hz(&arc_counter, arc_timer_freq);
>  }
> -- 
> 2.5.0
> 
