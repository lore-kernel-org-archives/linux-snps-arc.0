From: noamc@ezchip.com (Noam Camus)
Date: Sat, 31 Oct 2015 15:15:11 +0200
Subject: [PATCH v1 04/20] ARC: Set vmalloc size from configuration
In-Reply-To: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446297327-16298-5-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

User space use lower 2G of the virtual address space.
However kernel steals upper 512M of this space.
This stolen space is used partially for vmalloc and the rest
serves as gutter between kernel and user space.
The vmalloc size is depend on NR_CPUS since "per cpu" mechanism
use vmalloc to allocate chunks for its use.

Historically vmalloc size was 256M however it is not enough in
case of many CPUs e.g. 4K CPUs. For such case an extra 192M is
allocated.
We are setting default vmalloc size to be 256M, any addtional
space will be taken from kernel/user gutter.

Signed-off-by: Noam Camus <noamc at ezchip.com>
Acked-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Kconfig                 |    8 ++++++++
 arch/arc/include/asm/processor.h |   10 +++++-----
 arch/arc/mm/tlb.c                |    6 ++++++
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 2c2ac3f..689ccb3 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -468,6 +468,14 @@ config ARCH_PHYS_ADDR_T_64BIT
 config ARCH_DMA_ADDR_T_64BIT
 	bool
 
+config ARC_VMALLOC_SIZE
+	hex "Vmalloc size (MB)"
+	range 0 512
+	default "256"
+	help
+	  By default equals to 256MB and the rest of 512MB is
+	  left for gutter between kernel and user space.
+
 config ARC_CURR_IN_REG
 	bool "Dedicate Register r25 for current_task pointer"
 	default y
diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index 4454535..a603301 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -113,18 +113,18 @@ extern unsigned int get_wchan(struct task_struct *p);
  * 0xC000_0000		0xFFFF_FFFF	(peripheral uncached space)
  * -----------------------------------------------------------------------------
  */
-#define VMALLOC_START	0x70000000
 
 /*
  * 1 PGDIR_SIZE each for fixmap/pkmap, 2 PGDIR_SIZE gutter
  * See asm/highmem.h for details
  */
-#define VMALLOC_SIZE	(PAGE_OFFSET - VMALLOC_START - PGDIR_SIZE * 4)
-#define VMALLOC_END	(VMALLOC_START + VMALLOC_SIZE)
+#define VMALLOC_END	(PAGE_OFFSET - PGDIR_SIZE * 4)
+#define VMALLOC_SIZE	(CONFIG_ARC_VMALLOC_SIZE << 20)
+#define VMALLOC_START	(VMALLOC_END - VMALLOC_SIZE)
 
-#define USER_KERNEL_GUTTER    0x10000000
+#define TASK_SIZE	0x60000000
 
-#define TASK_SIZE	(VMALLOC_START - USER_KERNEL_GUTTER)
+#define USER_KERNEL_GUTTER    (VMALLOC_START - TASK_SIZE)
 
 #define STACK_TOP       TASK_SIZE
 #define STACK_TOP_MAX   STACK_TOP
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 0ee7398..0c75a27 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -814,6 +814,12 @@ void arc_mmu_init(void)
 
 	printk(arc_mmu_mumbojumbo(0, str, sizeof(str)));
 
+	/*
+	 * vmalloc size (in MB) sanity check,
+	 * Can't be done in processor.h due to header include depenedencies
+	 */
+	BUILD_BUG_ON(!IS_ALIGNED((CONFIG_ARC_VMALLOC_SIZE << 20), PMD_SIZE));
+
 	/* For efficiency sake, kernel is compile time built for a MMU ver
 	 * This must match the hardware it is running on.
 	 * Linux built for MMU V2, if run on MMU V1 will break down because V1
-- 
1.7.1
