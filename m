From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 29 Jan 2016 13:06:36 +0530
Subject: [PATCH 2/5] ARC: [intc-compact] setup TIMER as percpu_dev
In-Reply-To: <1454052999-5349-1-git-send-email-vgupta@synopsys.com>
References: <1454052999-5349-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454052999-5349-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This removes the quirk from arc_request_percpu_irq() and paves way for
future simplifications

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/intc-compact.c |  3 ++-
 arch/arc/kernel/irq.c          | 12 ------------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index 2955b39ea2b0..d31bc647146d 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -81,8 +81,9 @@ static struct irq_chip onchip_intc = {
 static int arc_intc_domain_map(struct irq_domain *d, unsigned int irq,
 			       irq_hw_number_t hw)
 {
-	switch (irq) {
+	switch (hw) {
 	case TIMER0_IRQ:
+		irq_set_percpu_devid(irq);
 		irq_set_chip_and_handler(irq, &onchip_intc, handle_percpu_irq);
 		break;
 	default:
diff --git a/arch/arc/kernel/irq.c b/arch/arc/kernel/irq.c
index ba17f85285cf..88074b50456b 100644
--- a/arch/arc/kernel/irq.c
+++ b/arch/arc/kernel/irq.c
@@ -72,18 +72,6 @@ void arc_request_percpu_irq(int irq, int cpu,
 	if (!cpu) {
 		int rc;
 
-#ifdef CONFIG_ISA_ARCOMPACT
-		/*
-		 * A subsequent request_percpu_irq() fails if percpu_devid is
-		 * not set. That in turns sets NOAUTOEN, meaning each core needs
-		 * to call enable_percpu_irq()
-		 *
-		 * For ARCv2, this is done in irq map function since we know
-		 * which irqs are strictly per cpu
-		 */
-		irq_set_percpu_devid(irq);
-#endif
-
 		rc = request_percpu_irq(irq, isr, irq_nm, percpu_dev);
 		if (rc)
 			panic("Percpu IRQ request failed for %d\n", irq);
-- 
2.5.0
