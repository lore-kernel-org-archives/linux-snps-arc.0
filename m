From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Fri, 21 Apr 2017 11:15:01 +0100
Subject: [RESEND PATCH 1/2] arc: axs10x: Add DT bindings for I2S audio playback
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7ed6deaf1ae6d5819364c793835aa30316077a7e.1487787376.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This patch adds the necessary DT bindings to get HDMI audio
output in ARC AXS10x SDP. The bindings for I2S controller were
added as well as the bindings for simple audio card.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Carlos Palminha <palminha at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Rob Herring <robh+dt at kernel.org>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: devicetree at vger.kernel.org
Cc: linux-snps-arc at lists.infradead.org
Cc: linux-kernel at vger.kernel.org
---
 arch/arc/boot/dts/axs10x_mb.dtsi | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index d6c1bbc..9d882b1 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -149,12 +149,13 @@
 			interrupts = <14>;
 		};
 
-		i2c at 0x1e000 {
-			compatible = "snps,designware-i2c";
+		i2s: i2s at 1e000 {
+			compatible = "snps,designware-i2s";
 			reg = <0x1e000 0x100>;
-			clock-frequency = <400000>;
-			clocks = <&i2cclk>;
+			clocks = <&i2sclk 0>;
+			clock-names = "i2sclk";
 			interrupts = <15>;
+			#sound-dai-cells = <0>;
 		};
 
 		i2c at 0x1f000 {
@@ -174,6 +175,7 @@
 				adi,input-colorspace = "rgb";
 				adi,input-clock = "1x";
 				adi,clock-delay = <0x03>;
+				#sound-dai-cells = <0>;
 
 				ports {
 					#address-cells = <1>;
@@ -295,5 +297,17 @@
 				};
 			};
 		};
+
+		sound_playback {
+			compatible = "simple-audio-card";
+			simple-audio-card,name = "AXS10x HDMI Audio";
+			simple-audio-card,format = "i2s";
+			simple-audio-card,cpu {
+				sound-dai = <&i2s>;
+			};
+			simple-audio-card,codec {
+				sound-dai = <&adv7511>;
+			};
+		};
 	};
 };
-- 
1.9.1
