From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Mon, 19 Nov 2018 13:00:03 +0100
Subject: [PATCH v3] clocksource/drivers/arc_timer: Utilize generic
 sched_clock
In-Reply-To: <20181119112917.4214-1-abrodkin@synopsys.com>
References: <20181119112917.4214-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b3bc70ba-5e02-0e46-01e8-9c72aa653a54@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 19/11/2018 12:29, Alexey Brodkin wrote:

[ ... ]

>  arch/arc/Kconfig                |  1 +
>  drivers/clocksource/Kconfig     |  1 +
>  drivers/clocksource/arc_timer.c | 22 ++++++++++++++++++++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig

Can I have an Ack for the arch part ?

Thanks
  -- Daniel

-- 
 <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
