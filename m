From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 20 Jul 2018 11:31:19 -0700
Subject: [GIT PULL] ARC updates for 4.18-rc6
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8299319b-bd3a-6a65-e404-e8b7c12d0810@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Hope you are enjoying the summer.

ARC is back after radio silence in 4.17. Please pull changes for 4.18, bunch of
them are stable fodder.

Thx,
-Vineet
------------->
The following changes since commit 29dcea88779c856c7dc92040a0c01233263101d4:

  Linux 4.17 (2018-06-03 14:15:21 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.18-rc6

for you to fetch changes up to af1fc5baa724c63ce1733dfcf855bad5ef6078e3:

  ARCv2: [plat-hsdk]: Save accl reg pair by default (2018-07-19 10:36:45 -0700)

----------------------------------------------------------------
ARC fixes for 4.18-rc6

 - Fix CONFIG_SWAP [Alexey]

 - Robistify cmpxchg emulation for systems w/o atomics [Alexey / PeterZ]

 - Allow mprotext(PROT_EXEC) for stack mappings [Vineet]

 - HSDK platform enable PCIe, APG GPIO [Gustavo]

 - miscll other fixes, config updates etc

----------------------------------------------------------------
Alexey Brodkin (4):
      ARC: Explicitly add -mmedium-calls to CFLAGS
      ARC: Enable machine_desc->init_per_cpu for !CONFIG_SMP
      ARC: configs: Remove CONFIG_INITRAMFS_SOURCE from defconfigs
      ARC: Fix CONFIG_SWAP

Anders Roxell (1):
      ARC: configs: remove no longer needed CONFIG_DEVPTS_MULTIPLE_INSTANCES

Gustavo Pimentel (2):
      ARC: [plat-hsdk] Add PCIe support
      ARC: [plat-hsdk]: Configure APB GPIO controller on ARC HSDK platform

Peter Zijlstra (1):
      ARC: Improve cmpxchg syscall implementation

Vineet Gupta (3):
      ARC: [arcompact] entry.S: minor code movement
      ARC: mm: allow mprotect to make stack mappings executable
      ARCv2: [plat-hsdk]: Save accl reg pair by default

 arch/arc/Kconfig                           |  2 +-
 arch/arc/Makefile                          | 15 +-------
 arch/arc/configs/axs101_defconfig          |  1 -
 arch/arc/configs/axs103_defconfig          |  1 -
 arch/arc/configs/axs103_smp_defconfig      |  1 -
 arch/arc/configs/haps_hs_defconfig         |  1 -
 arch/arc/configs/haps_hs_smp_defconfig     |  1 -
 arch/arc/configs/hsdk_defconfig            |  1 -
 arch/arc/configs/nsim_700_defconfig        |  1 -
 arch/arc/configs/nsim_hs_defconfig         |  1 -
 arch/arc/configs/nsim_hs_smp_defconfig     |  1 -
 arch/arc/configs/nsimosci_defconfig        |  1 -
 arch/arc/configs/nsimosci_hs_defconfig     |  1 -
 arch/arc/configs/nsimosci_hs_smp_defconfig |  1 -
 arch/arc/configs/tb10x_defconfig           |  1 -
 arch/arc/include/asm/entry-compact.h       |  6 +++
 arch/arc/include/asm/entry.h               |  3 --
 arch/arc/include/asm/mach_desc.h           |  2 -
 arch/arc/include/asm/page.h                |  2 +-
 arch/arc/include/asm/pgtable.h             |  2 +-
 arch/arc/kernel/irq.c                      |  2 +-
 arch/arc/kernel/process.c                  | 47 ++++++++++++++++------
 arch/arc/plat-hsdk/Kconfig                 |  3 ++
 arch/arc/plat-hsdk/platform.c              | 62 ++++++++++++++++++++++++++++++
 24 files changed, 112 insertions(+), 47 deletions(-)
