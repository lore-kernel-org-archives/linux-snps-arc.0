From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 29 May 2017 10:00:46 +0200
Subject: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
In-Reply-To: <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4ccb7cac-1663-792a-7912-d9ee803c7e2b@baylibre.com>
To: linux-snps-arc@lists.infradead.org

On 05/27/2017 11:58 AM, Daniel Lezcano wrote:
> The CLOCKSOUCE_OF_DECLARE macro is used widely for the timers to declare the
> clocksource at early stage. However, this macro is also used to initialize
> the clockevent if any, or the clockevent only.
> 
> It was originally suggested to declare another macro to initialize a
> clockevent, so in order to separate the two entities even they belong to the
> same IP. This was not accepted because of the impact on the DT where splitting
> a clocksource/clockevent definition does not make sense as it is a Linux
> concept not a hardware description.
> 
> On the other side, the clocksource has not interrupt declared while the
> clockevent has, so it is easy from the driver to know if the description is
> for a clockevent or a clocksource, IOW it could be implemented at the driver
> level.
> 
> So instead of dealing with a named clocksource macro, let's use a more generic
> one: TIMER_OF_DECLARE.
> 
> The patch has not functional changes.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
> ---
>  arch/arm/kernel/smp_twd.c                 |  6 +++---
>  arch/microblaze/kernel/timer.c            |  2 +-
>  arch/mips/ralink/cevt-rt3352.c            |  2 +-
>  arch/nios2/kernel/time.c                  |  2 +-
>  drivers/clocksource/arc_timer.c           |  6 +++---
>  drivers/clocksource/arm_arch_timer.c      |  6 +++---
>  drivers/clocksource/arm_global_timer.c    |  2 +-
>  drivers/clocksource/armv7m_systick.c      |  2 +-
>  drivers/clocksource/asm9260_timer.c       |  2 +-
>  drivers/clocksource/bcm2835_timer.c       |  2 +-
>  drivers/clocksource/bcm_kona_timer.c      |  4 ++--
>  drivers/clocksource/cadence_ttc_timer.c   |  2 +-
>  drivers/clocksource/clksrc-dbx500-prcmu.c |  2 +-
>  drivers/clocksource/clksrc_st_lpc.c       |  2 +-
>  drivers/clocksource/clps711x-timer.c      |  2 +-
>  drivers/clocksource/dw_apb_timer_of.c     |  8 ++++----
>  drivers/clocksource/exynos_mct.c          |  4 ++--
>  drivers/clocksource/fsl_ftm_timer.c       |  2 +-
>  drivers/clocksource/h8300_timer16.c       |  2 +-
>  drivers/clocksource/h8300_timer8.c        |  2 +-
>  drivers/clocksource/h8300_tpu.c           |  2 +-
>  drivers/clocksource/jcore-pit.c           |  2 +-
>  drivers/clocksource/meson6_timer.c        |  2 +-
>  drivers/clocksource/mips-gic-timer.c      |  2 +-
>  drivers/clocksource/mps2-timer.c          |  2 +-
>  drivers/clocksource/mtk_timer.c           |  2 +-
>  drivers/clocksource/mxs_timer.c           |  2 +-
>  drivers/clocksource/nomadik-mtu.c         |  2 +-
>  drivers/clocksource/pxa_timer.c           |  2 +-
>  drivers/clocksource/qcom-timer.c          |  4 ++--
>  drivers/clocksource/renesas-ostm.c        |  2 +-
>  drivers/clocksource/rockchip_timer.c      |  4 ++--
>  drivers/clocksource/samsung_pwm_timer.c   |  8 ++++----
>  drivers/clocksource/sun4i_timer.c         |  2 +-
>  drivers/clocksource/tango_xtal.c          |  2 +-
>  drivers/clocksource/tegra20_timer.c       |  4 ++--
>  drivers/clocksource/time-armada-370-xp.c  |  6 +++---
>  drivers/clocksource/time-efm32.c          |  4 ++--
>  drivers/clocksource/time-lpc32xx.c        |  2 +-
>  drivers/clocksource/time-orion.c          |  2 +-
>  drivers/clocksource/time-pistachio.c      |  2 +-
>  drivers/clocksource/timer-atlas7.c        |  2 +-
>  drivers/clocksource/timer-atmel-pit.c     |  2 +-
>  drivers/clocksource/timer-atmel-st.c      |  2 +-
>  drivers/clocksource/timer-digicolor.c     |  2 +-
>  drivers/clocksource/timer-fttmr010.c      | 10 +++++-----
>  drivers/clocksource/timer-imx-gpt.c       | 24 ++++++++++++------------
>  drivers/clocksource/timer-integrator-ap.c |  2 +-
>  drivers/clocksource/timer-keystone.c      |  2 +-
>  drivers/clocksource/timer-nps.c           |  6 +++---
>  drivers/clocksource/timer-oxnas-rps.c     |  4 ++--
>  drivers/clocksource/timer-prima2.c        |  2 +-
>  drivers/clocksource/timer-sp804.c         |  4 ++--
>  drivers/clocksource/timer-stm32.c         |  2 +-
>  drivers/clocksource/timer-sun5i.c         |  4 ++--
>  drivers/clocksource/timer-ti-32k.c        |  2 +-
>  drivers/clocksource/timer-u300.c          |  2 +-
>  drivers/clocksource/versatile.c           |  4 ++--
>  drivers/clocksource/vf_pit_timer.c        |  2 +-
>  drivers/clocksource/vt8500_timer.c        |  2 +-
>  drivers/clocksource/zevio-timer.c         |  2 +-
>  include/linux/clocksource.h               |  2 +-
>  62 files changed, 103 insertions(+), 103 deletions(-)
> 
[...]
> diff --git a/drivers/clocksource/timer-oxnas-rps.c b/drivers/clocksource/timer-oxnas-rps.c
> index d630bf4..eed6fef 100644
> --- a/drivers/clocksource/timer-oxnas-rps.c
> +++ b/drivers/clocksource/timer-oxnas-rps.c
> @@ -293,7 +293,7 @@ static int __init oxnas_rps_timer_init(struct device_node *np)
>  	return ret;
>  }
>  
> -CLOCKSOURCE_OF_DECLARE(ox810se_rps,
> +TIMER_OF_DECLARE(ox810se_rps,
>  		       "oxsemi,ox810se-rps-timer", oxnas_rps_timer_init);
> -CLOCKSOURCE_OF_DECLARE(ox820_rps,
> +TIMER_OF_DECLARE(ox820_rps,
>  		       "oxsemi,ox820se-rps-timer", oxnas_rps_timer_init);
[...]

For the timer-oxnas-rps driver,

Acked-by: Neil Armstrong <narmstrong at baylibre.com>

Thanks for the rework,
Neil
