From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 8 Mar 2016 17:56:06 +0530
Subject: [PATCH v2 3/9] ARC: clockevent: switch to cpu notifier for clockevent
 setup
In-Reply-To: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
References: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457439972-20285-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

ARC Timers so far have been handled as "legacy" w/o explicit description
in DT. This poses challenge for newer platforms wanting to use them.
This series will eventually help move timers over to DT.

This patch does a small change of using a CPU notifier to set clockevent
on non-boot CPUs. So explicit setup is done only on boot CPU (which will
later be done by DT)

Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
Signed-off-by: Noam Camus <noamc at ezchip.com>
[vgupta: broken off from a bigger patch]
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
Changes v1 -> v2
 - Rebased on 4.5-rc6 (some changes due to interim changes)
 - Reduced the extraneous header includes
 - Fixed @ret handling in arc_clockevent_setup()
 - Fix snafu in a adapting patch from EZChip tree:
    nps_timer_cpu_nb -> arc_timer_cpu_nb

v1:
 - http://lists.infradead.org/pipermail/linux-snps-arc/2016-February/000454.html

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/irq.h |  1 -
 arch/arc/kernel/smp.c      |  2 --
 arch/arc/kernel/time.c     | 62 ++++++++++++++++++++++++++++++----------------
 3 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index f9c735ede4fc..5c0b5abda67a 100644
--- a/arch/arc/include/asm/irq.h
+++ b/arch/arc/include/asm/irq.h
@@ -25,6 +25,5 @@
 #include <asm-generic/irq.h>
 
 extern void arc_init_IRQ(void);
-void arc_local_timer_setup(void);
 
 #endif
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index 96cb0d8887e5..74e7ce4c1508 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -138,8 +138,6 @@ void start_kernel_secondary(void)
 	if (machine_desc->init_per_cpu)
 		machine_desc->init_per_cpu(cpu);
 
-	arc_local_timer_setup();
-
 	local_irq_enable();
 	preempt_disable();
 	cpu_startup_entry(CPUHP_ONLINE);
diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index 146da3cbcc99..e97be743d47b 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -29,17 +29,14 @@
  * which however is currently broken
  */
 
-#include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/sched.h>
 #include <linux/kernel.h>
 #include <linux/time.h>
 #include <linux/init.h>
-#include <linux/timex.h>
-#include <linux/profile.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
+#include <linux/cpu.h>
 #include <asm/irq.h>
 #include <asm/arcregs.h>
 #include <asm/clk.h>
@@ -183,6 +180,8 @@ static struct clocksource arc_counter = {
 
 /********** Clock Event Device *********/
 
+static int arc_timer_irq = TIMER0_IRQ;
+
 /*
  * Arm the timer to interrupt after @cycles
  * The distinction for oneshot/periodic is done in arc_event_timer_ack() below
@@ -218,7 +217,6 @@ static DEFINE_PER_CPU(struct clock_event_device, arc_clockevent_device) = {
 	.features		= CLOCK_EVT_FEAT_ONESHOT |
 				  CLOCK_EVT_FEAT_PERIODIC,
 	.rating			= 300,
-	.irq			= TIMER0_IRQ,	/* hardwired, no need for resources */
 	.set_next_event		= arc_clkevent_set_next_event,
 	.set_state_periodic	= arc_clkevent_set_periodic,
 };
@@ -244,29 +242,52 @@ static irqreturn_t timer_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int arc_timer_cpu_notify(struct notifier_block *self,
+				unsigned long action, void *hcpu)
+{
+	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
+
+	evt->cpumask = cpumask_of(smp_processor_id());
+
+	switch (action & ~CPU_TASKS_FROZEN) {
+	case CPU_STARTING:
+		clockevents_config_and_register(evt, arc_get_core_freq(),
+						0, ULONG_MAX);
+		enable_percpu_irq(arc_timer_irq, 0);
+		break;
+	case CPU_DYING:
+		disable_percpu_irq(arc_timer_irq);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block arc_timer_cpu_nb = {
+	.notifier_call = arc_timer_cpu_notify,
+};
+
 /*
- * Setup the local event timer for @cpu
+ * clockevent setup for boot CPU
  */
-void arc_local_timer_setup()
+static void __init arc_clockevent_setup(void)
 {
 	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
-	int cpu = smp_processor_id();
-	int irq = TIMER0_IRQ;
+	int ret;
 
-	evt->cpumask = cpumask_of(cpu);
+	register_cpu_notifier(&arc_timer_cpu_nb);
+
+	evt->cpumask = cpumask_of(smp_processor_id());
 	clockevents_config_and_register(evt, arc_get_core_freq(),
 					0, ARC_TIMER_MAX);
 
-	if (!cpu) {
-		int rc;
-
-		rc = request_percpu_irq(irq, timer_irq_handler,
-					"Timer0 (per-cpu-tick)", evt);
-		if (rc)
-			panic("Percpu IRQ request failed for TIMER\n");
-	}
+	/* Needs apriori irq_set_percpu_devid() done in intc map function */
+	ret = request_percpu_irq(arc_timer_irq, timer_irq_handler,
+				 "Timer0 (per-cpu-tick)", evt);
+	if (ret)
+		pr_err("Unable to register interrupt\n");
 
-	enable_percpu_irq(irq, 0);
+	enable_percpu_irq(arc_timer_irq, 0);
 }
 
 /*
@@ -291,6 +312,5 @@ void __init time_init(void)
 		 */
 		clocksource_register_hz(&arc_counter, arc_get_core_freq());
 
-	/* sets up the periodic event timer */
-	arc_local_timer_setup();
+	arc_clockevent_setup();
 }
-- 
2.5.0
