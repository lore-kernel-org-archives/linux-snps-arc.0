From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 8 Mar 2016 17:56:03 +0530
Subject: [PATCH v2 0/9] ARC clockevent/clocksource modernization
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

This mini-series came out as a result of discussions during EZChip platform
code review.

This switches ARC timers to DT based probe and removes the homebrew clk API
we had before.

@Rob could you please take a look at the DT bindings.
@Daniel any comments would be appreciated !

Thx,
-Vineet

changes since v1:
- Primarily timer0/timer1 folded into one (more details in respective patches)

[v1]
http://lists.infradead.org/pipermail/linux-snps-arc/2016-February/000445.html

Alexey Brodkin (3):
  ARC: use fixed frequencies in arc_set_early_base_baud()
  ARC: [plat-axs] Don't use arc_{get|set}_core_freq() for manipulating
    core clk
  ARC: RIP arc_{get|set}_core_freq() clk API

Noam Camus (2):
  ARC: clockevent: switch to cpu notifier for clockevent setup
  ARC: clockevent: Prepare for DT based probe

Vineet Gupta (4):
  ARC: [dts] Add clk feeding into timers to DTs
  ARC: [dts] Introduce Timer bindings
  ARC: clockevent: DT based probe
  ARC: clocksource: DT based probe

 .../devicetree/bindings/timer/snps,arc-timer.txt   |  26 +++
 .../devicetree/bindings/timer/snps,archs-gfrc.txt  |  14 ++
 .../devicetree/bindings/timer/snps,archs-rtc.txt   |  14 ++
 arch/arc/Kconfig                                   |   3 +-
 arch/arc/boot/dts/abilis_tb10x.dtsi                |  14 ++
 arch/arc/boot/dts/axc001.dtsi                      |   6 +
 arch/arc/boot/dts/axc003.dtsi                      |   6 +
 arch/arc/boot/dts/axc003_idu.dtsi                  |   6 +
 arch/arc/boot/dts/nsim_700.dts                     |   6 +
 arch/arc/boot/dts/nsim_hs.dts                      |   6 +
 arch/arc/boot/dts/nsim_hs_idu.dts                  |   6 +
 arch/arc/boot/dts/nsimosci.dts                     |   6 +
 arch/arc/boot/dts/nsimosci_hs.dts                  |   6 +
 arch/arc/boot/dts/nsimosci_hs_idu.dts              |   6 +
 arch/arc/boot/dts/skeleton.dtsi                    |  14 ++
 arch/arc/boot/dts/skeleton_hs.dtsi                 |  20 ++
 arch/arc/boot/dts/skeleton_hs_idu.dtsi             |  14 ++
 arch/arc/boot/dts/vdk_axc003.dtsi                  |   6 +
 arch/arc/boot/dts/vdk_axc003_idu.dtsi              |   6 +
 arch/arc/include/asm/clk.h                         |  22 --
 arch/arc/include/asm/irq.h                         |  10 -
 arch/arc/kernel/Makefile                           |   2 +-
 arch/arc/kernel/clk.c                              |  21 --
 arch/arc/kernel/devtree.c                          |  13 +-
 arch/arc/kernel/intc-compact.c                     |   2 +
 arch/arc/kernel/mcip.c                             |   4 +-
 arch/arc/kernel/setup.c                            |  17 +-
 arch/arc/kernel/smp.c                              |   2 -
 arch/arc/kernel/time.c                             | 224 +++++++++++++--------
 arch/arc/plat-axs10x/axs10x.c                      |  27 ++-
 30 files changed, 361 insertions(+), 168 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
 delete mode 100644 arch/arc/include/asm/clk.h
 delete mode 100644 arch/arc/kernel/clk.c

-- 
2.5.0
