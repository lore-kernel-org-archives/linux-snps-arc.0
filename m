From: alexey.brodkin@gmail.com (=?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JHRgNC+0LTQutC40L0=?=)
Date: Fri, 11 Nov 2016 04:52:40 +0300
Subject: [GIT PULL] drm/arcpgu: Accommodate adv7511 switch to DRM bridge
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAML3pwWo0ZFVRNb+JQhpqbDHLpBMj_H-qsLGtDLe_SmfFtOc+w@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi Dave,

Please pull that change for ARC PGU that fixes driver instantiation on
AXS 10x boards.
The patch was published for review here:
https://lists.freedesktop.org/archives/dri-devel/2016-October/121245.html

It is based on today's "drm-next" branch.

Probably it's already too late for 4.9 but if there's a chance to
squeeze it there it will
be super nice because it's a fix for inevitable driver crash right on start.

Best regards,
Alexey

The following changes since commit fa860a1751e388385a7f249dd3f24a6c76db0ba9:

  drm: Print device information again in debugfs (2016-10-17 16:20:53 +1000)

are available in the git repository at:

  https://github.com/foss-for-synopsys-dwc-arc-processors/linux.git
topic-arcpgu-fixes

for you to fetch changes up to 7bc61cc5df808008b77a3b72cf814960c675518b:

  drm/arcpgu: Accommodate adv7511 switch to DRM bridge (2016-11-11
04:31:35 +0300)

----------------------------------------------------------------
Eugeniy Paltsev (1):
      drm/arcpgu: Accommodate adv7511 switch to DRM bridge

 drivers/gpu/drm/arc/arcpgu_hdmi.c | 159
+++++++++-------------------------------------------------------------------
 1 file changed, 17 insertions(+), 142 deletions(-)
