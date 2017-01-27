From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 27 Jan 2017 14:23:56 -0800
Subject: [GIT PULL] ARC updates for 4.10-rc6
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ad361a2d-6ad8-1047-df36-26b4738354bf@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Hopefully last set of changes for ARC for 4.10.

Please pull.

Thx,
-Vineet
----------->
The following changes since commit 7a308bb3016f57e5be11a677d15b821536419d36:

  Linux 4.10-rc5 (2017-01-22 12:54:15 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.10-rc6

for you to fetch changes up to 9aed02feae57bf7a40cb04ea0e3017cb7a998db4:

  ARC: [arcompact] handle unaligned access delay slot corner case (2017-01-27
10:54:20 -0800)

----------------------------------------------------------------
ARC fixes for 4.10-rc6

 - Fix for unaligned access emulation corner case

 - fix for udelay loop inline asm regression

 - Fix irq affinity finally for AXS103 board [Yuriy]

 - Final fixes for setting IO-coherency sanely in SMP

----------------------------------------------------------------
Vineet Gupta (5):
      ARC: udelay: fix inline assembler by adding LP_COUNT to clobber list
      ARCv2: MCIP: update the BCR per current changes
      ARC: smp-boot: Decouple Non masters waiting API from jump to entry point
      ARCv2: smp-boot: wake_flag polling by non-Masters needs to be uncached
      ARC: [arcompact] handle unaligned access delay slot corner case

Yuriy Kolerov (1):
      ARCv2: MCIP: Deprecate setting of affinity in Device Tree

 .../interrupt-controller/snps,archs-idu-intc.txt   |  3 ++
 arch/arc/include/asm/delay.h                       |  4 +-
 arch/arc/kernel/head.S                             | 14 +++---
 arch/arc/kernel/mcip.c                             | 55 +++++++++-------------
 arch/arc/kernel/smp.c                              | 25 ++++++++--
 arch/arc/kernel/unaligned.c                        |  3 +-
 include/soc/arc/mcip.h                             | 16 +++----
 7 files changed, 66 insertions(+), 54 deletions(-)
