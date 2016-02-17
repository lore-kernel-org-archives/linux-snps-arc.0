From: noamc@ezchip.com (Noam Camus)
Date: Wed, 17 Feb 2016 07:05:40 +0000
Subject: [PATCH v5 0/3] Adding NPS400 drivers
In-Reply-To: <1455216059-29632-1-git-send-email-noamc@ezchip.com>
References: <1455159741-21722-1-git-send-email-noamc@ezchip.com>
 <1455216059-29632-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR02MB1387CDBA065A1CB7C745A7EFD6AE0@HE1PR02MB1387.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Waiting for your feedback on my v5 patch set :)

-----Original Message-----
From: Noam Camus 
Sent: Thursday, February 11, 2016 8:41 PM
To: linux-kernel at vger.kernel.org
Cc: linux-snps-arc at lists.infradead.org; daniel.lezcano at linaro.org; marc.zyngier at arm.com; Chris Metcalf; Tal Zilcer; Gilad Ben Yossef; Noam Camus
Subject: [PATCH v5 0/3] Adding NPS400 drivers

From: Noam Camus <noamc@ezchip.com>

Change Log--
v5:
Clocksource, irqchip - Fix gracefull return.
				replace call to panic() with pr_err() and proper return value.

v4:
clocksource -- Apply all Daniel comments (Thanks)
				Handle gracefull return and also using clocksoure mmio driver at init

v3:
irqchip - Fix ARM build failure by adding missing include of linux/irq.h clocksource -- Avoid 64bit arch's to build driver by adding new dependency !PHYS_ADDR_T_64BIT
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

Now ARC is supporting DT for clockevents and the interrupt controller ARC uses irq domain handling.

Compare to last version now clocksource driver do not include clockevent registration since NPS400 can use ARC generic driver.

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
 drivers/clocksource/Kconfig                        |   10 ++
 drivers/clocksource/Makefile                       |    1 +
 drivers/clocksource/timer-nps.c                    |   82 +++++++++++
 drivers/irqchip/Kconfig                            |    6 +
 drivers/irqchip/Makefile                           |    1 +
 drivers/irqchip/irq-eznps.c                        |  149 +++++++++++++++++++
 include/soc/nps/common.h                           |  150 ++++++++++++++++++++
 9 files changed, 431 insertions(+), 0 deletions(-)  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
 create mode 100644 drivers/clocksource/timer-nps.c  create mode 100644 drivers/irqchip/irq-eznps.c  create mode 100644 include/soc/nps/common.h
