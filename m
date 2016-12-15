From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 15 Dec 2016 11:42:52 -0800
Subject: [GIT PULL] ARC updates for 4.10-rc1
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3d8f50be-214b-8f7c-4678-6ba637787f11@synopsys.com>
To: linux-snps-arc@lists.infradead.org

P.S. This time actually sending to Linus :-)

Hi Linus,

Please pull ARC updates for 4.10-rc1. These are mostly timer/clocksource driver
updates which were Reviewed/Acked by Daniel but had to be merged via ARC tree due
to dependencies.

I will follow up with another pull request with actual ARC changes early next week !

Thx,
-Vineet

----->
The following changes since commit 6a8b2ca702b279bea0e8f0363056439352e2081c:

  ARC: mm: PAE40: Fix crash at munmap (2016-11-29 09:12:08 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
tags/arc-4.10-rc1-part1

for you to fetch changes up to 7badf6fefca8278e749e82411fdb98b123cca50e:

  ARC: axs10x: really enable ARC PGU (2016-11-30 11:54:25 -0800)

----------------------------------------------------------------
ARC updates for 4.10-rc1 (part 1)

 - Moving ARC timer driver into drivers/clocksource
 - EZChip timer driver updates [Noam]
 - ARC AXS103 and HAPS platform updates	[Alexey]

----------------------------------------------------------------
Alexey Brodkin (1):
      ARC: axs10x: really enable ARC PGU

Arnd Bergmann (1):
      clocksource: nps: avoid maybe-uninitialized warning

Noam Camus (3):
      soc: Support for NPS HW scheduling
      clocksource: update "fn" at CLOCKSOURCE_OF_DECLARE() of nps400 timer
      clocksource: Add clockevent support to NPS400 driver

Vineet Gupta (9):
      ARC: timer: gfrc, rtc: deuglify big endian code
      ARC: timer: gfrc, rtc: Read BCR to detect whether hardware exists ...
      ARC: timer: gfrc, rtc: build under same option (64-bit timers)
      ARC: time: move time_init() out of the driver
      ARC: breakout aux handling into a separate header
      ARC: move mcip.h into include/soc and adjust the includes
      ARC: breakout timer include code into separate header ...
      clocksource: import ARC timer driver
      ARC: rename Zebu platform support to HAPS

 .../bindings/timer/ezchip,nps400-timer0.txt        |  17 ++
 ...p,nps400-timer.txt => ezchip,nps400-timer1.txt} |   6 +-
 MAINTAINERS                                        |   1 +
 arch/arc/Kconfig                                   |  13 +-
 arch/arc/boot/dts/axs101.dts                       |   2 +-
 arch/arc/boot/dts/axs103_idu.dts                   |   2 +-
 arch/arc/boot/dts/{zebu_hs.dts => haps_hs.dts}     |   0
 .../boot/dts/{zebu_hs_idu.dts => haps_hs_idu.dts}  |   0
 arch/arc/configs/axs101_defconfig                  |   4 +-
 arch/arc/configs/axs103_smp_defconfig              |   4 +-
 .../{zebu_hs_defconfig => haps_hs_defconfig}       |   2 +-
 ...zebu_hs_smp_defconfig => haps_hs_smp_defconfig} |   2 +-
 arch/arc/configs/nsimosci_hs_smp_defconfig         |   2 +-
 arch/arc/configs/vdk_hs38_smp_defconfig            |   2 +-
 arch/arc/include/asm/arcregs.h                     |  94 +--------
 arch/arc/kernel/Makefile                           |   2 +-
 arch/arc/kernel/mcip.c                             |   2 +-
 arch/arc/kernel/setup.c                            |  17 +-
 arch/arc/plat-axs10x/axs10x.c                      |   2 +-
 arch/arc/plat-eznps/include/plat/ctop.h            |   2 -
 drivers/clocksource/Kconfig                        |  20 ++
 drivers/clocksource/Makefile                       |   1 +
 .../time.c => drivers/clocksource/arc_timer.c      | 110 +++-------
 drivers/clocksource/timer-nps.c                    | 224 +++++++++++++++++++--
 include/soc/arc/aux.h                              |  63 ++++++
 {arch/arc/include/asm => include/soc/arc}/mcip.h   |  10 +-
 include/soc/arc/timers.h                           |  38 ++++
 include/soc/nps/mtm.h                              |  59 ++++++
 28 files changed, 474 insertions(+), 227 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
 rename Documentation/devicetree/bindings/timer/{ezchip,nps400-timer.txt =>
ezchip,nps400-timer1.txt} (52%)
 rename arch/arc/boot/dts/{zebu_hs.dts => haps_hs.dts} (100%)
 rename arch/arc/boot/dts/{zebu_hs_idu.dts => haps_hs_idu.dts} (100%)
 rename arch/arc/configs/{zebu_hs_defconfig => haps_hs_defconfig} (98%)
 rename arch/arc/configs/{zebu_hs_smp_defconfig => haps_hs_smp_defconfig} (98%)
 rename arch/arc/kernel/time.c => drivers/clocksource/arc_timer.c (73%)
 create mode 100644 include/soc/arc/aux.h
 rename {arch/arc/include/asm => include/soc/arc}/mcip.h (95%)
 create mode 100644 include/soc/arc/timers.h
 create mode 100644 include/soc/nps/mtm.h
