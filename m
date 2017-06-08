From: noamca@mellanox.com (Noam Camus)
Date: Thu,  8 Jun 2017 18:20:29 +0300
Subject: [PATCH 05/11] ARC: Support more than one PGDIR for KVADDR
In-Reply-To: <1496935235-46507-1-git-send-email-noamca@mellanox.com>
References: <1496935235-46507-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1496935235-46507-6-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

This way FIXMAP can have 2 PTEs per CPU even for
NR_CPUS=4096

For the extreme case like in eznps platform We use
all gutter between kernel and user.

Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/Kconfig                 |   11 +++++++++++
 arch/arc/include/asm/highmem.h   |    8 +++++---
 arch/arc/include/asm/pgtable.h   |    9 +++++++++
 arch/arc/include/asm/processor.h |    5 +++--
 arch/arc/mm/fault.c              |    8 ++++++++
 arch/arc/mm/highmem.c            |   16 +++++++++++-----
 arch/arc/mm/tlbex.S              |   31 +++++++++++++++++++++++++++++++
 7 files changed, 78 insertions(+), 10 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index b759be1..54ba8e6 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -478,6 +478,17 @@ config ARC_HAS_PAE40
 	  Enable access to physical memory beyond 4G, only supported on
 	  ARC cores with 40 bit Physical Addressing support
 
+config HIGHMEM_PGDS_SHIFT
+	int "log num of PGDs for HIGHMEM"
+	range 0 5
+	default "0" if !ARC_PLAT_EZNPS || !HIGHMEM
+	default "5" if ARC_PLAT_EZNPS
+	help
+	  This way we can map more pages for HIGHMEM.
+	  Single PGD (2M) is supporting 256 PTEs (8K PAGE_SIZE)
+	  For FIXMAP where at least 2 PTEs are needed per CPU
+	  large NR_CPUS e.g. 4096 will consume 32 PGDs
+
 config ARCH_PHYS_ADDR_T_64BIT
 	def_bool ARC_HAS_PAE40
 
diff --git a/arch/arc/include/asm/highmem.h b/arch/arc/include/asm/highmem.h
index b1585c9..c5cb473 100644
--- a/arch/arc/include/asm/highmem.h
+++ b/arch/arc/include/asm/highmem.h
@@ -17,13 +17,13 @@
 
 /* start after vmalloc area */
 #define FIXMAP_BASE		(PAGE_OFFSET - FIXMAP_SIZE - PKMAP_SIZE)
-#define FIXMAP_SIZE		PGDIR_SIZE	/* only 1 PGD worth */
-#define KM_TYPE_NR		((FIXMAP_SIZE >> PAGE_SHIFT)/NR_CPUS)
+#define FIXMAP_SIZE		(PGDIR_SIZE * _BITUL(CONFIG_HIGHMEM_PGDS_SHIFT))
+#define KM_TYPE_NR		(((FIXMAP_SIZE >> PAGE_SHIFT)/NR_CPUS) > 2 ?: 2)
 #define FIXMAP_ADDR(nr)		(FIXMAP_BASE + ((nr) << PAGE_SHIFT))
 
 /* start after fixmap area */
 #define PKMAP_BASE		(FIXMAP_BASE + FIXMAP_SIZE)
-#define PKMAP_SIZE		PGDIR_SIZE
+#define PKMAP_SIZE		(PGDIR_SIZE * _BITUL(CONFIG_HIGHMEM_PGDS_SHIFT))
 #define LAST_PKMAP		(PKMAP_SIZE >> PAGE_SHIFT)
 #define LAST_PKMAP_MASK		(LAST_PKMAP - 1)
 #define PKMAP_ADDR(nr)		(PKMAP_BASE + ((nr) << PAGE_SHIFT))
@@ -32,6 +32,7 @@
 #define kmap_prot		PAGE_KERNEL
 
 
+#ifndef __ASSEMBLY__
 #include <asm/cacheflush.h>
 
 extern void *kmap(struct page *page);
@@ -54,6 +55,7 @@ static inline void kunmap(struct page *page)
 		return;
 	kunmap_high(page);
 }
+#endif /* __ASSEMBLY__  */
 
 
 #endif
diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 08fe338..d08e207 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -224,6 +224,8 @@
 #define	PTRS_PER_PTE	_BITUL(BITS_FOR_PTE)
 #define	PTRS_PER_PGD	_BITUL(BITS_FOR_PGD)
 
+#define PTRS_HMEM_PTE	_BITUL(BITS_FOR_PTE + CONFIG_HIGHMEM_PGDS_SHIFT)
+
 /*
  * Number of entries a user land program use.
  * TASK_SIZE is the maximum vaddr that can be used by a userland program.
@@ -285,7 +287,14 @@ static inline void pmd_set(pmd_t *pmdp, pte_t *ptep)
 
 /* Don't use virt_to_pfn for macros below: could cause truncations for PAE40*/
 #define pte_pfn(pte)		(pte_val(pte) >> PAGE_SHIFT)
+#if CONFIG_HIGHMEM_PGDS_SHIFT
+#define __pte_index(addr)	(((addr) >= VMALLOC_END) ?		       \
+				(((addr) >> PAGE_SHIFT) & (PTRS_HMEM_PTE - 1)) \
+				:					       \
+				(((addr) >> PAGE_SHIFT) & (PTRS_PER_PTE - 1)))
+#else
 #define __pte_index(addr)	(((addr) >> PAGE_SHIFT) & (PTRS_PER_PTE - 1))
+#endif
 
 /*
  * pte_offset gets a @ptr to PMD entry (PGD in our 2-tier paging system)
diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index 6e1242d..fd7bdfa 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -121,8 +121,9 @@ extern void start_thread(struct pt_regs * regs, unsigned long pc,
 
 #define VMALLOC_START	(PAGE_OFFSET - (CONFIG_ARC_KVADDR_SIZE << 20))
 
-/* 1 PGDIR_SIZE each for fixmap/pkmap, 2 PGDIR_SIZE gutter (see asm/highmem.h) */
-#define VMALLOC_SIZE	((CONFIG_ARC_KVADDR_SIZE << 20) - PGDIR_SIZE * 4)
+/* 1 << CONFIG_HIGHMEM_PGDS_SHIFT PGDIR_SIZE each for fixmap/pkmap */
+#define VMALLOC_SIZE	((CONFIG_ARC_KVADDR_SIZE << 20) - \
+			  PGDIR_SIZE * _BITUL(CONFIG_HIGHMEM_PGDS_SHIFT) * 2)
 
 #define VMALLOC_END	(VMALLOC_START + VMALLOC_SIZE)
 
diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index a0b7bd6..fd89c9a 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -17,6 +17,7 @@
 #include <linux/perf_event.h>
 #include <asm/pgalloc.h>
 #include <asm/mmu.h>
+#include <asm/highmem.h>
 
 /*
  * kernel virtual address is required to implement vmalloc/pkmap/fixmap
@@ -35,6 +36,13 @@ noinline static int handle_kernel_vaddr_fault(unsigned long address)
 	pud_t *pud, *pud_k;
 	pmd_t *pmd, *pmd_k;
 
+#if defined(CONFIG_HIGHMEM) && (CONFIG_HIGHMEM_PGDS_SHIFT)
+	if (address > FIXMAP_BASE && address < (FIXMAP_BASE + FIXMAP_SIZE))
+		address = FIXMAP_BASE;
+	else if (address > PKMAP_BASE && address < (PKMAP_BASE + PKMAP_SIZE))
+		address = PKMAP_BASE;
+#endif
+
 	pgd = pgd_offset_fast(current->active_mm, address);
 	pgd_k = pgd_offset_k(address);
 
diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
index 77ff64a..1d4804d 100644
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -112,7 +112,8 @@ void __kunmap_atomic(void *kv)
 }
 EXPORT_SYMBOL(__kunmap_atomic);
 
-static noinline pte_t * __init alloc_kmap_pgtable(unsigned long kvaddr)
+static noinline pte_t * __init alloc_kmap_pgtable(unsigned long kvaddr,
+						  unsigned long pgnum)
 {
 	pgd_t *pgd_k;
 	pud_t *pud_k;
@@ -123,19 +124,24 @@ void __kunmap_atomic(void *kv)
 	pud_k = pud_offset(pgd_k, kvaddr);
 	pmd_k = pmd_offset(pud_k, kvaddr);
 
-	pte_k = (pte_t *)alloc_bootmem_low_pages(PAGE_SIZE);
+	pte_k = (pte_t *)alloc_bootmem_low_pages(pgnum * PAGE_SIZE);
 	pmd_populate_kernel(&init_mm, pmd_k, pte_k);
 	return pte_k;
 }
 
 void __init kmap_init(void)
 {
+	unsigned int pgnum;
+
 	/* Due to recursive include hell, we can't do this in processor.h */
 	BUILD_BUG_ON(PAGE_OFFSET < (VMALLOC_END + FIXMAP_SIZE + PKMAP_SIZE));
 
 	BUILD_BUG_ON(KM_TYPE_NR > PTRS_PER_PTE);
-	pkmap_page_table = alloc_kmap_pgtable(PKMAP_BASE);
+	pgnum = DIV_ROUND_UP(PKMAP_SIZE, PAGE_SIZE * PTRS_PER_PTE);
+	pkmap_page_table = alloc_kmap_pgtable(PKMAP_BASE, pgnum);
 
-	BUILD_BUG_ON(LAST_PKMAP > PTRS_PER_PTE);
-	fixmap_page_table = alloc_kmap_pgtable(FIXMAP_BASE);
+	BUILD_BUG_ON(LAST_PKMAP > (PTRS_PER_PTE *
+					_BITUL(CONFIG_HIGHMEM_PGDS_SHIFT)));
+	pgnum = DIV_ROUND_UP(FIXMAP_SIZE, PAGE_SIZE * PTRS_PER_PTE);
+	fixmap_page_table = alloc_kmap_pgtable(FIXMAP_BASE, pgnum);
 }
diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index 0e1e47a..e21aecc 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -43,6 +43,7 @@
 #include <asm/cache.h>
 #include <asm/processor.h>
 #include <asm/tlb-mmu1.h>
+#include <asm/highmem.h>
 
 #ifdef CONFIG_ISA_ARCOMPACT
 ;-----------------------------------------------------------------
@@ -204,6 +205,12 @@ ex_saved_reg1:
 	ld  r1, [r1, MM_PGD]
 #endif
 
+#if defined(CONFIG_HIGHMEM) && defined(CONFIG_HIGHMEM_PGDS_SHIFT)
+	; handle pkmap/fixmap with more then on pte table
+	cmp_s   r2, VMALLOC_END
+	b.hs    4f
+#endif
+
 	lsr     r0, r2, PGDIR_SHIFT     ; Bits for indexing into PGD
 	ld.as   r3, [r1, r0]            ; PGD entry corresp to faulting addr
 	tst	r3, r3
@@ -237,6 +244,30 @@ ex_saved_reg1:
 
 2:
 
+#if defined(CONFIG_HIGHMEM) && defined(CONFIG_HIGHMEM_PGDS_SHIFT)
+	b       6f
+
+4:
+	lsr     r0, r2, PGDIR_SHIFT         ; Bits for indexing into KMAP_PGD
+	and     r0, r0, ~(_BITUL(CONFIG_HIGHMEM_PGDS_SHIFT) - 1)
+	ld.as   r1, [r1, r0]                ; PGD entry corresp to faulting addr
+	tst     r1, r1
+	bz      do_slow_path_pf             ; if no Page Table, do page fault
+	and     r1, r1, PAGE_MASK
+
+	cmp_s   r2, PKMAP_BASE
+	mov.hs  r0, ( PKMAP_BASE >> PAGE_SHIFT )
+	b.hs    5f
+	mov     r0, ( FIXMAP_BASE >> PAGE_SHIFT )
+
+5:
+	lsr     r3, r2, PAGE_SHIFT
+	sub     r0, r3, r0
+	asl     r0, r0, PTE_SIZE_LOG
+	ld.aw   r0, [r1, r0]
+6:
+#endif
+
 .endm
 
 ;-----------------------------------------------------------------
-- 
1.7.1
