From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Tue,  8 Nov 2016 10:08:32 +0300
Subject: [PATCH v4 2/2] ARCv2: MCIP: Use IDU_M_DISTRI_DEST mode if there is
 only 1 destination core
In-Reply-To: <1478588912-3991-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1478588912-3991-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478588912-3991-3-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC linux uses 2 distribution modes for common interrupts: round robin
mode (IDU_M_DISTRI_RR) and a simple destination mode (IDU_M_DISTRI_DEST).
The first one is used when more than 1 cores may handle a common interrupt
and the second one is used when only 1 core may handle a common interrupt.

However idu_irq_set_affinity() always sets IDU_M_DISTRI_RR for all affinity
values. But there is no sense in setting of such mode if only 1 core must
handle a common interrupt.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/kernel/mcip.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index 4f4f04b..90f9934 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -193,6 +193,8 @@ idu_irq_set_affinity(struct irq_data *data, const struct cpumask *cpumask,
 {
 	unsigned long flags;
 	cpumask_t online;
+	unsigned int destination_bits;
+	unsigned int distribution_mode;
 
 	/* errout if no online cpu per @cpumask */
 	if (!cpumask_and(&online, cpumask, cpu_online_mask))
@@ -200,8 +202,15 @@ idu_irq_set_affinity(struct irq_data *data, const struct cpumask *cpumask,
 
 	raw_spin_lock_irqsave(&mcip_lock, flags);
 
-	idu_set_dest(data->hwirq, cpumask_bits(&online)[0]);
-	idu_set_mode(data->hwirq, IDU_M_TRIG_LEVEL, IDU_M_DISTRI_RR);
+	destination_bits = cpumask_bits(&online)[0];
+	idu_set_dest(data->hwirq, destination_bits);
+
+	if (ffs(destination_bits) == fls(destination_bits))
+		distribution_mode = IDU_M_DISTRI_DEST;
+	else
+		distribution_mode = IDU_M_DISTRI_RR;
+
+	idu_set_mode(data->hwirq, IDU_M_TRIG_LEVEL, distribution_mode);
 
 	raw_spin_unlock_irqrestore(&mcip_lock, flags);
 
-- 
2.7.4
