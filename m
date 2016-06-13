From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 13 Jun 2016 15:50:04 +0000
Subject: [GIT PULL] drm/arcpgu: Make ARC PGU usable on sim platforms
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1465832954.4130.41.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Dave,

Please pull this mini-series that allows ARC PGU to be used on simulation
platforms like nSIM OSCI (AKA Linux Virtual Platform) or ARC VDK.

The series was published for review here
https://lists.freedesktop.org/archives/dri-devel/2016-June/110647.html

It is based on today's "drm-next" branch.

Best regards,
Alexey

The following changes since commit 3c85f20a289d044f303f473ee6ab7502303fc3b0:

? Merge tag 'omapdrm-4.8' of git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux into drm-next (2016-06-09
12:20:11 +1000)

are available in the git repository at:

? https://github.com/foss-for-synopsys-dwc-arc-processors/linux.git topic-arcpgu-sim

for you to fetch changes up to 830c6578481e3b8649261062dfc5b0ac3c9374f8:

? ARC: [nsimosci] Enable ARC PGU on nSIM OSCI virtual platforms (2016-06-13 17:45:18 +0200)

----------------------------------------------------------------
Alexey Brodkin (2):
??????ARCv2: [vdk] Enable ARC PGU on HS38 VDK
??????ARC: [nsimosci] Enable ARC PGU on nSIM OSCI virtual platforms

Ruud Derwig (1):
??????drm/arcpgu: Make ARC PGU usable on simulation platforms

?arch/arc/boot/dts/nsimosci.dts?????????????|??14 +++++++++++---
?arch/arc/boot/dts/nsimosci_hs.dts??????????|??14 +++++++++++---
?arch/arc/boot/dts/nsimosci_hs_idu.dts??????|??14 +++++++++++---
?arch/arc/boot/dts/vdk_axs10x_mb.dtsi???????|??13 +++++++++----
?arch/arc/boot/dts/vdk_hs38_smp.dts?????????|???2 +-
?arch/arc/configs/nsimosci_defconfig????????|???3 ++-
?arch/arc/configs/nsimosci_hs_defconfig?????|???3 ++-
?arch/arc/configs/nsimosci_hs_smp_defconfig |???3 ++-
?arch/arc/configs/vdk_hs38_smp_defconfig????|???7 ++-----
?drivers/gpu/drm/arc/Makefile???????????????|???2 +-
?drivers/gpu/drm/arc/arcpgu.h???????????????|???1 +
?drivers/gpu/drm/arc/arcpgu_drv.c???????????|??15 ++++++++-------
?drivers/gpu/drm/arc/arcpgu_sim.c???????????| 128
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++
?13 files changed, 189 insertions(+), 30 deletions(-)
?create mode 100644 drivers/gpu/drm/arc/arcpgu_sim.c
