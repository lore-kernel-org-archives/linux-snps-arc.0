From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Mon, 28 Mar 2016 15:36:11 +0100
Subject: [PATCH 3/3 v2] arc: axs10x: Add support for Designware I2S on DT
In-Reply-To: <cover.1459174494.git.joabreu@synopsys.com>
References: <cover.1459174494.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <02e216b1c928bd939c81067346d2807fd38bf1a5.1459174494.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Synopsys Designware ARC SDP boards support HDMI audio
output using the ADV7511 HDMI transmitter.

This patchs enables audio output using Designware I2S
driver, ALSA SoC simple audio card and ADV7511 codec.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
---

Changes v1 -> v2:
* This change was introduced in v2.

 arch/arc/boot/dts/axs10x_mb.dtsi | 49 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index ab5d570..fc26ede 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -138,12 +138,23 @@
 			interrupts = <14>;
 		};
 
-		i2c at 0x1e000 {
-			compatible = "snps,designware-i2c";
+		i2s: i2s at 1e000 {
+			compatible = "snps,designware-i2s";
 			reg = <0x1e000 0x100>;
-			clock-frequency = <400000>;
-			clocks = <&i2cclk>;
 			interrupts = <15>;
+			#sound-dai-cells = <0>;
+		};
+
+		sound {
+			compatible = "simple-audio-card";
+			simple-audio-card,name = "AXS10X HDMI Audio";
+			simple-audio-card,format = "i2s";
+			simple-audio-card,cpu {
+				sound-dai = <&i2s>;
+			};
+			simple-audio-card,codec {
+				sound-dai = <&adv7511>;
+			};
 		};
 
 		i2c at 0x1f000 {
@@ -155,6 +166,36 @@
 			clocks = <&i2cclk>;
 			interrupts = <16>;
 
+			adv7511: adv7511 at 39 {
+				compatible = "adi,adv7511";
+				reg = <0x39>;
+				interrupts = <23>;
+				adi,input-depth = <8>;
+				adi,input-colorspace = "rgb";
+				adi,input-clock = "1x";
+				adi,clock-delay = <0x03>;
+				#sound-dai-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					/* RGB/YUV input */
+					port at 0 {
+						reg = <0>;
+						adv7511_input: endpoint {
+						};
+					};
+
+					/* HDMI output */
+					port at 1 {
+						reg = <1>;
+						adv7511_output: endpoint {
+						};
+					};
+				};
+			};
+
 			eeprom at 0x54{
 				compatible = "24c01";
 				reg = <0x54>;
-- 
1.9.1
