From: heiko@sntech.de (Heiko =?ISO-8859-1?Q?St=FCbner?=)
Date: Mon, 29 May 2017 09:37:03 +0200
Subject: [PATCH 3/7] clocksource: Rename clocksource_probe
In-Reply-To: <1495879129-28109-3-git-send-email-daniel.lezcano@linaro.org>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-3-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1764361.KSI3GRbcNJ@diego>
To: linux-snps-arc@lists.infradead.org

Am Samstag, 27. Mai 2017, 11:58:44 CEST schrieb Daniel Lezcano:
> The function name is now renamed to 'timer_probe' for consistency with
> the CLOCKSOURCE_OF_DECLARE => TIMER_OF_DECLARE change.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
> ---
[...]
> diff --git a/arch/arm/mach-rockchip/rockchip.c
> b/arch/arm/mach-rockchip/rockchip.c index ef0500a..5ab834e 100644
> --- a/arch/arm/mach-rockchip/rockchip.c
> +++ b/arch/arm/mach-rockchip/rockchip.c
> @@ -55,7 +55,7 @@ static void __init rockchip_timer_init(void)
>  	}
> 
>  	of_clk_init(NULL);
> -	clocksource_probe();
> +	timer_probe();
>  }
> 
>  static void __init rockchip_dt_init(void)

Acked-by: Heiko Stuebner <heiko at sntech.de>
