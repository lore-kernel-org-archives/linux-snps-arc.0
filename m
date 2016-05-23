From: broonie@kernel.org (Mark Brown)
Date: Mon, 23 May 2016 18:50:17 +0100
Subject: Applied "ASoC: dwc: Add helper functions to disable/enable irqs" to
 the asoc tree
In-Reply-To: <fb4a046bc20f0e0839082527b39e7737de128367.1463996627.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <E1b4tzd-0006ZX-EN@debutante>
To: linux-snps-arc@lists.infradead.org

The patch

   ASoC: dwc: Add helper functions to disable/enable irqs

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

>From df4e7be1832a1ca9fccfb2ed8771a17da6f7fa57 Mon Sep 17 00:00:00 2001
From: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Mon, 23 May 2016 11:02:22 +0100
Subject: [PATCH] ASoC: dwc: Add helper functions to disable/enable irqs

Helper functions to disable and enable the I2S interrupts were
added. Only the interrupts of the used channels are enabled.

Also, there is no need to enable irqs at dw_i2s_config(), they
are already enabled at startup.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
Cc: Carlos Palminha <palminha at synopsys.com>
Cc: Mark Brown <broonie at kernel.org>
Cc: Liam Girdwood <lgirdwood at gmail.com>
Cc: Jaroslav Kysela <perex at perex.cz>
Cc: Takashi Iwai <tiwai at suse.com>
Cc: Rob Herring <robh at kernel.org>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Cc: alsa-devel at alsa-project.org
Cc: devicetree at vger.kernel.org
Cc: linux-kernel at vger.kernel.org
Signed-off-by: Mark Brown <broonie at kernel.org>
---
 sound/soc/dwc/designware_i2s.c | 68 +++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/sound/soc/dwc/designware_i2s.c b/sound/soc/dwc/designware_i2s.c
index 0db69b7e9617..4c4f0dc24f10 100644
--- a/sound/soc/dwc/designware_i2s.c
+++ b/sound/soc/dwc/designware_i2s.c
@@ -145,26 +145,54 @@ static inline void i2s_clear_irqs(struct dw_i2s_dev *dev, u32 stream)
 	}
 }
 
-static void i2s_start(struct dw_i2s_dev *dev,
-		      struct snd_pcm_substream *substream)
+static inline void i2s_disable_irqs(struct dw_i2s_dev *dev, u32 stream,
+				    int chan_nr)
 {
-	struct i2s_clk_config_data *config = &dev->config;
 	u32 i, irq;
-	i2s_write_reg(dev->i2s_base, IER, 1);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		for (i = 0; i < (config->chan_nr / 2); i++) {
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		for (i = 0; i < (chan_nr / 2); i++) {
+			irq = i2s_read_reg(dev->i2s_base, IMR(i));
+			i2s_write_reg(dev->i2s_base, IMR(i), irq | 0x30);
+		}
+	} else {
+		for (i = 0; i < (chan_nr / 2); i++) {
+			irq = i2s_read_reg(dev->i2s_base, IMR(i));
+			i2s_write_reg(dev->i2s_base, IMR(i), irq | 0x03);
+		}
+	}
+}
+
+static inline void i2s_enable_irqs(struct dw_i2s_dev *dev, u32 stream,
+				   int chan_nr)
+{
+	u32 i, irq;
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		for (i = 0; i < (chan_nr / 2); i++) {
 			irq = i2s_read_reg(dev->i2s_base, IMR(i));
 			i2s_write_reg(dev->i2s_base, IMR(i), irq & ~0x30);
 		}
-		i2s_write_reg(dev->i2s_base, ITER, 1);
 	} else {
-		for (i = 0; i < (config->chan_nr / 2); i++) {
+		for (i = 0; i < (chan_nr / 2); i++) {
 			irq = i2s_read_reg(dev->i2s_base, IMR(i));
 			i2s_write_reg(dev->i2s_base, IMR(i), irq & ~0x03);
 		}
-		i2s_write_reg(dev->i2s_base, IRER, 1);
 	}
+}
+
+static void i2s_start(struct dw_i2s_dev *dev,
+		      struct snd_pcm_substream *substream)
+{
+	struct i2s_clk_config_data *config = &dev->config;
+
+	i2s_write_reg(dev->i2s_base, IER, 1);
+	i2s_enable_irqs(dev, substream->stream, config->chan_nr);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		i2s_write_reg(dev->i2s_base, ITER, 1);
+	else
+		i2s_write_reg(dev->i2s_base, IRER, 1);
 
 	i2s_write_reg(dev->i2s_base, CER, 1);
 }
@@ -172,24 +200,14 @@ static void i2s_start(struct dw_i2s_dev *dev,
 static void i2s_stop(struct dw_i2s_dev *dev,
 		struct snd_pcm_substream *substream)
 {
-	u32 i = 0, irq;
 
 	i2s_clear_irqs(dev, substream->stream);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		i2s_write_reg(dev->i2s_base, ITER, 0);
-
-		for (i = 0; i < 4; i++) {
-			irq = i2s_read_reg(dev->i2s_base, IMR(i));
-			i2s_write_reg(dev->i2s_base, IMR(i), irq | 0x30);
-		}
-	} else {
+	else
 		i2s_write_reg(dev->i2s_base, IRER, 0);
 
-		for (i = 0; i < 4; i++) {
-			irq = i2s_read_reg(dev->i2s_base, IMR(i));
-			i2s_write_reg(dev->i2s_base, IMR(i), irq | 0x03);
-		}
-	}
+	i2s_disable_irqs(dev, substream->stream, 8);
 
 	if (!dev->active) {
 		i2s_write_reg(dev->i2s_base, CER, 0);
@@ -223,7 +241,7 @@ static int dw_i2s_startup(struct snd_pcm_substream *substream,
 
 static void dw_i2s_config(struct dw_i2s_dev *dev, int stream)
 {
-	u32 ch_reg, irq;
+	u32 ch_reg;
 	struct i2s_clk_config_data *config = &dev->config;
 
 
@@ -235,16 +253,12 @@ static void dw_i2s_config(struct dw_i2s_dev *dev, int stream)
 				      dev->xfer_resolution);
 			i2s_write_reg(dev->i2s_base, TFCR(ch_reg),
 				      dev->fifo_th - 1);
-			irq = i2s_read_reg(dev->i2s_base, IMR(ch_reg));
-			i2s_write_reg(dev->i2s_base, IMR(ch_reg), irq & ~0x30);
 			i2s_write_reg(dev->i2s_base, TER(ch_reg), 1);
 		} else {
 			i2s_write_reg(dev->i2s_base, RCR(ch_reg),
 				      dev->xfer_resolution);
 			i2s_write_reg(dev->i2s_base, RFCR(ch_reg),
 				      dev->fifo_th - 1);
-			irq = i2s_read_reg(dev->i2s_base, IMR(ch_reg));
-			i2s_write_reg(dev->i2s_base, IMR(ch_reg), irq & ~0x03);
 			i2s_write_reg(dev->i2s_base, RER(ch_reg), 1);
 		}
 
-- 
2.8.1
