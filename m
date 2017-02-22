From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 22 Feb 2017 09:29:57 -0800
Subject: [GIT PULL] ARC updates for 4.11-rc1
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a2705cc3-8980-07a1-d929-9af60afd858b@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull

Thx,
-Vineet

------>
The following changes since commit d5adbfcd5f7bcc6fa58a41c5c5ada0e5c826ce2c:

  Linux 4.10-rc7 (2017-02-05 15:10:58 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.11-rc1

for you to fetch changes up to 8ba605b607b7278548c1092b2ac36381627f0839:

  ARC: [plat-*] ARC_HAS_COH_CACHES no longer relevant (2017-02-06 09:37:57 -0800)

----------------------------------------------------------------
ARC updates for 4.11 rc1

 - Intc imporvements [Yuriy]

 - VDK platform updates [Alexey]

----------------------------------------------------------------
Alexey Brodkin (3):
      arc: vdk: Disable halt on reset
      arc: vdk: Add support of MMC controller
      arc: vdk: Add support of UIO

Vineet Gupta (3):
      ARC: [intc-*]: confine NR_CPU_IRQS to intc code
      ARCv2: intc: Use runtime value of irq count for setting up intc
      ARC: [plat-*] ARC_HAS_COH_CACHES no longer relevant

Yuriy Kolerov (7):
      ARCv2: intc: Use ARC_REG_STATUS32 for addressing STATUS32 reg
      ARCv2: intc: Rework the build time irq count information
      ARCv2: intc: Set default priority for all core interrupts
      ARCv2: IDU-intc: Use build registers for getting numbers of interrupts
      ARCv2: IDU-intc: mask all common interrupts by default
      ARCv2: IDU-intc: Delete deprecated parameters in Device Trees
      ARCv2: intc: Delete useless comments in Device Trees

 .../interrupt-controller/snps,archs-idu-intc.txt   | 24 +++--------
 arch/arc/Kconfig                                   | 17 --------
 arch/arc/boot/dts/axc003_idu.dtsi                  | 23 ++---------
 arch/arc/boot/dts/haps_hs_idu.dts                  | 11 +----
 arch/arc/boot/dts/nsim_hs_idu.dts                  | 15 +------
 arch/arc/boot/dts/nsimosci_hs_idu.dts              | 21 ++--------
 arch/arc/boot/dts/vdk_axc003_idu.dtsi              | 13 ++----
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi               | 26 ++++++++++++
 arch/arc/configs/vdk_hs38_smp_defconfig            |  9 +++-
 arch/arc/include/asm/arcregs.h                     |  3 ++
 arch/arc/include/asm/irq.h                         | 10 ++++-
 arch/arc/kernel/entry-arcv2.S                      |  7 +++-
 arch/arc/kernel/intc-arcv2.c                       | 42 +++++++++++++------
 arch/arc/kernel/intc-compact.c                     |  1 +
 arch/arc/kernel/mcip.c                             | 48 +++++++++-------------
 arch/arc/plat-eznps/Kconfig                        |  1 -
 arch/arc/plat-sim/Kconfig                          |  1 -
 include/soc/arc/mcip.h                             | 17 ++++++++
 18 files changed, 138 insertions(+), 151 deletions(-)
