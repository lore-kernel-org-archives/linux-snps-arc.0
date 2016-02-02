From: noamc@ezchip.com (Noam Camus)
Date: Tue, 2 Feb 2016 15:14:56 +0200
Subject: [PATCH v2 0/3] Adding NPS400 drivers
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454418899-25500-1-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

Change Log--
v2:
Add header file include/soc/nps/common.h.
Now to build we do not depend on ARC subtree.

General summay:
Both drivers are now apart of previous basic patch set of new platform for ARC.
The rest is now can be seen at ARC srctree:
https://git.kernel.org/cgit/linux/kernel/git/vgupta/arc.git/

Now ARC is supporting DT for clockevents and the interrupt controller ARC
uses irq domain handling.

Compare to last version now clocksource driver do not include clockevent registration
since NPS400 can use ARC generic driver.

Compare to last version now irqchip driver sets domain as default since it is the root domain.
Also mapping of IPI is done in this driver.

Last thing is that drivers can be build cleanly for i386 (still runs only for ARC)
Note: in order to build we need to merge drivers into srctree which includes new header:
soc/nps/common.h
This header is part of patch set applied to ARC srctree.

Regards,
Noam Camus

Noam Camus (3):
  soc: Support for EZchip SoC
  clocksource: Add NPS400 timers driver
  irqchip: add nps Internal and external irqchips

 .../interrupt-controller/ezchip,nps400-ic.txt      |   17 +++
 .../bindings/timer/ezchip,nps400-timer.txt         |   15 ++
 drivers/clocksource/Kconfig                        |    7 +
 drivers/clocksource/Makefile                       |    1 +
 drivers/clocksource/timer-nps.c                    |   84 +++++++++++
 drivers/irqchip/Kconfig                            |    6 +
 drivers/irqchip/Makefile                           |    1 +
 drivers/irqchip/irq-eznps.c                        |  151 ++++++++++++++++++++
 include/soc/nps/common.h                           |  140 ++++++++++++++++++
 9 files changed, 422 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
 create mode 100644 drivers/clocksource/timer-nps.c
 create mode 100644 drivers/irqchip/irq-eznps.c
 create mode 100644 include/soc/nps/common.h
