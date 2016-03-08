From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 8 Mar 2016 17:56:08 +0530
Subject: [PATCH v2 5/9] ARC: clockevent: DT based probe
In-Reply-To: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
References: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457439972-20285-6-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

 - timer frequency is derived from DT (no longer rely on top level
   DT "clock-frequency" probed early and exported by asm/clk.h)

 - TIMER0_IRQ need not be exported across arch code, confided to intc as
   it is property of same

Cc: Noam Camus <noamc at ezchip.com>
Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
Changes v1 -> v2
 - Rebased on 4.5-rc6
 - Fix snafu in a adapting patch from EZChip tree

v1:
 - http://lists.infradead.org/pipermail/linux-snps-arc/2016-February/000449.html

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/irq.h     |  9 --------
 arch/arc/kernel/intc-compact.c |  2 ++
 arch/arc/kernel/time.c         | 49 +++++++++++++++++++++++++++++-------------
 3 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index 5c0b5abda67a..a6ac89dc228f 100644
--- a/arch/arc/include/asm/irq.h
+++ b/arch/arc/include/asm/irq.h
@@ -12,15 +12,6 @@
 #define NR_CPU_IRQS	32  /* number of interrupt lines of ARC770 CPU */
 #define NR_IRQS		128 /* allow some CPU external IRQ handling */
 
-/* Platform Independent IRQs */
-#ifdef CONFIG_ISA_ARCOMPACT
-#define TIMER0_IRQ      3
-#define TIMER1_IRQ      4
-#else
-#define TIMER0_IRQ      16
-#define TIMER1_IRQ      17
-#endif
-
 #include <linux/interrupt.h>
 #include <asm-generic/irq.h>
 
diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index 4195eedeb6d1..d31bc647146d 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -14,6 +14,8 @@
 #include <linux/irqchip.h>
 #include <asm/irq.h>
 
+#define TIMER0_IRQ	3	/* Fixed by ISA */
+
 /*
  * Early Hardware specific Interrupt setup
  * -Platform independent, needed for each CPU (not foldable into init_IRQ)
diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index 848353a27ac8..693545df9827 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -30,19 +30,15 @@
  */
 
 #include <linux/interrupt.h>
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/time.h>
-#include <linux/init.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 #include <asm/irq.h>
 #include <asm/arcregs.h>
-#include <asm/clk.h>
-#include <asm/mach_desc.h>
 
 #include <asm/mcip.h>
 
@@ -59,6 +55,24 @@
 
 #define ARC_TIMER_MAX	0xFFFFFFFF
 
+static unsigned long arc_timer_freq;
+
+static void noinline arc_get_timer_clk(struct device_node *node)
+{
+	struct clk *clk;
+	int ret;
+
+	clk = of_clk_get(node, 0);
+	if (IS_ERR(clk))
+		panic("Can't get timer clock");
+
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		pr_err("Couldn't enable parent clock\n");
+
+	arc_timer_freq = clk_get_rate(clk);
+}
+
 /********** Clock Source Device *********/
 
 #ifdef CONFIG_ARC_HAS_GFRC
@@ -182,7 +196,7 @@ static struct clocksource arc_counter = {
 
 /********** Clock Event Device *********/
 
-static int arc_timer_irq = TIMER0_IRQ;
+static int arc_timer_irq;
 
 /*
  * Arm the timer to interrupt after @cycles
@@ -210,7 +224,7 @@ static int arc_clkevent_set_periodic(struct clock_event_device *dev)
 	 * At X Hz, 1 sec = 1000ms -> X cycles;
 	 *		      10ms -> X / 100 cycles
 	 */
-	arc_timer_event_setup(arc_get_core_freq() / HZ);
+	arc_timer_event_setup(arc_timer_freq / HZ);
 	return 0;
 }
 
@@ -253,7 +267,7 @@ static int arc_timer_cpu_notify(struct notifier_block *self,
 
 	switch (action & ~CPU_TASKS_FROZEN) {
 	case CPU_STARTING:
-		clockevents_config_and_register(evt, arc_get_core_freq(),
+		clockevents_config_and_register(evt, arc_timer_freq,
 						0, ULONG_MAX);
 		enable_percpu_irq(arc_timer_irq, 0);
 		break;
@@ -272,15 +286,22 @@ static struct notifier_block arc_timer_cpu_nb = {
 /*
  * clockevent setup for boot CPU
  */
-static void __init arc_clockevent_setup(void)
+static void __init arc_clockevent_setup(struct device_node *node)
 {
 	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
 	int ret;
 
 	register_cpu_notifier(&arc_timer_cpu_nb);
 
+	arc_timer_irq = irq_of_parse_and_map(node, 0);
+	if (arc_timer_irq <= 0)
+		panic("Can't parse IRQ");
+
+	arc_get_timer_clk(node);
+
+	evt->irq = arc_timer_irq;
 	evt->cpumask = cpumask_of(smp_processor_id());
-	clockevents_config_and_register(evt, arc_get_core_freq(),
+	clockevents_config_and_register(evt, arc_timer_freq,
 					0, ARC_TIMER_MAX);
 
 	/* Needs apriori irq_set_percpu_devid() done in intc map function */
@@ -291,6 +312,7 @@ static void __init arc_clockevent_setup(void)
 
 	enable_percpu_irq(arc_timer_irq, 0);
 }
+CLOCKSOURCE_OF_DECLARE(arc_clkevt, "snps,arc-timer", arc_clockevent_setup);
 
 /*
  * Called from start_kernel() - boot CPU only
@@ -299,7 +321,6 @@ static void __init arc_clockevent_setup(void)
  * -Also sets up any global state needed for timer subsystem:
  *    - for "counting" timer, registers a clocksource, usable across CPUs
  *      (provided that underlying counter h/w is synchronized across cores)
- *    - for "event" timer, sets up TIMER0 IRQ (as that is platform agnostic)
  */
 void __init time_init(void)
 {
@@ -315,7 +336,5 @@ void __init time_init(void)
 		 * CLK upto 4.29 GHz can be safely represented in 32 bits
 		 * because Max 32 bit number is 4,294,967,295
 		 */
-		clocksource_register_hz(&arc_counter, arc_get_core_freq());
-
-	arc_clockevent_setup();
+		clocksource_register_hz(&arc_counter, arc_timer_freq);
 }
-- 
2.5.0
