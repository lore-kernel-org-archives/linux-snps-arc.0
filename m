From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Fri, 24 Jun 2016 08:41:17 +0200
Subject: [PATCH V3] clocksource/drivers/arc: Convert init function to
 return error
In-Reply-To: <576CB1B6.9090003@synopsys.com>
References: <5763BC00.1030101@synopsys.com>
 <1466158167-23126-1-git-send-email-daniel.lezcano@linaro.org>
 <576CB1B6.9090003@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <576CD60D.1020103@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 06/24/2016 06:06 AM, Vineet Gupta wrote:
> On Friday 17 June 2016 03:39 PM, Daniel Lezcano wrote:
>> The init functions do not return any error. They behave as the following:
>>
>>    - panic, thus leading to a kernel crash while another timer may work and
>>         make the system boot up correctly
>>
>>    or
>>
>>    - print an error and let the caller unaware if the state of the system
>>
>> Change that by converting the init functions to return an error conforming
>> to the CLOCKSOURCE_OF_RET prototype.
>>
>> Proper error handling (rollback, errno value) will be changed later case
>> by case, thus this change just return back an error or success in the init
>> function.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
>> ---
>>   arch/arc/kernel/time.c | 69 ++++++++++++++++++++++++++++++--------------------
>
> [...]
>
>>   	evt->cpumask = cpumask_of(smp_processor_id());
>> @@ -347,24 +355,31 @@ static void __init arc_clockevent_setup(struct device_node *node)
>>   	/* Needs apriori irq_set_percpu_devid() done in intc map function */
>>   	ret = request_percpu_irq(arc_timer_irq, timer_irq_handler,
>>   				 "Timer0 (per-cpu-tick)", evt);
>> -	if (ret)
>> -		panic("clockevent: unable to request irq\n");
>> +	if (ret) {
>> +		pr_err("clockevent: unable to request irq\n");
>> +		returnr ret;
>
> oops I missed the typo here !
> Daniel can u squash this to ur patch !

Yes, no problem.

Do you agree to move the driver to drivers/clocksource, so we can add 
the COMPILE_TEST option ?

Thanks.

   -- Daniel


-- 
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
