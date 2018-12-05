From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 5 Dec 2018 15:46:35 -0800
Subject: [GIT PULL] ARC updates for 4.20-rc6
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c156a393-7f72-4606-b8fd-d976e8565f52@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull.

Thx,
-Vineet

-------------------------------->
The following changes since commit ccda4af0f4b92f7b4c308d3acc262f4a7e3affad:

  Linux 4.20-rc2 (2018-11-11 17:12:31 -0600)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.20-rc6

for you to fetch changes up to 10d443431dc2bb733cf7add99b453e3fb9047a2e:

  ARC: io.h: Implement reads{x}()/writes{x}() (2018-11-30 11:26:29 -0800)

----------------------------------------------------------------
ARC fixes/updates for 4.20-rc6

 - Missing reads{x}()/writes{x}() getting in the way of some drivers [Jose Abreu]

 - Builds defaulting to ARCv2 ISA based configsa [Kevin Hilman]

 - Miscll fixes

----------------------------------------------------------------
Alexey Brodkin (1):
      arc: [devboards] Add support of NFSv3 ACL

Bartlomiej Zolnierkiewicz (1):
      ARC: remove redundant 'default n' from Kconfig

Eugeniy Paltsev (3):
      ARC: IOC: panic if kernel was started with previously enabled IOC
      ARC: [plat-hsdk] Enable DW APB GPIO support
      ARC: mm: fix uninitialised signal code in do_page_fault

Jose Abreu (1):
      ARC: io.h: Implement reads{x}()/writes{x}()

Kevin Hilman (1):
      ARC: change defconfig defaults to ARCv2

Vineet Gupta (1):
      ARCv2: boot log unaligned access in use

 arch/arc/Kconfig                           | 13 +-----
 arch/arc/Makefile                          |  2 +-
 arch/arc/boot/dts/hsdk.dts                 | 15 +++++++
 arch/arc/configs/axs101_defconfig          |  2 +
 arch/arc/configs/axs103_defconfig          |  1 +
 arch/arc/configs/axs103_smp_defconfig      |  1 +
 arch/arc/configs/hsdk_defconfig            |  4 ++
 arch/arc/configs/nps_defconfig             |  2 +
 arch/arc/configs/nsim_700_defconfig        |  1 +
 arch/arc/configs/nsimosci_defconfig        |  2 +
 arch/arc/configs/nsimosci_hs_defconfig     |  1 +
 arch/arc/configs/nsimosci_hs_smp_defconfig |  1 +
 arch/arc/configs/tb10x_defconfig           |  1 +
 arch/arc/configs/vdk_hs38_defconfig        |  1 +
 arch/arc/configs/vdk_hs38_smp_defconfig    |  1 +
 arch/arc/include/asm/cache.h               |  2 +
 arch/arc/include/asm/io.h                  | 72 ++++++++++++++++++++++++++++++
 arch/arc/kernel/setup.c                    |  9 ++--
 arch/arc/mm/cache.c                        | 20 +++++++--
 arch/arc/mm/fault.c                        |  2 +-
 20 files changed, 133 insertions(+), 20 deletions(-)
