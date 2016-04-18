From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Mon, 18 Apr 2016 11:08:18 +0200
Subject: [PATCH v5] ARC: clockevent: DT based probe
In-Reply-To: <1460961970-20696-1-git-send-email-vgupta@synopsys.com>
References: <20160414100518.GB15250@linaro.org>
 <1460961970-20696-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160418090818.GA14358@linaro.org>
To: linux-snps-arc@lists.infradead.org

On Mon, Apr 18, 2016@12:16:10PM +0530, Vineet Gupta wrote:
>  - timer frequency is derived from DT (no longer rely on top level
>    DT "clock-frequency" probed early and exported by asm/clk.h)
> 
>  - TIMER0_IRQ need not be exported across arch code, confined to intc as
>    it is property of same
> 
>  - Any failures in clockevent setup are considered pedantic and system
>    panic()'s as there is no generic fallback (unlike clocksource where
>    a jiffies based soft clocksource always exists)
> 
> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
> Changes since v4 [*]
> - clockevent setup failure panic()s bubbled up to top level function [Daniel]
> - arc_get_timer_clk() returns error status vs. void [Daniel]
> - For consistency, straggler pr_err() in setup function also converted to panic
> 
> [*] http://lists.infradead.org/pipermail/linux-snps-arc/2016-April/000903.html

[ ... ]

> +static int noinline arc_get_timer_clk(struct device_node *node)
> +{
> +	struct clk *clk;
> +	int ret = -1;
> +
> +	clk = of_clk_get(node, 0);
> +	if (IS_ERR(clk)) {
> +		pr_err("timer missing clk");
> +		return ret;
> +	}

return PTR_ERR(clk);

> +	ret = clk_prepare_enable(clk);
> +	if (ret) {
> +		pr_err("Couldn't enable parent clk\n");
> +		return ret;
> +	}
> +
> +	arc_timer_freq = clk_get_rate(clk);
> +	return ret;
> +}

With the change above: Acked-by: Daniel Lezcano <daniel.lezcano at linaro.org>
