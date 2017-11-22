From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 22 Nov 2017 12:11:08 -0800
Subject: [GIT PULL] ARC updates for 4.15-rc1
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <eaa3335c-fd43-d69d-d2ea-7af3ecce4a9c@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull ARC updates for 4.15-rc1: nothing too fancy here !

And in the spirit of Thanks giving, thank you for creating this amazing project 
(and giving a whole new connotation to the term "hacker"). God knows what we all 
would have been doing if Linux was not around to play with.

Thx,
-Vineet

--------------------->
The following changes since commit 0b07194bb55ed836c2cc7c22e866b87a14681984:

   Linux 4.14-rc7 (2017-10-29 13:58:38 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.15-rc1

for you to fetch changes up to 82385732b1c9d6a22942b5fe6e48a99891cb806f:

   ARC: perf: avoid vmalloc backed mmap (2017-11-21 15:21:08 -0800)

----------------------------------------------------------------
ARC updates for 4.15-rc1

  - More changes for HS48 cores: supporting MMUv5, detecting new micro-arch gizmos

  - axs10x platform wiring up reset driver merged in this cycle

  - ARC perf driver optimizations

----------------------------------------------------------------
Eugeniy Paltsev (1):
       ARC: [plat-axs10x] DTS: Add reset controller node to manage ethernet reset

Vineet Gupta (6):
       ARC: [plat-axs10x] auto-select AXS101 or AXS103 given the  ISA config
       ARCv2: Accomodate HS48 MMUv5 by relaxing MMU ver checking
       ARCv2: boot log: updates for HS48: dual-issue, ECC, Loop Buffer
       ARCv2: perf: tweak overflow interrupt
       ARCv2: perf: optimize given that num counters <= 32
       ARC: perf: avoid vmalloc backed mmap

  arch/arc/Kconfig                 |  2 +-
  arch/arc/boot/dts/axs10x_mb.dtsi |  8 ++++++
  arch/arc/include/asm/arcregs.h   | 33 ++++++++++++++++++++++-
  arch/arc/kernel/perf_event.c     | 40 ++++++++++++++--------------
  arch/arc/kernel/setup.c          | 43 +++++++++++++++++++++++++++---
  arch/arc/mm/tlb.c                | 57 +++++++++++++++++++++++-----------------
  arch/arc/plat-axs10x/Kconfig     |  2 ++
  arch/arc/plat-axs10x/axs10x.c    |  7 -----
  8 files changed, 136 insertions(+), 56 deletions(-)
