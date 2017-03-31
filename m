From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 31 Mar 2017 13:49:58 -0700
Subject: [GIT PULL] ARC updates for 4.11-rc5
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <589f0c47-2a54-b5bd-5dc7-63429813f05c@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Accumulated fixes for ARC which I've been been sitting on for a while.
Please pull.

Thx,
-Vineet

------>
The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.11-rc5

for you to fetch changes up to 4c6fabda1ad1dec6d274c098ef0a91809c74f2e3:

  ARC: fix build warnings with !CONFIG_KPROBES (2017-03-30 17:33:20 -0700)

----------------------------------------------------------------
ARC udpates for 4.11-rc5

 - reading clk from driver vs. device tree [Vlad]

 - Fix support for UIO in VDK platform [Alexey]

 - SLC busy bit reading workaround

 - build warning with  kprobes header reorg

----------------------------------------------------------------
Alexey Brodkin (2):
      ARC: vdk: Fix support of UIO
      ARCv2: SLC: Make sure busy bit is set properly on SLC flushing

Vineet Gupta (2):
      ARCv2: make unimplemented vectors as no-ops rather than halt core
      ARC: fix build warnings with !CONFIG_KPROBES

Vlad Zakharov (3):
      ARC: [dts] add input clocks for cpu nodes
      ARC: [dts] add cpu nodes to ARCHS SMP device tree
      ARC: get rate from clk driver instead of reading device tree

 arch/arc/boot/dts/skeleton.dtsi        |  1 +
 arch/arc/boot/dts/skeleton_hs.dtsi     |  1 +
 arch/arc/boot/dts/skeleton_hs_idu.dtsi | 21 ++++++++++++++++++++-
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi   | 20 +++++++++++++-------
 arch/arc/include/asm/kprobes.h         |  4 +---
 arch/arc/kernel/entry-arcv2.S          | 12 +++++++++---
 arch/arc/kernel/setup.c                | 16 ++++++++++++----
 arch/arc/mm/cache.c                    |  3 +++
 8 files changed, 60 insertions(+), 18 deletions(-)
