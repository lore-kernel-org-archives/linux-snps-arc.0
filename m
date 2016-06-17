From: santosh.shilimkar@oracle.com (Santosh Shilimkar)
Date: Fri, 17 Jun 2016 09:04:47 -0700
Subject: [PATCH V2 63/63] clocksources: Switch back to the clksrc table
In-Reply-To: <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
References: <1466112442-31105-1-git-send-email-daniel.lezcano@linaro.org>
 <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <afeed273-b0b9-eef6-5e9b-78f069ebe743@oracle.com>
To: linux-snps-arc@lists.infradead.org

On 6/16/2016 2:27 PM, Daniel Lezcano wrote:
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

>  drivers/clocksource/timer-keystone.c      |  2 +-

Acked-by: Santosh Shilimkar <ssantosh at kernel.org>
