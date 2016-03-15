From: Joao.Pinto@synopsys.com (Joao Pinto)
Date: Tue, 15 Mar 2016 11:06:02 +0000
Subject: [PATCH] Remove the inclusion of pci-bridge.h and pci-dma-compat.h
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <d3ed7b3e4f746831a5d0469da5361b4cd176f5c6.1457978659.git.jpinto@synopsys.com>
To: linux-snps-arc@lists.infradead.org

While building linux-next the test robot detected that the pci.h was including
two removed header files (pci-dma-compat.h and pci-bridge.h) causing the
process to fail:
http://lists.infradead.org/pipermail/linux-snps-arc/2016-March/000711.html

This patch has the goal to fix the build problem.

Signed-off-by: Joao Pinto <jpinto at synopsys.com>
---
 arch/arc/include/asm/pci.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arc/include/asm/pci.h b/arch/arc/include/asm/pci.h
index 2f2011c..ba56c23 100644
--- a/arch/arc/include/asm/pci.h
+++ b/arch/arc/include/asm/pci.h
@@ -10,9 +10,6 @@
 #define _ASM_ARC_PCI_H
 
 #ifdef __KERNEL__
-#include <asm-generic/pci-dma-compat.h>
-#include <asm-generic/pci-bridge.h>
-
 #include <linux/ioport.h>
 
 #define PCIBIOS_MIN_IO 0x100
-- 
1.8.1.5
