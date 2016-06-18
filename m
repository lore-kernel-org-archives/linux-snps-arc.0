From: heiko@sntech.de (Heiko =?ISO-8859-1?Q?St=FCbner?=)
Date: Sat, 18 Jun 2016 15:48:49 +0200
Subject: [PATCH V2 63/63] clocksources: Switch back to the clksrc table
In-Reply-To: <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
References: <1466112442-31105-1-git-send-email-daniel.lezcano@linaro.org>
 <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4420923.qQJUdaA1rI@diego>
To: linux-snps-arc@lists.infradead.org

Am Donnerstag, 16. Juni 2016, 23:27:22 schrieb Daniel Lezcano:
> All the clocksource drivers's init function are now converted to return
> an error code. CLOCKSOURCE_OF_DECLARE is no longer used as well as the
> clksrc-of table.
> 
> Let's convert back the names:
>  - CLOCKSOURCE_OF_DECLARE_RET => CLOCKSOURCE_OF_DECLARE
>  - clksrc-of-ret              => clksrc-of
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
> ---
>  drivers/clocksource/rockchip_timer.c      |  8 ++++----

> diff --git
> a/drivers/clocksource/rockchip_timer.c
> b/drivers/clocksource/rockchip_timer.c index d10bdee..d10e7a5 100644
> --- a/drivers/clocksource/rockchip_timer.c
> +++ b/drivers/clocksource/rockchip_timer.c
> @@ -200,7 +200,7 @@ static int __init rk3399_timer_init(struct device_node
> *np) return rk_timer_init(np, TIMER_CONTROL_REG3399);
>  }
> 
> -CLOCKSOURCE_OF_DECLARE_RET(rk3288_timer, "rockchip,rk3288-timer",
> -			   rk3288_timer_init);
> -CLOCKSOURCE_OF_DECLARE_RET(rk3399_timer, "rockchip,rk3399-timer",
> -			   rk3399_timer_init);
> +CLOCKSOURCE_OF_DECLARE(rk3288_timer, "rockchip,rk3288-timer",
> +		       rk3288_timer_init);
> +CLOCKSOURCE_OF_DECLARE(rk3399_timer, "rockchip,rk3399-timer",
> +		       rk3399_timer_init);

for the Rockchip-part
Acked-by: Heiko Stuebner <heiko at sntech.de>
