From: noamca@mellanox.com (Noam Camus)
Date: Sun, 28 May 2017 09:52:02 +0300
Subject: [PATCH v2 05/11] ARC: [plat-eznps] typo fix at Kconfig
In-Reply-To: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495954328-28736-6-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

Signed-off-by: Noam Camus <noamca at mellanox.com>
Reviewed-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/plat-eznps/Kconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/plat-eznps/Kconfig b/arch/arc/plat-eznps/Kconfig
index 1595a38..feaa471 100644
--- a/arch/arc/plat-eznps/Kconfig
+++ b/arch/arc/plat-eznps/Kconfig
@@ -12,8 +12,8 @@ menuconfig ARC_PLAT_EZNPS
 	help
 	  Support for EZchip development platforms,
 	  based on ARC700 cores.
-	  We handle few flavours:
-	    - Hardware Emulator AKA HE which is FPGA based chasis
+	  We handle few flavors:
+	    - Hardware Emulator AKA HE which is FPGA based chassis
 	    - Simulator based on MetaWare nSIM
 	    - NPS400 chip based on ASIC
 
-- 
1.7.1
