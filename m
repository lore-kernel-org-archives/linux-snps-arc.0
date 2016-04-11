From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 11 Apr 2016 13:42:13 +0530
Subject: [GIT PULL] ARC fixes for 4.6-rc4
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <570B5C5D.7020209@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull.

Thx,
-Vineet

-------------->
The following changes since commit 9735a22799b9214d17d3c231fe377fc852f042e9:

  Linux 4.6-rc2 (2016-04-03 09:09:40 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.6-rc4-fixes

for you to fetch changes up to 0dee6c82c2aa5342357dabd0e536a97f72039f0b:

  ARC: [plat-axs103] Enable loop block devices (2016-04-07 14:59:09 +0530)

----------------------------------------------------------------
ARC fixes for 4.6-rc4

 - Kconfig splat due to pcie rework
 - Making ethernet work again on axs103
 - Provide fb_pgprotect() for future Video driver integration

----------------------------------------------------------------
Alexey Brodkin (2):
      arc: Add our own implementation of fb_pgprotect()
      ARC: [plat-axs103] Enable loop block devices

Andreas Ziegler (1):
      ARC: Don't source drivers/pci/pcie/Kconfig ourselves

Vineet Gupta (1):
      Revert "ARC: [plat-axs10x] add Ethernet PHY description in .dts"

 arch/arc/Kconfig                      |  1 -
 arch/arc/boot/dts/axs10x_mb.dtsi      |  8 --------
 arch/arc/configs/axs103_defconfig     |  1 +
 arch/arc/configs/axs103_smp_defconfig |  1 +
 arch/arc/include/asm/fb.h             | 19 +++++++++++++++++++
 5 files changed, 21 insertions(+), 9 deletions(-)
 create mode 100644 arch/arc/include/asm/fb.h
