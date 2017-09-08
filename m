From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 8 Sep 2017 10:49:03 -0700
Subject: [GIT PULL] ARC changes for 4.4-rc1
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <28d82061-b6e2-2549-280e-8dc769a7be8e@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

We have a bigger set of updates for ARC this time (mostly because some couldn't 
make last release bus). Please pull.

Thx,
-Vineet

------->
The following changes since commit cc4a41fe5541a73019a864883297bd5043aa6d98:

   Linux 4.13-rc7 (2017-08-27 17:20:40 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.14-rc1

for you to fetch changes up to 1ee55a8f7f6b7ca4c0c59e0b4b4e3584a085c2d3:

   ARC: Re-enable MMU upon Machine Check exception (2017-09-01 11:29:05 -0700)

----------------------------------------------------------------
ARC changes for 4.14-rc1

  - support for HSDK board hosting a Quad core HS38x4 based SoC running @ 1 GHz
    (and some prerrquisite changes such as ability to scoot the kernel code/data
     from start of memory map etc)

  - Quite a few updates for EZChip (Mellanox) platform

  - Fixes to fault/exception printing

----------------------------------------------------------------
Alexey Brodkin (2):
       ARC: Hardcode ARCH_DMA_MINALIGN to max line length we may have
       ARC: [plat-hsdk] initial port for HSDK board

Elad Kanfi (1):
       ARC: [plat-eznps] avoid toggling of DPC register

Eugeniy Paltsev (4):
       ARC: [plat-axs103] use clk driver #1: Get rid of platform specific cpu clk 
setting
       ARC: [plat-axs103] use clk driver #2: Add core pll node to DT to manage cpu clk
       ARCv2: IOC: Tighten up the contraints (specifically base / size alignment)
       ARC: mm: Decouple RAM base address from kernel link address

Jose Abreu (2):
       ARC: Show fault information passed to show_kernel_fault_diag()
       ARC: Re-enable MMU upon Machine Check exception

Liav Rehana (4):
       ARC: typo fix in mm/fault.c
       ARC: typos fix in kernel/entry-compact.S
       ARC: [plat-eznps] Update the init sequence of aux regs per cpu.
       ARC: [plat-eznps] handle extra aux regs #2: kernel/entry exit

Noam Camus (9):
       ARC: [plat-eznps] typo fix at Kconfig
       ARC: [plat-eznps] Fix TLB Errata
       ARC: [plat-eznps] disabled stall counter due to a HW bug
       ARC: [plat-eznps] spinlock aware for MTM
       ARC: [plat-eznps] use schd.wft instruction instead of sleep at idle task
       ARC: [plat-eznps] Handle user memory error same in simulation and silicon
       ARC: set boot print log level to PR_INFO
       ARC: [plat-eznps] new command line argument for HW scheduler at MTM
       ARC: [plat-eznps] handle extra aux regs #1: save/restore on context switch

Vineet Gupta (4):
       ARC: spinlock: Document the EX based spin_unlock
       ARC: create cpu specific version of arch_cpu_idle()
       ARCv2: SLC: provide a line based flush routine for debugging
       ARC: [plat-axs103] refactor the DT fudging code

  Documentation/admin-guide/kernel-parameters.txt |   9 ++
  Documentation/devicetree/bindings/arc/hsdk.txt  |   7 +
  arch/arc/Kconfig                                |  11 +-
  arch/arc/Makefile                               |   1 +
  arch/arc/boot/dts/axc001.dtsi                   |   2 +-
  arch/arc/boot/dts/axc003.dtsi                   |  13 +-
  arch/arc/boot/dts/axc003_idu.dtsi               |  13 +-
  arch/arc/boot/dts/hsdk.dts                      | 189 ++++++++++++++++++++++++
  arch/arc/boot/dts/nsim_hs.dts                   |   2 +-
  arch/arc/configs/hsdk_defconfig                 |  80 ++++++++++
  arch/arc/include/asm/cache.h                    |   5 +-
  arch/arc/include/asm/entry-compact.h            |  24 +++
  arch/arc/include/asm/irqflags-arcv2.h           |   3 -
  arch/arc/include/asm/irqflags-compact.h         |   2 -
  arch/arc/include/asm/page.h                     |   2 +-
  arch/arc/include/asm/processor.h                |  10 ++
  arch/arc/include/asm/ptrace.h                   |   5 +
  arch/arc/include/asm/spinlock.h                 |  12 ++
  arch/arc/include/asm/switch_to.h                |   9 ++
  arch/arc/kernel/devtree.c                       |   5 +-
  arch/arc/kernel/entry-compact.S                 |  22 +--
  arch/arc/kernel/entry.S                         |   6 +
  arch/arc/kernel/process.c                       |  33 ++++-
  arch/arc/kernel/setup.c                         |   6 +-
  arch/arc/kernel/traps.c                         |   4 +-
  arch/arc/kernel/troubleshoot.c                  |   5 +-
  arch/arc/mm/cache.c                             |  83 +++++++++--
  arch/arc/mm/fault.c                             |   2 +-
  arch/arc/mm/init.c                              |   6 +-
  arch/arc/mm/tlb.c                               |   5 +-
  arch/arc/mm/tlbex.S                             |   9 ++
  arch/arc/plat-axs10x/axs10x.c                   | 152 +++----------------
  arch/arc/plat-eznps/Kconfig                     |  26 +++-
  arch/arc/plat-eznps/Makefile                    |   2 +-
  arch/arc/plat-eznps/ctop.c                      |  32 ++++
  arch/arc/plat-eznps/entry.S                     |   2 +-
  arch/arc/plat-eznps/include/plat/ctop.h         |   2 +
  arch/arc/plat-eznps/mtm.c                       |  50 ++++++-
  arch/arc/plat-hsdk/Kconfig                      |   9 ++
  arch/arc/plat-hsdk/Makefile                     |   9 ++
  arch/arc/plat-hsdk/platform.c                   |  66 +++++++++
  41 files changed, 741 insertions(+), 194 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/arc/hsdk.txt
  create mode 100644 arch/arc/boot/dts/hsdk.dts
  create mode 100644 arch/arc/configs/hsdk_defconfig
  create mode 100644 arch/arc/plat-eznps/ctop.c
  create mode 100644 arch/arc/plat-hsdk/Kconfig
  create mode 100644 arch/arc/plat-hsdk/Makefile
  create mode 100644 arch/arc/plat-hsdk/platform.c
