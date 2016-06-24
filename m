From: wens@csie.org (Chen-Yu Tsai)
Date: Fri, 24 Jun 2016 15:13:20 +0800
Subject: [PATCH V2 63/63] clocksources: Switch back to the clksrc table
In-Reply-To: <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
References: <1466112442-31105-1-git-send-email-daniel.lezcano@linaro.org>
 <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAGb2v64Qk822h2Mqp1Moc1yV7uXSEQBGiurkyFLSZdJ6NOO3Vg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Jun 17, 2016 at 5:27 AM, Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> All the clocksource drivers's init function are now converted to return
> an error code. CLOCKSOURCE_OF_DECLARE is no longer used as well as the
> clksrc-of table.
>
> Let's convert back the names:
>  - CLOCKSOURCE_OF_DECLARE_RET => CLOCKSOURCE_OF_DECLARE
>  - clksrc-of-ret              => clksrc-of
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
> ---
>  drivers/clocksource/sun4i_timer.c         |  2 +-
>  drivers/clocksource/timer-sun5i.c         |  4 ++--

Acked-by: Chen-Yu Tsai <wens at csie.org>
