From: carlo@caione.org (Carlo Caione)
Date: Fri, 24 Jun 2016 22:12:52 +0200
Subject: [PATCH V2 63/63] clocksources: Switch back to the clksrc table
In-Reply-To: <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
References: <1466112442-31105-1-git-send-email-daniel.lezcano@linaro.org>
 <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160624201252.GA2382@localhost>
To: linux-snps-arc@lists.infradead.org

On 16/06/16 23:27, Daniel Lezcano wrote:
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
>  drivers/clocksource/meson6_timer.c        |  2 +-

Acked-by: Carlo Caione <carlo at caione.org>
