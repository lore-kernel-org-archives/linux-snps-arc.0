From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Mon, 24 Oct 2016 15:46:33 +0300
Subject: [PATCH v2 4/5] ARC: MCIP: Set an initial affinity value in idu_irq_map
In-Reply-To: <1477313194-2310-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1477313194-2310-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477313194-2310-4-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Originally an initial distribution mode (its value resides in Device Tree)
for each common interrupt is set in idu_irq_xlate. This leads to the
following problems. idu_irq_xlate may be called several times during parsing
of the Device Tree and it is semantically wrong to configure an initial
distribution mode here. Also a value of affinity (CPUs bitmap) is not saved
to irq_desc structure for the virq - later (after parsing of the DT) kernel
sees that affinity is not set and sets a default value of affinity (all
cores in round robin mode). As a result a value of affinity from Device
Tree is ignored.

To fix it I created a buffer for initial CPUs bitmaps from Device Tree.
In idu_irq_xlate those bitmaps are saved to the buffer. Then affinity
for virq is set manually in idu_irq_map. It works because idu_irq_xlate
is always called before idu_irq_map.

Despite the fact that it works I think that it must be rewritten to
eliminate usage of the buffer and move all logic to idu_irq_map but
I do not know how to do it correctly.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/kernel/mcip.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index 51a218c..090f0a1 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -12,12 +12,15 @@
 #include <linux/irq.h>
 #include <linux/spinlock.h>
 #include <linux/irqdomain.h>
+#include <linux/interrupt.h>
+#include <linux/cpumask.h>
 #include <asm/irqflags-arcv2.h>
 #include <asm/mcip.h>
 #include <asm/setup.h>
 
 static char smp_cpuinfo_buf[128];
 static int idu_detected;
+static unsigned long idu_cirq_to_dest[CONFIG_ARC_NUMBER_OF_INTERRUPTS];
 
 static DEFINE_RAW_SPINLOCK(mcip_lock);
 
@@ -232,9 +235,15 @@ static void idu_cascade_isr(struct irq_desc *desc)
 
 static int idu_irq_map(struct irq_domain *d, unsigned int virq, irq_hw_number_t hwirq)
 {
+	cpumask_t mask;
+
 	irq_set_chip_and_handler(virq, &idu_irq_chip, handle_level_irq);
 	irq_set_status_flags(virq, IRQ_MOVE_PCNTXT);
 
+	cpumask_clear(&mask);
+	cpumask_bits(&mask)[0] |= idu_cirq_to_dest[hwirq];
+	irq_set_affinity(virq, &mask);
+
 	return 0;
 }
 
@@ -252,8 +261,7 @@ static int idu_irq_xlate(struct irq_domain *d, struct device_node *n,
 	if (distri == 0) {
 		/* 0 - Round Robin to all cpus, otherwise 1 bit per core */
 		raw_spin_lock_irqsave(&mcip_lock, flags);
-		idu_set_dest(hwirq, BIT(num_online_cpus()) - 1);
-		idu_set_mode(hwirq, IDU_M_TRIG_LEVEL, IDU_M_DISTRI_RR);
+		idu_cirq_to_dest[hwirq] = BIT(num_online_cpus()) - 1;
 		raw_spin_unlock_irqrestore(&mcip_lock, flags);
 	} else {
 		/*
@@ -267,8 +275,7 @@ static int idu_irq_xlate(struct irq_domain *d, struct device_node *n,
 				hwirq, cpu);
 
 		raw_spin_lock_irqsave(&mcip_lock, flags);
-		idu_set_dest(hwirq, cpu);
-		idu_set_mode(hwirq, IDU_M_TRIG_LEVEL, IDU_M_DISTRI_DEST);
+		idu_cirq_to_dest[hwirq] = cpu;
 		raw_spin_unlock_irqrestore(&mcip_lock, flags);
 	}
 
-- 
2.7.4
