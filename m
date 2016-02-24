From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 24 Feb 2016 11:16:19 +0530
Subject: [GIT PULL] ARC fixes for 4.5-rc6
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56CD43AB.5030008@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

A critical bug fix since the last pull request and a sweeping defconfig cleanup
from Alexey.

Please pull.

Thx,
-Vineet

---->
The following changes since commit 18558cae0272f8fd9647e69d3fec1565a7949865:

  Linux 4.5-rc4 (2016-02-14 13:05:20 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.5-rc6-fixes

for you to fetch changes up to d73b73f5626ac0b131b31b7b9457e19201bc570b:

  ARC: SMP: No need for CONFIG_ARC_IPI_DBG (2016-02-24 11:07:32 +0530)

----------------------------------------------------------------
ARC fixes for 4.5-rc5
 - Fix for csd deadlock due to missing self IPI
 - Accompanying IPI cleanups / optimization
 - Some boot reporting updates for new features

----------------------------------------------------------------
Alexey Brodkin (1):
      arc: get rid of DEVTMPFS dependency on INITRAMFS_SOURCE

Vineet Gupta (8):
      ARC: Assume multiplier is always present
      ARCv2: boot print Low Latency Memory
      ARCv2: boot report CCMs (Closely Coupled Memories)
      ARCv2: SMP: Emulate IPI to self using software triggered interrupt
      ARC: [intc-compact] Remove IPI setup from ARCompact port
      ARCv2: SMP: Push IPI_IRQ into IPI provider
      ARCv2: Elide sending new cross core intr if receiver didn't ack prev
      ARC: SMP: No need for CONFIG_ARC_IPI_DBG

 arch/arc/Kconfig                           | 18 -------
 arch/arc/Makefile                          |  4 --
 arch/arc/configs/axs101_defconfig          |  4 +-
 arch/arc/configs/axs103_defconfig          | 10 +---
 arch/arc/configs/axs103_smp_defconfig      | 10 +---
 arch/arc/configs/nsim_700_defconfig        |  5 +-
 arch/arc/configs/nsim_hs_defconfig         |  3 +-
 arch/arc/configs/nsim_hs_smp_defconfig     |  6 +--
 arch/arc/configs/nsimosci_defconfig        |  2 +-
 arch/arc/configs/nsimosci_hs_defconfig     |  3 +-
 arch/arc/configs/nsimosci_hs_smp_defconfig | 12 +----
 arch/arc/configs/tb10x_defconfig           | 18 +++----
 arch/arc/include/asm/arcregs.h             | 32 +++++++-----
 arch/arc/include/asm/irq.h                 |  2 -
 arch/arc/include/asm/irqflags-arcv2.h      | 11 ++++
 arch/arc/kernel/entry-arcv2.S              | 11 ++--
 arch/arc/kernel/intc-compact.c             |  3 --
 arch/arc/kernel/mcip.c                     | 55 ++++++++++----------
 arch/arc/kernel/setup.c                    | 80 +++++++++++++++++++-----------
 arch/arc/kernel/smp.c                      |  3 --
 20 files changed, 134 insertions(+), 158 deletions(-)
