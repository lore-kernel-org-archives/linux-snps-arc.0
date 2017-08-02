From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 2 Aug 2017 21:20:11 +0000
Subject: [PULL] Please pull ARCPGU changes
In-Reply-To: <1501499465.6216.4.camel@synopsys.com>
References: <1501499465.6216.4.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1501708811.2864.4.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Dave,

Could you please pull a couple of minor fixes and improvements for ARCPGU.
These changes are based on today's drm-next branch.

The following changes since commit dd24df657075fdf1e850612ea50634816f3c3581:

? Merge branch 'drm-next-4.14' of git://people.freedesktop.org/~agd5f/linux into drm-next (2017-08-02 12:43:12 +1000)

are available in the git repository at:

? https://github.com/foss-for-synopsys-dwc-arc-processors/linux topic-arcpgu-updates

for you to fetch changes up to 22d0be2a557e53a22feb484e8fce255fe09e6ad5:

? drm: arcpgu: Allow some clock deviation in crtc->mode_valid() callback (2017-08-03 00:11:02 +0300)

----------------------------------------------------------------
Alexey Brodkin (2):
??????drm/arcpgu: Opt in debugfs
??????arcpgu: Simplify driver name

Jose Abreu (3):
??????drm: arcpgu: Fix mmap() callback
??????drm: arcpgu: Fix module unload
??????drm: arcpgu: Allow some clock deviation in crtc->mode_valid() callback

?drivers/gpu/drm/arc/arcpgu_crtc.c |??7 ++++---
?drivers/gpu/drm/arc/arcpgu_drv.c??| 57 ++++++++++++++++++++++++++++++++-------------------------
?2 files changed, 36 insertions(+), 28 deletions(-)

Regards,
Alexey
