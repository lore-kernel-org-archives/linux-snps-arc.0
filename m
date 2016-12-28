From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Wed, 28 Dec 2016 11:46:23 +0300
Subject: [PATCH v3 0/3] Fixes for IRQ subsystem
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1482914786-10490-1-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

First 2 patches fix potential bugs in IRQ subsystem. The third one
deprecates setting of affinity in Device Tree and moves setting of
the initial value of affinity to irq_enable() function of IRQ chip.

Changes for v3:
 * Remove patch for manual setting of the global variable
   irq_default_affinity to avoid messing with generic code.
 * Fix 2 potential bugs.
 * Use irq_enable() for setting of the initial value for
   affinity in IDU.

Changes for v2:
 * Set the value of irq_default_affinity to the boot CPU. It is
   necessary because if an interrupt controller is connected to
   IDU then set_affinity() is not called for IDU interrupts and
   the real affinity of IDU does not correspond to the value
   in the descriptor of IRQ (irq_default_affinity by default).


Yuriy Kolerov (3):
  ARC: IRQ: Use hwirq instead of virq in mask/unmask
  ARCv2: IRQ: Call entry/exit functions for chained handlers in MCIP
  ARCv2: MCIP: Deprecate setting of affinity in Device Tree

 .../interrupt-controller/snps,archs-idu-intc.txt   |  3 ++
 arch/arc/kernel/intc-arcv2.c                       |  6 +--
 arch/arc/kernel/intc-compact.c                     |  4 +-
 arch/arc/kernel/mcip.c                             | 56 ++++++++++------------
 4 files changed, 34 insertions(+), 35 deletions(-)

-- 
2.7.4
