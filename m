From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 13 Apr 2016 17:10:00 +0530
Subject: [PATCH v4 0/5] Modernize ARC clocksource/clockevent/intc drivers
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1460547605-26184-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

This is a partial repost of a series [1] which improves the ARC clock* drivers.
I've also included the patches to switch the core intc from legacy to linear
domains (as suggested by Marc Z a while back).

These are stepping stones for eventual landing into driver/*

Please review !

Thx,
-Vineet


[1] http://lists.infradead.org/pipermail/linux-snps-arc/2016-March/000653.html

Vineet Gupta (5):
  ARC: clockevent: DT based probe
  ARC: clocksource: DT based probe
  ARC: irq: export some IRQs again
  ARC: [intc-*] Do a domain lookup in primary handler for hwirq -> linux
    virq
  ARC: [intc-*] switch to linear domain

 arch/arc/Kconfig               |   1 +
 arch/arc/include/asm/irq.h     |   9 +--
 arch/arc/kernel/intc-arcv2.c   |  17 +++--
 arch/arc/kernel/intc-compact.c |  14 ++--
 arch/arc/kernel/irq.c          |   9 +--
 arch/arc/kernel/mcip.c         |   7 +-
 arch/arc/kernel/setup.c        |   3 -
 arch/arc/kernel/time.c         | 169 +++++++++++++++++++++++++----------------
 8 files changed, 131 insertions(+), 98 deletions(-)

-- 
2.5.0
