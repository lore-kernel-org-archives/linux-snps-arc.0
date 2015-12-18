From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 18 Dec 2015 12:11:09 +0000
Subject: [GIT PULL] ARC fixes for 4.4-rc6
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E81E1F@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

We ran into a bunch of show stopper issues for perf and stack unwinding.
Please pull.

----------------->
The following changes since commit 31ade3b83e1821da5fbb2f11b5b3d4ab2ec39db8:

  Linux 4.4-rc3 (2015-11-29 18:58:26 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
tags/arc-fixes-for-4.4-rc6

for you to fetch changes up to 575a9d4e2c09675c05db2bc781c5c33153ce932f:

  ARC: smp: Rename platform hook @init_cpu_smp -> @init_per_cpu (2015-12-17
12:56:56 +0530)

----------------------------------------------------------------
ARC Fixes

 - perf interrupts on SMP: Not enabled (at boot) and disabled (at runtime)
 - stack unwinder regression (for modules, ignoring dwarf3)
 - nsim hosed for non default kernel link base builds

----------------------------------------------------------------
Alexey Brodkin (1):
      ARC: [axs10x] cap ethernet phy to 100 Mbit/sec

Noam Camus (1):
      ARC: rename smp operation init_irq_cpu() to init_per_cpu()

Vineet Gupta (8):
      ARCv2: intc: Fix random perf irq disabling in SMP setup
      ARC: intc: No need to clear IRQ_NOAUTOEN
      ARCv2: perf: Ensure perf intr gets enabled on all cores
      ARC: intc: Document arc_request_percpu_irq() better
      ARC: [plat-sim] unbork non default CONFIG_LINUX_LINK_BASE
      ARC: dw2 unwind: Reinstante unwinding out of modules
      ARC: dw2 unwind: Ignore CIE version !=1 gracefully instead of bailing
      ARC: smp: Rename platform hook @init_cpu_smp -> @init_per_cpu

 arch/arc/Kconfig                 |  1 +
 arch/arc/boot/dts/axs10x_mb.dtsi |  1 +
 arch/arc/boot/dts/nsim_hs.dts    |  3 ++-
 arch/arc/include/asm/mach_desc.h |  4 +--
 arch/arc/include/asm/smp.h       |  4 +--
 arch/arc/include/asm/unwind.h    |  4 ---
 arch/arc/kernel/intc-arcv2.c     | 15 ++++++++++--
 arch/arc/kernel/irq.c            | 33 ++++++++++++++++++-------
 arch/arc/kernel/mcip.c           |  2 +-
 arch/arc/kernel/perf_event.c     | 32 +++++++-----------------
 arch/arc/kernel/setup.c          |  1 -
 arch/arc/kernel/smp.c            |  8 +++---
 arch/arc/kernel/unwind.c         | 53 ++++++++++++++++++++++++++--------------
 arch/arc/mm/init.c               |  4 ++-
 14 files changed, 97 insertions(+), 68 deletions(-)
