From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 31 Oct 2016 15:48:07 -0700
Subject: [PATCH 0/9] Move ARC timer code into drivers/clocksource/
In-Reply-To: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477954096-770-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

This series addresses the long pending move of ARC timer code into
drivers/clocksource/.

- patches [1-4]/9 are improvements to arc code, paving way for later code motion.
- patches [5-8]/9 refactor the arc headers to be shared between arc and drivers
- patch 9/9 moves out the driver code/build/Kconfig bits

As review progresses/concludes, I'd like to merge [1-8] for this merge window and
clocksource maintainers can pick up the actual switch for 4.10 or even 4.9 as they
prefer.

Thx,
-Vineet

 MAINTAINERS                                        |  1 +
 arch/arc/Kconfig                                   | 12 +--
 arch/arc/configs/nsimosci_hs_smp_defconfig         |  2 +-
 arch/arc/configs/vdk_hs38_smp_defconfig            |  2 +-
 arch/arc/include/asm/arcregs.h                     | 94 +---------------------
 arch/arc/kernel/Makefile                           |  2 +-
 arch/arc/kernel/mcip.c                             |  2 +-
 arch/arc/kernel/setup.c                            | 17 +++-
 arch/arc/plat-axs10x/axs10x.c                      |  2 +-
 drivers/clocksource/Kconfig                        | 24 ++++++
 drivers/clocksource/Makefile                       |  1 +
 .../time.c => drivers/clocksource/arc_timer.c      | 69 +++++-----------
 include/soc/arc/aux.h                              | 52 ++++++++++++
 {arch/arc/include/asm => include/soc/arc}/mcip.h   | 10 +--
 include/soc/arc/timers.h                           | 24 ++++++
 include/soc/nps/common.h                           |  4 +-
 16 files changed, 151 insertions(+), 167 deletions(-)
 rename arch/arc/kernel/time.c => drivers/clocksource/arc_timer.c (83%)
 create mode 100644 include/soc/arc/aux.h
 rename {arch/arc/include/asm => include/soc/arc}/mcip.h (95%)
 create mode 100644 include/soc/arc/timers.h

-- 
2.7.4
