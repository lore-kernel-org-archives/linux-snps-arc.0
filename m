From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Sat, 28 Jan 2017 03:01:37 +0300
Subject: [PATCH 0/6] Use build registers for getting numbers of interrupts
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485561703-20921-1-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

A summary:

  * Use build registers for getting numbers of interrupts both for
    core interrupt controller and for IDU interrupt controller.
  * Set a default priority for all core interrupt to prevent
    unexpected switching of banks of registers.
  * Remove option for setting number of interrupts since it does
    not affect a number of interrupts in IRQ domains and breaks
    portability since it is impossible to change size of table of
    interrupts after linkage.

Yuriy Kolerov (6):
  ARCv2: IRQ: Move structures for core intc to the header
  ARCv2: MCIP: Add structure for build register of IDU
  ARCv2: IRQ: Add macro for the first external interrupt number
  ARCv2: IRQ: Remove option for setting number of interrupts
  ARCv2: IRQ: Use build registers for getting numbers of interrupts
  ARCv2: IRQ: Set a default priority for all core interrupts

 arch/arc/Kconfig               | 11 -----------
 arch/arc/include/asm/arcregs.h | 26 +++++++++++++++++++++++++
 arch/arc/include/asm/irq.h     | 32 +++++++++++++++++++++++++++---
 arch/arc/kernel/entry-arcv2.S  |  3 ++-
 arch/arc/kernel/intc-arcv2.c   | 44 ++++++++++++++++++++----------------------
 arch/arc/kernel/mcip.c         | 31 +++++++++++++++++------------
 include/soc/arc/mcip.h         | 17 ++++++++++++++++
 7 files changed, 114 insertions(+), 50 deletions(-)

-- 
2.7.4
