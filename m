From: broonie@kernel.org (Mark Brown)
Date: Thu, 07 Apr 2016 10:57:04 -0700
Subject: Applied "ASoC: dwc: Use fifo depth to program FCR" to the asoc tree
In-Reply-To: <5aa4bcb0eba226af2e78fc530ad7d0429d2c96ca.1460047238.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <E1aoEAy-0001TQ-NW@finisterre>
To: linux-snps-arc@lists.infradead.org

The patch

   ASoC: dwc: Use fifo depth to program FCR

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

>From 3fafd14d9422c46f5c2a142298384dc15dbf88b2 Mon Sep 17 00:00:00 2001
From: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Thu, 7 Apr 2016 17:53:57 +0100
Subject: [PATCH] ASoC: dwc: Use fifo depth to program FCR

This patch makes Designware I2S driver use the fifo
depth value to program the fifo configuration register
instead of using hardcoded values.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
Signed-off-by: Mark Brown <broonie at kernel.org>
---
 sound/soc/dwc/designware_i2s.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/dwc/designware_i2s.c b/sound/soc/dwc/designware_i2s.c
index 3effcd1a7df8..0db69b7e9617 100644
--- a/sound/soc/dwc/designware_i2s.c
+++ b/sound/soc/dwc/designware_i2s.c
@@ -100,6 +100,7 @@ struct dw_i2s_dev {
 	struct device *dev;
 	u32 ccr;
 	u32 xfer_resolution;
+	u32 fifo_th;
 
 	/* data related to DMA transfers b/w i2s and DMAC */
 	union dw_i2s_snd_dma_data play_dma_data;
@@ -232,14 +233,16 @@ static void dw_i2s_config(struct dw_i2s_dev *dev, int stream)
 		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			i2s_write_reg(dev->i2s_base, TCR(ch_reg),
 				      dev->xfer_resolution);
-			i2s_write_reg(dev->i2s_base, TFCR(ch_reg), 0x02);
+			i2s_write_reg(dev->i2s_base, TFCR(ch_reg),
+				      dev->fifo_th - 1);
 			irq = i2s_read_reg(dev->i2s_base, IMR(ch_reg));
 			i2s_write_reg(dev->i2s_base, IMR(ch_reg), irq & ~0x30);
 			i2s_write_reg(dev->i2s_base, TER(ch_reg), 1);
 		} else {
 			i2s_write_reg(dev->i2s_base, RCR(ch_reg),
 				      dev->xfer_resolution);
-			i2s_write_reg(dev->i2s_base, RFCR(ch_reg), 0x07);
+			i2s_write_reg(dev->i2s_base, RFCR(ch_reg),
+				      dev->fifo_th - 1);
 			irq = i2s_read_reg(dev->i2s_base, IMR(ch_reg));
 			i2s_write_reg(dev->i2s_base, IMR(ch_reg), irq & ~0x03);
 			i2s_write_reg(dev->i2s_base, RER(ch_reg), 1);
@@ -499,6 +502,7 @@ static int dw_configure_dai(struct dw_i2s_dev *dev,
 	 */
 	u32 comp1 = i2s_read_reg(dev->i2s_base, dev->i2s_reg_comp1);
 	u32 comp2 = i2s_read_reg(dev->i2s_base, dev->i2s_reg_comp2);
+	u32 fifo_depth = 1 << (1 + COMP1_FIFO_DEPTH_GLOBAL(comp1));
 	u32 idx;
 
 	if (dev->capability & DWC_I2S_RECORD &&
@@ -537,6 +541,7 @@ static int dw_configure_dai(struct dw_i2s_dev *dev,
 		dev->capability |= DW_I2S_SLAVE;
 	}
 
+	dev->fifo_th = fifo_depth / 2;
 	return 0;
 }
 
-- 
2.8.0.rc3
