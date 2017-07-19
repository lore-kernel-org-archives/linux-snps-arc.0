From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 19 Jul 2017 15:32:22 +0000
Subject: [PATCH] ARC: reset: introduce HSDKv1 reset driver
In-Reply-To: <1500476858.2364.45.camel@pengutronix.de>
References: <20170718172520.25546-1-Eugeniy.Paltsev@synopsys.com>
 <1500476858.2364.45.camel@pengutronix.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1500478342.9320.28.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Philipp,

On Wed, 2017-07-19@17:07 +0200, Philipp Zabel wrote:
> On Tue, 2017-07-18@20:25 +0300, Eugeniy Paltsev wrote:
> > The HSDK v1 periphery IPs can be reset by accessing some registers
> > from the CGU block.
> > 
> > The list of available reset lines is documented in the DT bindings.
> > 
> > [snip]
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -34,6 +34,12 @@ config RESET_BERLIN
> > ?	help
> > ?	??This enables the reset controller driver for Marvell
> > Berlin SoCs.
> > ?
> > +config RESET_HSDK_V1
> > +	bool "HSDK v1 Reset Driver"
> > +	default n
> 
> I suppose there will be a SOC_HSDK_V1 or similar in the future so
> that
> we can hide this option and enable it by default like the other reset
> drivers?
Actually we don't have (and don't planning to add) such SOC/board-
specific kconfig option, so I am wondering if it is OK to just left
this option not hidden?

> > [snip]
> > +
> > +#define CGU_ARC_RST_CTRL		0x0
> > +#define CGU_SYS_RST_CTRL		0x20
> > +#define CGU_DDR_RST_CTRL		0x40
> > +#define CGU_TUN_RST_CTRL		0x60
> 
> The ARC, DDR, and TUN reset control registers are never used.
Ok, I'll remove unused register defines.

> > [snip]
> 
> regards
> Philipp
> 
Thanks.
-- 
?Eugeniy Paltsev
