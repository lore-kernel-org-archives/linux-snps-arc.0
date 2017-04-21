From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Fri, 21 Apr 2017 11:15:02 +0100
Subject: [RESEND PATCH 2/2] arc: axs10x: Fix ARC PGU default clock frequency
In-Reply-To: <7ed6deaf1ae6d5819364c793835aa30316077a7e.1487787376.git.joabreu@synopsys.com>
References: <7ed6deaf1ae6d5819364c793835aa30316077a7e.1487787376.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <16273b3a26ec770f8d169f04f7cb9eb2fac55909.1487787376.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Default clock frequency for ARC PGU does not match any
existing HDMI mode, instead the default value matches a
DVI mode. Change the clock frequency to 74.25MHz so that
it matches HDMI mode 1280x720 at 60Hz

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
 arch/arc/boot/dts/axs10x_mb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 9d882b1..41cfb29 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -51,7 +51,7 @@
 			pguclk: pguclk {
 				#clock-cells = <0>;
 				compatible = "fixed-clock";
-				clock-frequency = <74440000>;
+				clock-frequency = <74250000>;
 			};
 		};
 
-- 
1.9.1
