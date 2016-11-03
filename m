From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Thu,  3 Nov 2016 15:23:05 +0300
Subject: [PATCH v3 0/3] ARC: Set of patches for IRQ subsystem
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478175788-3118-1-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

First 2 patches fix misuse of IRQ numbers. In some places of the
Linux kernel for ARC hardware IRQ numbers are used as virtual IRQ
numbers and obviously it is wrong.

The third patch forces the kernel to set a simple distribution mode
for common interrupts in cases when such interrupts are routed
to a single core.

Yuriy Kolerov (3):
  ARC: SMP: Register IPI handler using virq but not hwirq
  ARCv2: MCIP: Use hwirq instead of virq for resolution of IDU IRQ
    handlers
  ARCv2: MCIP: Use IDU_M_DISTRI_DEST mode if there is only 1 destination
    core

 arch/arc/include/asm/smp.h |  4 ++--
 arch/arc/kernel/mcip.c     | 33 ++++++++++++++++++++-------------
 arch/arc/kernel/smp.c      | 13 +++++++++----
 3 files changed, 31 insertions(+), 19 deletions(-)

-- 
2.7.4
