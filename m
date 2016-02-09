From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Tue, 9 Feb 2016 14:38:15 +0100
Subject: [PATCH v3 2/3] clocksource: Add NPS400 timers driver
In-Reply-To: <HE1PR02MB138769C4BA48A4D8884BC516D6D60@HE1PR02MB1387.eurprd02.prod.outlook.com>
References: <1454418899-25500-1-git-send-email-noamc@ezchip.com>
 <1454775406-25277-3-git-send-email-noamc@ezchip.com>
 <56B8A482.8040302@linaro.org>
 <HE1PR02MB138769C4BA48A4D8884BC516D6D60@HE1PR02MB1387.eurprd02.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56B9EBC7.4010703@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 02/09/2016 01:36 PM, Noam Camus wrote:
>> From: Daniel Lezcano [mailto:daniel.lezcano at linaro.org] Sent:
>> Monday, February 08, 2016 4:22 PM
>
>>> +	ret = clk_prepare_enable(clk); +	if (ret) +		pr_err("Couldn't
>>> enable parent clock\n"); + +	nps_timer_rate = clk_get_rate(clk);
>
>> If there is an error, you continue the execution of the code. I
>> guess you expect the system to hang in any case with the error in
>> the >console, right ?
>
> Since our clock is root then returned value will always be valid. I
> am far from being expert here, but no one checks for clk_get_rate()
> return value for error. Could you refer to a single place at
> clocksource drivers that checks for error in the return value.

Actually I was referring to clk_prepare_enable, clocksource_register_hz.
Agree clk_get_rate is always valid.

>>> +	ret = clocksource_register_hz(clksrc, nps_timer_rate);
>
>> You can simplify the driver even more by using
>> clocksource_mmio_init.
> Since my base address depends on cluster number, which CPU is part
> of,  this interface is not much of a use. On top of that it assumes
> that I am little endian by using readl family accessories.

Why can't you use ?

clocksource_mmio_init(nps_msu_reg_low_addr, "EZnps-tick", 
nps_timer_rate, 32, nps_clksrc_read);



-- 
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
