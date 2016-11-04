From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Fri,  4 Nov 2016 15:16:31 +0300
Subject: [RFC] ARCv2: MCIP: Deprecate setting of affinity in Device Tree
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478261791-2793-1-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Ignore value of interrupt distribution mode for common interrupts in
IDU since setting an affinity using value from Device Tree is deprecated
in ARC. Originially it is done in idu_irq_xlate function and it is
semantically wrong and does not guaranty that an affinity value will be
set properly.

However it is necessary to set a default affinity value manually for all
common interrupts since initially all of them are disabled by IDU (a
CPU mask for common interrupts is set to 0 after CPU reset) and in
some cases the kernel cannot do it itself after initialization of
endpoint devices (e.g. when IRQ chip below of IDU does not support
setting of affinity and it cannot propagate an affinity value to IDU).

P.S.

Despite the fact that the patch works fine I would like to discuss
few topics which are one way or another related to the original problem.

Despite the fact that this patch works fine it does not work well when
the intc below IDU does not support setting and propagating of affinity
(e.g. GPIO intc in AXS103 configuration which does not implement a function
for setting an affinity). That is why it is necessary to set an affinity
manually for IDU - you cannot be sure that an affinity will be propagated
to IDU properly even with support of hierarchical IRQ domains. But an
affinity *must* be set because IDU common interrupts are disabled by
default (registers which stores cpu masks are zeroes). In this patch
I use this soulution in idu_irq_map() function:

    irq_set_affinity(virq, cpu_online_mask);

And there is a second problem. You cannot be sure that all cpus are
online at the moment of calling idu_irq_map() that is why cpu_online_mask
mask is used for setting of the initial affinity. It means that affinity
of all common interrupts is unpredictable after kernel boot (of course it
would be cool to distribute all common interrupts to all available cores
by default).

And the third topic is setting of affinity for AXS103 devices. Devices
in AXS103 are connected to CPU through a chain of GPIO controllers which
funnel all signals to 2 IDU common interrupts. Thus you cannot simply set
an affinity for devices using something like:

    echo 2 > /proc/irq/3/...

because 1) GPIO contorrels in AXS103 does not support setting an affinity
and 2) there is a logical explanation for it: if you want to set an affinity
for a device connected to GPIO you produce a side affect by touchin an
affinity for nearby devices.

So if in case of AXS103 you must set an affinity not for devices but for
GPIO controllers which are connected to IDU. Also you must to know a virq
of the common interrupt line in IDU to set an affinity for it. Problem is
that you cannot retrieve this value from /proc/interrupts for AXS103 even
if support of hierarchical domains is implemented: /proc/interrupts does
not show chained virqs and virqs without actions (e.g. all virqs of IDU).

P.S.S.

The question is how to solve all those problems properly.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 .../interrupt-controller/snps,archs-idu-intc.txt   |  2 ++
 arch/arc/kernel/mcip.c                             | 35 +++++-----------------
 2 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
index 0dcb7c7..e967e7f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
@@ -15,6 +15,8 @@ Properties:
   Second cell specifies the irq distribution mode to cores
      0=Round Robin; 1=cpu0, 2=cpu1, 4=cpu2, 8=cpu3
 
+  The second cell in interrupts property is deprecated and ignored.
+
   intc accessed via the special ARC AUX register interface, hence "reg" property
   is not specified.
 
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index 90f9934..2f4b0dc 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -242,6 +242,7 @@ static int idu_irq_map(struct irq_domain *d, unsigned int virq, irq_hw_number_t
 {
 	irq_set_chip_and_handler(virq, &idu_irq_chip, handle_level_irq);
 	irq_set_status_flags(virq, IRQ_MOVE_PCNTXT);
+	irq_set_affinity(virq, cpu_online_mask);
 
 	return 0;
 }
@@ -250,36 +251,14 @@ static int idu_irq_xlate(struct irq_domain *d, struct device_node *n,
 			 const u32 *intspec, unsigned int intsize,
 			 irq_hw_number_t *out_hwirq, unsigned int *out_type)
 {
-	irq_hw_number_t hwirq = *out_hwirq = intspec[0];
-	int distri = intspec[1];
-	unsigned long flags;
-
+	/*
+	 * Ignore value of interrupt distribution mode for common interrupts in
+	 * IDU which resides in intspec[1] since setting an affinity using value
+	 * from Device Tree is deprecated in ARC.
+	 */
+	*out_hwirq = intspec[0];
 	*out_type = IRQ_TYPE_NONE;
 
-	/* XXX: validate distribution scheme again online cpu mask */
-	if (distri == 0) {
-		/* 0 - Round Robin to all cpus, otherwise 1 bit per core */
-		raw_spin_lock_irqsave(&mcip_lock, flags);
-		idu_set_dest(hwirq, BIT(num_online_cpus()) - 1);
-		idu_set_mode(hwirq, IDU_M_TRIG_LEVEL, IDU_M_DISTRI_RR);
-		raw_spin_unlock_irqrestore(&mcip_lock, flags);
-	} else {
-		/*
-		 * DEST based distribution for Level Triggered intr can only
-		 * have 1 CPU, so generalize it to always contain 1 cpu
-		 */
-		int cpu = ffs(distri);
-
-		if (cpu != fls(distri))
-			pr_warn("IDU irq %lx distri mode set to cpu %x\n",
-				hwirq, cpu);
-
-		raw_spin_lock_irqsave(&mcip_lock, flags);
-		idu_set_dest(hwirq, cpu);
-		idu_set_mode(hwirq, IDU_M_TRIG_LEVEL, IDU_M_DISTRI_DEST);
-		raw_spin_unlock_irqrestore(&mcip_lock, flags);
-	}
-
 	return 0;
 }
 
-- 
2.7.4
