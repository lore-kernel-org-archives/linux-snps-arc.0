From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 22 Feb 2019 09:42:38 -0800
Subject: [GIT PULL] ARC updates for 5.0 final
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3c904d38-fba8-dfa7-fa56-4817abfd58de@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull bunch of fixes for ARC for 5.0, bunch of those are stable fodder
anyways so sooner the better.

Thx,
-Vineet
------------------>
The following changes since commit f17b5f06cb92ef2250513a1e154c47b78df07d40:

  Linux 5.0-rc4 (2019-01-27 15:18:05 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.0-final

for you to fetch changes up to 7b2e932f633bcb7b190fc7031ce6dac75f8c3472:

  ARCv2: don't assume core 0x54 has dual issue (2019-02-21 14:53:36 -0800)

----------------------------------------------------------------
ARC fixes for 5.0 final

 - Fix memcpy to prevent prefetchw beyond end of buffer [Eugeniy]

 - Enable unaligned access early to prevent exceptions given newer gcc
   code gen [Eugeniy]

 - Tighten up uboot arg checking to prevent false negatives and also
   allow both jtag and bootloading to coexist w/o config option as
   needed by kernelCi folks [Eugeniy]

 - Set slab alignment to 8 for ARC to avoid the atomic64_t unalign [Alexey]

 - Disable regfile auto save on interrupts on HSDK platform due to a
   silicon issue  [Vineet]

 - Avoid HS38x boot printing crash by not reading HS48x only reg [Vineet]

----------------------------------------------------------------
Alexey Brodkin (1):
      ARC: define ARCH_SLAB_MINALIGN = 8

Eugeniy Paltsev (5):
      ARCv2: Enable unaligned access in early ASM code
      ARCv2: lib: memcpy: fix doing prefetchw outside of buffer
      ARC: fix actionpoints configuration detection
      ARC: U-boot: check arguments paranoidly
      ARC: enable uboot support unconditionally

Vineet Gupta (3):
      ARC: uacces: remove lp_start, lp_end from clobber list
      ARCv2: support manual regfile save on interrupts
      ARCv2: don't assume core 0x54 has dual issue

 arch/arc/Kconfig                        |  20 +++---
 arch/arc/configs/nps_defconfig          |   1 -
 arch/arc/configs/vdk_hs38_defconfig     |   1 -
 arch/arc/configs/vdk_hs38_smp_defconfig |   2 -
 arch/arc/include/asm/arcregs.h          |   8 +++
 arch/arc/include/asm/cache.h            |  11 +++
 arch/arc/include/asm/entry-arcv2.h      |  54 +++++++++++++++
 arch/arc/include/asm/uaccess.h          |   8 +--
 arch/arc/kernel/entry-arcv2.S           |   4 +-
 arch/arc/kernel/head.S                  |  16 +++--
 arch/arc/kernel/intc-arcv2.c            |   2 +
 arch/arc/kernel/setup.c                 | 119 +++++++++++++++++++++++---------
 arch/arc/lib/memcpy-archs.S             |  14 ----
 arch/arc/plat-hsdk/Kconfig              |   1 +
 14 files changed, 188 insertions(+), 73 deletions(-)
