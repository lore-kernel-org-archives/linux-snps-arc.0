From: viresh.kumar@linaro.org (Viresh Kumar)
Date: Mon, 29 May 2017 10:04:34 +0530
Subject: [PATCH 3/7] clocksource: Rename clocksource_probe
In-Reply-To: <1495879129-28109-3-git-send-email-daniel.lezcano@linaro.org>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-3-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170529043434.GB5752@vireshk-i7>
To: linux-snps-arc@lists.infradead.org

On 27-05-17, 11:58, Daniel Lezcano wrote:
>  arch/arm/mach-spear/spear13xx.c          |  2 +-

> diff --git a/arch/arm/mach-spear/spear13xx.c b/arch/arm/mach-spear/spear13xx.c
> index ca2f6a8..31c43ca 100644
> --- a/arch/arm/mach-spear/spear13xx.c
> +++ b/arch/arm/mach-spear/spear13xx.c
> @@ -124,5 +124,5 @@ void __init spear13xx_timer_init(void)
>  	clk_put(pclk);
>  
>  	spear_setup_of_timer();
> -	clocksource_probe();
> +	timer_probe();
>  }

Acked-by: Viresh Kumar <viresh.kumar at linaro.org>

-- 
viresh
