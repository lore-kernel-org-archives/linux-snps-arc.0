From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Dec 2015 16:49:11 +0530
Subject: [PATCH 1/3] ARCv2: intc: Fix random perf irq disabling in SMP setup
In-Reply-To: <1449832753-6767-1-git-send-email-vgupta@synopsys.com>
References: <1449832753-6767-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449832753-6767-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As part of fixing another perf issue, observed that after a perf run,
the interrupt got disabled on one/more cores.

| [ARCLinux]# cat /proc/interrupts | grep perf
|  20:    0      0      0       0  ARCv2 core Intc  20 ARC perf counters
|
| [ARCLinux]# perf record -c 20000 /sbin/hackbench
| Running with 10*40 (== 400) tasks.
|
| [ARCLinux]# cat /proc/interrupts | grep perf
|  20:    0    522      8    51916  ARCv2 core Intc  20 ARC perf counters
|
| [ARCLinux]# perf record -c 20000 /sbin/hackbench
| Running with 10*40 (== 400) tasks.
|
| [ARCLinux]# cat /proc/interrupts | grep perf
|  20:    0    522      8   104368  ARCv2 core Intc  20 ARC perf counters

Turns out that despite requesting perf irq as percpu, the flow handler
registered was not handle_percpu_irq()

Given that on ARCv2 cores, IRQs < 24 are always private to cpu, we
register the right handler at the very onset.

Cc: Marc Zyngier <marc.zyngier at arm.com>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: stable at vger.kernel.org #4.2+
Cc: linux-kernel at vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/intc-arcv2.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index 26c156827479..0394f9f61b46 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -106,10 +106,21 @@ static struct irq_chip arcv2_irq_chip = {
 static int arcv2_irq_map(struct irq_domain *d, unsigned int irq,
 			 irq_hw_number_t hw)
 {
-	if (irq == TIMER0_IRQ || irq == IPI_IRQ)
+	/*
+	 * core intc IRQs [16, 23]:
+	 * Statically assigned always private-per-core (Timers, WDT, IPI, PCT)
+	 */
+	if (hw < 24) {
+		/*
+		 * A subsequent request_percpu_irq() fails if percpu_devid is
+		 * not set. That in turns sets NOAUTOEN, meaning each core needs
+		 * to call enable_percpu_irq()
+		 */
+		irq_set_percpu_devid(irq);
 		irq_set_chip_and_handler(irq, &arcv2_irq_chip, handle_percpu_irq);
-	else
+	} else {
 		irq_set_chip_and_handler(irq, &arcv2_irq_chip, handle_level_irq);
+	}
 
 	return 0;
 }
-- 
1.9.1
