From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri,  4 Dec 2015 22:22:06 +0300
Subject: [PATCH] ARC: [axs10x] enable DW DMA controller
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449256926-16786-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Nelson Pereira <npereira@synopsys.com>

ARC SDP baseboard among other peripherals sports
DesignWare DMA controller.

This enables support of that device.
Note typically DW DMA controller is used with external devices
connected to ARC SDP board via HAPS Extension bus.

Signed-off-by: Nelson Pereira <npereira at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/boot/dts/axs10x_mb.dtsi      | 16 ++++++++++++++++
 arch/arc/configs/axs101_defconfig     |  5 +++++
 arch/arc/configs/axs103_defconfig     |  5 +++++
 arch/arc/configs/axs103_smp_defconfig |  5 +++++
 4 files changed, 31 insertions(+)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index f3db321..1e57580 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -220,5 +220,21 @@
 				reg = <2>;
 			};
 		};
+
+		dmac: dmac at 0x80000 {
+			compatible = "snps,dma-spear1340";
+			reg = <0x80000 0x1000>;
+			interrupts = <9>;
+			dma-channels = <4>;
+			dma-requests = <16>;
+			dma-masters = <2>;
+			#dma-cells = <3>;
+			chan_allocation_order = <1>;
+			chan_priority = <1>;
+			block_size = <0xfff>;
+			data_width = <3 3>;
+			clocks = <&apbclk>;
+			clock-names = "hclk";
+		};
 	};
 };
diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 562dac6..405474f 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -90,6 +90,11 @@ CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_IDMAC=y
+CONFIG_DMADEVICES=y
+CONFIG_DW_DMAC_CORE=y
+CONFIG_DW_DMAC=y
+CONFIG_DMA_ENGINE=y
+CONFIG_DMA_OF=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
 CONFIG_EXT4_FS=y
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index 83a6d8d..570f06f 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -96,6 +96,11 @@ CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_IDMAC=y
+CONFIG_DMADEVICES=y
+CONFIG_DW_DMAC_CORE=y
+CONFIG_DW_DMAC=y
+CONFIG_DMA_ENGINE=y
+CONFIG_DMA_OF=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
 CONFIG_EXT4_FS=y
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index f1e1c84..16cfce8 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -97,6 +97,11 @@ CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_IDMAC=y
+CONFIG_DMADEVICES=y
+CONFIG_DW_DMAC_CORE=y
+CONFIG_DW_DMAC=y
+CONFIG_DMA_ENGINE=y
+CONFIG_DMA_OF=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
 CONFIG_EXT4_FS=y
-- 
2.4.3
