From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Thu,  3 Nov 2016 15:23:06 +0300
Subject: [PATCH v3 1/3] ARC: SMP: Register IPI handler using virq but not hwirq
In-Reply-To: <1478175788-3118-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1478175788-3118-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478175788-3118-2-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

smp_ipi_irq_setup takes a cpu number and a hwirq number for the per core
local interrupt line in the root interrupt controller and registers an
appropriate IPI handler per cpu. However this function tries to bind a
handler to the hwirq as virtual IRQ number and it is a wrong behavior.
It is necessary to find a mapping of hwirq in the root IRQ domain to
the actual virq using irq_find_mapping.

Also a declaration of smp_ipi_irq_setup is corrected to denote that
this function takes a hardware IRQ number but not a virtual IRQ number.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/include/asm/smp.h |  4 ++--
 arch/arc/kernel/smp.c      | 13 +++++++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arc/include/asm/smp.h b/arch/arc/include/asm/smp.h
index 89fdd1b..0861007 100644
--- a/arch/arc/include/asm/smp.h
+++ b/arch/arc/include/asm/smp.h
@@ -37,9 +37,9 @@ extern const char *arc_platform_smp_cpuinfo(void);
  * API expected BY platform smp code (FROM arch smp code)
  *
  * smp_ipi_irq_setup:
- *	Takes @cpu and @irq to which the arch-common ISR is hooked up
+ *	Takes @cpu and @hwirq to which the arch-common ISR is hooked up
  */
-extern int smp_ipi_irq_setup(int cpu, int irq);
+extern int smp_ipi_irq_setup(int cpu, irq_hw_number_t hwirq);
 
 /*
  * struct plat_smp_ops	- SMP callbacks provided by platform to ARC SMP
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index f183cc6..692ca51 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -22,6 +22,7 @@
 #include <linux/atomic.h>
 #include <linux/cpumask.h>
 #include <linux/reboot.h>
+#include <linux/irqdomain.h>
 #include <asm/processor.h>
 #include <asm/setup.h>
 #include <asm/mach_desc.h>
@@ -351,20 +352,24 @@ irqreturn_t do_IPI(int irq, void *dev_id)
  */
 static DEFINE_PER_CPU(int, ipi_dev);
 
-int smp_ipi_irq_setup(int cpu, int irq)
+int smp_ipi_irq_setup(int cpu, irq_hw_number_t hwirq)
 {
 	int *dev = per_cpu_ptr(&ipi_dev, cpu);
+	unsigned int virq = irq_find_mapping(NULL, hwirq);
+
+	if (!virq)
+		panic("Cannot find virq for root domain and hwirq=%lu", hwirq);
 
 	/* Boot cpu calls request, all call enable */
 	if (!cpu) {
 		int rc;
 
-		rc = request_percpu_irq(irq, do_IPI, "IPI Interrupt", dev);
+		rc = request_percpu_irq(virq, do_IPI, "IPI Interrupt", dev);
 		if (rc)
-			panic("Percpu IRQ request failed for %d\n", irq);
+			panic("Percpu IRQ request failed for %u\n", virq);
 	}
 
-	enable_percpu_irq(irq, 0);
+	enable_percpu_irq(virq, 0);
 
 	return 0;
 }
-- 
2.7.4
