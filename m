From: CARLOS.PALMINHA@synopsys.com (Carlos Palminha)
Date: Fri, 19 Feb 2016 09:39:11 +0000
Subject: [PATCH 0/4] Add I2S/ADV7511 audio support for ARC AXS10x boards.
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cover.1455872448.git.palminha@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC AXS10x platforms consist of a mainboard with several peripherals.
One of those peripherals is an HDMI output port controlled by ADV7511 transmitter.

This patch set adds audio for the ADV7511 transmitter and I2S audio for the 
AXS10x platform.
 
Jose Abreu (4):
  drm/i2c/adv7511: Add audio support
  ARC: axs10x: Update defconfigs so that audio is enabled
  ASoC: dwc: Add I2S HDMI audio support using custom platform
  ARC: axs10x: Update defconfigs so that I2S is enabled

 arch/arc/boot/dts/axs10x_mb.dtsi      |   20 +-
 arch/arc/configs/axs101_defconfig     |    4 +
 arch/arc/configs/axs103_defconfig     |    6 +
 arch/arc/configs/axs103_smp_defconfig |    6 +
 drivers/gpu/drm/i2c/Kconfig           |    8 +
 drivers/gpu/drm/i2c/Makefile          |    2 +
 drivers/gpu/drm/i2c/adv7511.c         | 1024 ---------------------------------
 drivers/gpu/drm/i2c/adv7511.h         |   41 ++
 drivers/gpu/drm/i2c/adv7511_audio.c   |  310 ++++++++++
 drivers/gpu/drm/i2c/adv7511_core.c    | 1005 ++++++++++++++++++++++++++++++++
 include/sound/soc-dai.h               |    1 +
 sound/soc/dwc/Kconfig                 |    1 +
 sound/soc/dwc/Makefile                |    4 +-
 sound/soc/dwc/designware_i2s.c        |  139 ++++-
 sound/soc/dwc/designware_pcm.c        |  264 +++++++++
 sound/soc/dwc/designware_pcm.h        |   21 +
 16 files changed, 1813 insertions(+), 1043 deletions(-)
 delete mode 100644 drivers/gpu/drm/i2c/adv7511.c
 create mode 100644 drivers/gpu/drm/i2c/adv7511_audio.c
 create mode 100644 drivers/gpu/drm/i2c/adv7511_core.c
 create mode 100644 sound/soc/dwc/designware_pcm.c
 create mode 100644 sound/soc/dwc/designware_pcm.h

-- 
2.5.0
