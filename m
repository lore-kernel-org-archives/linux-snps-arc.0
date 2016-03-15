From: andreas.ziegler@fau.de (Andreas Ziegler)
Date: Tue, 15 Mar 2016 12:16:55 +0100
Subject: [PATCH] ARC: Don't source drivers/pci/pcie/Kconfig ourselves
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1458040615-10697-1-git-send-email-andreas.ziegler@fau.de>
To: linux-snps-arc@lists.infradead.org

Commit 5f8fc43217a0 ("PCI: Include pci/pcie/Kconfig directly from
pci/Kconfig") in linux-next changed drivers/pci/Kconfig to include
drivers/pci/pcie/Kconfig itself, so that architectures do not need
to source both files themselves. ARC just recently gained PCI support
through commit 6b3fb77998dd ("ARC: Add PCI support"), but this change
was based on the old behaviour of the Kconfig files. This makes
Kconfig now spit out the following warnings:

drivers/pci/pcie/Kconfig:61:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:67:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:74:warning: choice value used outside its choice group

This change updates the Kconfig file for ARC, dropping the now
unnecessary 'source' statement, which makes the warning disappear.

Signed-off-by: Andreas Ziegler <andreas.ziegler at fau.de>
---
 arch/arc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 69d05f5..282efec 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -592,7 +592,6 @@ config PCI_SYSCALL
 	def_bool PCI
 
 source "drivers/pci/Kconfig"
-source "drivers/pci/pcie/Kconfig"
 
 endmenu
 
-- 
1.9.1
