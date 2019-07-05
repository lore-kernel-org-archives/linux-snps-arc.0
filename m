From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri,  5 Jul 2019 19:24:09 +0300
Subject: [PATCH] ARC: [plat-hsdk]: Enable AXI DW DMAC in defconfig
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190705162409.8916-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

For some reasons my previous patch "Enable AXI DW DMAC support"
was applied only partially (only device tree part).
So enable AXI DW DMAC in HSDK defconfig to be able to use it in
verification flow.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/configs/hsdk_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index c8fb5d60c53f..85e7921e0628 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -66,6 +66,8 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
+CONFIG_DMADEVICES=y
+CONFIG_DW_AXI_DMAC=y
 CONFIG_EXT3_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
-- 
2.21.0
