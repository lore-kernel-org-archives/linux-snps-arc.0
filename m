From: p.zabel@pengutronix.de (Philipp Zabel)
Date: Mon, 11 Sep 2017 12:28:17 +0200
Subject: [PATCH] ARC: reset: remove the misleading v1 suffix all over
In-Reply-To: <1504202767-17361-1-git-send-email-vgupta@synopsys.com>
References: <1504202767-17361-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1505125697.26622.22.camel@pengutronix.de>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

[added Eugeniy to Cc]

On Thu, 2017-08-31@11:06 -0700, Vineet Gupta wrote:
> There is no plan yet to do a v2 board. And even if we were to do it
> only some IPs would actually change, so it be best to add suffixes at
> that point, not now !
> 
> Cc: Philipp Zabel <p.zabel at pengutronix.de>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
> P.S. Philip, if you and Eugeniy are OK, can this be please squashed
> with his original patch since it has not yet been merged etc.

This had been merged into arm-soc already, and by now is merged into
mainline. We could try to queue this as a fix for 4.14.

[...]
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -34,11 +34,11 @@ config RESET_BERLIN
> ?	help
> ?	??This enables the reset controller driver for Marvell Berlin
> SoCs.
> ?
> -config RESET_HSDK_V1
> -	bool "HSDK v1 Reset Driver"
> +config RESET_SNPS_HSDK

I suggest to drop the _SNPS part, we don't do it for the other drivers
either, and so far I'm not afraid of conflicts with other reset
controllers that may be called HSDK.

regards
Philipp
