From: adam.buchbinder@gmail.com (Adam Buchbinder)
Date: Tue, 23 Feb 2016 15:24:55 -0800
Subject: [PATCH] ARC: Fix misspellings in comments.
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1456269895-25714-1-git-send-email-adam.buchbinder@gmail.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Adam Buchbinder <adam.buchbinder at gmail.com>
---
 arch/arc/include/asm/cmpxchg.h       | 2 +-
 arch/arc/include/asm/entry-compact.h | 2 +-
 arch/arc/include/asm/pgtable.h       | 2 +-
 arch/arc/kernel/stacktrace.c         | 2 +-
 arch/arc/kernel/time.c               | 4 ++--
 arch/arc/mm/cache.c                  | 2 +-
 arch/arc/mm/highmem.c                | 2 +-
 arch/arc/mm/tlb.c                    | 8 ++++----
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index af7a2db..a444be6 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -149,7 +149,7 @@ static inline unsigned long __xchg(unsigned long val, volatile void *ptr,
  * Since xchg() doesn't always do that, it would seem that following defintion
  * is incorrect. But here's the rationale:
  *   SMP : Even xchg() takes the atomic_ops_lock, so OK.
- *   LLSC: atomic_ops_lock are not relevent at all (even if SMP, since LLSC
+ *   LLSC: atomic_ops_lock are not relevant at all (even if SMP, since LLSC
  *         is natively "SMP safe", no serialization required).
  *   UP  : other atomics disable IRQ, so no way a difft ctxt atomic_xchg()
  *         could clobber them. atomic_xchg() itself would be 1 insn, so it
diff --git a/arch/arc/include/asm/entry-compact.h b/arch/arc/include/asm/entry-compact.h
index 1aff3be..1d8f57c 100644
--- a/arch/arc/include/asm/entry-compact.h
+++ b/arch/arc/include/asm/entry-compact.h
@@ -231,7 +231,7 @@
 	/* free up r9 as scratchpad */
 	PROLOG_FREEUP_REG r9, @int\LVL\()_saved_reg
 
-	/* Which mode (user/kernel) was the system in when intr occured */
+	/* Which mode (user/kernel) was the system in when intr occurred */
 	lr  r9, [status32_l\LVL\()]
 
 	SWITCH_TO_KERNEL_STK
diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index d426d42..ec2af62 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -12,7 +12,7 @@
  *  - Utilise some unused free bits to confine PTE flags to 12 bits
  *     This is a must for 4k pg-sz
  *
- * vineetg: Mar 2011 - changes to accomodate MMU TLB Page Descriptor mods
+ * vineetg: Mar 2011 - changes to accommodate MMU TLB Page Descriptor mods
  *  -TLB Locking never really existed, except for initial specs
  *  -SILENT_xxx not needed for our port
  *  -Per my request, MMU V3 changes the layout of some of the bits
diff --git a/arch/arc/kernel/stacktrace.c b/arch/arc/kernel/stacktrace.c
index 001de4c..e0efff1 100644
--- a/arch/arc/kernel/stacktrace.c
+++ b/arch/arc/kernel/stacktrace.c
@@ -232,7 +232,7 @@ void show_stack(struct task_struct *tsk, unsigned long *sp)
 }
 
 /* Another API expected by schedular, shows up in "ps" as Wait Channel
- * Ofcourse just returning schedule( ) would be pointless so unwind until
+ * Of course just returning schedule( ) would be pointless so unwind until
  * the function is not in schedular code
  */
 unsigned int get_wchan(struct task_struct *tsk)
diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index 156d983..7d9a736 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -55,8 +55,8 @@
 #define ARC_REG_TIMER1_CTRL	0x101	/* timer 1 control */
 #define ARC_REG_TIMER1_CNT	0x100	/* timer 1 count */
 
-#define TIMER_CTRL_IE		(1 << 0) /* Interupt when Count reachs limit */
-#define TIMER_CTRL_NH		(1 << 1) /* Count only when CPU NOT halted */
+#define TIMER_CTRL_IE	(1 << 0) /* Interrupt when Count reaches limit */
+#define TIMER_CTRL_NH	(1 << 1) /* Count only when CPU NOT halted */
 
 #define ARC_TIMER_MAX	0xFFFFFFFF
 
diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index b65f797..e1d71dc 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -650,7 +650,7 @@ static void __dma_cache_wback_l1(unsigned long start, unsigned long sz)
 
 /*
  * DMA ops for systems with both L1 and L2 caches, but without IOC
- * Both L1 and L2 lines need to be explicity flushed/invalidated
+ * Both L1 and L2 lines need to be explicitly flushed/invalidated
  */
 static void __dma_cache_wback_inv_slc(unsigned long start, unsigned long sz)
 {
diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
index 92dd92c..04f8332 100644
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -18,7 +18,7 @@
 /*
  * HIGHMEM API:
  *
- * kmap() API provides sleep semantics hence refered to as "permanent maps"
+ * kmap() API provides sleep semantics hence referred to as "permanent maps"
  * It allows mapping LAST_PKMAP pages, using @last_pkmap_nr as the cursor
  * for book-keeping
  *
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index daf2bf5..7046c12 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -45,7 +45,7 @@
  *       in interrupt-safe region.
  *
  * Vineetg: April 23rd Bug #93131
- *    Problem: tlb_flush_kernel_range() doesnt do anything if the range to
+ *    Problem: tlb_flush_kernel_range() doesn't do anything if the range to
  *              flush is more than the size of TLB itself.
  *
  * Rahul Trivedi : Codito Technologies 2004
@@ -167,7 +167,7 @@ static void utlb_invalidate(void)
 	/* MMU v2 introduced the uTLB Flush command.
 	 * There was however an obscure hardware bug, where uTLB flush would
 	 * fail when a prior probe for J-TLB (both totally unrelated) would
-	 * return lkup err - because the entry didnt exist in MMU.
+	 * return lkup err - because the entry didn't exist in MMU.
 	 * The Workround was to set Index reg with some valid value, prior to
 	 * flush. This was fixed in MMU v3 hence not needed any more
 	 */
@@ -210,7 +210,7 @@ static void tlb_entry_insert(unsigned int pd0, pte_t pd1)
 
 	/*
 	 * Commit the Entry to MMU
-	 * It doesnt sound safe to use the TLBWriteNI cmd here
+	 * It doesn't sound safe to use the TLBWriteNI cmd here
 	 * which doesn't flush uTLBs. I'd rather be safe than sorry.
 	 */
 	write_aux_reg(ARC_REG_TLBCOMMAND, TLBWrite);
@@ -636,7 +636,7 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long vaddr_unaligned,
  * support.
  *
  * Normal and Super pages can co-exist (ofcourse not overlap) in TLB with a
- * new bit "SZ" in TLB page desciptor to distinguish between them.
+ * new bit "SZ" in TLB page descriptor to distinguish between them.
  * Super Page size is configurable in hardware (4K to 16M), but fixed once
  * RTL builds.
  *
-- 
2.7.0.rc3.207.g0ac5344
