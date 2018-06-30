From: rppt@linux.vnet.ibm.com (Mike Rapoport)
Date: Sat, 30 Jun 2018 16:54:09 +0300
Subject: [PATCH] arc/Kconfig: add the "Memory Management" menu around include
 mm/Kconfig
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1530366849-19257-1-git-send-email-rppt@linux.vnet.ibm.com>
To: linux-snps-arc@lists.infradead.org

Otherwise mm configuration options show up in the top level menu.

Suggested-by: Randy Dunlap <rdunlap at infradead.org>
Signed-off-by: Mike Rapoport <rppt at linux.vnet.ibm.com>
Tested-by: Randy Dunlap <rdunlap at infradead.org>
Acked-by: Randy Dunlap <rdunlap at infradead.org>
---
 arch/arc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index e81bcd271be7..44a20141639a 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -556,12 +556,14 @@ endmenu
 
 endmenu	 # "ARC Architecture Configuration"
 
+menu "Memory Management"
 source "mm/Kconfig"
 
 config FORCE_MAX_ZONEORDER
 	int "Maximum zone order"
 	default "12" if ARC_HUGEPAGE_16M
 	default "11"
+endmenu # "Memory Management"
 
 source "net/Kconfig"
 source "drivers/Kconfig"
-- 
2.7.4
