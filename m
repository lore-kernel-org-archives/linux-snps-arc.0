From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 11 Feb 2016 09:18:42 +0100
Subject: [PATCH v4 2/3] clocksource: Add NPS400 timers driver
In-Reply-To: <1455159741-21722-3-git-send-email-noamc@ezchip.com>
References: <1454775406-25277-1-git-send-email-noamc@ezchip.com>
 <1455159741-21722-3-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56BC43E2.9030306@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 02/11/2016 04:02 AM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
>
> Add internal tick generator which is shared by all cores.
> Each cluster of cores view it through dedicated address.
> This is used for SMP system where all CPUs synced by same
> clock source.
>
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
> Cc: Rob Herring <robh+dt at kernel.org>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: John Stultz <john.stultz at linaro.org>
> Acked-by: Vineet Gupta <vgupta at synopsys.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano at linaro.org>

but ...

[ ... ]

> +	clk = of_clk_get(node, 0);
> +	if (IS_ERR(clk))
> +		panic("Can't get timer clock");

                 ^^^^^^

I failed to see that at in the previous review.

Thanks

   -- Daniel

-- 
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
