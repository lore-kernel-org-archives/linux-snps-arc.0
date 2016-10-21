From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Sat, 22 Oct 2016 01:15:31 +0300
Subject: [PATCH 5/5] ARC: MCIP: Use IDU_M_DISTRI_DEST mode if there is only 1
 destination core
In-Reply-To: <1477088131-15822-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1477088131-15822-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477088131-15822-5-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC linux uses 2 distribution modes for common interrupts: round robin
mode (IDU_M_DISTRI_RR) and a simple destination mode (IDU_M_DISTRI_DEST).
The first one is used when more than 1 cores may handle a common interrupt
and the second one is used when only 1 core may handle a common interrupt.

However idu_irq_set_affinity always sets IDU_M_DISTRI_RR for all affinity
values. But there is no sense in setting of such mode if only 1 core must
handle a common interrupt.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/kernel/mcip.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index 090f0a1..75e6d73 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -197,6 +197,7 @@ idu_irq_set_affinity(struct irq_data *data, const struct cpumask *cpumask,
 {
 	unsigned long flags;
 	cpumask_t online;
+	unsigned long dest_bits;
 
 	/* errout if no online cpu per @cpumask */
 	if (!cpumask_and(&online, cpumask, cpu_online_mask))
@@ -204,8 +205,14 @@ idu_irq_set_affinity(struct irq_data *data, const struct cpumask *cpumask,
 
 	raw_spin_lock_irqsave(&mcip_lock, flags);
 
-	idu_set_dest(data->hwirq, cpumask_bits(&online)[0]);
-	idu_set_mode(data->hwirq, IDU_M_TRIG_LEVEL, IDU_M_DISTRI_RR);
+	dest_bits = cpumask_bits(&online)[0];
+	idu_set_dest(data->hwirq, dest_bits);
+
+	if (ffs(dest_bits) == fls(dest_bits)) {
+		idu_set_mode(data->hwirq, IDU_M_TRIG_LEVEL, IDU_M_DISTRI_DEST);
+	} else {
+		idu_set_mode(data->hwirq, IDU_M_TRIG_LEVEL, IDU_M_DISTRI_RR);
+	}
 
 	raw_spin_unlock_irqrestore(&mcip_lock, flags);
 
-- 
2.7.4
