From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 12 May 2016 23:03:35 +0200
Subject: [PATCH] irqchip: nps: add 64BIT dependency
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1463087038-2522527-1-git-send-email-arnd@arndb.de>
To: linux-snps-arc@lists.infradead.org

The newly added nps irqchip driver causes build warnings on ARM64.

include/soc/nps/common.h: In function 'nps_host_reg_non_cl':
include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

As the driver is only used on ARC, we don't need to see it without
COMPILE_TEST elsewhere, and we can avoid the warnings by only
building on 32-bit architectures even with CONFIG_COMPILE_TEST.

Signed-off-by: Arnd Bergmann <arnd at arndb.de>
---
 drivers/irqchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 83775f148158..37289cf6b449 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -253,6 +253,7 @@ config MVEBU_ODMI
 
 config EZNPS_GIC
 	bool "NPS400 Global Interrupt Manager (GIM)"
+	depends on ARC || (COMPILE_TEST && !64BIT)
 	select IRQ_DOMAIN
 	help
 	  Support the EZchip NPS400 global interrupt controller
-- 
2.7.0
