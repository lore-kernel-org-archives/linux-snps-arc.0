From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Mon, 23 May 2016 11:02:23 +0100
Subject: [PATCH 2/4 v7] ASoC: dwc: Do not use devm_clk_get() if using platform
 data
In-Reply-To: <cover.1463996627.git.joabreu@synopsys.com>
References: <cover.1463996627.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <d288d87fc0f1c07f4d301dc08d32b1bf9915446c.1463996627.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

When using platform data the devm_clk_get() function is
called causing a probe failure if the clock is not
declared. As we can pass the clock handler by platform
data call only devm_clk_get() when platform data is not
used.

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

This patch was only introduced in v7.

 sound/soc/dwc/designware_i2s.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/dwc/designware_i2s.c b/sound/soc/dwc/designware_i2s.c
index 4c4f0dc..a97be8e 100644
--- a/sound/soc/dwc/designware_i2s.c
+++ b/sound/soc/dwc/designware_i2s.c
@@ -690,15 +690,16 @@ static int dw_i2s_probe(struct platform_device *pdev)
 				dev_err(&pdev->dev, "no clock configure method\n");
 				return -ENODEV;
 			}
-		}
-		dev->clk = devm_clk_get(&pdev->dev, clk_id);
+		} else {
+			dev->clk = devm_clk_get(&pdev->dev, clk_id);
 
-		if (IS_ERR(dev->clk))
-			return PTR_ERR(dev->clk);
+			if (IS_ERR(dev->clk))
+				return PTR_ERR(dev->clk);
 
-		ret = clk_prepare_enable(dev->clk);
-		if (ret < 0)
-			return ret;
+			ret = clk_prepare_enable(dev->clk);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	dev_set_drvdata(&pdev->dev, dev);
-- 
1.9.1
