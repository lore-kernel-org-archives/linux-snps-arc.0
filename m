From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed,  1 Feb 2017 19:42:53 +0300
Subject: [PATCH 3/3] arc: vdk: Add support of UIO
In-Reply-To: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
References: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485967373-15273-4-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC VDK for EVSS uses UIO for communication with Embedded Vision
Subsystem.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi    | 8 ++++++++
 arch/arc/configs/vdk_hs38_smp_defconfig | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
index 1953914b9f4f..f0df59b23e21 100644
--- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
@@ -112,5 +112,13 @@
 			interrupts = <7>;
 			bus-width = <4>;
 		};
+
+		/* Embedded Vision subsystem UIO mappings; only relevant for EV VDK */
+		uio_ev: uio at 0xD0000000 {
+			compatible = "generic-uio";
+			reg = <0xD0000000 0x2000 0xD1000000 0x2000 0x90000000 0x10000000 0xC0000000 0x10000000>;
+			reg-names = "ev_gsa", "ev_ctrl", "ev_shared_mem", "ev_code_mem";
+			interrupts = <23>;
+		};
 	};
 };
diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
index e03413fbc784..1a9b19903c9a 100644
--- a/arch/arc/configs/vdk_hs38_smp_defconfig
+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
@@ -81,6 +81,8 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
+CONFIG_UIO=y
+CONFIG_UIO_PDRV_GENIRQ=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
 CONFIG_MSDOS_FS=y
-- 
2.7.4
