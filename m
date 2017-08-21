From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 21 Aug 2017 09:46:52 -0700
Subject: [GIT PULL] ARC fixes for 4.13
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <622c8350-17ae-1e0f-59da-b6da2f72c230@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Apologies for this very late pull request for ARC changes (was away from my 
computer enjoying Indian monsoon).

Please pull.

Thx,
-Vineet
------------------------>
The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

   Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ 
tags/arc-4.13-rc7-fixes

for you to fetch changes up to a8ec3ee861b6e4e6b82a98777c65510ae63766c1:

   arc: Mask individual IRQ lines during core INTC init (2017-08-11 06:38:31 +0530)

----------------------------------------------------------------
ARC fixes for 4.13-rc7

  - PAE40 related updates

  - SLC errata for region ops

  - intc line masking by default

----------------------------------------------------------------
Alexey Brodkin (3):
       ARCv2: SLC: Make sure busy bit is set properly for region ops
       ARCv2: PAE40: Explicitly set MSB counterpart of SLC region ops addresses
       arc: Mask individual IRQ lines during core INTC init

Eugeniy Paltsev (1):
       ARC: [plat-axs10x]: prepare dts files for enabling PAE40 on axs103

Krzysztof Kozlowski (1):
       ARC: defconfig: Cleanup from old Kconfig options

Vineet Gupta (3):
       ARC: [plat-sim] Include this platform unconditionally
       ARC: dma: implement dma_unmap_page and sg variant
       ARCv2: PAE40: set MSB even if !CONFIG_ARC_HAS_PAE40 but PAE exists in SoC

  arch/arc/Kconfig                           |  1 -
  arch/arc/Makefile                          |  2 +-
  arch/arc/boot/dts/axc001.dtsi              | 20 ++++++------
  arch/arc/boot/dts/axc003.dtsi              | 21 ++++++-------
  arch/arc/boot/dts/axc003_idu.dtsi          | 21 ++++++-------
  arch/arc/boot/dts/axs10x_mb.dtsi           |  2 +-
  arch/arc/configs/haps_hs_defconfig         |  1 -
  arch/arc/configs/haps_hs_smp_defconfig     |  1 -
  arch/arc/configs/nps_defconfig             |  1 -
  arch/arc/configs/nsim_700_defconfig        |  1 -
  arch/arc/configs/nsim_hs_defconfig         |  1 -
  arch/arc/configs/nsim_hs_smp_defconfig     |  1 -
  arch/arc/configs/nsimosci_defconfig        |  1 -
  arch/arc/configs/nsimosci_hs_defconfig     |  1 -
  arch/arc/configs/nsimosci_hs_smp_defconfig |  1 -
  arch/arc/configs/tb10x_defconfig           |  1 -
  arch/arc/include/asm/cache.h               |  2 ++
  arch/arc/include/asm/mmu.h                 |  2 ++
  arch/arc/kernel/intc-arcv2.c               |  3 ++
  arch/arc/kernel/intc-compact.c             | 14 ++++++++-
  arch/arc/mm/cache.c                        | 50 +++++++++++++++++++++++++-----
  arch/arc/mm/dma.c                          | 45 +++++++++++++++++++++++++++
  arch/arc/mm/tlb.c                          | 12 ++++++-
  arch/arc/plat-sim/Kconfig                  | 13 --------
  arch/arc/plat-sim/platform.c               |  5 ++-
  25 files changed, 153 insertions(+), 70 deletions(-)
  delete mode 100644 arch/arc/plat-sim/Kconfig
