From: gustavo.pimentel@synopsys.com (Gustavo Pimentel)
Date: Thu, 21 Jun 2018 15:06:14 +0100
Subject: [PATCH v2] ARC: Add PCIe support for ARC HSDK platform
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e1d274a5ed756f86ced3df50538ef8c7e67ef4b6.1529589452.git.gustavo.pimentel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Add PCI support to the ARC HSDK platform allowing to use the generic PCI
setup functions.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel at synopsys.com>
Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/plat-hsdk/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/plat-hsdk/Kconfig b/arch/arc/plat-hsdk/Kconfig
index 19ab3cf..556bc5e 100644
--- a/arch/arc/plat-hsdk/Kconfig
+++ b/arch/arc/plat-hsdk/Kconfig
@@ -9,3 +9,4 @@ menuconfig ARC_SOC_HSDK
 	bool "ARC HS Development Kit SOC"
 	select CLK_HSDK
 	select RESET_HSDK
+	select MIGHT_HAVE_PCI
-- 
2.7.4
