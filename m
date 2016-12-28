From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Wed, 28 Dec 2016 11:46:25 +0300
Subject: [PATCH v3 2/3] ARCv2: IRQ: Call entry/exit functions for chained
 handlers in MCIP
In-Reply-To: <1482914786-10490-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1482914786-10490-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1482914786-10490-3-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

It is necessary to call entry/exit functions for parent interrupt
controllers for proper masking/unmasking of interrupt lines.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/kernel/mcip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index f39142a..be131b2 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -10,6 +10,7 @@
 
 #include <linux/smp.h>
 #include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/spinlock.h>
 #include <asm/irqflags-arcv2.h>
 #include <asm/mcip.h>
@@ -221,10 +222,13 @@ static irq_hw_number_t idu_first_hwirq;
 static void idu_cascade_isr(struct irq_desc *desc)
 {
 	struct irq_domain *idu_domain = irq_desc_get_handler_data(desc);
+	struct irq_chip *core_chip = irq_desc_get_chip(desc);
 	irq_hw_number_t core_hwirq = irqd_to_hwirq(irq_desc_get_irq_data(desc));
 	irq_hw_number_t idu_hwirq = core_hwirq - idu_first_hwirq;
 
+	chained_irq_enter(core_chip, desc);
 	generic_handle_irq(irq_find_mapping(idu_domain, idu_hwirq));
+	chained_irq_exit(core_chip, desc);
 }
 
 static int idu_irq_map(struct irq_domain *d, unsigned int virq, irq_hw_number_t hwirq)
-- 
2.7.4
