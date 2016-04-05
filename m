From: broonie@kernel.org (Mark Brown)
Date: Tue, 5 Apr 2016 11:56:58 -0700
Subject: [PATCH 3/3 v3] ASoC: dwc: Unmask I2S interrupts only for enabled
 channels
In-Reply-To: <409b73fe04f1bd5155a8e6be701370a4594edc52.1459875048.git.joabreu@synopsys.com>
References: <cover.1459875048.git.joabreu@synopsys.com>
 <409b73fe04f1bd5155a8e6be701370a4594edc52.1459875048.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160405185658.GJ1924@sirena.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, Apr 05, 2016@06:08:02PM +0100, Jose Abreu wrote:
> There is no need to unmask all interrupts at I2S start. This
> can cause performance issues in slower platforms.
> 
> Unmask only the interrupts for the used channels.

This appears to be completely unrelated to the other two patches in the
series.  Please don't mix unrelated changes in a single series, it
creates interdependencies that don't really exist - if you've got a
separate change or set of changes send them separately.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160405/db45e7c7/attachment.sig>
