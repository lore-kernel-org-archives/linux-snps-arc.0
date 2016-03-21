From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 21 Mar 2016 10:30:29 +0530
Subject: [GIT PULL] ARC changes for 4.6-rc1
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56EF7FED.6050601@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

ARC changes for 4.6-rc1. Nothing too exciting here although diffstat hows more
files touched than usual due to some sweeping defconfig / DT updates.

Please pull !

Thx,
-Vineet
------------->
The following changes since commit fc77dbd34c5c99bce46d40a2491937c3bcbd10af:

  Linux 4.5-rc6 (2016-02-28 08:41:20 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.6-rc1

for you to fetch changes up to deaf7565eb618a80534844300aeacffa14125182:

  ARCv2: ioremap: Support dynamic peripheral address space (2016-03-19 14:34:10 +0530)

----------------------------------------------------------------
ARC updates for 4.6-rc1
- Big Endian io accessors fix [Lada]
- Spellos fixes [Adam]
- Fix for DW GMAC breakage [Alexey]
- Making DMA API 64-bit ready
- Shutting up -Wmaybe-uninitialized noise for ARC
- Other minor fixes here and there, comments update

----------------------------------------------------------------
Adam Buchbinder (1):
      ARC: Fix misspellings in comments.

Alexey Brodkin (1):
      ARC: [plat-axs10x] add Ethernet PHY description in .dts

Kefeng Wang (1):
      arc: use of_platform_default_populate() to populate default bus

Lada Trimasova (2):
      ARC: [BE] readl()/writel() to work in Big Endian CPU configuration
      arc: [plat-nsimosci*] use ezchip network driver

Vineet Gupta (16):
      ARC: bitops: Remove non relevant comments
      ARC: [BE] Select correct CROSS_COMPILE prefix
      ARC: [*defconfig] No need to specify CONFIG_CROSS_COMPILE
      ARCv2: Allow enabling PAE40 w/o HIGHMEM
      ARC: build: Better way to detect ISA compatible toolchain
      ARC: [plat-nsim] document ranges
      ARC: mm: Use virt_to_pfn() for addr >> PAGE_SHIFT pattern
      ARCv2: LLSC: software backoff is NOT needed starting HS2.1c
      ARC: thp: unbork !CONFIG_TRANSPARENT_HUGEPAGE build
      ARC: build: Turn off -Wmaybe-uninitialized for ARC gcc 4.8
      ARC: dma: Use struct page based page allocator helpers
      ARC: dma: non-coherent pages need V-P mapping if in HIGHMEM
      ARC: dma: pass_phys() not sg_virt() to cache ops
      ARC: dma: ioremap: use phys_addr_t consistenctly in code paths
      ARC: dma: reintroduce platform specific dma<->phys
      ARCv2: ioremap: Support dynamic peripheral address space

 arch/arc/Kconfig                           |  6 ++-
 arch/arc/Makefile                          | 22 ++++++++-
 arch/arc/boot/dts/axs10x_mb.dtsi           |  8 ++++
 arch/arc/boot/dts/nsim_hs.dts              |  3 +-
 arch/arc/boot/dts/nsimosci.dts             |  5 +-
 arch/arc/boot/dts/nsimosci_hs.dts          |  5 +-
 arch/arc/boot/dts/nsimosci_hs_idu.dts      |  5 +-
 arch/arc/configs/axs101_defconfig          |  1 -
 arch/arc/configs/axs103_defconfig          |  1 -
 arch/arc/configs/axs103_smp_defconfig      |  1 -
 arch/arc/configs/nsim_700_defconfig        |  1 -
 arch/arc/configs/nsim_hs_defconfig         |  1 -
 arch/arc/configs/nsim_hs_smp_defconfig     |  1 -
 arch/arc/configs/nsimosci_defconfig        |  2 +-
 arch/arc/configs/nsimosci_hs_defconfig     |  2 +-
 arch/arc/configs/nsimosci_hs_smp_defconfig |  3 +-
 arch/arc/configs/tb10x_defconfig           |  1 -
 arch/arc/configs/vdk_hs38_defconfig        |  1 -
 arch/arc/configs/vdk_hs38_smp_defconfig    |  1 -
 arch/arc/include/asm/arcregs.h             |  6 ---
 arch/arc/include/asm/bitops.h              | 15 ------
 arch/arc/include/asm/cache.h               |  1 +
 arch/arc/include/asm/cacheflush.h          |  6 +--
 arch/arc/include/asm/cmpxchg.h             |  2 +-
 arch/arc/include/asm/dma-mapping.h         |  7 +++
 arch/arc/include/asm/entry-compact.h       |  2 +-
 arch/arc/include/asm/io.h                  | 22 ++++++---
 arch/arc/include/asm/page.h                | 19 +++-----
 arch/arc/include/asm/pgtable.h             | 11 ++---
 arch/arc/include/asm/tlbflush.h            |  7 ++-
 arch/arc/kernel/setup.c                    | 21 ++-------
 arch/arc/kernel/stacktrace.c               |  2 +-
 arch/arc/kernel/time.c                     |  4 +-
 arch/arc/mm/cache.c                        | 39 +++++++++-------
 arch/arc/mm/dma.c                          | 75 ++++++++++++++++++++----------
 arch/arc/mm/highmem.c                      |  2 +-
 arch/arc/mm/ioremap.c                      | 37 ++++++++++-----
 arch/arc/mm/tlb.c                          |  8 ++--
 38 files changed, 201 insertions(+), 155 deletions(-)
