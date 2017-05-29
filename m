From: matthias.bgg@gmail.com (Matthias Brugger)
Date: Mon, 29 May 2017 15:25:12 +0200
Subject: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
In-Reply-To: <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5d5d1f1b-0948-f28d-0c52-adcdbdf89244@gmail.com>
To: linux-snps-arc@lists.infradead.org



On 27/05/17 11:58, Daniel Lezcano wrote:
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

> diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
> index 9065949..f9b724f 100644
> --- a/drivers/clocksource/mtk_timer.c
> +++ b/drivers/clocksource/mtk_timer.c
> @@ -265,4 +265,4 @@ static int __init mtk_timer_init(struct device_node *node)
>   
>   	return -EINVAL;
>   }
> -CLOCKSOURCE_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_timer_init);
> +TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_timer_init);

For the mediatek driver:

Acked-by: Matthias Brugger <matthias.bgg at gmail.com>
