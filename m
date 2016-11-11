From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Nov 2016 11:04:49 -0800
Subject: [GIT PULL] ARC updates for 4.9-rc5
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e3d08b2a-7d95-b2d9-df5c-9557ed0f4cd4@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Here's a bunch of fixes for ARC for latest RC. Please pull.

Thx,
-Vineet

------------>

  Linux 4.9-rc3 (2016-10-29 13:52:02 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.9-rc5

for you to fetch changes up to 0a0a047def15b7c8bcd27671d2be2de3d37fb30d:

  ARCv2: MCIP: Use IDU_M_DISTRI_DEST mode if there is only 1 destination core
(2016-11-08 12:22:52 -0800)

----------------------------------------------------------------
ARC fixes for 4.9-rc5

 - mmap handler for dma ops as generic handler no longer works for us [Alexey]

 - Fixes for EZChip platform [Noam]

 - Fix RTC clocksource driver build issue

 - ARC IRQ handling fixes [Yuriy]

 - Revert a recent makefile change which doesn't go well with oldish tools out in
 the wild

----------------------------------------------------------------
Alexey Brodkin (2):
      ARC: Enable PERF_EVENTS in nSIM driven platforms
      arc: Implement arch-specific dma_map_ops.mmap

Noam Camus (3):
      ARC: [SMP] avoid overriding present cpumask
      ARC: [plat-eznps] remove IPI clear from SMP operations
      ARC: [plat-eznps] set default baud for early console

Vineet Gupta (3):
      ARC: change return value of userspace cmpxchg assist syscall
      ARC: timer: rtc: implement read loop in "C" vs. inline asm
      Revert "ARC: build: retire old toggles"

Yuriy Kolerov (2):
      ARC: IRQ: Do not use hwirq as virq and vice versa
      ARCv2: MCIP: Use IDU_M_DISTRI_DEST mode if there is only 1 destination core

 arch/arc/Makefile                          |  3 +++
 arch/arc/boot/dts/axc001.dtsi              |  2 +-
 arch/arc/boot/dts/nsim_700.dts             |  2 +-
 arch/arc/boot/dts/nsimosci.dts             |  4 ++++
 arch/arc/configs/nsim_700_defconfig        |  1 +
 arch/arc/configs/nsim_hs_defconfig         |  1 +
 arch/arc/configs/nsim_hs_smp_defconfig     |  1 +
 arch/arc/configs/nsimosci_defconfig        |  1 +
 arch/arc/configs/nsimosci_hs_defconfig     |  1 +
 arch/arc/configs/nsimosci_hs_smp_defconfig |  3 +--
 arch/arc/include/asm/arcregs.h             |  2 ++
 arch/arc/include/asm/smp.h                 |  4 ++--
 arch/arc/kernel/devtree.c                  |  2 ++
 arch/arc/kernel/mcip.c                     | 32 +++++++++++++++++++-----------
 arch/arc/kernel/process.c                  | 20 ++++++++++---------
 arch/arc/kernel/smp.c                      | 23 +++++++++++++--------
 arch/arc/kernel/time.c                     | 19 ++++++++++--------
 arch/arc/mm/dma.c                          | 26 ++++++++++++++++++++++++
 arch/arc/plat-eznps/smp.c                  |  6 ------
 19 files changed, 104 insertions(+), 49 deletions(-)
