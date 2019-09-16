From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 16 Sep 2019 14:32:02 -0700
Subject: [PATCH 1/6] ARCv2: mm: TLB Miss optim: SMP builds can cache pgd
 pointer in mmu scratch reg
In-Reply-To: <20190916213207.12792-1-vgupta@synopsys.com>
References: <20190916213207.12792-1-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190916213207.12792-2-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC700 exception (and intr handling) didn't have auto stack switching
thus had to rely on stashing a reg temporarily (to free it up) at a
known place in memory, allowing to code up the low level stack switching.
This however was not re-entrant in SMP which thus had to repurpose the
per-cpu MMU SCRATCH DATA register otherwise used to "cache" the task pdg
pointer (vs. reading it from mm struct)

The newer HS cores do have auto-stack switching and thus even SMP builds
can use the MMU SCRATCH reg as originally intended.

This patch fixes the restriction to ARC700 SMP builds only

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/entry-compact.h | 4 ++--
 arch/arc/include/asm/mmu.h           | 4 ++++
 arch/arc/include/asm/mmu_context.h   | 2 +-
 arch/arc/include/asm/pgtable.h       | 2 +-
 arch/arc/mm/tlb.c                    | 2 +-
 arch/arc/mm/tlbex.S                  | 2 +-
 6 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arc/include/asm/entry-compact.h b/arch/arc/include/asm/entry-compact.h
index 66a292335ee6..c3aa775878dc 100644
--- a/arch/arc/include/asm/entry-compact.h
+++ b/arch/arc/include/asm/entry-compact.h
@@ -130,7 +130,7 @@
  * to be saved again on kernel mode stack, as part of pt_regs.
  *-------------------------------------------------------------*/
 .macro PROLOG_FREEUP_REG	reg, mem
-#ifdef CONFIG_SMP
+#ifndef ARC_USE_SCRATCH_REG
 	sr  \reg, [ARC_REG_SCRATCH_DATA0]
 #else
 	st  \reg, [\mem]
@@ -138,7 +138,7 @@
 .endm
 
 .macro PROLOG_RESTORE_REG	reg, mem
-#ifdef CONFIG_SMP
+#ifndef ARC_USE_SCRATCH_REG
 	lr  \reg, [ARC_REG_SCRATCH_DATA0]
 #else
 	ld  \reg, [\mem]
diff --git a/arch/arc/include/asm/mmu.h b/arch/arc/include/asm/mmu.h
index 98cadf1a09ac..0abacb82a72b 100644
--- a/arch/arc/include/asm/mmu.h
+++ b/arch/arc/include/asm/mmu.h
@@ -40,6 +40,10 @@
 #define ARC_REG_SCRATCH_DATA0	0x46c
 #endif
 
+#if defined(CONFIG_ISA_ARCV2) || !defined(CONFIG_SMP)
+#define	ARC_USE_SCRATCH_REG
+#endif
+
 /* Bits in MMU PID register */
 #define __TLB_ENABLE		(1 << 31)
 #define __PROG_ENABLE		(1 << 30)
diff --git a/arch/arc/include/asm/mmu_context.h b/arch/arc/include/asm/mmu_context.h
index 035470816be5..3a5e6a5b9ed6 100644
--- a/arch/arc/include/asm/mmu_context.h
+++ b/arch/arc/include/asm/mmu_context.h
@@ -144,7 +144,7 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	 */
 	cpumask_set_cpu(cpu, mm_cpumask(next));
 
-#ifndef CONFIG_SMP
+#ifdef ARC_USE_SCRATCH_REG
 	/* PGD cached in MMU reg to avoid 3 mem lookups: task->mm->pgd */
 	write_aux_reg(ARC_REG_SCRATCH_DATA0, next->pgd);
 #endif
diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 1d87c18a2976..210eb1df17df 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -351,7 +351,7 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
  * Thus use this macro only when you are certain that "current" is current
  * e.g. when dealing with signal frame setup code etc
  */
-#ifndef CONFIG_SMP
+#ifdef ARC_USE_SCRATCH_REG
 #define pgd_offset_fast(mm, addr)	\
 ({					\
 	pgd_t *pgd_base = (pgd_t *) read_aux_reg(ARC_REG_SCRATCH_DATA0);  \
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 10025e199353..417f05ac4397 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -868,7 +868,7 @@ void arc_mmu_init(void)
 	write_aux_reg(ARC_REG_PID, MMU_ENABLE);
 
 	/* In smp we use this reg for interrupt 1 scratch */
-#ifndef CONFIG_SMP
+#ifdef ARC_USE_SCRATCH_REG
 	/* swapper_pg_dir is the pgd for the kernel, used by vmalloc */
 	write_aux_reg(ARC_REG_SCRATCH_DATA0, swapper_pg_dir);
 #endif
diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index c55d95dd2f39..d6fbdeda400a 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -193,7 +193,7 @@ ex_saved_reg1:
 
 	lr  r2, [efa]
 
-#ifndef CONFIG_SMP
+#ifdef ARC_USE_SCRATCH_REG
 	lr  r1, [ARC_REG_SCRATCH_DATA0] ; current pgd
 #else
 	GET_CURR_TASK_ON_CPU  r1
-- 
2.20.1
