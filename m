From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 6 Oct 2017 14:23:22 -0700
Subject: [GIT PULL] ARC updates for 4.14-rc4
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f80509d5-ad04-d4db-3aa5-169681af20d2@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

ARC updates - Please pull !

Thx,
-Vineet

------------------>
The following changes since commit 9e66317d3c92ddaab330c125dfe9d06eee268aff:

   Linux 4.14-rc3 (2017-10-01 14:54:54 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.14-rc4

for you to fetch changes up to ab8eb7db1dcc03e7ae9eb379884fd701af6b1a38:

   ARC: [plat-hsdk]: Add reset controller node to manage ethernet reset 
(2017-10-06 08:59:54 -0700)

----------------------------------------------------------------
ARC udpates for 4.14-rc4

  - Updates for various platforms

  - boot log updates for upcoming HS48 family of cores (dual issue)

----------------------------------------------------------------
Alexey Brodkin (1):
       ARC: [*defconfig] Reenable soft lock-up detector

Eugeniy Paltsev (6):
       ARC: [plat-axs103] Add temporary quirk to reset ethernet IP
       ARC: [plat-hsdk] sdio: Temporary fix of sdio ciu frequency
       ARC: [plat-axs10x] sdio: Temporary fix of sdio ciu frequency
       ARC: [plat-hsdk] use actual clk driver to manage cpu clk
       ARC: [plat-hsdk]: Temporary fix to set CPU frequency to 1GHz
       ARC: [plat-hsdk]: Add reset controller node to manage ethernet reset

Masahiro Yamada (1):
       arc: remove redundant UTS_MACHINE define in arch/arc/Makefile

Vineet Gupta (4):
       ARC: [plat-eznps] Update platform maintainer as Noam left
       ARC: boot log: decontaminate ARCv2 ISA_CONFIG register
       ARCv2: boot log: identify HS48 cores (dual issue)
       ARC: fix allnoconfig build warning

  MAINTAINERS                             |  3 ++-
  arch/arc/Kconfig                        |  2 +-
  arch/arc/Makefile                       |  2 --
  arch/arc/boot/dts/axs10x_mb.dtsi        |  9 ++++++-
  arch/arc/boot/dts/hsdk.dts              | 32 ++++++++++++++++++++++---
  arch/arc/configs/axs101_defconfig       |  2 +-
  arch/arc/configs/axs103_defconfig       |  2 +-
  arch/arc/configs/axs103_smp_defconfig   |  2 +-
  arch/arc/configs/haps_hs_smp_defconfig  |  2 +-
  arch/arc/configs/hsdk_defconfig         |  3 ++-
  arch/arc/configs/vdk_hs38_defconfig     |  2 +-
  arch/arc/configs/vdk_hs38_smp_defconfig |  2 +-
  arch/arc/include/asm/arcregs.h          | 11 +++++----
  arch/arc/kernel/setup.c                 | 32 +++++++++++++++++++------
  arch/arc/plat-axs10x/axs10x.c           |  7 ++++++
  arch/arc/plat-hsdk/Kconfig              |  3 ++-
  arch/arc/plat-hsdk/platform.c           | 42 +++++++++++++++++++++++++++++++++
  17 files changed, 130 insertions(+), 28 deletions(-)
