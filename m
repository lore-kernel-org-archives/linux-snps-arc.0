From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 16 Sep 2019 14:06:25 -0700
Subject: [PATCH 0/6] ignore @ 2.06
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190916210625.9780-1-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

This is set of patches almost lost in one of my older branches. I decided to
clean them and post given the work on newer MMU.

Thx,
-Vineet

Vineet Gupta (6):
  ARCv2: mm: TLB Miss optim: SMP builds can cache pgd pointer in mmu
    scratch reg
  ARCv2: mm: TLB Miss optim: Use double world load/stores LDD/STD
  ARC: mm: TLB Miss optim: avoid re-reading ECR
  ARC: mm: tlb flush optim: Make TLBWriteNI fallback to TLBWrite if not
    available
  ARC: mm: tlb flush optim: elide repeated uTLB invalidate in loop
  ARC: mm: tlb flush optim: elide redundant uTLB invalidates for MMUv3

 arch/arc/include/asm/entry-compact.h |  4 +-
 arch/arc/include/asm/mmu.h           |  6 +++
 arch/arc/include/asm/mmu_context.h   |  2 +-
 arch/arc/include/asm/pgtable.h       |  2 +-
 arch/arc/mm/tlb.c                    | 81 +++++++++++-----------------
 arch/arc/mm/tlbex.S                  | 18 ++++---
 6 files changed, 51 insertions(+), 62 deletions(-)

-- 
2.20.1
