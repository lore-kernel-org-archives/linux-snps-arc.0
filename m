From: broonie@kernel.org (Mark Brown)
Date: Tue, 29 Mar 2016 10:31:58 -0700
Subject: [PATCH 2/3 v2] ASoC: dwc: Add I2S HDMI audio support
In-Reply-To: <538be366488bf0d7633d702f2d0bab16707b7a47.1459174494.git.joabreu@synopsys.com>
References: <cover.1459174494.git.joabreu@synopsys.com>
 <538be366488bf0d7633d702f2d0bab16707b7a47.1459174494.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160329173158.GB2350@sirena.org.uk>
To: linux-snps-arc@lists.infradead.org

On Mon, Mar 28, 2016@03:36:10PM +0100, Jose Abreu wrote:
> HDMI audio support was added to the AXS board using an
> I2S cpu driver and a custom platform driver.
> 
> The platform driver supports two channels @ 16 bits with
> rates 32k, 44.1k and 48k. ALSA Simple audio card is used to
> glue the cpu, platform and codec driver (adv7511).

>  sound/soc/dwc/Kconfig          |   1 +
>  sound/soc/dwc/designware_i2s.c | 385 +++++++++++++++++++++++++++++++++++++++--

Your changelog appears to describe the writing of a machine driver but
this is a large patch adding code to an I2S controller driver.  This
means I can't review your patch since I can't tell what it is supposed
to do.  If you've added functionality to this driver you need to send
one or more patches each of which adds a single feature to the driver
together with a changelog which describes what that feature is.

Glancing at the patch I'm not 100% sure that the features you're adding
are part of the Synopsis device but I'm not entirely sure.

>  2 files changed, 373 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/dwc/Kconfig b/sound/soc/dwc/Kconfig
> index d50e085..bc3fae7 100644
> --- a/sound/soc/dwc/Kconfig
> +++ b/sound/soc/dwc/Kconfig
> @@ -2,6 +2,7 @@ config SND_DESIGNWARE_I2S
>  	tristate "Synopsys I2S Device Driver"
>  	depends on CLKDEV_LOOKUP
>  	select SND_SOC_GENERIC_DMAENGINE_PCM
> +	select SND_SIMPLE_CARD

No, this doesn't make sense - the fact that someone has used a Synopsis
I2S controller doesn't mean that they have a system which uses
simple-card.  If the user wants to use simple-card they need to enable
it separately, this is the same pattern we follow for all CPU controller
drivers.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160329/4f161eee/attachment.sig>
