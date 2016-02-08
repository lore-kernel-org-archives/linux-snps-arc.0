From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Mon, 8 Feb 2016 13:10:26 +0100
Subject: [PATCH 6/9] ARC: clocksource: DT based probe
In-Reply-To: <1454410739-24444-7-git-send-email-vgupta@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
 <1454410739-24444-7-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56B885B2.6060408@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 02/02/2016 11:58 AM, Vineet Gupta wrote:
> - Remove explicit clocksource setup and let it be done by OF framework
>    by defining CLOCKSOURCE_OF_DECLARE() for various timers
>
> - This allows multiple clocksources to be potentially registered
>    simultaneouly: previously we could only do one - as all of them had
>    same arc_counter_setup() routine for registration
>
> - Setup routines also ensure that the underlying timer actually exists.
>
> - Remove some of the panic() calls if underlying timer is NOT detcted as
>    a fallback clocksource might still be available
>    1. If GRFC doesn't exist, jiffies clocksource gets registered anyways
>    2. if RTC doesn't exist, TIMER1 cetainly will take over (as it is
>       always present)
>
> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

May be it is time to move these drivers into the drivers/clocksource 
directory where they belong to.


-- 
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
