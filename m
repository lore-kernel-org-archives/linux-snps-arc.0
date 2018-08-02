From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 2 Aug 2018 14:48:34 -0700
Subject: [GIT PULL] ARC final updates for 4.18
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a8920aa8-bd15-c27e-f525-da4236065876@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Another batch of fixes for ARC, this time mainly DMA API rework wreckage.

Please pull.

Thx,
-Vineet
--------------------------->
The following changes since commit d72e90f33aa4709ebecc5005562f52335e106a60:

  Linux 4.18-rc6 (2018-07-22 14:12:20 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.18-final

for you to fetch changes up to ec837d620c750c0d4996a907c8c4f7febe1bbeee:

  arc: fix type warnings in arc/mm/cache.c (2018-07-30 11:48:50 -0700)

----------------------------------------------------------------
ARC updates for 4.18

 - Software managed DMA wreckage after rework in 4.17 [Euginey]
   + missing cache flush
   + SMP_CACHE_BYTES vs. cache_line_size

 - allmodconfig build errors [Randy]

 - Maintainer update for Mellanox (EZChip) NPS platform

----------------------------------------------------------------
Eugeniy Paltsev (3):
      ARC: dma [non IOC]: fix arc_dma_sync_single_for_(device|cpu)
      ARC: dma [non-IOC] setup SMP_CACHE_BYTES and cache_line_size
      ARC: add SMP_CACHE_BYTES value validate

Leon Romanovsky (1):
      ARC: Add Ofer Levi as plat-eznps maintainer

Ofer Levi (1):
      ARC: [plat-eznps] Add missing struct nps_host_reg_aux_dpc

Randy Dunlap (4):
      arc: [plat-eznps] fix data type errors in platform headers
      arc: [plat-eznps] fix printk warning in arc/plat-eznps/mtm.c
      arc: fix build errors in arc/include/asm/delay.h
      arc: fix type warnings in arc/mm/cache.c

 MAINTAINERS                             |  1 +
 arch/arc/Kconfig                        |  3 ++
 arch/arc/include/asm/cache.h            |  4 ++-
 arch/arc/include/asm/delay.h            |  3 ++
 arch/arc/mm/cache.c                     | 17 ++++++++++--
 arch/arc/mm/dma.c                       | 49 +++++++++++++++++++++++++++++++--
 arch/arc/plat-eznps/include/plat/ctop.h | 10 +++++++
 arch/arc/plat-eznps/mtm.c               |  6 ++--
 8 files changed, 85 insertions(+), 8 deletions(-)
