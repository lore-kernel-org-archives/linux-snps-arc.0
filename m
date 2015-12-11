From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Dec 2015 16:49:13 +0530
Subject: [PATCH 3/3] ARCv2: perf: Ensure perf intr gets enabled on all cores
In-Reply-To: <1449832753-6767-1-git-send-email-vgupta@synopsys.com>
References: <1449832753-6767-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449832753-6767-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This was the second perf intr issue

perf sampling on multicore requires intr to be enabled on all cores.
ARC perf probe code used helper arc_request_percpu_irq() which calls
 - request_percpu_irq() on core0
 - enable_percpu_irq() on all all cores (including core0)

genirq requires that request be made ahead of enable call.
However if perf probe happened on non core0 (observed on a 3.18 kernel),
enable would get called ahead of request, failing obviously and
rendering perf intr disabled on all such cores

[   11.120000] 1 ARC perf       : 8 counters (48 bits), 113 conditions, [overflow IRQ support]
[   11.130000] 1 -----> enable_percpu_irq() IRQ 20 failed
[   11.140000] 3 -----> enable_percpu_irq() IRQ 20 failed
[   11.140000] 2 -----> enable_percpu_irq() IRQ 20 failed
[   11.140000] 0 =====> request_percpu_irq() IRQ 20
[   11.140000] 0 -----> enable_percpu_irq() IRQ 20

Fix this fragility, by calling request_percpu_irq() on whatever core
calls probe (there is no requirement on which core calls this anyways)
and then calling enable on each cores.

Interestingly this started as invesigation of STAR 9000838902:
"sporadically IRQs enabled on perf prob"

which was about occassional boot spew as request_percpu_irq got called
non-locally (from an IPI), and re-enabled interrupts in following path
proc_mkdir ->  spin_unlock_irq()

which the irq work code didn't like.

| ARC perf     : 8 counters (48 bits), 113 conditions, [overflow IRQ support]
|
| BUG: failure at ../kernel/irq_work.c:135/irq_work_run_list()!
| CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.18.10-01127-g285efb8e66d1 #2
|
| Stack Trace:
|  arc_unwind_core.constprop.1+0x94/0x104
|  dump_stack+0x62/0x98
|  irq_work_run_list+0xb0/0xb4
|  irq_work_run+0x22/0x3c
|  do_IPI+0x74/0x9c
|  handle_irq_event_percpu+0x34/0x164
|  handle_percpu_irq+0x58/0x78
|  generic_handle_irq+0x1e/0x2c
|  arch_do_IRQ+0x3c/0x60
|  ret_from_exception+0x0/0x8

Cc: Marc Zyngier <marc.zyngier at arm.com>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: linux-snps-arc at lists.infradead.org
Cc: linux-kernel at vger.kernel.org
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/perf_event.c | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 0c08bb1ce15a..8b134cfe5e1f 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -428,12 +428,11 @@ static irqreturn_t arc_pmu_intr(int irq, void *dev)
 
 #endif /* CONFIG_ISA_ARCV2 */
 
-void arc_cpu_pmu_irq_init(void)
+static void arc_cpu_pmu_irq_init(void *data)
 {
-	struct arc_pmu_cpu *pmu_cpu = this_cpu_ptr(&arc_pmu_cpu);
+	int irq = *(int *)data;
 
-	arc_request_percpu_irq(arc_pmu->irq, smp_processor_id(), arc_pmu_intr,
-			       "ARC perf counters", pmu_cpu);
+	enable_percpu_irq(irq, IRQ_TYPE_NONE);
 
 	/* Clear all pending interrupt flags */
 	write_aux_reg(ARC_REG_PCT_INT_ACT, 0xffffffff);
@@ -515,7 +514,6 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 
 	if (has_interrupts) {
 		int irq = platform_get_irq(pdev, 0);
-		unsigned long flags;
 
 		if (irq < 0) {
 			pr_err("Cannot get IRQ number for the platform\n");
@@ -524,24 +522,12 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 
 		arc_pmu->irq = irq;
 
-		/*
-		 * arc_cpu_pmu_irq_init() needs to be called on all cores for
-		 * their respective local PMU.
-		 * However we use opencoded on_each_cpu() to ensure it is called
-		 * on core0 first, so that arc_request_percpu_irq() sets up
-		 * AUTOEN etc. Otherwise enable_percpu_irq() fails to enable
-		 * perf IRQ on non master cores.
-		 * see arc_request_percpu_irq()
-		 */
-		preempt_disable();
-		local_irq_save(flags);
-		arc_cpu_pmu_irq_init();
-		local_irq_restore(flags);
-		smp_call_function((smp_call_func_t)arc_cpu_pmu_irq_init, 0, 1);
-		preempt_enable();
-
-		/* Clean all pending interrupt flags */
-		write_aux_reg(ARC_REG_PCT_INT_ACT, 0xffffffff);
+		/* intc map function ensures irq_set_percpu_devid() called */
+		request_percpu_irq(irq, arc_pmu_intr, "ARC perf counters",
+				   this_cpu_ptr(&arc_pmu_cpu));
+
+		on_each_cpu(arc_cpu_pmu_irq_init, &irq, 1);
+
 	} else
 		arc_pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 
-- 
1.9.1
