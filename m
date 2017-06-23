From: wens@csie.org (Chen-Yu Tsai)
Date: Fri, 23 Jun 2017 11:56:38 +0800
Subject: [PATCH 13/23] clocksource/drivers: Rename clocksource_probe to
 timer_probe
In-Reply-To: <1497443984-12371-13-git-send-email-daniel.lezcano@linaro.org>
References: <20170614123800.GH2261@mai>
 <1497443984-12371-1-git-send-email-daniel.lezcano@linaro.org>
 <1497443984-12371-13-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAGb2v65PAg3twJnLmre6MkBoRj7UP_BD0UJf_g2ZttLQX+gpJw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Jun 14, 2017 at 8:39 PM, Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> The function name is now renamed to 'timer_probe' for consistency with
> the CLOCKSOURCE_OF_DECLARE => TIMER_OF_DECLARE change.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
> Acked-by: Viresh Kumar <viresh.kumar at linaro.org>
> Acked-by: Heiko Stuebner <heiko at sntech.de>
> Reviewed-by: Linus Walleij <linus.walleij at linaro.org>
> ---
>  arch/arc/kernel/setup.c                  |  2 +-
>  arch/arm/kernel/time.c                   |  2 +-
>  arch/arm/mach-mediatek/mediatek.c        |  2 +-
>  arch/arm/mach-omap2/timer.c              | 10 +++++-----
>  arch/arm/mach-rockchip/rockchip.c        |  2 +-
>  arch/arm/mach-shmobile/setup-rcar-gen2.c |  2 +-
>  arch/arm/mach-spear/spear13xx.c          |  2 +-
>  arch/arm/mach-sunxi/sunxi.c              |  2 +-

Acked-by: Chen-Yu Tsai <wens at csie.org>
