From: patrice.chotard@st.com (Patrice CHOTARD)
Date: Wed, 31 May 2017 07:11:41 +0000
Subject: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
In-Reply-To: <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e6ebd144-414a-51da-d2b4-8d7877eb5d99@st.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel

On 05/27/2017 11:58 AM, Daniel Lezcano wrote:
> The CLOCKSOUCE_OF_DECLARE macro is used widely for the timers to declare the
> clocksource at early stage. However, this macro is also used to initialize
> the clockevent if any, or the clockevent only.
> 
> It was originally suggested to declare another macro to initialize a
> clockevent, so in order to separate the two entities even they belong to the
> same IP. This was not accepted because of the impact on the DT where splitting
> a clocksource/clockevent definition does not make sense as it is a Linux
> concept not a hardware description.
> 
> On the other side, the clocksource has not interrupt declared while the
> clockevent has, so it is easy from the driver to know if the description is
> for a clockevent or a clocksource, IOW it could be implemented at the driver
> level.
> 
> So instead of dealing with a named clocksource macro, let's use a more generic
> one: TIMER_OF_DECLARE.
> 
> The patch has not functional changes.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
> ---

[...]

> diff --git a/drivers/clocksource/clksrc_st_lpc.c b/drivers/clocksource/clksrc_st_lpc.c
> index 03cc492..a1d01eb 100644
> --- a/drivers/clocksource/clksrc_st_lpc.c
> +++ b/drivers/clocksource/clksrc_st_lpc.c
> @@ -132,4 +132,4 @@ static int __init st_clksrc_of_register(struct device_node *np)
>   
>   	return ret;
>   }
> -CLOCKSOURCE_OF_DECLARE(ddata, "st,stih407-lpc", st_clksrc_of_register);
> +TIMER_OF_DECLARE(ddata, "st,stih407-lpc", st_clksrc_of_register);

For the STi driver:

Acked-by: Patrice Chotard <patrice.chotard at st.com>

Thanks
