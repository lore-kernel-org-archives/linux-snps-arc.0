From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Dec 2015 16:49:12 +0530
Subject: [PATCH 2/3] ARC: intc: No need to clear IRQ_NOAUTOEN
In-Reply-To: <1449832753-6767-1-git-send-email-vgupta@synopsys.com>
References: <1449832753-6767-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449832753-6767-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

arc_request_percpu_irq() is called by all cores to request/enable percpu
irq. It has some "prep" calls needed by genirq:
 - setup percpu devid
 - disable IRQ_NOAUTOEN

However given that enable_percpu_irq() is called enayways, latter can be
avoided.

We are now left with irq_set_percpu_devid() quirk and that too for
ARCompact builds only, since previous patch updated ARCv2 intc to do this
in the "right" place, i.e. irq map function.

By next release, this will ultimately be fixed for ARCompact as well.

Cc: Marc Zyngier <marc.zyngier at arm.com>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Cc: linux-kernel at vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/irq.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arc/kernel/irq.c b/arch/arc/kernel/irq.c
index 2ee226546c6a..d736678d2724 100644
--- a/arch/arc/kernel/irq.c
+++ b/arch/arc/kernel/irq.c
@@ -60,14 +60,17 @@ void arc_request_percpu_irq(int irq, int cpu,
 	if (!cpu) {
 		int rc;
 
+#ifdef CONFIG_ISA_ARCOMPACT
 		/*
-		 * These 2 calls are essential to making percpu IRQ APIs work
-		 * Ideally these details could be hidden in irq chip map function
-		 * but the issue is IPIs IRQs being static (non-DT) and platform
-		 * specific, so we can't identify them there.
+		 * A subsequent request_percpu_irq() fails if percpu_devid is
+		 * not set. That in turns sets NOAUTOEN, meaning each core needs
+		 * to call enable_percpu_irq()
+		 *
+		 * For ARCv2, this is done in irq map function since we know
+		 * which irqs are strictly per cpu
 		 */
 		irq_set_percpu_devid(irq);
-		irq_modify_status(irq, IRQ_NOAUTOEN, 0);  /* @irq, @clr, @set */
+#endif
 
 		rc = request_percpu_irq(irq, isr, irq_nm, percpu_dev);
 		if (rc)
-- 
1.9.1
