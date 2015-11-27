From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 27 Nov 2015 12:14:33 +0000
Subject: [GIT PULL] ARC fixes for 4.4-rc3
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D3F5F@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Fixes for ARC for 4.4-rc3. Please Pull !

---------------->
The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.4-rc3-fixes

for you to fetch changes up to 2e22502c080f27afeab5e6f11e618fb7bc7aea53:

  ARC: dw2 unwind: Remove falllback linear search thru FDE entries (2015-11-23
21:36:49 +0530)

----------------------------------------------------------------
ARC fixes for 4.4-rc3
 - Fix for perf callgraph unwinding causing RCU stalls
 - Fix to enable Linux to run on non-default Interrupt priority 0
 - Removal of pointless SYNC from __switch_to()

----------------------------------------------------------------
Vineet Gupta (5):
      ARC: comments update
      ARC: Abstract out ISA specific SLEEP args
      ARCv2: Use the default irq priority for idle sleep
      ARC: remove SYNC from __switch_to()
      ARC: dw2 unwind: Remove falllback linear search thru FDE entries

sujayraaj (1):
      ARC: switch to arc-linux- CROSS_COMPILE prefix across all configs

 arch/arc/configs/axs101_defconfig          |  2 +-
 arch/arc/configs/axs103_defconfig          |  2 +-
 arch/arc/configs/axs103_smp_defconfig      |  2 +-
 arch/arc/configs/nsim_hs_defconfig         |  2 +-
 arch/arc/configs/nsim_hs_smp_defconfig     |  2 +-
 arch/arc/configs/nsimosci_hs_defconfig     |  2 +-
 arch/arc/configs/nsimosci_hs_smp_defconfig |  2 +-
 arch/arc/configs/vdk_hs38_defconfig        |  2 +-
 arch/arc/configs/vdk_hs38_smp_defconfig    |  2 +-
 arch/arc/include/asm/irqflags-arcv2.h      |  3 +++
 arch/arc/include/asm/irqflags-compact.h    |  2 ++
 arch/arc/kernel/ctx_sw.c                   |  2 --
 arch/arc/kernel/ctx_sw_asm.S               |  3 ---
 arch/arc/kernel/process.c                  |  9 ++++----
 arch/arc/kernel/unwind.c                   | 37 ++++--------------------------
 arch/arc/mm/tlb.c                          |  4 ++--
 16 files changed, 24 insertions(+), 54 deletions(-)
