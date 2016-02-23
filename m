From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 23 Feb 2016 14:41:37 +0530
Subject: [PATCH 0/5] ARC IPI related fix
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1456218702-11911-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

This cam eout of debugging a csd deadlock on ARC.
The fix itself is 1/5, rest of patches are additional improvements,
optimizations while we are at it.

Thx,
-Vineet

Vineet Gupta (5):
  ARCv2: SMP: Emulate IPI to self using software triggered interrupt
  ARC: [intc-compact] Remove IPI setup from ARCompact port
  ARCv2: SMP: Push IPI_IRQ into IPI provider
  ARCv2: Elide sending new cross core intr if receiver didn't ack prev
  ARC: SMP: No need for CONFIG_ARC_IPI_DBG

 arch/arc/Kconfig                      |  8 ------
 arch/arc/include/asm/irq.h            |  2 --
 arch/arc/include/asm/irqflags-arcv2.h | 11 ++++++++
 arch/arc/kernel/intc-compact.c        |  3 --
 arch/arc/kernel/mcip.c                | 52 ++++++++++++++++++-----------------
 arch/arc/kernel/smp.c                 |  3 --
 6 files changed, 38 insertions(+), 41 deletions(-)

-- 
2.5.0
