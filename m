From: broonie@kernel.org (Mark Brown)
Date: Tue, 29 Mar 2016 11:22:22 -0700
Subject: [PATCH 2/3 v2] ASoC: dwc: Add I2S HDMI audio support
In-Reply-To: <56FAC355.1040705@synopsys.com>
References: <cover.1459174494.git.joabreu@synopsys.com>
 <538be366488bf0d7633d702f2d0bab16707b7a47.1459174494.git.joabreu@synopsys.com>
 <20160329173158.GB2350@sirena.org.uk>
 <56FAC355.1040705@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160329182222.GC2350@sirena.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, Mar 29, 2016@07:03:01PM +0100, Jose Abreu wrote:

> The major part of this patch is the adding of an ALSA platform driver so that
> audio comes out of the box in AXS boards but we also added functionalities to
> the i2s driver and performed one bug fix related with the mask/unmask of
> interrupts. I will split the patches but they will depend on each other.

If you want to add a new platform driver you need to add a new platform
driver, not shove the code into an existing driver for a seperate IP.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160329/020e90b1/attachment-0001.sig>
