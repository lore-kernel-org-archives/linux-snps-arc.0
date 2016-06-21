From: noamca@mellanox.com (Noam Camus)
Date: Tue, 21 Jun 2016 06:45:58 +0000
Subject: [PATCH V2 63/63] clocksources: Switch back to the clksrc table
In-Reply-To: <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
References: <1466112442-31105-1-git-send-email-daniel.lezcano@linaro.org>
 <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR05MB162581196C0157F45749344FAA2B0@HE1PR05MB1625.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Daniel Lezcano [mailto:daniel.lezcano at linaro.org] 
>Sent: Friday, June 17, 2016 12:27 AM

>All the clocksource drivers's init function are now converted to return an error code. CLOCKSOURCE_OF_DECLARE is no longer used as well as the clksrc-of table.

>Let's convert back the names:
> - CLOCKSOURCE_OF_DECLARE_RET => CLOCKSOURCE_OF_DECLARE
> - clksrc-of-ret              => clksrc-of

> Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
> ---
> arch/arc/kernel/time.c                    |  6 +++---
> arch/arm/kernel/smp_twd.c                 |  6 +++---
> arch/microblaze/kernel/timer.c            |  2 +-
> arch/mips/ralink/cevt-rt3352.c            |  2 +-
> arch/nios2/kernel/time.c                  |  2 +-
> drivers/clocksource/arm_arch_timer.c      |  6 +++---
> drivers/clocksource/arm_global_timer.c    |  2 +-
> drivers/clocksource/armv7m_systick.c      |  2 +-
> drivers/clocksource/asm9260_timer.c       |  2 +-
> drivers/clocksource/bcm2835_timer.c       |  2 +-
> drivers/clocksource/bcm_kona_timer.c      |  4 ++--
> drivers/clocksource/cadence_ttc_timer.c   |  2 +-
> drivers/clocksource/clksrc-dbx500-prcmu.c |  2 +-
> drivers/clocksource/clksrc-probe.c        | 14 --------------
> drivers/clocksource/clksrc_st_lpc.c       |  2 +-
> drivers/clocksource/clps711x-timer.c      |  2 +-
> drivers/clocksource/dw_apb_timer_of.c     |  8 ++++----
> drivers/clocksource/exynos_mct.c          |  4 ++--
> drivers/clocksource/fsl_ftm_timer.c       |  2 +-
> drivers/clocksource/h8300_timer16.c       |  2 +-
> drivers/clocksource/h8300_timer8.c        |  2 +-
> drivers/clocksource/h8300_tpu.c           |  2 +-
> drivers/clocksource/meson6_timer.c        |  2 +-
> drivers/clocksource/mips-gic-timer.c      |  2 +-
> drivers/clocksource/moxart_timer.c        |  2 +-
> drivers/clocksource/mps2-timer.c          |  2 +-
> drivers/clocksource/mtk_timer.c           |  2 +-
> drivers/clocksource/mxs_timer.c           |  2 +-
> drivers/clocksource/nomadik-mtu.c         |  2 +-
> drivers/clocksource/pxa_timer.c           |  2 +-
> drivers/clocksource/qcom-timer.c          |  4 ++--
> drivers/clocksource/rockchip_timer.c      |  8 ++++----
> drivers/clocksource/samsung_pwm_timer.c   |  8 ++++----
> drivers/clocksource/sun4i_timer.c         |  2 +-
> drivers/clocksource/tango_xtal.c          |  2 +-
> drivers/clocksource/tegra20_timer.c       |  4 ++--
> drivers/clocksource/time-armada-370-xp.c  |  6 +++---
> drivers/clocksource/time-efm32.c          |  4 ++--
> drivers/clocksource/time-lpc32xx.c        |  2 +-
> drivers/clocksource/time-orion.c          |  2 +-
> drivers/clocksource/time-pistachio.c      |  2 +-
> drivers/clocksource/timer-atlas7.c        |  2 +-
> drivers/clocksource/timer-atmel-pit.c     |  2 +-
> drivers/clocksource/timer-atmel-st.c      |  2 +-
> drivers/clocksource/timer-digicolor.c     |  2 +-
> drivers/clocksource/timer-imx-gpt.c       | 24 ++++++++++++------------
> drivers/clocksource/timer-integrator-ap.c |  2 +-
> drivers/clocksource/timer-keystone.c      |  2 +-
> drivers/clocksource/timer-nps.c           |  4 ++--
> drivers/clocksource/timer-oxnas-rps.c     |  4 ++--
> drivers/clocksource/timer-prima2.c        |  2 +-
> drivers/clocksource/timer-sp804.c         |  4 ++--
> drivers/clocksource/timer-stm32.c         |  2 +-
> drivers/clocksource/timer-sun5i.c         |  4 ++--
> drivers/clocksource/timer-ti-32k.c        |  2 +-
> drivers/clocksource/timer-u300.c          |  2 +-
> drivers/clocksource/versatile.c           |  4 ++--
> drivers/clocksource/vf_pit_timer.c        |  2 +-
> drivers/clocksource/vt8500_timer.c        |  2 +-
> drivers/clocksource/zevio-timer.c         |  2 +-
> include/asm-generic/vmlinux.lds.h         |  2 --
> include/linux/clocksource.h               |  5 +----
> 62 files changed, 98 insertions(+), 117 deletions(-)

[..]

> diff --git a/drivers/clocksource/timer-nps.c b/drivers/clocksource/timer-nps.c index b5c7b2b..70c149a 100644
> --- a/drivers/clocksource/timer-nps.c
> +++ b/drivers/clocksource/timer-nps.c
> @@ -96,5 +96,5 @@ static int __init nps_timer_init(struct device_node *node)
> 	return nps_setup_clocksource(node, clk);  }
 
> -CLOCKSOURCE_OF_DECLARE_RET(ezchip_nps400_clksrc, "ezchip,nps400-timer",
> -			   nps_timer_init);
> +CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer",
> +		       nps_timer_init);
> diff --git a/drivers/clocksource/timer-oxnas-rps.c b/drivers/clocksource/timer-oxnas-rps.c
> index 0d99f40..bd887e2 100644
> --- a/drivers/clocksource/timer-oxnas-rps.c
> +++ b/drivers/clocksource/timer-oxnas-rps.c
> @@ -293,5 +293,5 @@ err_alloc:
>  	return ret;
> }
 

Acked-by: Noam Camus <noamca at mellanox.com>
