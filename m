From: broonie@kernel.org (Mark Brown)
Date: Thu, 7 Apr 2016 10:53:26 -0700
Subject: [PATCH 5/5 v4] ASoC: dwc: Update DOCUMENTATION for I2S Driver
In-Reply-To: <ce97e6bb7ddb71e532c4066334ceead4d4d3e692.1460047238.git.joabreu@synopsys.com>
References: <cover.1460047238.git.joabreu@synopsys.com>
 <ce97e6bb7ddb71e532c4066334ceead4d4d3e692.1460047238.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160407175326.GX1924@sirena.org.uk>
To: linux-snps-arc@lists.infradead.org

On Thu, Apr 07, 2016@05:53:59PM +0100, Jose Abreu wrote:

> + Optional properties:
> + - snps,use-dmaengine: If set the driver will use ALSA DMA engine. If set
> +   it is required to use the properties 'dmas' and 'dma-names'.

This is not a good interface, it's describing Linux internal APIs.  If
the device needs to operate in PIO mode it should just do that.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160407/566c90a6/attachment-0001.sig>
