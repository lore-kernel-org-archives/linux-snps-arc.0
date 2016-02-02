From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 2 Feb 2016 16:28:55 +0530
Subject: [PATCH 5/9] ARC: clockevent: DT based probe
In-Reply-To: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454410739-24444-6-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

 - timer frequency is derived from DT (no longer rely on top level
   DT "clock-frequency" probed early and exported by asm/clk.h)

 - TIMER0_IRQ need not be exported across arch code, confided to intc as
   it is property of same

Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/irq.h     |  4 ---
 arch/arc/kernel/intc-compact.c |  2 ++
 arch/arc/kernel/time.c         | 67 ++++++++++++++++++++++++++----------------
 3 files changed, 44 insertions(+), 29 deletions(-)

diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index 0c86f0787bcd..44b6ea85e8fb 100644
--- a/arch/arc/include/asm/irq.h
+++ b/arch/arc/include/asm/irq.h
@@ -14,12 +14,8 @@
 
 /* Platform Independent IRQs */
 #ifdef CONFIG_ISA_ARCOMPACT
-#define TIMER0_IRQ      3
-#define TIMER1_IRQ      4
 #define IPI_IRQ		(NR_CPU_IRQS-1) /* dummy to enable SMP build for up hardware */
 #else
-#define TIMER0_IRQ      16
-#define TIMER1_IRQ      17
 #define IPI_IRQ         19
 #endif
 
diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index 06bcedf19b62..5d390958d233 100644
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
index 1f5a6fe03bcc..43ef22853473 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -29,22 +29,16 @@
  * which however is currently broken
  */
 
-#include <linux/spinlock.h>
 #include <linux/interrupt.h>
-#include <linux/module.h>
-#include <linux/sched.h>
-#include <linux/kernel.h>
-#include <linux/time.h>
-#include <linux/init.h>
-#include <linux/timex.h>
-#include <linux/profile.h>
 #include <linux/clk-provider.h>
+#include <linux/clk.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
+#include <linux/cpu.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 #include <asm/irq.h>
 #include <asm/arcregs.h>
-#include <asm/clk.h>
-#include <asm/mach_desc.h>
 
 #include <asm/mcip.h>
 
@@ -61,6 +55,24 @@
 
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
@@ -184,7 +196,7 @@ static struct clocksource arc_counter = {
 
 /********** Clock Event Device *********/
 
-static int arc_timer_irq = TIMER0_IRQ;
+static int arc_timer_irq;
 
 /*
  * Arm the timer to interrupt after @cycles
@@ -212,7 +224,7 @@ static int arc_clkevent_set_periodic(struct clock_event_device *dev)
 	 * At X Hz, 1 sec = 1000ms -> X cycles;
 	 *		      10ms -> X / 100 cycles
 	 */
-	arc_timer_event_setup(arc_get_core_freq() / HZ);
+	arc_timer_event_setup(arc_timer_freq / HZ);
 	return 0;
 }
 
@@ -221,7 +233,6 @@ static DEFINE_PER_CPU(struct clock_event_device, arc_clockevent_device) = {
 	.features		= CLOCK_EVT_FEAT_ONESHOT |
 				  CLOCK_EVT_FEAT_PERIODIC,
 	.rating			= 300,
-	.irq			= TIMER0_IRQ,	/* hardwired, no need for resources */
 	.set_next_event		= arc_clkevent_set_next_event,
 	.set_state_periodic	= arc_clkevent_set_periodic,
 };
@@ -256,7 +267,7 @@ static int arc_timer_cpu_notify(struct notifier_block *self,
 
 	switch (action & ~CPU_TASKS_FROZEN) {
 	case CPU_STARTING:
-		clockevents_config_and_register(evt, arc_get_core_freq(),
+		clockevents_config_and_register(evt, arc_timer_freq,
 						0, ULONG_MAX);
 		enable_percpu_irq(arc_timer_irq, 0);
 		break;
@@ -268,32 +279,41 @@ static int arc_timer_cpu_notify(struct notifier_block *self,
 	return NOTIFY_OK;
 }
 
-static struct notifier_block nps_timer_cpu_nb = {
+static struct notifier_block arc_timer_cpu_nb = {
 	.notifier_call = arc_timer_cpu_notify,
 };
 
 /*
  * clockevent setup for boot CPU
  */
-static void __init arc_clockevent_setup()
+static void __init arc_clockevent_setup(struct device_node *node)
 {
 	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
+	int ret;
 
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
 
 	/* setup the per-cpu timer IRQ handler - for all cpus */
-	request_percpu_irq(arc_timer_irq, timer_irq_handler,
-			   "Timer0 (per-cpu-tick)", evt);
+	ret = request_percpu_irq(arc_timer_irq, timer_irq_handler,
+				 "Timer0 (per-cpu-tick)", evt);
+	if (ret)
+		pr_err("Unable to register interrupt\n");
 
 	enable_percpu_irq(arc_timer_irq, 0);
 
-	if (ret)
-		pr_err("Unable to register interrupt\n");
 }
+CLOCKSOURCE_OF_DECLARE(arc_clkevt, "snps,arc-timer0", arc_clockevent_setup);
 
 /*
  * Called from start_kernel() - boot CPU only
@@ -302,7 +322,6 @@ static void __init arc_clockevent_setup()
  * -Also sets up any global state needed for timer subsystem:
  *    - for "counting" timer, registers a clocksource, usable across CPUs
  *      (provided that underlying counter h/w is synchronized across cores)
- *    - for "event" timer, sets up TIMER0 IRQ (as that is platform agnostic)
  */
 void __init time_init(void)
 {
@@ -318,7 +337,5 @@ void __init time_init(void)
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
