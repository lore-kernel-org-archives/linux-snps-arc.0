From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon,  6 Jun 2016 13:56:22 +0300
Subject: [PATCH 0/3] Make ARC PGU usable on sim platforms
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1465210585-13284-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Initially ARC PGU required real encoder/trnasmitter to exist.
That was fine for real HW such as ARC SDP boards.

But on some simulaiton platroms like ARC VDK or nSIM OSCI we have model
of the same ARC PGU and ability to output video data in a virtual LCD.

To make ARC PGU driver usable in those virtual platforms we need to istantiate
virtual encoder instead of a real one. And that all is done in the first patch
of the series.

Subsequent patches just update configs of both VDK and nSIM OSCI boards
with enabling ARC PGU driver and adding required fixups in their DT
descriptions.

Alexey Brodkin (2):
  ARCv2: [vdk] Enable ARC PGU on HS38 VDK
  ARC: [nsimosci] Enable ARC PGU on nSIM OSCI virtual platforms

Ruud Derwig (1):
  drm/arcpgu: Make ARC PGU usable on simulation platforms

 arch/arc/boot/dts/nsimosci.dts             |  14 ++-
 arch/arc/boot/dts/nsimosci_hs.dts          |  14 ++-
 arch/arc/boot/dts/nsimosci_hs_idu.dts      |  14 ++-
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi       |  13 ++-
 arch/arc/boot/dts/vdk_hs38_smp.dts         |   2 +-
 arch/arc/configs/nsimosci_defconfig        |   3 +-
 arch/arc/configs/nsimosci_hs_defconfig     |   3 +-
 arch/arc/configs/nsimosci_hs_smp_defconfig |   3 +-
 arch/arc/configs/vdk_hs38_smp_defconfig    |   7 +-
 drivers/gpu/drm/arc/Makefile               |   2 +-
 drivers/gpu/drm/arc/arcpgu.h               |   1 +
 drivers/gpu/drm/arc/arcpgu_drv.c           |  15 +--
 drivers/gpu/drm/arc/arcpgu_sim.c           | 177 +++++++++++++++++++++++++++++
 13 files changed, 238 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/drm/arc/arcpgu_sim.c

-- 
2.5.5
