From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 9 Jun 2016 09:46:38 +0530
Subject: [GIT PULL] ARC fixes for 4.7-rc3
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5758EDA6.8080407@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull !

Thx,
-Vineet

---------------->
The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.7-rc3

for you to fetch changes up to ed6aefed726a305bd36344e230d2a9e9301226fc:

  Revert "ARCv2: spinlock/rwlock/atomics: Delayed retry of failed SCOND with
exponential backoff" (2016-06-02 10:59:23 +0530)

----------------------------------------------------------------
ARC updates for 4.7-rc3

- Revert of ll-sc backoff retry workaround in atomics/spinlocks as hardware
  is now proven to work just fine

- Typo fixes (Thanks Andrea Gelmini)

- Removal of obsolete DT property (Alexey)

- Other minor fixes

----------------------------------------------------------------
Alexey Brodkin (1):
      arc: Get rid of root core-frequency property

Andrea Gelmini (1):
      Fix typos

Vineet Gupta (5):
      ARC: [intc-compact] simplify code for 2 priority levels
      ARC: don't enable DISCONTIGMEM unconditionally
      Revert "ARCv2: spinlock/rwlock/atomics: reduce 1 instruction in exponential
backoff"
      Revert "ARCv2: spinlock/rwlock: Reset retry delay when starting a new
spin-wait cycle"
      Revert "ARCv2: spinlock/rwlock/atomics: Delayed retry of failed SCOND with
exponential backoff"

 arch/arc/Kconfig                       |  31 +---
 arch/arc/Makefile                      |   2 +-
 arch/arc/boot/dts/abilis_tb100.dtsi    |   2 -
 arch/arc/boot/dts/abilis_tb101.dtsi    |   2 -
 arch/arc/boot/dts/axc001.dtsi          |   1 -
 arch/arc/boot/dts/axc003.dtsi          |   1 -
 arch/arc/boot/dts/axc003_idu.dtsi      |   1 -
 arch/arc/boot/dts/eznps.dts            |   1 -
 arch/arc/boot/dts/nsim_700.dts         |   1 -
 arch/arc/boot/dts/nsimosci.dts         |   1 -
 arch/arc/boot/dts/nsimosci_hs.dts      |   1 -
 arch/arc/boot/dts/nsimosci_hs_idu.dts  |   1 -
 arch/arc/boot/dts/skeleton.dtsi        |   1 -
 arch/arc/boot/dts/skeleton_hs.dtsi     |   1 -
 arch/arc/boot/dts/skeleton_hs_idu.dtsi |   1 -
 arch/arc/boot/dts/vdk_axc003.dtsi      |   1 -
 arch/arc/boot/dts/vdk_axc003_idu.dtsi  |   1 -
 arch/arc/include/asm/atomic.h          |  45 +----
 arch/arc/include/asm/entry-compact.h   |   4 +-
 arch/arc/include/asm/mmu_context.h     |   2 +-
 arch/arc/include/asm/pgtable.h         |   2 +-
 arch/arc/include/asm/processor.h       |   2 +-
 arch/arc/include/asm/smp.h             |   2 +-
 arch/arc/include/asm/spinlock.h        | 292 ---------------------------------
 arch/arc/include/asm/thread_info.h     |   2 +-
 arch/arc/include/asm/uaccess.h         |   2 +-
 arch/arc/include/uapi/asm/swab.h       |   2 +-
 arch/arc/kernel/entry-compact.S        |  18 +-
 arch/arc/kernel/intc-compact.c         |   6 +-
 arch/arc/kernel/perf_event.c           |   2 +-
 arch/arc/kernel/setup.c                |   2 +-
 arch/arc/kernel/signal.c               |   2 +-
 arch/arc/kernel/troubleshoot.c         |   2 +-
 arch/arc/mm/cache.c                    |   6 +-
 arch/arc/mm/dma.c                      |   2 +-
 35 files changed, 30 insertions(+), 415 deletions(-)
