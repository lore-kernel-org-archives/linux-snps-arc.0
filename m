From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Fri,  9 Dec 2016 12:59:31 +0300
Subject: [PATCH v2 1/2] ARC: SMP: Set the default affinity to the boot cpu
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1481277572-18283-1-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

By default the kernel sets a value for default affinity which may
not correspond to the real bitmap of potentially online CPUs. E.g.
for ARC HS processors with 2 cores the default value of affinity in
the kernel may be 0xF and it is wrong in this case. This happens
because init_irq_default_affinity() sets all bits in
irq_default_affinity variable by default.

It is better to set the default value of affinity to the boot core
to guarantee that value of irq_default_affinity contains at least
one valid online CPU during the early stage of booting. It is
necessary for proper configuration of affinity for common interrupt.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/kernel/irq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arc/kernel/irq.c b/arch/arc/kernel/irq.c
index 538b36a..e53bfd5 100644
--- a/arch/arc/kernel/irq.c
+++ b/arch/arc/kernel/irq.c
@@ -20,6 +20,12 @@
  */
 void __init init_IRQ(void)
 {
+#ifdef CONFIG_SMP
+	/* Set the default affinity to the boot cpu. */
+	cpumask_clear(irq_default_affinity);
+	cpumask_set_cpu(smp_processor_id(), irq_default_affinity);
+#endif
+
 	/*
 	 * process the entire interrupt tree in one go
 	 * Any external intc will be setup provided DT chains them
-- 
2.7.4
