From: noamca@mellanox.com (Noam Camus)
Date: Thu, 15 Jun 2017 11:43:52 +0300
Subject: [PATCH v3 02/11] ARC: send ipi to all cpus sharing task mm in case of
 page fault
In-Reply-To: <1497516241-16446-1-git-send-email-noamca@mellanox.com>
References: <1497516241-16446-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1497516241-16446-3-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

This patch is derived due to performance issue.
The use case is a page fault that resides on more than the local cpu.
Trying to broadcast all CPUs results on performance degradation.
So we try to avoid this by sending only to the relevant CPUs.

Signed-off-by: Noam Camus <noamca at mellanox.com>
Reviewed-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/include/asm/cacheflush.h |    3 ++-
 arch/arc/mm/cache.c               |   12 ++++++++++--
 arch/arc/mm/tlb.c                 |    2 +-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/cacheflush.h b/arch/arc/include/asm/cacheflush.h
index fc662f4..716dba1 100644
--- a/arch/arc/include/asm/cacheflush.h
+++ b/arch/arc/include/asm/cacheflush.h
@@ -33,7 +33,8 @@
 
 void flush_icache_range(unsigned long kstart, unsigned long kend);
 void __sync_icache_dcache(phys_addr_t paddr, unsigned long vaddr, int len);
-void __inv_icache_page(phys_addr_t paddr, unsigned long vaddr);
+void __inv_icache_page(struct vm_area_struct *vma,
+		       phys_addr_t paddr, unsigned long vaddr);
 void __flush_dcache_page(phys_addr_t paddr, unsigned long vaddr);
 
 #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index bdb5227..bfad0fa 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -934,9 +934,17 @@ void __sync_icache_dcache(phys_addr_t paddr, unsigned long vaddr, int len)
 }
 
 /* wrapper to compile time eliminate alignment checks in flush loop */
-void __inv_icache_page(phys_addr_t paddr, unsigned long vaddr)
+void __inv_icache_page(struct vm_area_struct *vma,
+		       phys_addr_t paddr, unsigned long vaddr)
 {
-	__ic_line_inv_vaddr(paddr, vaddr, PAGE_SIZE);
+	struct ic_inv_args ic_inv = {
+		.paddr	= paddr,
+		.vaddr	= vaddr,
+		.sz	= PAGE_SIZE
+	};
+
+	on_each_cpu_mask(mm_cpumask(vma->vm_mm),
+			 __ic_line_inv_vaddr_helper, &ic_inv, 1);
 }
 
 /*
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 2b6da60..e298da9 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -626,7 +626,7 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long vaddr_unaligned,
 
 			/* invalidate any existing icache lines (U-mapping) */
 			if (vma->vm_flags & VM_EXEC)
-				__inv_icache_page(paddr, vaddr);
+				__inv_icache_page(vma, paddr, vaddr);
 		}
 	}
 }
-- 
1.7.1
