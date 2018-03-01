From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 1 Mar 2018 14:05:34 -0800
Subject: [GIT PULL] ARC fixes for 4.16-rc4
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <d363d22e-d465-c1de-a665-103543f21cf0@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull ARC fixes for 4.16-rc4.

Thx,
-Vineet

------------------->
The following changes since commit b2cd1df66037e7c4697c7e40496bf7e4a5e16a2d:

   Linux 4.15-rc7 (2018-01-07 14:22:41 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.15-rc4

for you to fetch changes up to a29a25275452c97fe35815f1eb9564f2a07a1965:

   ARC: setup cpu possible mask according to possible-cpus dts property 
(2018-02-28 10:45:32 -0800)

----------------------------------------------------------------
ARC fixes for 4.16-rc4

  - MCIP aka ARconnect fixes for SMP builds [Euginey]

  - Preventive fix for SLC (L2 cache) flushing [Euginey]

  - Kconfig default fix [Ulf Magnusson]

  - trailing semicolon fixes [Luis de Bethencourt]

  - other assorted minor fixes

----------------------------------------------------------------
Alexey Brodkin (2):
       ARCv2: Don't pretend we may set L-bit in STATUS32 with kflag instruction
       ARC: Enable fatal signals on boot for dev platforms

Bartosz Golaszewski (1):
       arc: dts: use 'atmel' as manufacturer for at24 in axs10x_mb

Eugeniy Paltsev (4):
       ARCv2: cache: fix slc_entire_op: flush only instead of flush-n-inv
       ARC: mcip: halt GFRC counter when ARC cores halt
       ARC: mcip: update MCIP debug mask when the new cpu came online
       ARC: setup cpu possible mask according to possible-cpus dts property

Luis de Bethencourt (2):
       ARC: dw2 unwind: Fix trailing semicolon
       ARC: boot log: Fix trailing semicolon

Ulf Magnusson (1):
       ARC: Fix malformed ARC_EMUL_UNALIGNED default

Vineet Gupta (1):
       ARCv2: boot log: fix HS48 release number

  arch/arc/Kconfig                      |  1 -
  arch/arc/boot/dts/axs101.dts          |  2 +-
  arch/arc/boot/dts/axs10x_mb.dtsi      |  4 +-
  arch/arc/boot/dts/haps_hs_idu.dts     |  2 +-
  arch/arc/boot/dts/nsim_700.dts        |  2 +-
  arch/arc/boot/dts/nsim_hs.dts         |  2 +-
  arch/arc/boot/dts/nsim_hs_idu.dts     |  2 +-
  arch/arc/boot/dts/nsimosci.dts        |  2 +-
  arch/arc/boot/dts/nsimosci_hs.dts     |  2 +-
  arch/arc/boot/dts/nsimosci_hs_idu.dts |  2 +-
  arch/arc/include/asm/entry-arcv2.h    |  2 +-
  arch/arc/kernel/mcip.c                | 74 ++++++++++++++++++++++++++++++++---
  arch/arc/kernel/setup.c               |  4 +-
  arch/arc/kernel/smp.c                 | 50 ++++++++++++++++++-----
  arch/arc/kernel/unwind.c              |  2 +-
  arch/arc/mm/cache.c                   |  5 ++-
  include/soc/arc/mcip.h                |  5 +++
  17 files changed, 132 insertions(+), 31 deletions(-)
