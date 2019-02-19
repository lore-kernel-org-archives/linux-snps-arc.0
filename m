From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 19 Feb 2019 13:52:26 +0300
Subject: [PATCH] ARC: [plat-hsdk]: Enable AXI DW DMAC support
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190219105226.20062-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
NOTE:
  Even if this patch have no logical dependency with gpu-enabling-patch
  (http://patchwork.ozlabs.org/patch/1034722/)
  gpu-enabling-patch should be applied first to avoid rebasing.

 arch/arc/boot/dts/hsdk.dts      | 27 +++++++++++++++++++++++++++
 arch/arc/configs/hsdk_defconfig |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index a26b3f532f32..46a6e1080b38 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -185,6 +185,18 @@
 			#clock-cells = <0>;
 		};
 
+		dmac_core_clk: dmac-core-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <400000000>;
+			#clock-cells = <0>;
+		};
+
+		dmac_cfg_clk: dmac-gpu-cfg-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <200000000>;
+			#clock-cells = <0>;
+		};
+
 		gmac: ethernet at 8000 {
 			#interrupt-cells = <1>;
 			compatible = "snps,dwmac";
@@ -268,6 +280,21 @@
 			clock-names = "bus", "reg", "core", "shader";
 			interrupts = <28>;
 		};
+
+		dmac: dmac at 80000 {
+			compatible = "snps,axi-dma-1.01a";
+			reg = <0x80000 0x400>;
+			interrupts = <27>;
+			clocks = <&dmac_core_clk>, <&dmac_cfg_clk>;
+			clock-names = "core-clk", "cfgr-clk";
+
+			dma-channels = <4>;
+			snps,dma-masters = <2>;
+			snps,data-width = <3>;
+			snps,block-size = <4096 4096 4096 4096>;
+			snps,priority = <0 1 2 3>;
+			snps,axi-max-burst-len = <16>;
+		};
 	};
 
 	memory at 80000000 {
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 915e1cca31f8..5f1c772cb2fd 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -64,6 +64,8 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
+CONFIG_DMADEVICES=y
+CONFIG_DW_AXI_DMAC=y
 CONFIG_EXT3_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
-- 
2.14.5
