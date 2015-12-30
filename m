From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 30 Dec 2015 16:50:08 +0530
Subject: [PATCH v5 09/20] ARC: IRQ: use device tree to get timer device
 configuration
In-Reply-To: <1451222619-3610-10-git-send-email-noamc@ezchip.com>
References: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
 <1451222619-3610-10-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5683BDE8.4010200@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Sunday 27 December 2015 06:53 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
> 
> We've designated:
> TIMER0 for events (clockevents)
> TIMER1 for free running (clocksource)
> 
> Till now timer configuration was done on arch/arc/kernel/time.c
> with constant values.
> 
> This commit add device tree support so we can do this work
> at dedicated clocksource driver which parse the DT blob.
> 
> Such driver will get clocksource rate as well as interrupt line
> from DT and use them for setting clocksourcse and clockevents.

Rephrase above part please...

Enable DT based clocksources/clockevents to be probed on ARC. Both clk and IRQ are
furnished by DT.

> 
> Note that lately called of_clk_init() is moved before we call
> clocksource_probe() since at that time device from DT
> need a "provider" (clocks) which will be available only after
> we call to of_clk_init().

Rephrase...

Also move of_clk_init() from a late'ish arch_initcall into time_init() to ensure
clocksource_probe() gets the "provide" clocks.


> 
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> Acked-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/kernel/setup.c |    1 -
>  arch/arc/kernel/smp.c   |    2 ++
>  arch/arc/kernel/time.c  |    8 ++++++++
>  3 files changed, 10 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index e1b8744..4681e9c 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -433,7 +433,6 @@ void __init setup_arch(char **cmdline_p)
>  
>  static int __init customize_machine(void)
>  {
> -	of_clk_init(NULL);
>  	/*
>  	 * Traverses flattened DeviceTree - registering platform devices
>  	 * (if any) complete with their resources
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> index 2cfe135..ec6a5c1 100644
> --- a/arch/arc/kernel/smp.c
> +++ b/arch/arc/kernel/smp.c
> @@ -138,7 +138,9 @@ void start_kernel_secondary(void)
>  
>  	pr_info("## CPU%u LIVE ##: Executing Code...\n", cpu);
>  
> +#ifndef CONFIG_CLKSRC_OF
>  	arc_local_timer_setup();
> +#endif
>  
>  	local_irq_enable();
>  	preempt_disable();
> diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
> index dfad287..be6dd9e 100644
> --- a/arch/arc/kernel/time.c
> +++ b/arch/arc/kernel/time.c
> @@ -38,6 +38,7 @@
>  #include <linux/init.h>
>  #include <linux/timex.h>
>  #include <linux/profile.h>
> +#include <linux/clk-provider.h>
>  #include <linux/clocksource.h>
>  #include <linux/clockchips.h>
>  #include <asm/irq.h>
> @@ -283,6 +284,13 @@ void __init time_init(void)
>  		 */
>  		clocksource_register_hz(&arc_counter, arc_get_core_freq());
>  
> +#ifdef CONFIG_COMMON_CLK
> +	of_clk_init(NULL);
> +#endif
> +#ifdef CONFIG_CLKSRC_OF
> +	clocksource_probe();
> +#else

You don't need the #ifdef for both as stub versions already exist.

>  	/* sets up the periodic event timer */
>  	arc_local_timer_setup();

simply do #ifndef CONFIG_CLKSRC_OF just as you do above.

I wanted to remove arc_local_timer_setup from ARC altogether and just switch over
to DT, but it seems I first need to figure out how the timer clk will work with
existing *hack* in plat-axs where we change the clk value for SMP / QUAD configs.

Perhaps needs a clk driver !


> +#endif
>  }
> 
