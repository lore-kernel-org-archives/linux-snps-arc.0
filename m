From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Sat, 21 Jan 2017 13:57:40 -0800
Subject: [GIT PULL] ARC updates for 4.10-rc5
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <9b6c6214-b0c6-df7c-773f-065a596adf89@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull.

Thx,
-Vineet

---------------->
The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.10-rc5

for you to fetch changes up to d0e73e2ac6a6b157159e1e62f981c06d29f42336:

  ARC: Revert "ARC: mm: IOC: Don't enable IOC by default" (2017-01-18 19:21:06 -0800)

----------------------------------------------------------------
ARC updates for 4.10-rc5

 - More intc updates [Yuriv]

 - Fix module build when unwinder is turned off

 - IO Coherency Programming model updates

 - Other miscll

----------------------------------------------------------------
Vineet Gupta (8):
      ARC: mmu: clarify the MMUv3 programming model
      ARCv2: save r30 on kernel entry as gcc uses it for code-gen
      ARC: module: Fix !CONFIG_ARC_DW2_UNWIND builds
      ARCv2: IOC: refactor the IOC and SLC operations into own functions
      ARCv2: IOC: Adhere to progamming model guidelines to avoid DMA corruption
      ARCv2: IOC: Use actual memory size to setup aperture size
      ARC: mm: split arc_cache_init to allow __init reaping of bulk
      ARC: Revert "ARC: mm: IOC: Don't enable IOC by default"

Yuriy Kolerov (2):
      ARC: IRQ: Use hwirq instead of virq in mask/unmask
      ARCv2: IRQ: Call entry/exit functions for chained handlers in MCIP

 arch/arc/Kconfig                   |   2 +-
 arch/arc/include/asm/cache.h       |   9 ++-
 arch/arc/include/asm/entry-arcv2.h |   2 +
 arch/arc/include/asm/module.h      |   4 +-
 arch/arc/include/asm/ptrace.h      |   2 +-
 arch/arc/include/asm/setup.h       |   1 +
 arch/arc/kernel/intc-arcv2.c       |   6 +-
 arch/arc/kernel/intc-compact.c     |   4 +-
 arch/arc/kernel/mcip.c             |   4 +
 arch/arc/kernel/module.c           |   4 +-
 arch/arc/mm/cache.c                | 155 +++++++++++++++++++++++++++++--------
 arch/arc/mm/init.c                 |   5 ++
 12 files changed, 151 insertions(+), 47 deletions(-)
