From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu,  7 Jul 2016 10:01:43 +0200
Subject: [PATCH 70/93] clocksource/drivers/arc: Convert init function to
 return error
In-Reply-To: <1467878526-1238-1-git-send-email-daniel.lezcano@linaro.org>
References: <577E0BED.3020608@linaro.org>
 <1467878526-1238-1-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1467878526-1238-70-git-send-email-daniel.lezcano@linaro.org>
To: linux-snps-arc@lists.infradead.org

The init functions do not return any error. They behave as the following:

  - panic, thus leading to a kernel crash while another timer may work and
       make the system boot up correctly

  or

  - print an error and let the caller unaware if the state of the system

Change that by converting the init functions to return an error conforming
to the CLOCKSOURCE_OF_RET prototype.

Proper error handling (rollback, errno value) will be changed later case
by case, thus this change just return back an error or success in the init
function.

Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
---
 arch/arc/kernel/time.c | 69 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index 4549ab2..09de669 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -116,21 +116,21 @@ static struct clocksource arc_counter_gfrc = {
 	.flags  = CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
-static void __init arc_cs_setup_gfrc(struct device_node *node)
+static int __init arc_cs_setup_gfrc(struct device_node *node)
 {
 	int exists = cpuinfo_arc700[0].extn.gfrc;
 	int ret;
 
 	if (WARN(!exists, "Global-64-bit-Ctr clocksource not detected"))
-		return;
+		return -ENXIO;
 
 	ret = arc_get_timer_clk(node);
 	if (ret)
-		return;
+		return ret;
 
-	clocksource_register_hz(&arc_counter_gfrc, arc_timer_freq);
+	return clocksource_register_hz(&arc_counter_gfrc, arc_timer_freq);
 }
-CLOCKSOURCE_OF_DECLARE(arc_gfrc, "snps,archs-timer-gfrc", arc_cs_setup_gfrc);
+CLOCKSOURCE_OF_DECLARE_RET(arc_gfrc, "snps,archs-timer-gfrc", arc_cs_setup_gfrc);
 
 #endif
 
@@ -172,27 +172,27 @@ static struct clocksource arc_counter_rtc = {
 	.flags  = CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
-static void __init arc_cs_setup_rtc(struct device_node *node)
+static int __init arc_cs_setup_rtc(struct device_node *node)
 {
 	int exists = cpuinfo_arc700[smp_processor_id()].extn.rtc;
 	int ret;
 
 	if (WARN(!exists, "Local-64-bit-Ctr clocksource not detected"))
-		return;
+		return -ENXIO;
 
 	/* Local to CPU hence not usable in SMP */
 	if (WARN(IS_ENABLED(CONFIG_SMP), "Local-64-bit-Ctr not usable in SMP"))
-		return;
+		return -EINVAL;
 
 	ret = arc_get_timer_clk(node);
 	if (ret)
-		return;
+		return ret;
 
 	write_aux_reg(AUX_RTC_CTRL, 1);
 
-	clocksource_register_hz(&arc_counter_rtc, arc_timer_freq);
+	return clocksource_register_hz(&arc_counter_rtc, arc_timer_freq);
 }
-CLOCKSOURCE_OF_DECLARE(arc_rtc, "snps,archs-timer-rtc", arc_cs_setup_rtc);
+CLOCKSOURCE_OF_DECLARE_RET(arc_rtc, "snps,archs-timer-rtc", arc_cs_setup_rtc);
 
 #endif
 
@@ -213,23 +213,23 @@ static struct clocksource arc_counter_timer1 = {
 	.flags  = CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
-static void __init arc_cs_setup_timer1(struct device_node *node)
+static int __init arc_cs_setup_timer1(struct device_node *node)
 {
 	int ret;
 
 	/* Local to CPU hence not usable in SMP */
 	if (IS_ENABLED(CONFIG_SMP))
-		return;
+		return -EINVAL;
 
 	ret = arc_get_timer_clk(node);
 	if (ret)
-		return;
+		return ret;
 
 	write_aux_reg(ARC_REG_TIMER1_LIMIT, ARC_TIMER_MAX);
 	write_aux_reg(ARC_REG_TIMER1_CNT, 0);
 	write_aux_reg(ARC_REG_TIMER1_CTRL, TIMER_CTRL_NH);
 
-	clocksource_register_hz(&arc_counter_timer1, arc_timer_freq);
+	return clocksource_register_hz(&arc_counter_timer1, arc_timer_freq);
 }
 
 /********** Clock Event Device *********/
@@ -324,20 +324,28 @@ static struct notifier_block arc_timer_cpu_nb = {
 /*
  * clockevent setup for boot CPU
  */
-static void __init arc_clockevent_setup(struct device_node *node)
+static int __init arc_clockevent_setup(struct device_node *node)
 {
 	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
 	int ret;
 
-	register_cpu_notifier(&arc_timer_cpu_nb);
+	ret = register_cpu_notifier(&arc_timer_cpu_nb);
+	if (ret) {
+		pr_err("Failed to register cpu notifier");
+		return ret;
+	}
 
 	arc_timer_irq = irq_of_parse_and_map(node, 0);
-	if (arc_timer_irq <= 0)
-		panic("clockevent: missing irq");
+	if (arc_timer_irq <= 0) {
+		pr_err("clockevent: missing irq");
+		return -EINVAL;
+	}
 
 	ret = arc_get_timer_clk(node);
-	if (ret)
-		panic("clockevent: missing clk");
+	if (ret) {
+		pr_err("clockevent: missing clk");
+		return ret;
+	}
 
 	evt->irq = arc_timer_irq;
 	evt->cpumask = cpumask_of(smp_processor_id());
@@ -347,24 +355,31 @@ static void __init arc_clockevent_setup(struct device_node *node)
 	/* Needs apriori irq_set_percpu_devid() done in intc map function */
 	ret = request_percpu_irq(arc_timer_irq, timer_irq_handler,
 				 "Timer0 (per-cpu-tick)", evt);
-	if (ret)
-		panic("clockevent: unable to request irq\n");
+	if (ret) {
+		pr_err("clockevent: unable to request irq\n");
+		return ret;
+	}
 
 	enable_percpu_irq(arc_timer_irq, 0);
+
+	return 0;
 }
 
-static void __init arc_of_timer_init(struct device_node *np)
+static int __init arc_of_timer_init(struct device_node *np)
 {
 	static int init_count = 0;
+	int ret;
 
 	if (!init_count) {
 		init_count = 1;
-		arc_clockevent_setup(np);
+		ret = arc_clockevent_setup(np);
 	} else {
-		arc_cs_setup_timer1(np);
+		ret = arc_cs_setup_timer1(np);
 	}
+
+	return ret;
 }
-CLOCKSOURCE_OF_DECLARE(arc_clkevt, "snps,arc-timer", arc_of_timer_init);
+CLOCKSOURCE_OF_DECLARE_RET(arc_clkevt, "snps,arc-timer", arc_of_timer_init);
 
 /*
  * Called from start_kernel() - boot CPU only
-- 
1.9.1
