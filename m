From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 26 Nov 2015 15:08:45 +0000
Subject: [PATCH] ARC SDP AXS101 support for HDMI ADV7511 DRM I2C driver.
In-Reply-To: <1448546022-16024-1-git-send-email-palminha@synopsys.com>
References: <1448546022-16024-1-git-send-email-palminha@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1448550525.4631.50.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Carlos,

On Thu, 2015-11-26@13:53 +0000, Carlos Palminha wrote:
> Device tree and config support for ADV7511 in ARC SDP AXS101.
> Supporting ADV7511 HDMI I2C DRM  will allow the development of a DRM ARC PGU driver.

Unfortunately there's no DRM ARC PGU driver at the moment.
We still only have ARC PGU driver as a part of off-the-tree arc-3.18 branch,
see https://github.com/foss-for-synopsys-dwc-arc-processors/linux/blob/arc-3.18/drivers/video/fbdev/arcpgu.c

And without PGU driver that ADI I2C is useless because this interface is
only used in HDMI for control data exchange like display mode setting etc.

Once we upstream ARC PGU driver (we plan to do it in 4.6/4.7 timeframe)
that change will make perfect sense.

So for now we won't accept that patch.

Still if you want to help us with ARC PGU upstreaming please feel free to
use mentioned implementation as a reference and create your clean
implementation basing on linux-next. If you're going to do that please let
me know so we don't do the same work twice.

-Alexey
