From: anna-maria@linutronix.de (Anna-Maria Gleixner)
Date: Wed, 13 Jul 2016 17:17:07 -0000
Subject: [patch V2 66/67] ARC/time: Convert to hotplug state machine
References: <20160713153219.128052238@linutronix.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160713153338.391826254@linutronix.de>
To: linux-snps-arc@lists.infradead.org

From: Anna-Maria Gleixner <anna-maria@linutronix.de>

Install the callbacks via the state machine.

Signed-off-by: Anna-Maria Gleixner <anna-maria at linutronix.de>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
---
 arch/arc/kernel/time.c     |   48 ++++++++++++++++-----------------------------
 include/linux/cpuhotplug.h |    1 
 2 files changed, 19 insertions(+), 30 deletions(-)

--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -296,30 +296,23 @@ static irqreturn_t timer_irq_handler(int
 	return IRQ_HANDLED;
 }
 
-static int arc_timer_cpu_notify(struct notifier_block *self,
-				unsigned long action, void *hcpu)
+
+static int arc_timer_starting_cpu(unsigned int cpu)
 {
 	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
 
 	evt->cpumask = cpumask_of(smp_processor_id());
 
-	switch (action & ~CPU_TASKS_FROZEN) {
-	case CPU_STARTING:
-		clockevents_config_and_register(evt, arc_timer_freq,
-						0, ULONG_MAX);
-		enable_percpu_irq(arc_timer_irq, 0);
-		break;
-	case CPU_DYING:
-		disable_percpu_irq(arc_timer_irq);
-		break;
-	}
-
-	return NOTIFY_OK;
+	clockevents_config_and_register(evt, arc_timer_freq, 0, ARC_TIMER_MAX);
+	enable_percpu_irq(arc_timer_irq, 0);
+	return 0;
 }
 
-static struct notifier_block arc_timer_cpu_nb = {
-	.notifier_call = arc_timer_cpu_notify,
-};
+static int arc_timer_dying_cpu(unsigned int cpu)
+{
+	disable_percpu_irq(arc_timer_irq);
+	return 0;
+}
 
 /*
  * clockevent setup for boot CPU
@@ -329,12 +322,6 @@ static int __init arc_clockevent_setup(s
 	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
 	int ret;
 
-	ret = register_cpu_notifier(&arc_timer_cpu_nb);
-	if (ret) {
-		pr_err("Failed to register cpu notifier");
-		return ret;
-	}
-
 	arc_timer_irq = irq_of_parse_and_map(node, 0);
 	if (arc_timer_irq <= 0) {
 		pr_err("clockevent: missing irq");
@@ -347,11 +334,6 @@ static int __init arc_clockevent_setup(s
 		return ret;
 	}
 
-	evt->irq = arc_timer_irq;
-	evt->cpumask = cpumask_of(smp_processor_id());
-	clockevents_config_and_register(evt, arc_timer_freq,
-					0, ARC_TIMER_MAX);
-
 	/* Needs apriori irq_set_percpu_devid() done in intc map function */
 	ret = request_percpu_irq(arc_timer_irq, timer_irq_handler,
 				 "Timer0 (per-cpu-tick)", evt);
@@ -360,8 +342,14 @@ static int __init arc_clockevent_setup(s
 		return ret;
 	}
 
-	enable_percpu_irq(arc_timer_irq, 0);
-
+	ret = cpuhp_setup_state(CPUHP_AP_ARC_TIMER_STARTING,
+				"AP_ARC_TIMER_STARTING",
+				arc_timer_starting_cpu,
+				arc_timer_dying_cpu);
+	if (ret) {
+		pr_err("Failed to setup hotplug state");
+		return ret;
+	}
 	return 0;
 }
 
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -57,6 +57,7 @@ enum cpuhp_state {
 	CPUHP_AP_ARMADA_TIMER_STARTING,
 	CPUHP_AP_MARCO_TIMER_STARTING,
 	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
+	CPUHP_AP_ARC_TIMER_STARTING,
 	CPUHP_AP_KVM_STARTING,
 	CPUHP_AP_KVM_ARM_VGIC_INIT_STARTING,
 	CPUHP_AP_KVM_ARM_VGIC_STARTING,
