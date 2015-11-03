From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 3 Nov 2015 11:37:16 +0000
Subject: [GIT PULL] ARC updates for 4.4-rc1
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D02FD@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull.

Thx,
-Vineet
----------------------->
The following changes since commit 049e6dde7e57f0054fdc49102e7ef4830c698b46:

  Linux 4.3-rc4 (2015-10-04 16:57:17 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.4-rc1

for you to fetch changes up to 5a364c2a1762e8a78721fafc93144509c0b6cb84:

  ARC: mm: PAE40 support (2015-10-29 18:41:30 +0530)

----------------------------------------------------------------
- Support for new MM features in ARCv2 cores (THP, PAE40)
  Some generic THP bits are touched - all ACKed by Kirill

- Platform framework updates to prepare for EZChip arrival (still in works)

- ARC Public Mailing list setup finally (linux-snps-arc at lists.infraded.org)

----------------------------------------------------------------
Alexey Brodkin (1):
      ARC: mm: use generic macros _BITUL()/_AC()

Vineet Gupta (41):
      ARC: mm: switch pgtable_to to pte_t *
      ARC: mm: pte flags comsetic cleanups, comments
      ARC: mm: Introduce PTE_SPECIAL
      Documentation/features/vm: pte_special now supported by ARC
      ARCv2: mm: THP support
      ARCv2: mm: THP: boot validation/reporting
      Documentation/features/vm: THP now supported by ARC
      mm: group pte related helpers together
      mm,thp: reduce ifdef'ery for THP in generic code
      mm,thp: introduce flush_pmd_tlb_range
      ARCv2: mm: THP: Implement flush_pmd_tlb_range() optimization
      ARCv2: mm: THP: flush_pmd_tlb_range make SMP safe
      ARC: [arcompact] don't check for hard isr calling local_irq_enable()
      ARC: [arcompact] entry.S: Improve early return from exception
      ARC: [arcompact] entry.S: Document preemption games for L2 intr
      ARC: [arcompact] entry.S: Elide extra check/branch in exception ret path
      ARC: make write_aux_reg safer against macro substitution
      ARC: mm: MMU v1..v3 only selectable for ARCompact ISA based cores
      ARC: mm: compute TLB size as needed from ways * sets
      ARC: boot log: move helper macros to header for reuse
      ARC: boot log: decode more mmu config items
      ARC: smp: Move default boot kick/wait code out of MCIP into common code
      ARC: boot: Support Halt-on-reset and Run-on-reset SMP booting modes
      ARC: smp: irqchip: handle IPI as percpu irq like timer
      ARC: remove @init_time, @init_irq platform callbacks
      ARC: smp: Introduce smp hook @init_early_smp for Master core
      ARCv2: smp: [plat-*]: No need to explicitly call mcip_init_early_smp()
      ARC: smp: Rename platform hook @init_smp -> @init_cpu_smp
      ARC: smp: Introduce smp hook @init_irq_cpu called for all cores
      ARCv2: smp: [plat-*]: No need to explicitly call mcip_init_smp()
      ARC: boot: Non Master cpus only need to call EARLY_CPU_SETUP once
      ARC: Ensure DT mem base is same as what kernel is built with
      MAINTAINERS: Add public mailing list for ARC
      ARC: mm: Improve Duplicate PD Fault handler
      ARC: mm: preps ahead of HIGHMEM support
      ARC: mm: preps ahead of HIGHMEM support #2
      ARC: mm: HIGHMEM: kmap API implementation
      ARC: mm: HIGHMEM: populate high memory from DT
      ARC: mm: PAE40: switch to using phys_addr_t for physical addresses
      ARC: mm: PAE40: tlbex.S: Explicitify the size of pte_t
      ARC: mm: PAE40 support

 Documentation/features/vm/THP/arch-support.txt     |   2 +-
 .../features/vm/pte_special/arch-support.txt       |   2 +-
 MAINTAINERS                                        |   1 +
 arch/arc/Kconfig                                   |  40 ++++
 arch/arc/boot/dts/axc001.dtsi                      |   2 +-
 arch/arc/boot/dts/axc003.dtsi                      |   2 +-
 arch/arc/boot/dts/axc003_idu.dtsi                  |   2 +-
 arch/arc/boot/dts/nsim_hs.dts                      |  12 +-
 arch/arc/boot/dts/skeleton.dtsi                    |   2 +-
 arch/arc/boot/dts/vdk_axc003.dtsi                  |   2 +-
 arch/arc/boot/dts/vdk_axc003_idu.dtsi              |   2 +-
 arch/arc/include/asm/arcregs.h                     |   6 +-
 arch/arc/include/asm/cache.h                       |   2 +
 arch/arc/include/asm/cacheflush.h                  |   8 +-
 arch/arc/include/asm/entry-compact.h               |  13 +-
 arch/arc/include/asm/highmem.h                     |  61 ++++++
 arch/arc/include/asm/hugepage.h                    |  81 +++++++
 arch/arc/include/asm/irq.h                         |   1 +
 arch/arc/include/asm/irqflags-compact.h            |  16 +-
 arch/arc/include/asm/kmap_types.h                  |  18 ++
 arch/arc/include/asm/mach_desc.h                   |  10 +-
 arch/arc/include/asm/mcip.h                        |   3 -
 arch/arc/include/asm/mmu.h                         |   7 +
 arch/arc/include/asm/page.h                        |   9 +-
 arch/arc/include/asm/pgalloc.h                     |  12 +-
 arch/arc/include/asm/pgtable.h                     |  88 ++++----
 arch/arc/include/asm/processor.h                   |   7 +-
 arch/arc/include/asm/setup.h                       |   7 +
 arch/arc/include/asm/smp.h                         |   7 +
 arch/arc/include/asm/tlbflush.h                    |   5 +
 arch/arc/include/uapi/asm/page.h                   |  11 +-
 arch/arc/kernel/entry-arcv2.S                      |   2 +-
 arch/arc/kernel/entry-compact.S                    |  43 ++--
 arch/arc/kernel/head.S                             |  49 +++--
 arch/arc/kernel/intc-compact.c                     |  90 ++------
 arch/arc/kernel/irq.c                              |  20 +-
 arch/arc/kernel/mcip.c                             |  46 +---
 arch/arc/kernel/setup.c                            |   7 +-
 arch/arc/kernel/smp.c                              |  66 +++---
 arch/arc/kernel/time.c                             |   3 -
 arch/arc/kernel/vmlinux.lds.S                      |   2 +-
 arch/arc/mm/Makefile                               |   1 +
 arch/arc/mm/cache.c                                |  91 +++++---
 arch/arc/mm/fault.c                                |  13 +-
 arch/arc/mm/highmem.c                              | 140 ++++++++++++
 arch/arc/mm/init.c                                 | 104 ++++++---
 arch/arc/mm/tlb.c                                  | 234 +++++++++++++++++----
 arch/arc/mm/tlbex.S                                |  51 +++--
 arch/arc/plat-axs10x/axs10x.c                      |   8 -
 arch/arc/plat-sim/platform.c                       |   4 -
 include/asm-generic/pgtable.h                      |  37 +++-
 mm/huge_memory.c                                   |   2 +-
 mm/pgtable-generic.c                               | 100 +++++----
 53 files changed, 1075 insertions(+), 479 deletions(-)
 create mode 100644 arch/arc/include/asm/highmem.h
 create mode 100644 arch/arc/include/asm/hugepage.h
 create mode 100644 arch/arc/include/asm/kmap_types.h
 create mode 100644 arch/arc/mm/highmem.c
