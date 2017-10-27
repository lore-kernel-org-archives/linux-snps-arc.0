From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 27 Oct 2017 13:53:33 -0700
Subject: [GIt PULL] ARC fixes for 4.14-rc7
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0c661c32-c1f4-f28f-ab62-6dd8b0c3737f@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull ARC fixes for 4.14-rc7.

Thx,
-Vineet
-------------->
The following changes since commit 8a5776a5f49812d29fe4b2d0a2d71675c3facf3f:

   Linux 4.14-rc4 (2017-10-08 20:53:29 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.14-rc7

for you to fetch changes up to fdbed19697e1aa0f7cb719c11c67f2da26ea7f47:

   ARC: unbork module link errors with !CONFIG_ARC_HAS_LLSC (2017-10-11 17:07:44 
-0700)

----------------------------------------------------------------
ARC fixes for 4.14-rc7

  - Fixes for HSDK platform
  - module build error for !LLSC config

----------------------------------------------------------------
Eugeniy Paltsev (1):
       ARC: [plat-hsdk] Increase SDIO CIU frequency to 50000000Hz

Vineet Gupta (2):
       ARC: [plat-hsdk] select CONFIG_RESET_HSDK from Kconfig
       ARC: unbork module link errors with !CONFIG_ARC_HAS_LLSC

  arch/arc/boot/dts/hsdk.dts      | 11 ++++++-----
  arch/arc/configs/hsdk_defconfig |  1 -
  arch/arc/kernel/smp.c           |  5 +++++
  arch/arc/plat-hsdk/Kconfig      |  1 +
  arch/arc/plat-hsdk/platform.c   | 10 ++++++++++
  5 files changed, 22 insertions(+), 6 deletions(-)
