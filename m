From: noamc@ezchip.com (Noam Camus)
Date: Wed, 16 Dec 2015 03:10:32 +0200
Subject: [PATCH v4 13/19] ARC: [plat-eznps] Use dedicated user stack top
In-Reply-To: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
References: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1450228238-4499-14-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

NPS use special mapping right below TASK_SIZE.
Hence we need to lower STACK_TOP so that user stack won't
overlap NPS special mapping.

Signed-off-by: Noam Camus <noamc at ezchip.com>
Acked-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/processor.h |   17 +++++++++++++++++
 arch/arc/mm/tlb.c                |    6 ++++++
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index 8a77ccd..41142ab 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -122,7 +122,24 @@ extern unsigned int get_wchan(struct task_struct *p);
 
 #define USER_KERNEL_GUTTER    (VMALLOC_START - TASK_SIZE)
 
+#ifdef CONFIG_ARC_PLAT_EZNPS
+/* NPS architecture defines special window of 129M in user address space for
+ * special memory areas, when accessing this window the MMU do not use TLB.
+ * Instead MMU direct the access to:
+ * 0x57f00000:0x57ffffff -- 1M of closely coupled memory (aka CMEM)
+ * 0x58000000:0x5fffffff -- 16 huge pages, 8M each, with fixed map (aka FMTs)
+ *
+ * CMEM - is the fastest memory we got and its size is 16K.
+ * FMT  - is used to map either to internal/external memory.
+ * Internal memory is the second fast memory and its size is 16M
+ * External memory is the biggest memory (16G) and also the slowest.
+ *
+ * STACK_TOP need to be PMD align (21bit) that is why we supply 0x57e00000.
+ */
+#define STACK_TOP       0x57e00000
+#else /* CONFIG_ARC_PLAT_EZNPS */
 #define STACK_TOP       TASK_SIZE
+#endif /* CONFIG_ARC_PLAT_EZNPS */
 #define STACK_TOP_MAX   STACK_TOP
 
 /* This decides where the kernel will search for a free chunk of vm
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 843e1a5..01f85e5 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -820,6 +820,12 @@ void arc_mmu_init(void)
 	 */
 	BUILD_BUG_ON(!IS_ALIGNED((CONFIG_ARC_VMALLOC_SIZE << 20), PMD_SIZE));
 
+	/*
+	 * stack top size sanity check,
+	 * Can't be done in processor.h due to header include depenedencies
+	 */
+	BUILD_BUG_ON(!IS_ALIGNED(STACK_TOP, PMD_SIZE));
+
 	/* For efficiency sake, kernel is compile time built for a MMU ver
 	 * This must match the hardware it is running on.
 	 * Linux built for MMU V2, if run on MMU V1 will break down because V1
-- 
1.7.1
