From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Tue,  8 Nov 2016 10:08:30 +0300
Subject: [PATCH v4 0/2] ARC: Set of patches for IRQ subsystem
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478588912-3991-1-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The first patch fixes misuse of IRQ numbers. In some places of the
Linux kernel for ARC hardware IRQ numbers are used as virtual IRQ
numbers and obviously it is wrong.

The second patch forces the kernel to set a simple distribution mode
for common interrupts in cases when such interrupts are routed to a
single core.

Yuriy Kolerov (2):
  ARC: IRQ: Do not use hwirq as virq and vice versa
  ARCv2: MCIP: Use IDU_M_DISTRI_DEST mode if there is only 1 destination
    core

 arch/arc/include/asm/smp.h |  4 ++--
 arch/arc/kernel/mcip.c     | 33 ++++++++++++++++++++-------------
 arch/arc/kernel/smp.c      | 13 +++++++++----
 3 files changed, 31 insertions(+), 19 deletions(-)

-- 
2.7.4
