From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 19 Feb 2016 16:03:53 +0300
Subject: [PATCH 3/4] arc: axs10x - add support of ARC PGU
In-Reply-To: <1455887034-7739-1-git-send-email-abrodkin@synopsys.com>
References: <1455887034-7739-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1455887034-7739-4-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Synopsys DesignWare ARC SDP boards sport ARC SDP display
controller attached to ADV7511 HDMI encoder.

That change adds desctiption of both ARC PGU and ADV7511 in
ARC SDP'd base-board Device Tree.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Rob Herring <robh+dt at kernel.org>
Cc: Pawel Moll <pawel.moll at arm.com>
Cc: Mark Rutland <mark.rutland at arm.com>
Cc: Ian Campbell <ijc+devicetree at hellion.org.uk>
Cc: Kumar Gala <galak at codeaurora.org>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: devicetree at vger.kernel.org
Cc: linux-snps-arc at lists.infradead.org
---
 arch/arc/boot/dts/axs10x_mb.dtsi | 54 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 44a578c..0d50bc3 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -147,6 +147,37 @@
 			clocks = <&i2cclk>;
 			interrupts = <16>;
 
+			adv7511:adv7511 at 0x39{
+				compatible="adi,adv7511";
+				reg = <0x39>;
+				interrupts = <23>;
+				adi,input-depth = <8>;
+				adi,input-colorspace = "rgb";
+				adi,input-clock = "1x";
+				adi,clock-delay = <0x03>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					/* RGB/YUV input */
+					port at 0 {
+						reg = <0>;
+						adv7511_input:endpoint {
+						remote-endpoint = <&pgu_output>;
+						};
+					};
+
+					/* HDMI output */
+					port at 1 {
+						reg = <1>;
+						adv7511_output: endpoint {
+							remote-endpoint = <&hdmi_connector_in>;
+						};
+					};
+				};
+			};
+
 			eeprom at 0x54{
 				compatible = "24c01";
 				reg = <0x54>;
@@ -160,6 +191,16 @@
 			};
 		};
 
+		hdmi0: connector {
+			compatible = "hdmi-connector";
+			type = "a";
+			port {
+				hdmi_connector_in: endpoint {
+					remote-endpoint = <&adv7511_output>;
+				};
+			};
+		};
+
 		gpio0:gpio at 13000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x13000 0x1000>;
@@ -221,5 +262,18 @@
 				reg = <2>;
 			};
 		};
+
+		pgu at 0x17000 {
+			compatible = "snps,arcpgu";
+			reg = <0x17000 0x400>;
+			encoder-slave = <&adv7511>;
+			interrupts = <5>;
+
+			port {
+				pgu_output: endpoint {
+					remote-endpoint = <&adv7511_input>;
+					};
+			};
+		};
 	};
 };
-- 
2.5.0
