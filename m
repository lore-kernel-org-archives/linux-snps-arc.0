From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 3 Jun 2019 14:04:16 -0700
Subject: [GIT PULL] ARC updates for 5.2-rc4
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e1a01d01-fccc-fab8-7022-9a18bb4d8f10@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull.

Thx,
-Vineet
------------------------->
The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.2-rc4

for you to fetch changes up to 46e04c25e72f002d0d14be072300c2dd827d99b6:

  ARC: [plat-hsdk] Get rid of inappropriate PHY settings (2019-05-28 10:09:31 -0700)

----------------------------------------------------------------
ARC fixes for 5.2-rc4

 - Fix for userspace trying to access kernel vaddr space

 - HSDK platform DT updates

 - Cleanup some build warnings

----------------------------------------------------------------
Alexey Brodkin (1):
      ARC: [plat-hsdk] Get rid of inappropriate PHY settings

Eugeniy Paltsev (3):
      ARC: mm: SIGSEGV userspace trying to access kernel virtual memory
      ARC: [plat-hsdk]: enable creg-gpio controller
      ARC: [plat-hsdk]: Add support of Vivante GPU

Jose Abreu (2):
      ARC: [plat-hsdk]: Add missing multicast filter bins number to GMAC node
      ARC: [plat-hsdk]: Add missing FIFO size entry in GMAC node

Vineet Gupta (1):
      ARC: fix build warnings

 arch/arc/boot/dts/hsdk.dts      | 45 +++++++++++++++++++++++++++++++++++++----
 arch/arc/configs/hsdk_defconfig |  3 ++-
 arch/arc/include/asm/cmpxchg.h  | 14 +++++++++----
 arch/arc/mm/fault.c             |  9 +++------
 arch/arc/mm/tlb.c               | 13 +++++++-----
 5 files changed, 64 insertions(+), 20 deletions(-)
