From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Sat, 13 Feb 2016 11:47:56 +0000
Subject: [GIT PULL] ARC fixes for 4.5
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E899AD@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

I'd been sitting on some of these fixes for a while.
Please pill.

Thx,
-Vineet
---------------->
The following changes since commit afd2ff9b7e1b367172f18ba7f693dfb62bdcb2dc:

  Linux 4.4 (2016-01-10 15:01:32 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.5-fixes

for you to fetch changes up to 37eda9df5bd8444263418495632ea6ec750f03f9:

  ARC: mm: Introduce explicit super page size support (2016-02-12 12:10:25 +0530)

----------------------------------------------------------------
ARC fixes for 4.5

- Corner case of returning to delay slot from interrupt
- Changing default interrupt prioiry level
- Kconfig'ize support for super pages
- Other minor fixes

----------------------------------------------------------------
Vineet Gupta (6):
      ARCv2: STAR 9000950267: Handle return from intr to Delay Slot #2
      ARCv2: clocksource: Rename GRTC -> GFRC ...
      ARC: shrink cpuinfo by not saving full timer BCR
      ARCv2: Check for LL-SC livelock only if LLSC is enabled
      ARCv2: intc: Allow interruption by lowest priority interrupt
      ARC: mm: Introduce explicit super page size support

 arch/arc/Kconfig                        | 21 ++++++++++++++-
 arch/arc/configs/vdk_hs38_smp_defconfig |  2 +-
 arch/arc/include/asm/arcregs.h          |  3 +--
 arch/arc/include/asm/irqflags-arcv2.h   |  7 +++--
 arch/arc/include/asm/mcip.h             |  4 +--
 arch/arc/include/asm/pgtable.h          | 45 +++++++++++++++++++--------------
 arch/arc/kernel/entry-arcv2.S           | 19 +++++++++++++-
 arch/arc/kernel/intc-arcv2.c            | 41 +++++++++++++++++-------------
 arch/arc/kernel/mcip.c                  | 10 ++++----
 arch/arc/kernel/setup.c                 | 20 ++++++++++-----
 arch/arc/kernel/time.c                  |  8 +++---
 11 files changed, 119 insertions(+), 61 deletions(-)
