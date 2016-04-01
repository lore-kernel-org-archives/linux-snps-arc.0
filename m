From: noamca@mellanox.com (Noam Camus)
Date: Fri, 1 Apr 2016 23:21:22 +0300
Subject: [PATCH v7 0/3] Adding NPS400 drivers
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1459542085-3065-1-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

Change Log--
v7:
Rebased on latest HEAD (4.6-rc1)
Added change log to all patches to ease review.

v6:
Files headers changed to start with:
Copyright (c) 2016, Mellanox Technologies
...

This is due to the acquisition of EZchip made by Mellanox.
One can still find "EZchip" used in tree, and this is ok.

This patch set is a requierement before I can insert new platform to ARC,
one that supports the NPS400 SoC.

v5:
Clocksource, irqchip - Fix gracefull return.
				replace call to panic() with pr_err() and proper return value.

v4:
clocksource -- Apply all Daniel comments (Thanks)
				Handle gracefull return and also using clocksoure mmio driver at init

v3:
irqchip - Fix ARM build failure by adding missing include of linux/irq.h
clocksource -- Avoid 64bit arch's to build driver by adding new dependency !PHYS_ADDR_T_64BIT
				This is since we use explicit io access of 32 bit. So for test coverage we allow
				not only build for ARC, but restrict it to 32 bit arch's.
irqchip - Apply all Thomas comments (Thank you)

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

 .../interrupt-controller/ezchip,nps400-ic.txt      |   17 ++
 .../bindings/timer/ezchip,nps400-timer.txt         |   15 ++
 drivers/clocksource/Kconfig                        |   10 ++
 drivers/clocksource/Makefile                       |    1 +
 drivers/clocksource/timer-nps.c                    |   98 ++++++++++++
 drivers/irqchip/Kconfig                            |    6 +
 drivers/irqchip/Makefile                           |    1 +
 drivers/irqchip/irq-eznps.c                        |  165 +++++++++++++++++++
 include/soc/nps/common.h                           |  166 ++++++++++++++++++++
 9 files changed, 479 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
 create mode 100644 drivers/clocksource/timer-nps.c
 create mode 100644 drivers/irqchip/irq-eznps.c
 create mode 100644 include/soc/nps/common.h
