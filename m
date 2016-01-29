From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 29 Jan 2016 13:06:37 +0530
Subject: [PATCH 3/5] ARC: [intc] opencode arc_request_percpu_irq
In-Reply-To: <1454052999-5349-1-git-send-email-vgupta@synopsys.com>
References: <1454052999-5349-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454052999-5349-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

- With only 1 caller, simply opencode it.

- The idea however is to remove the API usage since it has a subltle
  design flaw - relies on being called on cpu0 first. This is true for
  some early per cpu irqs such as TIMER/IPI, but not for late probed
  per cpu peripherals such a perf. And it's usage in perf has already
  bitten us once: see c6317bc7c5ab
  ("ARCv2: perf: Ensure perf intr gets enabled on all cores") where we
  ended up open coding it anyways

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/irq.h |  3 ---
 arch/arc/kernel/irq.c      | 29 -----------------------------
 arch/arc/kernel/smp.c      | 11 ++++++++++-
 3 files changed, 10 insertions(+), 33 deletions(-)

diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index c9b4d83c70f7..de33e83eb24d 100644
--- a/arch/arc/include/asm/irq.h
+++ b/arch/arc/include/asm/irq.h
@@ -20,8 +20,5 @@
 #include <asm-generic/irq.h>
 
 extern void arc_init_IRQ(void);
-void arc_request_percpu_irq(int irq, int cpu,
-                            irqreturn_t (*isr)(int irq, void *dev),
-                            const char *irq_nm, void *percpu_dev);
 
 #endif
diff --git a/arch/arc/kernel/irq.c b/arch/arc/kernel/irq.c
index 88074b50456b..fb6dede9d05f 100644
--- a/arch/arc/kernel/irq.c
+++ b/arch/arc/kernel/irq.c
@@ -50,32 +50,3 @@ void arch_do_IRQ(unsigned int irq, struct pt_regs *regs)
 	irq_exit();
 	set_irq_regs(old_regs);
 }
-
-/*
- * API called for requesting percpu interrupts - called by each CPU
- *  - For boot CPU, actually request the IRQ with genirq core + enables
- *  - For subsequent callers only enable called locally
- *
- * Relies on being called by boot cpu first (i.e. request called ahead) of
- * any enable as expected by genirq. Hence Suitable only for TIMER, IPI
- * which are guaranteed to be setup on boot core first.
- * Late probed peripherals such as perf can't use this as there no guarantee
- * of being called on boot CPU first.
- */
-
-void arc_request_percpu_irq(int irq, int cpu,
-                            irqreturn_t (*isr)(int irq, void *dev),
-                            const char *irq_nm,
-                            void *percpu_dev)
-{
-	/* Boot cpu calls request, all call enable */
-	if (!cpu) {
-		int rc;
-
-		rc = request_percpu_irq(irq, isr, irq_nm, percpu_dev);
-		if (rc)
-			panic("Percpu IRQ request failed for %d\n", irq);
-	}
-
-	enable_percpu_irq(irq, 0);
-}
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index ea790f1c1107..0e71ad0a43c0 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -354,7 +354,16 @@ int smp_ipi_irq_setup(int cpu, int irq)
 {
 	int *dev = per_cpu_ptr(&ipi_dev, cpu);
 
-	arc_request_percpu_irq(irq, cpu, do_IPI, "IPI Interrupt", dev);
+	/* Boot cpu calls request, all call enable */
+	if (!cpu) {
+		int rc;
+
+		rc = request_percpu_irq(irq, do_IPI, "IPI Interrupt", dev);
+		if (rc)
+			panic("Percpu IRQ request failed for %d\n", irq);
+	}
+
+	enable_percpu_irq(irq, 0);
 
 	return 0;
 }
-- 
2.5.0
