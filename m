From: broonie@kernel.org (Mark Brown)
Date: Mon, 23 May 2016 17:57:13 +0100
Subject: [PATCH 2/4 v7] ASoC: dwc: Do not use devm_clk_get() if using
 platform data
In-Reply-To: <d288d87fc0f1c07f4d301dc08d32b1bf9915446c.1463996627.git.joabreu@synopsys.com>
References: <cover.1463996627.git.joabreu@synopsys.com>
 <d288d87fc0f1c07f4d301dc08d32b1bf9915446c.1463996627.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160523165713.GX8206@sirena.org.uk>
To: linux-snps-arc@lists.infradead.org

On Mon, May 23, 2016@11:02:23AM +0100, Jose Abreu wrote:

> When using platform data the devm_clk_get() function is
> called causing a probe failure if the clock is not
> declared. As we can pass the clock handler by platform
> data call only devm_clk_get() when platform data is not
> used.

No, this is broken - if the device needs a clock the device needs a
clock and clock names should be static rather than passed in via
platform data (indeed NULL is a perfectly valid clock name).  The system
integation should map in a clock as needed, if it's just a fixed crystal
or something then just register a fixed clock and connect it up.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160523/102cc97a/attachment.sig>
