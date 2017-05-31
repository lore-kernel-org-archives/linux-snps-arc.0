From: james.hartley@imgtec.com (James Hartley)
Date: Wed, 31 May 2017 11:29:45 +0100
Subject: [PATCH 3/7] clocksource: Rename clocksource_probe
In-Reply-To: <1495879129-28109-3-git-send-email-daniel.lezcano@linaro.org>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-3-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a974f62d-5a3c-629c-7e80-b45ba34f44dc@imgtec.com>
To: linux-snps-arc@lists.infradead.org



On 27/05/17 10:58, Daniel Lezcano wrote:
> The function name is now renamed to 'timer_probe' for consistency with
> the CLOCKSOURCE_OF_DECLARE => TIMER_OF_DECLARE change.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
> ---
>  arch/arc/kernel/setup.c                  |  2 +-
>  arch/arm/kernel/time.c                   |  2 +-
>  arch/arm/mach-mediatek/mediatek.c        |  2 +-
>  arch/arm/mach-omap2/timer.c              | 10 +++++-----
>  arch/arm/mach-rockchip/rockchip.c        |  2 +-
>  arch/arm/mach-shmobile/setup-rcar-gen2.c |  2 +-
>  arch/arm/mach-spear/spear13xx.c          |  2 +-
>  arch/arm/mach-sunxi/sunxi.c              |  2 +-
>  arch/arm/mach-u300/core.c                |  2 +-
>  arch/arm/mach-zynq/common.c              |  2 +-
>  arch/arm64/kernel/time.c                 |  2 +-
>  arch/h8300/kernel/setup.c                |  2 +-
>  arch/microblaze/kernel/setup.c           |  2 +-
>  arch/mips/generic/init.c                 |  2 +-
>  arch/mips/mti-malta/malta-time.c         |  2 +-
>  arch/mips/pic32/pic32mzda/time.c         |  2 +-
>  arch/mips/pistachio/time.c               |  2 +-
>  arch/mips/ralink/clk.c                   |  2 +-
>  arch/mips/ralink/timer-gic.c             |  2 +-
>  arch/mips/xilfpga/time.c                 |  2 +-
>  arch/nios2/kernel/time.c                 |  2 +-
>  arch/sh/boards/of-generic.c              |  2 +-
>  arch/xtensa/kernel/time.c                |  2 +-
>  drivers/clocksource/clksrc-probe.c       |  2 +-
>  include/linux/clocksource.h              |  4 ++--
>  25 files changed, 30 insertions(+), 30 deletions(-)
>
>
For pistachio:

Acked-by: James Hartley <james.hartley at imgtec.com>

Thanks,
James.
