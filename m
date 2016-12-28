From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Wed, 28 Dec 2016 11:46:24 +0300
Subject: [PATCH v3 1/3] ARC: IRQ: Use hwirq instead of virq in mask/unmask
In-Reply-To: <1482914786-10490-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1482914786-10490-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1482914786-10490-2-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

It is necessary to use hwirq instead of virq when you communicate
with an interrupt controller since there is no guaranty that virq
numbers match hwirq numbers.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/kernel/intc-arcv2.c   | 6 +++---
 arch/arc/kernel/intc-compact.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index 62b59409..fa171e1 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -79,20 +79,20 @@ void arc_init_IRQ(void)
 
 static void arcv2_irq_mask(struct irq_data *data)
 {
-	write_aux_reg(AUX_IRQ_SELECT, data->irq);
+	write_aux_reg(AUX_IRQ_SELECT, data->hwirq);
 	write_aux_reg(AUX_IRQ_ENABLE, 0);
 }
 
 static void arcv2_irq_unmask(struct irq_data *data)
 {
-	write_aux_reg(AUX_IRQ_SELECT, data->irq);
+	write_aux_reg(AUX_IRQ_SELECT, data->hwirq);
 	write_aux_reg(AUX_IRQ_ENABLE, 1);
 }
 
 void arcv2_irq_enable(struct irq_data *data)
 {
 	/* set default priority */
-	write_aux_reg(AUX_IRQ_SELECT, data->irq);
+	write_aux_reg(AUX_IRQ_SELECT, data->hwirq);
 	write_aux_reg(AUX_IRQ_PRIORITY, irq_prio);
 
 	/*
diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index ce9deb9..8c1fd5c 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -57,7 +57,7 @@ static void arc_irq_mask(struct irq_data *data)
 	unsigned int ienb;
 
 	ienb = read_aux_reg(AUX_IENABLE);
-	ienb &= ~(1 << data->irq);
+	ienb &= ~(1 << data->hwirq);
 	write_aux_reg(AUX_IENABLE, ienb);
 }
 
@@ -66,7 +66,7 @@ static void arc_irq_unmask(struct irq_data *data)
 	unsigned int ienb;
 
 	ienb = read_aux_reg(AUX_IENABLE);
-	ienb |= (1 << data->irq);
+	ienb |= (1 << data->hwirq);
 	write_aux_reg(AUX_IENABLE, ienb);
 }
 
-- 
2.7.4
