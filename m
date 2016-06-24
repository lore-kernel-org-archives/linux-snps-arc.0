From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 24 Jun 2016 09:36:14 +0530
Subject: [PATCH V3] clocksource/drivers/arc: Convert init function to
 return error
In-Reply-To: <1466158167-23126-1-git-send-email-daniel.lezcano@linaro.org>
References: <5763BC00.1030101@synopsys.com>
 <1466158167-23126-1-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <576CB1B6.9090003@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 17 June 2016 03:39 PM, Daniel Lezcano wrote:
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
>  arch/arc/kernel/time.c | 69 ++++++++++++++++++++++++++++++--------------------

[...]

>  	evt->cpumask = cpumask_of(smp_processor_id());
> @@ -347,24 +355,31 @@ static void __init arc_clockevent_setup(struct device_node *node)
>  	/* Needs apriori irq_set_percpu_devid() done in intc map function */
>  	ret = request_percpu_irq(arc_timer_irq, timer_irq_handler,
>  				 "Timer0 (per-cpu-tick)", evt);
> -	if (ret)
> -		panic("clockevent: unable to request irq\n");
> +	if (ret) {
> +		pr_err("clockevent: unable to request irq\n");
> +		returnr ret;

oops I missed the typo here !
Daniel can u squash this to ur patch !

-Vineet
