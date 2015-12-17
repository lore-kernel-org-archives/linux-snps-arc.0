From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 17 Dec 2015 14:12:20 +0100
Subject: [PATCH v4 04/19] clocksource: Add NPS400 timers driver
In-Reply-To: <1450228238-4499-5-git-send-email-noamc@ezchip.com>
References: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
 <1450228238-4499-5-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5672B4B4.2010305@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 12/16/2015 02:10 AM, Noam Camus wrote:
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

[ ... ]

> +	clk_prepare_enable(clk);
> +	rate = clk_get_rate(clk);

With the return value checked:

Acked-by: Daniel Lezcano <daniel.lezcano at linaro.org>

Thanks !

   -- Daniel


-- 
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
