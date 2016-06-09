From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Thu,  9 Jun 2016 12:47:04 +0100
Subject: [PATCH 0/2 v9] Add I2S audio support for ARC AXS10x boards
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cover.1465472500.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC AXS10x platforms consist of a mainboard with several peripherals.
One of those peripherals is an HDMI output port controlled by the ADV7511
transmitter.

This patch set adds I2S audio for the AXS10x platform.

NOTE:
Although the mainline I2S driver uses ALSA DMA engine, this controller
can be built without DMA support so it was necessary to add this
custom platform driver so that HDMI audio works in AXS boards.

Changes v8 -> v9:
* Use defines in IRQ handling

Changes v7 -> v8:
* Build PIO PCM as module
* Always unmask interrupts even when in DMA mode
* Fallback to PIO mode only if ALSA DMA engine probe fails

Changes v6 -> v7:
* Discard the use of memcpy
* Report IRQ_HANDLED only when there is an IRQ
* Use interrupts to check if PIO mode is in use
* Unmask interrupts only when in PIO mode
* Remove empty functions

Changes v5 -> v6:
* Use SNDRV_DMA_TYPE_CONTINUOUS

Changes v4 -> v5:
* Resolve undefined references when compiling as module
* Dropped adv7511 audio patches
* Use DMA properties in I2S to check which mode to use: PIO or DMA (as suggested by Lars-Peter Clausen)

Changes v3 -> v4:
* Reintroduced custom PCM driver (see note below)
* Use DT boolean to switch between ALSA DMA engine PCM or custom PCM
* Use fifo depth to program I2S FCR
* Update I2S documentation

Changes v2 -> v3:
* Removed pll_config functions (as suggested by Alexey Brodkin)
* Removed HDMI start at adv7511_core (as suggested by Archit Taneja)
* Use NOP functions for adv7511_audio (as suggested by Archit Taneja)
* Added adv7511_audio_exit() function (as suggested by Archit Taneja)
* Moved adv7511 to its own folder (as suggested by Archit Taneja)
* Separated file rename of adv7511_core (as suggested by Emil Velikov)
* Compile adv7511 as module if ALSA SoC is compiled as module
* Load adv7511 audio only if declared in device tree (as suggested by Laurent Pinchart)
* Dropped custom platform driver, using now ALSA DMA engine
* Dropped IRQ handler for I2S

Changes v1 -> v2:
* DT bindings moved to separate patch (as suggested by Alexey Brodkin)
* Removed defconfigs entries (as suggested by Alexey Brodkin)


Cc: Carlos Palminha <palminha at synopsys.com>
Cc: Mark Brown <broonie at kernel.org>
Cc: Liam Girdwood <lgirdwood at gmail.com>
Cc: Jaroslav Kysela <perex at perex.cz>
Cc: Takashi Iwai <tiwai at suse.com>
Cc: Rob Herring <robh at kernel.org>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Cc: alsa-devel at alsa-project.org
Cc: linux-kernel at vger.kernel.org

Jose Abreu (2):
  ASoC: dwc: Add PIO PCM extension
  ASoC: dwc: Add irq parameter to DOCUMENTATION

 .../devicetree/bindings/sound/designware-i2s.txt   |   4 +
 sound/soc/dwc/Kconfig                              |   9 +
 sound/soc/dwc/Makefile                             |   1 +
 sound/soc/dwc/designware_i2s.c                     | 161 +++++++--------
 sound/soc/dwc/designware_pcm.c                     | 225 +++++++++++++++++++++
 sound/soc/dwc/local.h                              | 128 ++++++++++++
 6 files changed, 440 insertions(+), 88 deletions(-)
 create mode 100644 sound/soc/dwc/designware_pcm.c
 create mode 100644 sound/soc/dwc/local.h

-- 
1.9.1
