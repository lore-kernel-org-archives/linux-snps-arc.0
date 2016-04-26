From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 26 Apr 2016 19:29:34 +0300
Subject: [PATCH 2/2] ARC: add support for reserved memory defined by device
 tree
In-Reply-To: <1461688174-8936-1-git-send-email-abrodkin@synopsys.com>
References: <1461688174-8936-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1461688174-8936-3-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Enable reserved memory initialization from device tree.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Grant Likely <grant.likely at linaro.org>
Cc: Marek Szyprowski <m.szyprowski at samsung.com>
Cc: linux-kernel at vger.kernel.org
---
 arch/arc/Kconfig   | 1 +
 arch/arc/mm/init.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 61d69e6..33c1fc7 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -35,6 +35,7 @@ config ARC
 	select NO_BOOTMEM
 	select OF
 	select OF_EARLY_FLATTREE
+	select OF_RESERVED_MEM
 	select PERF_USE_VMALLOC
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_GENERIC_DMA_COHERENT
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 7d2c4fb..5487d0b 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -13,6 +13,7 @@
 #ifdef CONFIG_BLK_DEV_INITRD
 #include <linux/initrd.h>
 #endif
+#include <linux/of_fdt.h>
 #include <linux/swap.h>
 #include <linux/module.h>
 #include <linux/highmem.h>
@@ -136,6 +137,9 @@ void __init setup_arch_memory(void)
 		memblock_reserve(__pa(initrd_start), initrd_end - initrd_start);
 #endif
 
+	early_init_fdt_reserve_self();
+	early_init_fdt_scan_reserved_mem();
+
 	memblock_dump_all();
 
 	/*----------------- node/zones setup --------------------------*/
-- 
2.5.5
