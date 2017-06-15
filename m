From: matthias.bgg@gmail.com (Matthias Brugger)
Date: Thu, 15 Jun 2017 18:02:00 +0200
Subject: [PATCH 13/23] clocksource/drivers: Rename clocksource_probe to
 timer_probe
In-Reply-To: <1497443984-12371-13-git-send-email-daniel.lezcano@linaro.org>
References: <20170614123800.GH2261@mai>
 <1497443984-12371-1-git-send-email-daniel.lezcano@linaro.org>
 <1497443984-12371-13-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a6614bcf-5552-b168-eee9-a1d604673494@gmail.com>
To: linux-snps-arc@lists.infradead.org



On 14/06/17 14:39, Daniel Lezcano wrote:
> The function name is now renamed to 'timer_probe' for consistency with
> the CLOCKSOURCE_OF_DECLARE => TIMER_OF_DECLARE change.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
> Acked-by: Viresh Kumar <viresh.kumar at linaro.org>
> Acked-by: Heiko Stuebner <heiko at sntech.de>
> Reviewed-by: Linus Walleij <linus.walleij at linaro.org>
> ---
[...]
> diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
> index a6e3c98..c3cf215 100644
> --- a/arch/arm/mach-mediatek/mediatek.c
> +++ b/arch/arm/mach-mediatek/mediatek.c
> @@ -41,7 +41,7 @@ static void __init mediatek_timer_init(void)
>   	}
>   
>   	of_clk_init(NULL);
> -	clocksource_probe();
> +	timer_probe();
>   };

Acked-by: Matthias Brugger <matthias.bgg at gmail.com>
