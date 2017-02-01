From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed,  1 Feb 2017 19:42:52 +0300
Subject: [PATCH 2/3] arc: vdk: Add support of MMC controller
In-Reply-To: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
References: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485967373-15273-3-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC VDK virtual platform emulates host MMC controller (DW Mobile Storage)
and moreover rootfs is situated on that virtual card.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi    | 18 ++++++++++++++++++
 arch/arc/configs/vdk_hs38_smp_defconfig |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
index 99498a4b4216..1953914b9f4f 100644
--- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
@@ -23,6 +23,12 @@
 				#clock-cells = <0>;
 			};
 
+			mmcclk: mmcclk {
+				compatible = "fixed-clock";
+				clock-frequency = <50000000>;
+				#clock-cells = <0>;
+			};
+
 			pguclk: pguclk {
 				#clock-cells = <0>;
 				compatible = "fixed-clock";
@@ -94,5 +100,17 @@
 			interrupts = <5>;
 			interrupt-names = "arc_ps2_irq";
 		};
+
+		mmc at 0x15000 {
+			compatible = "snps,dw-mshc";
+			reg = <0x15000 0x400>;
+			num-slots = <1>;
+			fifo-depth = <1024>;
+			card-detect-delay = <200>;
+			clocks = <&apbclk>, <&mmcclk>;
+			clock-names = "biu", "ciu";
+			interrupts = <7>;
+			bus-width = <4>;
+		};
 	};
 };
diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
index f6361de41eec..e03413fbc784 100644
--- a/arch/arc/configs/vdk_hs38_smp_defconfig
+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
@@ -77,6 +77,10 @@ CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_SERIAL=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_DW=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
 CONFIG_MSDOS_FS=y
-- 
2.7.4
