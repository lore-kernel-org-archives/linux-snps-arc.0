From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 29 Jan 2016 13:06:39 +0530
Subject: [PATCH 5/5] ARC: [intc-*] switch to linear domain
In-Reply-To: <1454052999-5349-1-git-send-email-vgupta@synopsys.com>
References: <1454052999-5349-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454052999-5349-6-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Now that we have Timers probed from DT, don't need legacy domain

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/intc-arcv2.c   | 4 ++--
 arch/arc/kernel/intc-compact.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index cede73b50d31..c92de8148104 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -139,8 +139,7 @@ init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
 	if (parent)
 		panic("DeviceTree incore intc not a root irq controller\n");
 
-	root_domain = irq_domain_add_legacy(intc, NR_CPU_IRQS, 0, 0,
-					    &arcv2_irq_ops, NULL);
+	root_domain = irq_domain_add_linear(intc, NR_CPU_IRQS, &arcv2_irq_ops, NULL);
 	if (!root_domain)
 		panic("root irq domain not avail\n");
 
@@ -150,6 +149,7 @@ init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
 	 */
 	irq_set_default_host(root_domain);
 
+	irq_create_mapping(root_domain, IPI_IRQ);
 	return 0;
 }
 
diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index 48a8b24de23e..c5cceca36118 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -105,7 +105,7 @@ init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
 	if (parent)
 		panic("DeviceTree incore intc not a root irq controller\n");
 
-	root_domain = irq_domain_add_legacy(intc, NR_CPU_IRQS, 0, 0,
+	root_domain = irq_domain_add_linear(intc, NR_CPU_IRQS,
 					    &arc_intc_domain_ops, NULL);
 	if (!root_domain)
 		panic("root irq domain not avail\n");
-- 
2.5.0
