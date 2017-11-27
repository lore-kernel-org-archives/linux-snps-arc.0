From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 27 Nov 2017 21:56:08 +0300
Subject: [PATCH 1/4] ARC: [plat-hsdk]: Set initial core pll output frequency
In-Reply-To: <20171127185611.12379-1-Eugeniy.Paltsev@synopsys.com>
References: <20171127185611.12379-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171127185611.12379-2-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Set initial core pll output frequency specified in device tree to
1GHz. It will be applied at the core pll driver probing.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/boot/dts/hsdk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 8f627c2..006aa3d 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -114,6 +114,14 @@
 			reg = <0x00 0x10>, <0x14B8 0x4>;
 			#clock-cells = <0>;
 			clocks = <&input_clk>;
+
+			/*
+			 * Set initial core pll output frequency to 1GHz.
+			 * It will be applied at the core pll driver probing
+			 * on early boot.
+			 */
+			assigned-clocks = <&core_clk>;
+			assigned-clock-rates = <1000000000>;
 		};
 
 		serial: serial at 5000 {
-- 
2.9.3
