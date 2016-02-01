From: noamc@ezchip.com (Noam Camus)
Date: Mon, 1 Feb 2016 21:22:46 +0200
Subject: [PATCH 0/2] Adding NPS400 drivers
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454354568-15055-1-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

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

Noam Camus (2):
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
 8 files changed, 282 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
 create mode 100644 drivers/clocksource/timer-nps.c
 create mode 100644 drivers/irqchip/irq-eznps.c
