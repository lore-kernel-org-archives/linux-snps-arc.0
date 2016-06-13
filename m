From: broonie@kernel.org (Mark Brown)
Date: Mon, 13 Jun 2016 17:54:37 +0100
Subject: Applied "ASoC: dwc: Add irq parameter to DOCUMENTATION" to the asoc
 tree
In-Reply-To: <49fab21a9c10576cb0c5d6a2bb0e19c7bcfb732f.1463996627.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <E1bCV8H-0004aa-If@finisterre>
To: linux-snps-arc@lists.infradead.org

The patch

   ASoC: dwc: Add irq parameter to DOCUMENTATION

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 5aa1418defb0e88fb7f70c5b112d531cfcede851 Mon Sep 17 00:00:00 2001
From: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Thu, 9 Jun 2016 12:47:06 +0100
Subject: [PATCH] ASoC: dwc: Add irq parameter to DOCUMENTATION

A parameter description for the interruptions of the
I2S controller was added.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
Acked-by: Rob Herring <robh at kernel.org>
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
Signed-off-by: Mark Brown <broonie at kernel.org>
---
 Documentation/devicetree/bindings/sound/designware-i2s.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/designware-i2s.txt b/Documentation/devicetree/bindings/sound/designware-i2s.txt
index 7bb54247f8e8..6a536d570e29 100644
--- a/Documentation/devicetree/bindings/sound/designware-i2s.txt
+++ b/Documentation/devicetree/bindings/sound/designware-i2s.txt
@@ -12,6 +12,10 @@ Required properties:
    one for receive.
  - dma-names : "tx" for the transmit channel, "rx" for the receive channel.
 
+Optional properties:
+ - interrupts: The interrupt line number for the I2S controller. Add this
+   parameter if the I2S controller that you are using does not support DMA.
+
 For more details on the 'dma', 'dma-names', 'clock' and 'clock-names'
 properties please check:
 	* resource-names.txt
-- 
2.8.1
