From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 9 May 2017 09:15:26 -0700
Subject: [GIT PULL] ARC changes for 4.12-rc1
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <eff5f2bd-192a-65e5-d73a-75cf9e67ceb8@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

ARC updates for 4.12. Please pull !

Thx,
-Vineet

---------------->
The following changes since commit 3d5e80125a6e5649c6bdad8d5780e39ea422c67d:

  ARCv2: entry: save Accumulator register pair (r58:59) if present (2017-04-20
15:37:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.12-rc1

for you to fetch changes up to cf4100d1cddcd243f80ac2af2e4c4273919ff225:

  Revert "ARCv2: Allow enabling PAE40 w/o HIGHMEM" (2017-05-05 13:49:41 -0700)

----------------------------------------------------------------
ARC updates for 4.12

 - AXS10x platform clk updates for I2S, PGU

 - Adding region based cache flush operation for ARCv2 cores

 - Enforcing PAE40 dependency on HIGHMEM

 - ptrace support for additional regs in ARCv2 cores

 - Fix build failure in linux-next dut to a header include ordering change

----------------------------------------------------------------
Alexey Brodkin (1):
      Revert "ARCv2: Allow enabling PAE40 w/o HIGHMEM"

Jose Abreu (2):
      arc: axs10x: Add DT bindings for I2S audio playback
      arc: axs10x: Fix ARC PGU default clock frequency

Vineet Gupta (7):
      ARC: mm: Move full_page computation into cache version agnostic wrapper
      ARCv2: mm: Implement cache region flush operations
      ARCv2: mm: Merge 2 updates to DC_CTRL for region flush
      ARCv2: mm: micro-optimize region flush generated code
      elf: Add ARCv2 specific core note section
      ARCv2: ptrace: provide regset for accumulator/r30 regs
      ARC: mm: fix build failure in linux-next for UP builds

 arch/arc/Kconfig                   |   1 +
 arch/arc/boot/dts/axs10x_mb.dtsi   |  24 ++++++--
 arch/arc/include/asm/cache.h       |   6 ++
 arch/arc/include/asm/mmu.h         |   4 ++
 arch/arc/include/asm/pgtable.h     |   6 +-
 arch/arc/include/uapi/asm/elf.h    |   1 +
 arch/arc/include/uapi/asm/ptrace.h |   5 ++
 arch/arc/kernel/ptrace.c           |  62 ++++++++++++++++++++-
 arch/arc/mm/cache.c                | 111 ++++++++++++++++++++++++++++++++-----
 include/uapi/linux/elf.h           |   2 +-
 10 files changed, 197 insertions(+), 25 deletions(-)
