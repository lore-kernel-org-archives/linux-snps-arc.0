From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Mon, 28 Mar 2016 15:36:08 +0100
Subject: [PATCH 0/3 v2] Add I2S/ADV7511 audio support for ARC AXS10x boards
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cover.1459174494.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC AXS10x platforms consist of a mainboard with several peripherals.
One of those peripherals is an HDMI output port controlled by the ADV7511
transmitter.

This patch set adds audio for the ADV7511 transmitter and I2S audio for
the AXS10x platform.

Changes v1 -> v2:
* DT bindings moved to separate patch (as suggested by Alexey Brodkin)
* Removed defconfigs entries (as suggested by Alexey Brodkin)

Jose Abreu (3):
  drm/i2c/adv7511: Add audio support
  ASoC: dwc: Add I2S HDMI audio support
  arc: axs10x: Add support for Designware I2S on DT

 arch/arc/boot/dts/axs10x_mb.dtsi    |   49 +-
 drivers/gpu/drm/i2c/Kconfig         |   11 +
 drivers/gpu/drm/i2c/Makefile        |    2 +
 drivers/gpu/drm/i2c/adv7511.c       | 1024 -----------------------------------
 drivers/gpu/drm/i2c/adv7511.h       |   41 ++
 drivers/gpu/drm/i2c/adv7511_audio.c |  310 +++++++++++
 drivers/gpu/drm/i2c/adv7511_core.c  | 1005 ++++++++++++++++++++++++++++++++++
 include/sound/soc-dai.h             |    1 +
 sound/soc/dwc/Kconfig               |    1 +
 sound/soc/dwc/designware_i2s.c      |  385 ++++++++++++-
 10 files changed, 1788 insertions(+), 1041 deletions(-)
 delete mode 100644 drivers/gpu/drm/i2c/adv7511.c
 create mode 100644 drivers/gpu/drm/i2c/adv7511_audio.c
 create mode 100644 drivers/gpu/drm/i2c/adv7511_core.c

-- 
1.9.1
