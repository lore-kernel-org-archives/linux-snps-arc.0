From: shawn.lin@rock-chips.com (Shawn Lin)
Date: Wed,  5 Jul 2017 15:10:45 +0800
Subject: [PATCH] arc: remove num-slots from arc platforms
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1499238645-29178-1-git-send-email-shawn.lin@rock-chips.com>
To: linux-snps-arc@lists.infradead.org

dwmmc driver deprecated num-slots and plan to get rid
of it finally. Just move a step to cleanup it from DT.

Cc: Jaehoon Chung <jh80.chung at samsung.com>
Signed-off-by: Shawn Lin <shawn.lin at rock-chips.com>
---

 arch/arc/boot/dts/axs10x_mb.dtsi     | 1 -
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 41cfb29..82e26ad 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -101,7 +101,6 @@
 		mmc at 0x15000 {
 			compatible = "altr,socfpga-dw-mshc";
 			reg = < 0x15000 0x400 >;
-			num-slots = < 1 >;
 			fifo-depth = < 16 >;
 			card-detect-delay = < 200 >;
 			clocks = <&apbclk>, <&mmcclk>;
diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
index 459fc65..48bb4b4 100644
--- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
@@ -104,7 +104,6 @@
 		mmc at 0x15000 {
 			compatible = "snps,dw-mshc";
 			reg = <0x15000 0x400>;
-			num-slots = <1>;
 			fifo-depth = <1024>;
 			card-detect-delay = <200>;
 			clocks = <&apbclk>, <&mmcclk>;
-- 
1.9.1
