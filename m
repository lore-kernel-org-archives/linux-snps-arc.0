From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 31 Oct 2016 15:48:16 -0700
Subject: [PATCH 9/9] clocksource: import ARC timer driver
In-Reply-To: <1477954096-770-1-git-send-email-vgupta@synopsys.com>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477954096-770-10-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 MAINTAINERS                                        |  1 +
 arch/arc/Kconfig                                   | 12 +--------
 arch/arc/kernel/Makefile                           |  2 +-
 drivers/clocksource/Kconfig                        | 24 ++++++++++++++++++
 drivers/clocksource/Makefile                       |  1 +
 .../time.c => drivers/clocksource/arc_timer.c      | 29 ++++++----------------
 6 files changed, 35 insertions(+), 34 deletions(-)
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
index b4499f97035a..8768a509d5e7 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -8,9 +8,9 @@
 
 config ARC
 	def_bool y
+	select ARC_TIMER
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
 	select BUILDTIME_EXTABLE_SORT
-	select CLKSRC_OF
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select GENERIC_ATOMIC64 if !ISA_ARCV2 || !(ARC_HAS_LL64 && ARC_HAS_LLSC)
@@ -410,16 +410,6 @@ config ARC_HAS_DIV_REM
 	bool "Insn: div, divu, rem, remu"
 	default y
 
-config ARC_TIMER_RTC
-	bool "Local 64-bit r/o cycle counter"
-	default n
-	depends on !SMP
-
-config ARC_TIMER_GFRC
-	bool "SMP synchronized 64-bit cycle counter"
-	default y
-	depends on SMP
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
index e2c6e43cf8ca..73feaadc1924 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -282,6 +282,30 @@ config CLKSRC_MPS2
 	select CLKSRC_MMIO
 	select CLKSRC_OF
 
+config ARC_TIMER
+	bool "Enable timers for ARC Cores"
+	select CLKSRC_OF if OF
+
+if ARC_TIMER
+
+config ARC_TIMER_RTC
+	bool "64-bit cycle counter in HS38 cores"
+	default y if ARC
+	depends on !SMP
+	help
+	  This counter provides 64-bit resolution vs. the 32-bit TIMER1.
+	  It is implemented inside the core thus can't be used in SMP systems
+
+config ARC_TIMER_GFRC
+	bool "64-bit cycle counter in ARConnect block in HS38x cores"
+	default y if ARC
+	depends on SMP
+	help
+	  This counter can be used as clocksource in SMP HS38 SoCs.
+	  It sits outside the core thus can be used in SMP systems
+
+endif
+
 config ARM_ARCH_TIMER
 	bool
 	select CLKSRC_OF if OF
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index cf87f407f1ad..e78480cb47f4 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -69,3 +69,4 @@ obj-$(CONFIG_H8300_TMR16)		+= h8300_timer16.o
 obj-$(CONFIG_H8300_TPU)			+= h8300_tpu.o
 obj-$(CONFIG_CLKSRC_ST_LPC)		+= clksrc_st_lpc.o
 obj-$(CONFIG_X86_NUMACHIP)		+= numachip.o
+obj-$(CONFIG_ARC_TIMER)			+= arc_timer.o
diff --git a/arch/arc/kernel/time.c b/drivers/clocksource/arc_timer.c
similarity index 90%
rename from arch/arc/kernel/time.c
rename to drivers/clocksource/arc_timer.c
index 676b14b7a9be..ec37b6c5e903 100644
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
@@ -281,7 +266,7 @@ static irqreturn_t timer_irq_handler(int irq, void *dev_id)
 	 * irq_set_chip_and_handler() asked for handle_percpu_devid_irq()
 	 */
 	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
-	int irq_reenable = clockevent_state_periodic(evt);
+	int irq_reenable __maybe_unused = clockevent_state_periodic(evt);
 
 	/*
 	 * Any write to CTRL reg ACks the interrupt, we rewrite the
-- 
2.7.4
