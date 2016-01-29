From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 29 Jan 2016 13:06:34 +0530
Subject: [PATCH 0/5] ARC IRQ setup changes
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454052999-5349-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

This series came out as a result of discussions during EZChip platform code
review.

There is one real fix for irq domain lookup as pointed by Marc.

Please have alook.

Thx,
-Vineet

Vineet Gupta (5):
  ARC: [intc-compact] Remove IPI setup from ARCompact port
  ARC: [intc-compact] setup TIMER as percpu_dev
  ARC: [intc] opencode arc_request_percpu_irq
  ARC: [intc-*] Do a domain lookup in primary handler for hwirq -> linux
    virq
  ARC: [intc-*] switch to linear domain

 arch/arc/Kconfig               |  1 +
 arch/arc/include/asm/irq.h     |  8 +------
 arch/arc/kernel/intc-arcv2.c   | 13 ++++++-----
 arch/arc/kernel/intc-compact.c | 18 +++++++--------
 arch/arc/kernel/irq.c          | 50 ++----------------------------------------
 arch/arc/kernel/smp.c          | 11 +++++++++-
 6 files changed, 31 insertions(+), 70 deletions(-)

-- 
2.5.0
