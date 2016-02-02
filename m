From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 2 Feb 2016 16:28:53 +0530
Subject: [PATCH 3/9] ARC: clockevent: switch to cpu notifier for clockevent
 setup
In-Reply-To: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454410739-24444-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

ARC Timers so far have been handled as "legacy" w/o explicit description
in DT. This poses challenge for newer platforms wanting to use them.
This series will eventually help move timers over to DT.

This patch does a small change of using a CPU notifier to set clockevent
on non-boot CPUs. So explicit setup is done only on boot CPU (which will
later be done by DT)

This also helps
 - wean away from arc_request_percpu_irq() which has a design flaw as
   noted in c6317bc7c5ab
   ("ARCv2: perf: Ensure perf intr gets enabled on all cores")
 - Remove exposing timer function to smp.c

Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
Signed-off-by: Noam Camus <noamc at ezchip.com>
[vgupta: broken off from a bigger patch]
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/irq.h |  1 -
 arch/arc/kernel/smp.c      |  2 --
 arch/arc/kernel/time.c     | 48 ++++++++++++++++++++++++++++++++++++++--------
 3 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index 4fd7d62a6e30..0c86f0787bcd 100644
--- a/arch/arc/include/asm/irq.h
+++ b/arch/arc/include/asm/irq.h
@@ -27,7 +27,6 @@
 #include <asm-generic/irq.h>
 
 extern void arc_init_IRQ(void);
-void arc_local_timer_setup(void);
 void arc_request_percpu_irq(int irq, int cpu,
                             irqreturn_t (*isr)(int irq, void *dev),
                             const char *irq_nm, void *percpu_dev);
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index ef6e9e15b82a..ea790f1c1107 100644
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
index 156d9833ff84..bdfc621d5d85 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -183,6 +183,8 @@ static struct clocksource arc_counter = {
 
 /********** Clock Event Device *********/
 
+static int arc_timer_irq = TIMER0_IRQ;
+
 /*
  * Arm the timer to interrupt after @cycles
  * The distinction for oneshot/periodic is done in arc_event_timer_ack() below
@@ -244,21 +246,52 @@ static irqreturn_t timer_irq_handler(int irq, void *dev_id)
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
+static struct notifier_block nps_timer_cpu_nb = {
+	.notifier_call = arc_timer_cpu_notify,
+};
+
 /*
- * Setup the local event timer for @cpu
+ * clockevent setup for boot CPU
  */
-void arc_local_timer_setup()
+static void __init arc_clockevent_setup()
 {
 	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
-	int cpu = smp_processor_id();
 
-	evt->cpumask = cpumask_of(cpu);
+	register_cpu_notifier(&arc_timer_cpu_nb);
+
+	evt->cpumask = cpumask_of(smp_processor_id());
 	clockevents_config_and_register(evt, arc_get_core_freq(),
 					0, ARC_TIMER_MAX);
 
 	/* setup the per-cpu timer IRQ handler - for all cpus */
-	arc_request_percpu_irq(TIMER0_IRQ, cpu, timer_irq_handler,
-			       "Timer0 (per-cpu-tick)", evt);
+	request_percpu_irq(arc_timer_irq, timer_irq_handler,
+			   "Timer0 (per-cpu-tick)", evt);
+
+	enable_percpu_irq(arc_timer_irq, 0);
+
+	if (ret)
+		pr_err("Unable to register interrupt\n");
 }
 
 /*
@@ -283,6 +316,5 @@ void __init time_init(void)
 		 */
 		clocksource_register_hz(&arc_counter, arc_get_core_freq());
 
-	/* sets up the periodic event timer */
-	arc_local_timer_setup();
+	arc_clockevent_setup();
 }
-- 
2.5.0
