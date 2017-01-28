From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Sat, 28 Jan 2017 03:01:40 +0300
Subject: [PATCH 3/6] ARCv2: IRQ: Add macro for the first external interrupt
 number
In-Reply-To: <1485561703-20921-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485561703-20921-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485561703-20921-4-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/include/asm/irq.h   | 1 +
 arch/arc/kernel/intc-arcv2.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index c0fa0d2..e61ad30 100644
--- a/arch/arc/include/asm/irq.h
+++ b/arch/arc/include/asm/irq.h
@@ -16,6 +16,7 @@
 #ifdef CONFIG_ISA_ARCV2
 #define IPI_IRQ		19
 #define SOFTIRQ_IRQ	21
+#define FIRST_EXT_IRQ	24
 #endif
 
 #include <linux/interrupt.h>
diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index 2f31bb1..a9a7497 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -98,7 +98,7 @@ static int arcv2_irq_map(struct irq_domain *d, unsigned int irq,
 	 * core intc IRQs [16, 23]:
 	 * Statically assigned always private-per-core (Timers, WDT, IPI, PCT)
 	 */
-	if (hw < 24) {
+	if (hw < FIRST_EXT_IRQ) {
 		/*
 		 * A subsequent request_percpu_irq() fails if percpu_devid is
 		 * not set. That in turns sets NOAUTOEN, meaning each core needs
-- 
2.7.4
