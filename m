From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 11 Feb 2016 21:29:59 +0100
Subject: [PATCH v5 2/3] clocksource: Add NPS400 timers driver
In-Reply-To: <1455216059-29632-3-git-send-email-noamc@ezchip.com>
References: <1455159741-21722-1-git-send-email-noamc@ezchip.com>
 <1455216059-29632-3-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56BCEF47.8090006@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 02/11/2016 07:40 PM, Noam Camus wrote:
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


-- 
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
