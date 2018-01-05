From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 5 Jan 2018 13:06:41 -0800
Subject: [GIT PULL] ARC updates for 4.15-rc7
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <19e6eb47-1653-27da-2e88-77d0e945ff02@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

ARC updates for 4.15-rc7. They have been sitting in for-next for a while but got 
delayed coming your way due to the holidays.

Please pull !

Thx,
-Vineet
-------------------------->
The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

   Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.15-rc7

for you to fetch changes up to af1be2e21203867cb958aaceed5366e2e24b88e8:

   ARC: handle gcc generated __builtin_trap for older compiler (2018-01-03 
00:31:27 -0800)

----------------------------------------------------------------
ARC fixes for 4.15-rc7

  - platform updates for setting up clock correctly

  - Fixes to accomodate newer gcc (__builtin_trap, removed inline asm modifier)

  - Other fixes

----------------------------------------------------------------
Alexey Brodkin (2):
       ARC: Fix detection of dual-issue enabled
       ARC: [plat-hsdk] Switch DisplayLink driver from fbdev to DRM

Eugeniy Paltsev (4):
       ARC: [plat-hsdk]: Set initial core pll output frequency
       ARC: [plat-hsdk]: Get rid of core pll frequency set in platform code
       ARC: [plat-axs103]: Set initial core pll output frequency
       ARC: [plat-axs103] refactor the quad core DT quirk code

Sergey Senozhatsky (1):
       arc: do not use __print_symbol()

Vineet Gupta (3):
       ARC: uaccess: dont use "l" gcc inline asm constraint modifier
       ARC: handle gcc generated __builtin_trap()
       ARC: handle gcc generated __builtin_trap for older compiler

  arch/arc/boot/dts/axc003.dtsi     |  8 ++++++++
  arch/arc/boot/dts/axc003_idu.dtsi |  8 ++++++++
  arch/arc/boot/dts/hsdk.dts        |  8 ++++++++
  arch/arc/configs/hsdk_defconfig   |  5 +++--
  arch/arc/include/asm/uaccess.h    |  5 +++--
  arch/arc/kernel/setup.c           |  2 +-
  arch/arc/kernel/stacktrace.c      |  2 +-
  arch/arc/kernel/traps.c           | 14 +++++++++++++
  arch/arc/kernel/troubleshoot.c    |  3 +++
  arch/arc/plat-axs10x/axs10x.c     | 18 ++++++++---------
  arch/arc/plat-hsdk/platform.c     | 42 ---------------------------------------
  11 files changed, 57 insertions(+), 58 deletions(-)
