From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Nov 2016 13:38:44 -0800
Subject: [PATCH v4 0/8] Move ARC timer code into drivers/clocksource/
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478900332-24279-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

This series addresses the long pending move of ARC timer code into
drivers/clocksource/.

Thx,
-Vineet

v3 -> v4

- dropped 2 patches.
  "rtc: implement read loop in "C" vs. inline asm" was a bug fix which is
  merged in upstream already
  "gfrc: boot print alongside other timers" squashed in final patch

- ARC_TIMERS_64BIT now have explicit dependency on ARC_TIMERS to fix the
  build issue when only 64BIT optin is selected		[Daniel]

- 0day build reported error with aux header movement patch - problem is in
  nps irqchip driver, which needs to be fixed before it can start using the
  new header

v2 -> v3

- Fixed a bunch of typos in changelogs				[Daniel]

- aux.h: stubs for {read,write}_aux_reg() inline functions(vs. macros)
  to cleanly avoid warnings in !ARC builds			[Daniel]

- Remove __maybe_used in driver given above			[Daniel]

- Ran checkpatch and fixed some space/tab issues

v1 -> v2

- Now 10 patches instead of 9 to handle BIG ENDIAN in arch agnostic way

- Moved fix for RTC (v1 2/9) ahead of queue (v2 1/10) to allow for easier
  stable backport

- Folded the Kconfig items for RTC and GFRC into single ARC_TIMERS_64BIT
  So no special casing for UP/SMP in Kconfig.
  Driver already handles the UP vs. SMP at runtime as needed

- convert WARN() to pr_warn()				[Daniel]
- Use of _BITUL() vs. constant 0x8000_0000		[Daniel]
- changelog spellos:					[Daniel]
  s/depedency/dependency/
  s/seperate/separate/

v3: http://lists.infradead.org/pipermail/linux-snps-arc/2016-November/001757.html
v2: http://lists.infradead.org/pipermail/linux-snps-arc/2016-November/001724.html
v1: http://lists.infradead.org/pipermail/linux-snps-arc/2016-October/001676.html

Vineet Gupta (8):
  ARC: timer: gfrc, rtc: deuglify big endian code
  ARC: timer: gfrc, rtc: Read BCR to detect whether hardware exists ...
  ARC: time: move time_init() out of the driver
  ARC: timer: Build gfrc, rtc under same option (64-bit timers)
  ARC: breakout aux handling into a separate header
  ARC: move mcip.h into include/soc and adjust the includes
  ARC: breakout timer include code into separate header ...
  clocksource: import ARC timer driver

 MAINTAINERS                                        |   1 +
 arch/arc/Kconfig                                   |  13 +--
 arch/arc/configs/nsimosci_hs_smp_defconfig         |   2 +-
 arch/arc/configs/vdk_hs38_smp_defconfig            |   2 +-
 arch/arc/include/asm/arcregs.h                     |  94 +-----------------
 arch/arc/kernel/Makefile                           |   2 +-
 arch/arc/kernel/mcip.c                             |   2 +-
 arch/arc/kernel/setup.c                            |  17 +++-
 arch/arc/plat-axs10x/axs10x.c                      |   2 +-
 drivers/clocksource/Kconfig                        |  20 ++++
 drivers/clocksource/Makefile                       |   1 +
 .../time.c => drivers/clocksource/arc_timer.c      | 110 ++++++---------------
 include/soc/arc/aux.h                              |  63 ++++++++++++
 {arch/arc/include/asm => include/soc/arc}/mcip.h   |  10 +-
 include/soc/arc/timers.h                           |  38 +++++++
 15 files changed, 181 insertions(+), 196 deletions(-)
 rename arch/arc/kernel/time.c => drivers/clocksource/arc_timer.c (73%)
 create mode 100644 include/soc/arc/aux.h
 rename {arch/arc/include/asm => include/soc/arc}/mcip.h (95%)
 create mode 100644 include/soc/arc/timers.h

-- 
2.7.4
