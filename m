From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 22 Dec 2016 16:50:52 -0800
Subject: [GIT PULL] ARC updates for 4.10-rc1 part 2
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f33708b1-296d-e74f-e7f5-8341b54e0471@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull.

Thx and Happy holidays !
-Vineet

----------------->
The following changes since commit 7badf6fefca8278e749e82411fdb98b123cca50e:

  ARC: axs10x: really enable ARC PGU (2016-11-30 11:54:25 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
tags/arc-4.10-rc1-part2

for you to fetch changes up to 08fe007968b2b45e831daf74899f79a54d73f773:

  ARC: mm: arc700: Don't assume 2 colours for aliasing VIPT dcache (2016-12-19
11:55:17 -0800)

----------------------------------------------------------------
2nd round of ARC udpates for 4.10rc1

 - Fix for aliasing VIPT dcache in old ARC700 cores

 - micro-optimization in ARC700 ProtV handler

 - Enable SG_CHAIN  [Vladimir]

 - ARC HS38 core intc default to prio 1

----------------------------------------------------------------
Vineet Gupta (5):
      ARC: ARCompact entry: elide re-reading ECR in ProtV handler
      ARCv2: entry: document intr disable in hard isr
      ARCv2: intc: default all interrupts to priority 1
      ARC: mm: No need to save cache version in @cpuinfo
      ARC: mm: arc700: Don't assume 2 colours for aliasing VIPT dcache

Vladimir Kondratiev (1):
      ARC: enable SG chaining

 .../features/io/sg-chain/arch-support.txt          |  2 +-
 arch/arc/Kconfig                                   |  1 +
 arch/arc/include/asm/arcregs.h                     |  2 +-
 arch/arc/include/asm/cacheflush.h                  |  6 +++--
 arch/arc/include/asm/irqflags-arcv2.h              |  6 ++---
 arch/arc/kernel/entry-arcv2.S                      | 24 ++++++++++++++-----
 arch/arc/kernel/entry-compact.S                    |  2 +-
 arch/arc/kernel/intc-arcv2.c                       | 10 ++++----
 arch/arc/mm/cache.c                                | 28 ++++++++++------------
 9 files changed, 46 insertions(+), 35 deletions(-)
