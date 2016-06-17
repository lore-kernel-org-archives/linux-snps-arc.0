From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 17 Jun 2016 10:59:44 +0200
Subject: [PATCH V2 61/63] clocksource/drivers/arc: Convert init function
 to return error
In-Reply-To: <1466112442-31105-62-git-send-email-daniel.lezcano@linaro.org>
References: <1466112442-31105-1-git-send-email-daniel.lezcano@linaro.org>
 <1466112442-31105-62-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5763BC00.1030101@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 16 June 2016 11:27 PM, Daniel Lezcano wrote:
> The init functions do not return any error. They behave as the following:
> 
>   - panic, thus leading to a kernel crash while another timer may work and
>        make the system boot up correctly
> 
>   or
> 
>   - print an error and let the caller unaware if the state of the system
> 
> Change that by converting the init functions to return an error conforming
> to the CLOCKSOURCE_OF_RET prototype.
> 
> Proper error handling (rollback, errno value) will be changed later case
> by case, thus this change just return back an error or success in the init
> function.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
> ---

[...]

>  
> @@ -172,27 +172,27 @@ static struct clocksource arc_counter_rtc = {
>  	.flags  = CLOCK_SOURCE_IS_CONTINUOUS,
>  };
>  
> -static void __init arc_cs_setup_rtc(struct device_node *node)
> +static int __init arc_cs_setup_rtc(struct device_node *node)
>  {
>  	int exists = cpuinfo_arc700[smp_processor_id()].extn.rtc;
>  	int ret;
>  
>  	if (WARN(!exists, "Local-64-bit-Ctr clocksource not detected"))
> -		return;
> +		return -ENXIO;
>  
>  	/* Local to CPU hence not usable in SMP */
>  	if (WARN(IS_ENABLED(CONFIG_SMP), "Local-64-bit-Ctr not usable in SMP"))
> -		return;
> +		return -EINVAL;
>  
>  	ret = arc_get_timer_clk(node);
>  	if (ret)
> -		return;
> +		return ret;
>  
>  	write_aux_reg(AUX_RTC_CTRL, 1);
>  
> -	clocksource_register_hz(&arc_counter_rtc, arc_timer_freq);
> +	return clocksource_register_hz(&arc_counter_rtc, arc_timer_freq);
>  }
> -CLOCKSOURCE_OF_DECLARE(arc_rtc, "snps,archs-timer-rtc", arc_cs_setup_rtc);
> +CLOCKSOURCE_OF_DECLARE_RET(arc_rtc, "snps,archs-timer-rtc", arc_cs_setup_rtc);
>  
>  #endif
>  
> @@ -213,23 +213,23 @@ static struct clocksource arc_counter_timer1 = {
>  	.flags  = CLOCK_SOURCE_IS_CONTINUOUS,
>  };
>  
> -static void __init arc_cs_setup_timer1(struct device_node *node)
> +static int __init arc_cs_setup_timer1(struct device_node *node)
>  {
>  	int ret;
>  
>  	/* Local to CPU hence not usable in SMP */
>  	if (IS_ENABLED(CONFIG_SMP))
> -		return;
> +		return 0;

-EINVAL to keep it similar as rtc above
