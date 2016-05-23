From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Mon, 23 May 2016 11:02:25 +0100
Subject: [PATCH 4/4 v7] ASoC: dwc: Add irq parameter to DOCUMENTATION
In-Reply-To: <cover.1463996627.git.joabreu@synopsys.com>
References: <cover.1463996627.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <49fab21a9c10576cb0c5d6a2bb0e19c7bcfb732f.1463996627.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

A parameter description for the interruptions of the
I2S controller was added. This interrupt parameter
should only be set when I2S does not have DMA support.

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
---

Changes v6 -> v7:
* interrupts is now optional property

No changes v5 -> v6.

Changes v4 -> v5:
* interrupts is now required property
* Drop 'snps-use-dmaengine' property

This patch was only introduced in v4.

 Documentation/devicetree/bindings/sound/designware-i2s.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/designware-i2s.txt b/Documentation/devicetree/bindings/sound/designware-i2s.txt
index 7bb5424..6a536d5 100644
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
1.9.1
