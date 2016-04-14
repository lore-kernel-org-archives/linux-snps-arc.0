From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 14 Apr 2016 12:05:18 +0200
Subject: [PATCH v4 1/5] ARC: clockevent: DT based probe
In-Reply-To: <570F63B6.1070409@synopsys.com>
References: <1460547605-26184-1-git-send-email-vgupta@synopsys.com>
 <1460547605-26184-2-git-send-email-vgupta@synopsys.com>
 <20160413125922.GA14715@linaro.org> <570F63B6.1070409@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160414100518.GB15250@linaro.org>
To: linux-snps-arc@lists.infradead.org

On Thu, Apr 14, 2016@03:02:38PM +0530, Vineet Gupta wrote:
> On Wednesday 13 April 2016 06:29 PM, Daniel Lezcano wrote:
> > On Wed, Apr 13, 2016@05:10:01PM +0530, Vineet Gupta wrote:
> >>  - timer frequency is derived from DT (no longer rely on top level
> >>    DT "clock-frequency" probed early and exported by asm/clk.h)
> >>
> >>  - TIMER0_IRQ need not be exported across arch code, confined to intc as
> >>    it is property of same
> >>
> >> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
> >> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> >> ---
> > 
> > [ ... ]
> > 
> >> +static void noinline arc_get_timer_clk(struct device_node *node)
> >> +{
> >> +	struct clk *clk;
> >> +	int ret;
> >> +
> >> +	clk = of_clk_get(node, 0);
> >> +	if (IS_ERR(clk))
> >> +		panic("Can't get timer clock");
> >> +
> > 
> > Don't panic here. Change the function to return an error and let the
> > caller to handle it.
> > 
> >> +	ret = clk_prepare_enable(clk);
> >> +	if (ret)
> >> +		pr_err("Couldn't enable parent clock\n");
> 
> I suppose we need to return here too ?
>
> >> +
> >> +	arc_timer_freq = clk_get_rate(clk);
> >> +}
> >> +
> > 
> > [ ... ]
> > 
> >> +static void __init arc_clockevent_setup(struct device_node *node)
> >>  {
> >>  	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
> >>  	int ret;
> >>  
> >>  	register_cpu_notifier(&arc_timer_cpu_nb);
> >>  
> >> +	arc_timer_irq = irq_of_parse_and_map(node, 0);
> >> +	if (arc_timer_irq <= 0)
> >> +		panic("Can't parse IRQ");
> >> +
> >> +	arc_get_timer_clk(node);
> > 
> > Connected to the comment above, check the return code.
> 
> Right and if there's error, bail from here too ? This will leave a system w/o a
> working clockevent and our lpj setup loop will spin forever. Better to add a WARN
> so that user knows to fix his DT.

You can handle the error as you wish here. I just don't want panics spread in the
code.

In the patch 2/5, you mention:

"Remove some of the panic() calls if underlying timer is NOT detected as
 fallback clocksource might still be available"

but you add calls to arc_get_timer_clk() which can panic.

The main problem is the macro CLOCKSOURCE_OF_DECLARE() which expect an init function
returning void. I would like to change the code to have it returning an int, so
the panic could be raised in the generic clksrc code when all clocksource inits fail.

In the meantime, it is a good practice to concentrate all panics in a single place,
that is in the init function to facilitate the conversion above which will happen
in the future ...

  -- Daniel


 
> >> +
> >> +	evt->irq = arc_timer_irq;
> >>  	evt->cpumask = cpumask_of(smp_processor_id());
> >> -	clockevents_config_and_register(evt, arc_get_core_freq(),
> >> +	clockevents_config_and_register(evt, arc_timer_freq,
> >>  					0, ARC_TIMER_MAX);
> >>  
> >>  	/* Needs apriori irq_set_percpu_devid() done in intc map function */
> >> @@ -291,6 +312,7 @@ static void __init arc_clockevent_setup(void)
> >>  
> >>  	enable_percpu_irq(arc_timer_irq, 0);
> >>  }
> >> +CLOCKSOURCE_OF_DECLARE(arc_clkevt, "snps,arc-timer", arc_clockevent_setup);
> >>  
> >>  /*
> >>   * Called from start_kernel() - boot CPU only
> >> @@ -299,7 +321,6 @@ static void __init arc_clockevent_setup(void)
> >>   * -Also sets up any global state needed for timer subsystem:
> >>   *    - for "counting" timer, registers a clocksource, usable across CPUs
> >>   *      (provided that underlying counter h/w is synchronized across cores)
> >> - *    - for "event" timer, sets up TIMER0 IRQ (as that is platform agnostic)
> >>   */
> >>  void __init time_init(void)
> >>  {
> >> @@ -315,7 +336,5 @@ void __init time_init(void)
> >>  		 * CLK upto 4.29 GHz can be safely represented in 32 bits
> >>  		 * because Max 32 bit number is 4,294,967,295
> >>  		 */
> >> -		clocksource_register_hz(&arc_counter, arc_get_core_freq());
> >> -
> >> -	arc_clockevent_setup();
> >> +		clocksource_register_hz(&arc_counter, arc_timer_freq);
> >>  }
> >> -- 
> >> 2.5.0
> >>
> > 
> 
