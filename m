From: Joao.Pinto@synopsys.com (Joao Pinto)
Date: Tue,  9 Aug 2016 16:49:37 +0100
Subject: [PATCH] pci: adding support for PCI_MSI_IRQ_DOMAIN in ARC arch
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <fdd37b0b995d178fddb34fdbdb5daf5981822f52.1470757628.git.jpinto@synopsys.com>
To: linux-snps-arc@lists.infradead.org

To fix this, this patch adds ARC as a PCI_MSI_IRQ_DOMAIN supportive
platform and adds the generation of msi.h in the ARC arch.

Signed-off-by: Joao Pinto <jpinto at synopsys.com>
---
 arch/arc/include/asm/Kbuild | 1 +
 drivers/pci/Kconfig         | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/Kbuild b/arch/arc/include/asm/Kbuild
index 0b10ef2..c332604 100644
--- a/arch/arc/include/asm/Kbuild
+++ b/arch/arc/include/asm/Kbuild
@@ -25,6 +25,7 @@ generic-y += mcs_spinlock.h
 generic-y += mm-arch-hooks.h
 generic-y += mman.h
 generic-y += msgbuf.h
+generic-y += msi.h
 generic-y += param.h
 generic-y += parport.h
 generic-y += pci.h
diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 67f9916..6555eb7 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -25,7 +25,7 @@ config PCI_MSI
 	   If you don't know what to do here, say Y.
 
 config PCI_MSI_IRQ_DOMAIN
-	def_bool ARM || ARM64 || X86
+	def_bool ARC || ARM || ARM64 || X86
 	depends on PCI_MSI
 	select GENERIC_MSI_IRQ_DOMAIN
 
-- 
1.8.1.5
