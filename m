From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 19 Feb 2016 16:03:50 +0300
Subject: [PATCH 0/4] drm: Add support of ARC PGU display controller
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1455887034-7739-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This series add support of ARC PGU display controller.
ARC PGU is a quite simple byte streamer that gets data from the framebuffer
and pushes it to hte connected encoder (DP or HDMI).

It was tested on ARC SDP boards (axs101 in particular).

Alexey Brodkin (4):
  drm: Add support of ARC PGU display controller
  drm: Add DT bindings documentation for ARC PGU display controller
  arc: axs10x - add support of ARC PGU
  MAINTAINERS: Add maintainer for ARC PGU display controller

 .../devicetree/bindings/display/snps,arcpgu.txt    |  74 ++++++
 MAINTAINERS                                        |   6 +
 arch/arc/boot/dts/axs10x_mb.dtsi                   |  54 ++++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/arc/Kconfig                        |  10 +
 drivers/gpu/drm/arc/Makefile                       |   2 +
 drivers/gpu/drm/arc/arcpgu.h                       |  47 ++++
 drivers/gpu/drm/arc/arcpgu_crtc.c                  | 274 +++++++++++++++++++++
 drivers/gpu/drm/arc/arcpgu_drv.c                   | 239 ++++++++++++++++++
 drivers/gpu/drm/arc/arcpgu_hdmi.c                  | 204 +++++++++++++++
 drivers/gpu/drm/arc/arcpgu_regs.h                  |  36 +++
 12 files changed, 949 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
 create mode 100644 drivers/gpu/drm/arc/Kconfig
 create mode 100644 drivers/gpu/drm/arc/Makefile
 create mode 100644 drivers/gpu/drm/arc/arcpgu.h
 create mode 100644 drivers/gpu/drm/arc/arcpgu_crtc.c
 create mode 100644 drivers/gpu/drm/arc/arcpgu_drv.c
 create mode 100644 drivers/gpu/drm/arc/arcpgu_hdmi.c
 create mode 100644 drivers/gpu/drm/arc/arcpgu_regs.h

-- 
2.5.0
