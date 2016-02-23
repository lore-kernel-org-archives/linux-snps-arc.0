From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 23 Feb 2016 14:41:38 +0530
Subject: [PATCH 1/5] ARCv2: SMP: Emulate IPI to self using software triggered
 interrupt
In-Reply-To: <1456218702-11911-1-git-send-email-vgupta@synopsys.com>
References: <1456218702-11911-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1456218702-11911-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARConnect/MCIP Inter-Core-Interrupt module can't send interrupt to
local core. So use core intc capability to trigger software
interrupt to self, using an unsued IRQ #21.

This showed up as csd deadlock with LTP trace_sched on a dual core
system. This test acts as scheduler fuzzer, triggering all sorts of
schedulting activity. Trouble starts with IPI to self, which doesn't get
delivered (effectively lost due to H/w capability), but the msg intended
to be sent remain enqueued in per-cpu @ipi_data.

All subsequent IPIs to this core from other cores get elided due to the
IPI coalescing optimization in ipi_send_msg_one() where a pending msg
implies an IPI already sent and assumes other core is yet to ack it.
After the elided IPI, other core simply goes into csd_lock_wait()
but never comes out as this core never sees the interrupt.

Fixes STAR 9001008624

Cc: Peter Zijlstra <peterz at infradead.org>
Cc: <stable at vger.kernel.org>        [4.2]
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/irqflags-arcv2.h | 11 +++++++++++
 arch/arc/kernel/mcip.c                | 15 +++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arc/include/asm/irqflags-arcv2.h b/arch/arc/include/asm/irqflags-arcv2.h
index 1fc18ee06cf2..37c2f751eebf 100644
--- a/arch/arc/include/asm/irqflags-arcv2.h
+++ b/arch/arc/include/asm/irqflags-arcv2.h
@@ -22,6 +22,7 @@
 #define AUX_IRQ_CTRL		0x00E
 #define AUX_IRQ_ACT		0x043	/* Active Intr across all levels */
 #define AUX_IRQ_LVL_PEND	0x200	/* Pending Intr across all levels */
+#define AUX_IRQ_HINT		0x201	/* For generating Soft Interrupts */
 #define AUX_IRQ_PRIORITY	0x206
 #define ICAUSE			0x40a
 #define AUX_IRQ_SELECT		0x40b
@@ -115,6 +116,16 @@ static inline int arch_irqs_disabled(void)
 	return arch_irqs_disabled_flags(arch_local_save_flags());
 }
 
+static inline void arc_softirq_trigger(int irq)
+{
+	write_aux_reg(AUX_IRQ_HINT, irq);
+}
+
+static inline void arc_softirq_clear(int irq)
+{
+	write_aux_reg(AUX_IRQ_HINT, 0);
+}
+
 #else
 
 .macro IRQ_DISABLE  scratch
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index 002c5fcf8947..9e1bd03b87a6 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -11,9 +11,12 @@
 #include <linux/smp.h>
 #include <linux/irq.h>
 #include <linux/spinlock.h>
+#include <asm/irqflags-arcv2.h>
 #include <asm/mcip.h>
 #include <asm/setup.h>
 
+#define SOFTIRQ_IRQ	21
+
 static char smp_cpuinfo_buf[128];
 static int idu_detected;
 
@@ -22,6 +25,7 @@ static DEFINE_RAW_SPINLOCK(mcip_lock);
 static void mcip_setup_per_cpu(int cpu)
 {
 	smp_ipi_irq_setup(cpu, IPI_IRQ);
+	smp_ipi_irq_setup(cpu, SOFTIRQ_IRQ);
 }
 
 static void mcip_ipi_send(int cpu)
@@ -29,6 +33,12 @@ static void mcip_ipi_send(int cpu)
 	unsigned long flags;
 	int ipi_was_pending;
 
+	/* ARConnect can only send IPI to others */
+	if (unlikely(cpu == raw_smp_processor_id())) {
+		arc_softirq_trigger(SOFTIRQ_IRQ);
+		return;
+	}
+
 	/*
 	 * NOTE: We must spin here if the other cpu hasn't yet
 	 * serviced a previous message. This can burn lots
@@ -63,6 +73,11 @@ static void mcip_ipi_clear(int irq)
 	unsigned long flags;
 	unsigned int __maybe_unused copy;
 
+	if (unlikely(irq == SOFTIRQ_IRQ)) {
+		arc_softirq_clear(irq);
+		return;
+	}
+
 	raw_spin_lock_irqsave(&mcip_lock, flags);
 
 	/* Who sent the IPI */
-- 
2.5.0
