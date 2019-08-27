From: vineetg76@gmail.com (Vineet Gupta)
Date: Tue, 27 Aug 2019 10:07:47 -0700
Subject: [GIT PULL] ARC fixes for 5.3-rc7
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <41adb7d8-dcf5-3ee9-0ae8-53fe0d614de9@gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Late pull request for ARC as I was off to land of monsoons.
Please pull.

P.S. Using my private email (also on pgp key) due to some interim IT email
shenanigans being sorted out.

Thx,
-Vineet
--------->
The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.3-rc7

for you to fetch changes up to 2f029413cbfbfe519d294c6ac83a0c00e2a48a97:

  arc: prefer __section from compiler_attributes.h (2019-08-26 22:37:12 +0530)

----------------------------------------------------------------
ARC updates for 5.3-rc7

 - Support for Edge Triggered IRQs in ARC IDU intc

 - other fixes here and there

----------------------------------------------------------------
Alexey Brodkin (1):
      ARCv2: entry: early return from exception need not clear U & DE bits

Eugeniy Paltsev (2):
      ARC: fix typo in setup_dma_ops log message
      ARC: [plat-hsdk]: allow to switch between AXI DMAC port configurations

Gustavo A. R. Silva (1):
      ARC: unwind: Mark expected switch fall-throughs

Mischa Jonker (3):
      ARCv2: IDU-intc: Add support for edge-triggered interrupts
      dt-bindings: IDU-intc: Clean up documentation
      dt-bindings: IDU-intc: Add support for edge-triggered interrupts

Nick Desaulniers (1):
      arc: prefer __section from compiler_attributes.h

 .../interrupt-controller/snps,archs-idu-intc.txt   | 30 +++++---
 arch/arc/boot/dts/Makefile                         |  3 +
 arch/arc/include/asm/entry-arcv2.h                 |  2 +-
 arch/arc/include/asm/linkage.h                     |  8 +-
 arch/arc/include/asm/mach_desc.h                   |  3 +-
 arch/arc/kernel/mcip.c                             | 60 +++++++++++++--
 arch/arc/kernel/unwind.c                           |  4 +-
 arch/arc/mm/dma.c                                  |  2 +-
 arch/arc/plat-hsdk/platform.c                      | 87 +++++++++++++++++++---
 include/soc/arc/mcip.h                             | 11 +++
 10 files changed, 172 insertions(+), 38 deletions(-)
