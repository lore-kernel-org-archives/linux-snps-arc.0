From: noamc@ezchip.com (Noam Camus)
Date: Tue, 1 Dec 2015 15:02:47 +0200
Subject: [PATCH v3 00/18] *** SUBJECT HERE ***
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

v3:
1)	irqchip: use MACROS instead of structures to decribe
	registers.
2)	clocksource: use 32bit counter and avoid 2 halfs read
	of 64bit dance.

v2:
1)	Remove out of tree platform include path
2)	Move atomic/bitop/cmpxchg for platform to end.
	Remove macro duplication.
	Fix some bad implementation.
3)	define cpu_relax_lowlatency() for platform.
4)	rename init_irq_cpu() to init_per_cpu()
	reorder call to init_per_cpu() for secondary
	use it instead of init_cpu_smp().
5)	set res_service to call stext
6)	fix build failure for CTOP_AUX_BASE at assembly code
7)	Use ilog2 for mtm_init_nat()
8)	Add CLKSRC_NPS option to Kconfig
	change nps_clksrc_read() to be more readable.

General summay:
This set introduce new platform to ARC architecture.
Platform name called "eznps" for working with EZchip NPS400
Network Proccessor.
NPS400 is targeted to service "fast path" network applications.

NPS400 got mesh of 256 extended ARC cores (AKA CTOP), each core
got 16 HW threads. This is basically SMT core where at any point of
time only one HW thread is active.
Each core have HW scheduler that round robin between eligible HW
threads. Totaly, kernel sees 4096 CPUs which I belive is a high record.
There is no cache coherency between cores so generic user applications
and kernel do not use D$.

Cores got special memory mappings for huge pages (8MB).
Mapping is static and should provide application enough memory without
any "TLB miss". This mapping is on top of TLB mapping.

This is a basic set that will later be followed with additional
set of patches with all advanced features.

Many thanks to all people helping to make this happen.

Regards,
Noam Camus

Noam Camus (17):
  Documentation: Add EZchip vendor to binding list
  ARC: [plat-eznps] define IPI_IRQ
  clocksource: Add NPS400 timers driver
  irqchip: add nps Internal and external irqchips
  ARC: Set vmalloc size from configuration
  ARC: rwlock: disable interrupts in !LLSC variant
  ARC: rename smp operation init_irq_cpu() to init_per_cpu()
  ARC: Mark secondary cpu online only after all HW setup is done
  ARC: add CONFIG_CLKSRC_OF support to time_init()
  ARC: [plat-eznps] Add eznps board defconfig and dts
  ARC: [plat-eznps] Add eznps platform
  ARC: [plat-eznps] Use dedicated user stack top
  ARC: [plat-eznps] Use dedicated atomic/bitops/cmpxchg
  ARC: [plat-eznps] Use dedicated SMP barriers
  ARC: [plat-eznps] Use dedicated identity auxiliary register.
  ARC: [plat-eznps] Use dedicated COMMAND_LINE_SIZE
  ARC: Add eznps platform to Kconfig and Makefile

Tal Zilcer (1):
  ARC: [plat-eznps] Use dedicated cpu_relax()

 Documentation/devicetree/bindings/arc/eznps.txt    |    7 +
 .../interrupt-controller/ezchip,nps400-ic.txt      |   17 ++
 .../bindings/timer/ezchip,nps400-timer.txt         |   11 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 MAINTAINERS                                        |    6 +
 arch/arc/Kconfig                                   |    9 +
 arch/arc/Makefile                                  |    5 +
 arch/arc/boot/dts/eznps.dts                        |   76 ++++++
 arch/arc/configs/nps_defconfig                     |   85 +++++++
 arch/arc/include/asm/atomic.h                      |   79 ++++++-
 arch/arc/include/asm/barrier.h                     |    8 +
 arch/arc/include/asm/bitops.h                      |   54 +++++
 arch/arc/include/asm/cmpxchg.h                     |   87 ++++++--
 arch/arc/include/asm/entry-compact.h               |    8 +
 arch/arc/include/asm/irq.h                         |    4 +
 arch/arc/include/asm/pgtable.h                     |    2 +-
 arch/arc/include/asm/processor.h                   |   36 +++-
 arch/arc/include/asm/setup.h                       |    4 +
 arch/arc/include/asm/smp.h                         |    4 +-
 arch/arc/include/asm/spinlock.h                    |   14 +
 arch/arc/kernel/ctx_sw.c                           |   13 +
 arch/arc/kernel/irq.c                              |    4 +-
 arch/arc/kernel/mcip.c                             |    2 +-
 arch/arc/kernel/smp.c                              |   14 +-
 arch/arc/kernel/time.c                             |    4 +
 arch/arc/mm/tlb.c                                  |   12 +
 arch/arc/plat-eznps/Kconfig                        |   34 +++
 arch/arc/plat-eznps/Makefile                       |    7 +
 arch/arc/plat-eznps/entry.S                        |   75 ++++++
 arch/arc/plat-eznps/include/plat/ctop.h            |  250 ++++++++++++++++++++
 arch/arc/plat-eznps/include/plat/mtm.h             |   60 +++++
 arch/arc/plat-eznps/include/plat/smp.h             |   26 ++
 arch/arc/plat-eznps/mtm.c                          |  133 +++++++++++
 arch/arc/plat-eznps/platform.c                     |   27 ++
 arch/arc/plat-eznps/smp.c                          |  149 ++++++++++++
 drivers/clocksource/Kconfig                        |    7 +
 drivers/clocksource/Makefile                       |    1 +
 drivers/clocksource/timer-nps.c                    |   63 +++++
 drivers/irqchip/Makefile                           |    1 +
 drivers/irqchip/irq-eznps.c                        |  213 +++++++++++++++++
 40 files changed, 1576 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arc/eznps.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
 create mode 100644 arch/arc/boot/dts/eznps.dts
 create mode 100644 arch/arc/configs/nps_defconfig
 create mode 100644 arch/arc/plat-eznps/Kconfig
 create mode 100644 arch/arc/plat-eznps/Makefile
 create mode 100644 arch/arc/plat-eznps/entry.S
 create mode 100644 arch/arc/plat-eznps/include/plat/ctop.h
 create mode 100644 arch/arc/plat-eznps/include/plat/mtm.h
 create mode 100644 arch/arc/plat-eznps/include/plat/smp.h
 create mode 100644 arch/arc/plat-eznps/mtm.c
 create mode 100644 arch/arc/plat-eznps/platform.c
 create mode 100644 arch/arc/plat-eznps/smp.c
 create mode 100644 drivers/clocksource/timer-nps.c
 create mode 100644 drivers/irqchip/irq-eznps.c
