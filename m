From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Nov 2016 16:33:35 -0700
Subject: [PATCH v3 10/10] clocksource: import ARC timer driver
In-Reply-To: <1478216015-18931-1-git-send-email-vgupta@synopsys.com>
References: <1478216015-18931-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478216015-18931-11-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This adds support for

 - CONFIG_ARC_TIMERS : legacy 32-bit TIMER0 and TIMER1 which count UP
   from @CNT to @LIMIT, before optionally triggering an interrupt.
   These are programmed using ARC auxiliary register interface.
   These are present in all ARC cores (ARC700 and ARC HS38)
   TIMER0 serves as clockevent for all ARC linux builds.
   TIMER1 is used for clocksource in arc700 builds.

 - CONFIG_ARC_TIMERS_64BIT: 64-bit counters, RTC and GFRC found in
   ARC HS38 cores. These are independnet IP blocks with different
   programming model respectively.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 MAINTAINERS                                        |  1 +
 arch/arc/Kconfig                                   |  7 ++----
 arch/arc/kernel/Makefile                           |  2 +-
 drivers/clocksource/Kconfig                        | 19 +++++++++++++++
 drivers/clocksource/Makefile                       |  1 +
 .../time.c => drivers/clocksource/arc_timer.c      | 27 +++++-----------------
 6 files changed, 30 insertions(+), 27 deletions(-)
 rename arch/arc/kernel/time.c => drivers/clocksource/arc_timer.c (90%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3d838cf49f81..57b56ff1dd68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11632,6 +11632,7 @@ S:	Supported
 F:	arch/arc/
 F:	Documentation/devicetree/bindings/arc/*
 F:	Documentation/devicetree/bindings/interrupt-controller/snps,arc*
+F:	drivers/clocksource/arc_timer.c
 F:	drivers/tty/serial/arc_uart.c
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git
 
diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index bde3e558d8bc..ab12723d39a0 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -8,9 +8,9 @@
 
 config ARC
 	def_bool y
+	select ARC_TIMERS
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
 	select BUILDTIME_EXTABLE_SORT
-	select CLKSRC_OF
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select GENERIC_ATOMIC64 if !ISA_ARCV2 || !(ARC_HAS_LL64 && ARC_HAS_LLSC)
@@ -115,6 +115,7 @@ config ISA_ARCOMPACT
 
 config ISA_ARCV2
 	bool "ARC ISA v2"
+	select ARC_TIMERS_64BIT
 	help
 	  ISA for the Next Generation ARC-HS cores
 
@@ -410,10 +411,6 @@ config ARC_HAS_DIV_REM
 	bool "Insn: div, divu, rem, remu"
 	default y
 
-config ARC_TIMERS_64BIT
-	bool "64-bit r/o cycle counters RTC (up) and GFRC (smp)"
-	default y
-
 config ARC_NUMBER_OF_INTERRUPTS
 	int "Number of interrupts"
 	range 8 240
diff --git a/arch/arc/kernel/Makefile b/arch/arc/kernel/Makefile
index cfcdedf52ff8..8942c5c3b4c5 100644
--- a/arch/arc/kernel/Makefile
+++ b/arch/arc/kernel/Makefile
@@ -8,7 +8,7 @@
 # Pass UTS_MACHINE for user_regset definition
 CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
 
-obj-y	:= arcksyms.o setup.o irq.o time.o reset.o ptrace.o process.o devtree.o
+obj-y	:= arcksyms.o setup.o irq.o reset.o ptrace.o process.o devtree.o
 obj-y	+= signal.o traps.o sys.o troubleshoot.o stacktrace.o disasm.o
 obj-$(CONFIG_ISA_ARCOMPACT)		+= entry-compact.o intc-compact.o
 obj-$(CONFIG_ISA_ARCV2)			+= entry-arcv2.o intc-arcv2.o
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index e2c6e43cf8ca..a53bd50164e7 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -282,6 +282,25 @@ config CLKSRC_MPS2
 	select CLKSRC_MMIO
 	select CLKSRC_OF
 
+config ARC_TIMERS
+	bool "Support for 32-bit TIMERn counters in ARC Cores" if COMPILE_TEST
+	depends on GENERIC_CLOCKEVENTS
+	select CLKSRC_OF
+	help
+	  These are legacy 32-bit TIMER0 and TIMER1 counters found on all ARC cores
+	  (ARC700 as well as ARC HS38).
+	  TIMER0 serves as clockevent while TIMER1 provides clocksource
+
+config ARC_TIMERS_64BIT
+	bool "Support for 64-bit counters in ARC HS38 cores" if COMPILE_TEST
+	depends on GENERIC_CLOCKEVENTS
+	select CLKSRC_OF
+	help
+	  This enables 2 different 64-bit timers: RTC (for UP) and GFRC (for SMP)
+	  RTC is implemented inside the core, while GFRC sits outside the core in
+	  ARConnect IP block. Driver automatically picks one of them for clocksource
+	  as appropriate.
+
 config ARM_ARCH_TIMER
 	bool
 	select CLKSRC_OF if OF
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index cf87f407f1ad..a14111e1f087 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_CLKSRC_TI_32K)	+= timer-ti-32k.o
 obj-$(CONFIG_CLKSRC_NPS)	+= timer-nps.o
 obj-$(CONFIG_OXNAS_RPS_TIMER)	+= timer-oxnas-rps.o
 
+obj-$(CONFIG_ARC_TIMERS)		+= arc_timer.o
 obj-$(CONFIG_ARM_ARCH_TIMER)		+= arm_arch_timer.o
 obj-$(CONFIG_ARM_GLOBAL_TIMER)		+= arm_global_timer.o
 obj-$(CONFIG_ARMV7M_SYSTICK)		+= armv7m_systick.o
diff --git a/arch/arc/kernel/time.c b/drivers/clocksource/arc_timer.c
similarity index 90%
rename from arch/arc/kernel/time.c
rename to drivers/clocksource/arc_timer.c
index 94b9cd169374..a49748d826c0 100644
--- a/arch/arc/kernel/time.c
+++ b/drivers/clocksource/arc_timer.c
@@ -1,32 +1,18 @@
 /*
+ * Copyright (C) 2016-17 Synopsys, Inc. (www.synopsys.com)
  * Copyright (C) 2004, 2007-2010, 2011-2012 Synopsys, Inc. (www.synopsys.com)
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
- *
- * vineetg: Jan 1011
- *  -sched_clock( ) no longer jiffies based. Uses the same clocksource
- *   as gtod
- *
- * Rajeshwarr/Vineetg: Mar 2008
- *  -Implemented CONFIG_GENERIC_TIME (rather deleted arch specific code)
- *   for arch independent gettimeofday()
- *  -Implemented CONFIG_GENERIC_CLOCKEVENTS as base for hrtimers
- *
- * Vineetg: Mar 2008: Forked off from time.c which now is time-jiff.c
  */
 
-/* ARC700 has two 32bit independent prog Timers: TIMER0 and TIMER1
- * Each can programmed to go from @count to @limit and optionally
- * interrupt when that happens.
- * A write to Control Register clears the Interrupt
- *
- * We've designated TIMER0 for events (clockevents)
- * while TIMER1 for free running (clocksource)
+/* ARC700 has two 32bit independent prog Timers: TIMER0 and TIMER1, Each can be
+ * programmed to go from @count to @limit and optionally interrupt.
+ * We've designated TIMER0 for clockevents and TIMER1 for clocksource
  *
- * Newer ARC700 cores have 64bit clk fetching RTSC insn, preferred over TIMER1
- * which however is currently broken
+ * ARCv2 based HS38 cores have RTC (in-core) and GFRC (inside ARConnect/MCIP)
+ * which are suitable for UP and SMP based clocksources respectively
  */
 
 #include <linux/interrupt.h>
@@ -37,7 +23,6 @@
 #include <linux/cpu.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
-#include <asm/irq.h>
 
 #include <soc/arc/timers.h>
 #include <soc/arc/mcip.h>
-- 
2.7.4
