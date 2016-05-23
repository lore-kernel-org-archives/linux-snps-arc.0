From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 23 May 2016 10:31:41 +0000
Subject: [GIT PULL] drm/arcpgu: use dedicated memory area for frame buffer
In-Reply-To: <1463386919.3008.18.camel@synopsys.com>
References: <1461684480.2955.31.camel@synopsys.com>
 <1461929790.3020.8.camel@synopsys.com>
 <1462873872.3135.0.camel@synopsys.com>
 <1463386919.3008.18.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1463999470.3116.5.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Dave,

On Mon, 2016-05-16@08:22 +0000, Alexey Brodkin wrote:
> Hi Dave,
> 
> On Tue, 2016-05-10@09:51 +0000, Alexey Brodkin wrote:
> > 
> > Hi Dave,
> > 
> > On Fri, 2016-04-29@11:36 +0000, Alexey Brodkin wrote:
> > > 
> > > 
> > > Hi Dave,
> > > 
> > > Please pull this mini-series that allows ARC PGU to use
> > > dedicated memory location as framebuffer backing storage.
> > > 
> > > v2 of that series was reviewed here
> > > https://lists.freedesktop.org/archives/dri-devel/2016-April/106279.html
> > > 
> > > It is based on top of today's drm-next branch.
> > > 
> > > Best regards,
> > > Alexey
> > > 
> > > The following changes since commit b89359bdf0f1e95a4c5f92300594ba9dde323fc4:
> > > 
> > > ? Merge branch 'for-next' of http://git.agner.ch/git/linux-drm-fsl-dcu into drm-next (2016-04-29 14:57:51 +1000)
> > > 
> > > are available in the git repository at:
> > > 
> > > ? https://github.com/foss-for-synopsys-dwc-arc-processors/linux.git topic-arcpgu-updates
> > > 
> > > for you to fetch changes up to cb2ad5e5339c5122166265cea579cc6a356d46de:
> > > 
> > > ? ARC: [axs10x] Specify reserved memory for frame buffer (2016-04-29 14:34:13 +0300)
> > > 
> > > ----------------------------------------------------------------
> > > Alexey Brodkin (2):
> > > ??????drm/arcpgu: use dedicated memory area for frame buffer
> > > ??????ARC: [axs10x] Specify reserved memory for frame buffer
> > > 
> > > ?arch/arc/boot/dts/axc001.dtsi?????| 22 ++++++++++++++++++++--
> > > ?arch/arc/boot/dts/axc003.dtsi?????| 14 ++++++++++++++
> > > ?arch/arc/boot/dts/axc003_idu.dtsi | 14 ++++++++++++++
> > > ?arch/arc/boot/dts/axs10x_mb.dtsi??|??2 +-
> > > ?drivers/gpu/drm/arc/arcpgu_drv.c??|??6 ++++++
> > > ?5 files changed, 55 insertions(+), 3 deletions(-)
> > Could you please take a look at this pull request?
> Another polite reminder.

Could you please pull this one?
Indeed it was created quite some time ago so if required I may
rebase it on top of whatever current you'd like.

Alternatively you may just apply the first patch from the series
(could be found here?https://lists.freedesktop.org/archives/dri-devel/2016-April/106280.html)
and the second patch will be picked up by ARC maintainer (Vineet Gupta).

-Alexey
