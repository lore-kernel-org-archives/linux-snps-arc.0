From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 19 Mar 2019 14:58:03 -0700
Subject: [GIT PULL] ARC updates for 5.1-rc2
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <84416b56-150b-1725-30de-6ae563862a87@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

please pull. This is rc1 material but I was away from my computer much of last week.

Thx,
-Vineet
---------------->
The following changes since commit 5908e6b738e3357af42c10e1183753c70a0117a9:

  Linux 5.0-rc8 (2019-02-24 16:46:45 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.1-rc2

for you to fetch changes up to 9a18b5a412baf23137c8fddb4ea7f0c14087f31c:

  arch: arc: Kconfig: pedantic formatting (2019-03-11 22:03:18 -0700)

----------------------------------------------------------------
ARC updates for 5.1-rc2

 - unaligned access support for HS cores

 - Removed extra memory barrier around spinlock code

 - HSDK platform updates: enable dmac, reset

 - some more boot logging updates

 - misclleneous minor fixes

----------------------------------------------------------------
Alexey Brodkin (1):
      ARC: DTB: [scripted] fix node name and address spelling

Corentin Labbe (1):
      arc: hsdk_defconfig: Enable CONFIG_BLK_DEV_RAM

Enrico Weigelt, metux IT consult (1):
      arch: arc: Kconfig: pedantic formatting

Eugeniy Paltsev (5):
      ARC: [plat-hsdk]: Add reset controller handle to manage USB reset
      ARC: [plat-hsdk]: Enable AXI DW DMAC support
      ARCv2: lib: introduce memcpy optimized for unaligned access
      ARCv2: Add explcit unaligned access support (and ability to disable too)
      ARC: u-boot args: check that magic number is correct

Vineet Gupta (5):
      ARC: perf: bpok condition only exists for ARCompact
      ARCv2: boot log: refurbish HS core/release identification
      ARC: boot log: cut down on verbosity
      ARC: unaligned: relax the check for gcc supporting -mno-unaligned-access
      ARCv2: spinlock: remove the extra smp_mb before lock, after unlock

 arch/arc/Kconfig                       |  21 +++-
 arch/arc/Makefile                      |   6 +
 arch/arc/boot/dts/abilis_tb100.dtsi    |  58 ++++-----
 arch/arc/boot/dts/abilis_tb100_dvk.dts |  14 +--
 arch/arc/boot/dts/abilis_tb101.dtsi    |  58 ++++-----
 arch/arc/boot/dts/abilis_tb101_dvk.dts |  14 +--
 arch/arc/boot/dts/abilis_tb10x.dtsi    |  60 +++++-----
 arch/arc/boot/dts/axc001.dtsi          |   6 +-
 arch/arc/boot/dts/axc003.dtsi          |  16 +--
 arch/arc/boot/dts/axc003_idu.dtsi      |  16 +--
 arch/arc/boot/dts/axs10x_mb.dtsi       |  22 ++--
 arch/arc/boot/dts/hsdk.dts             |  33 +++++-
 arch/arc/boot/dts/vdk_axc003.dtsi      |   4 +-
 arch/arc/boot/dts/vdk_axc003_idu.dtsi  |   4 +-
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi   |  18 +--
 arch/arc/configs/hsdk_defconfig        |   1 +
 arch/arc/include/asm/arcregs.h         |  12 +-
 arch/arc/include/asm/irqflags-arcv2.h  |   8 +-
 arch/arc/include/asm/perf_event.h      |   2 +-
 arch/arc/include/asm/spinlock.h        |  49 +++-----
 arch/arc/kernel/head.S                 |   6 +
 arch/arc/kernel/intc-arcv2.c           |   2 +-
 arch/arc/kernel/setup.c                | 211 +++++++++++++++++----------------
 arch/arc/kernel/troubleshoot.c         |   5 +-
 arch/arc/lib/Makefile                  |   8 +-
 arch/arc/lib/memcpy-archs-unaligned.S  |  47 ++++++++
 arch/arc/plat-eznps/Kconfig            |  12 +-
 27 files changed, 399 insertions(+), 314 deletions(-)
 create mode 100644 arch/arc/lib/memcpy-archs-unalig
