From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 25 Jan 2016 18:38:34 +0530
Subject: [PATCH v4 05/19] irqchip: add nps Internal and external irqchips
In-Reply-To: <567434DF.2030201@arm.com>
References: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
 <1450228238-4499-6-git-send-email-noamc@ezchip.com>
 <56712F50.6050404@arm.com>
 <DB5PR02MB1141324364E0253DAA030DF1D6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
 <5673EC2D.5040307@arm.com>
 <DB5PR02MB1141A1E0BE574A713957650BD6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
 <567434DF.2030201@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56A61E52.3050505@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Marc,

On Friday 18 December 2015 10:01 PM, Marc Zyngier wrote:
> On 18/12/15 14:29, Noam Camus wrote:
>>> From: Marc Zyngier [mailto:marc.zyngier at arm.com] 
>>> Sent: Friday, December 18, 2015 1:21 PM
>>
>>>> I need this for my per CPU irqs such timer and IPI which do not come 
>>>> from some external device but from CPUs. For these IRQs I am calling 
>>>> to irq_create_mapping() from my platform at arch/arc and at that point 
>>>> I got no irqdomain and using irq_find_host() is not good since I got 
>>>> no device_node (at most I can have DT root).
>>
>>> That's a problem. You should never do that for your timer (doing a request_irq will do the right thing, and that's what your timer driver already does).
>>
>> Please be more specific, from all that I wrote what is the problem?
> 
> Calling irq_create_mapping out of the blue like you do it here:
> 
> +static void eznps_init_per_cpu(int cpu)
> +{
> +	/* Create mapping for all per cpu IRQs */
> +	if (cpu == 0) {
> +		irq_create_mapping(NULL, TIMER0_IRQ);
> +		irq_create_mapping(NULL, IPI_IRQ);
> +	}
> 
> is simply not acceptable.

I understand but... see below

>>> As for initializing your IPIs, they are usually outside of the IRQ
>>> space, so you should handle them separately (and get your irqchip
>>> to initialize them).
>> I am handling all my IRQs within same irqchip, which is the only one 
>> I have. So I am not sure what you expect here. Please be more 
>> elaborate.
> 
> Do not create a mapping for IPIs. Full stop. Handle them independently
> from your normal IRQs.

why not ? IPI is a hardware construct afterall.

Anyhow I looked in arch/arm and do_IPI/handle_IPI are the handlers. do_IPI is
called from asm, irq-gic.c calls handle_IPI. I can't seem to find an explicit
request_irq / request_percpu_irq for IPI irq ?

...

>> Note that I am working with ARC (seem alike) here and we do not
>> define CONFIG_HANDLE_DOMAIN_IRQ and do not implement
>> set_handle_irq().
>>
>> So for ARC this reverse mapping is something we can leave without
>> (maybe because we are kind of a legacy domain).
> 
> Yeah, I just located the crap: arch_do_IRQ() happily takes a hwirq (the
> vector number), and uses that as a Linux IRQ. This looks a lot like ARM
> pre-DT, about 10 years ago.
> 
> Well, time to meet the 21st century. If you intend to use DT, please fix
> your arch port. Otherwise, just hardcode everything in your platform and
> don't pretend to support device tree.

Following works for me, hopefully it is closer to 21st century code :-)

----------->
>From 619eb5179d865140a723dd524d0e42fbf234b53b Mon Sep 17 00:00:00 2001
From: Vineet Gupta <vgupta@synopsys.com>
Date: Fri, 1 Jan 2016 15:12:54 +0530
Subject: [PATCH] ARC: [intc-*] Do a domain lookup in primary handler for hwirq
 -> linux virq

The primary interrupt handler arch_do_IRQ() was passing hwirq as linux
virq to core code. This was fragile and worked so far as we only had legacy/linear
domains.

This came out of a rant by Marc Zyngier.
http://lists.infradead.org/pipermail/linux-snps-arc/2015-December/000298.html

Cc: Marc Zyngier <marc.zyngier at arm.com>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Noam Camus <noamc at ezchip.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Kconfig               |  1 +
 arch/arc/kernel/intc-arcv2.c   |  9 ++++++---
 arch/arc/kernel/intc-compact.c | 10 ++++++----
 arch/arc/kernel/irq.c          |  9 ++-------
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 6312f607932f..576f1c40ba75 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -31,6 +31,7 @@ config ARC
 	select HAVE_MOD_ARCH_SPECIFIC if ARC_DW2_UNWIND
 	select HAVE_OPROFILE
 	select HAVE_PERF_EVENTS
+	select HANDLE_DOMAIN_IRQ
 	select IRQ_DOMAIN
 	select MODULES_USE_ELF_RELA
 	select NO_BOOTMEM
diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index 0394f9f61b46..cede73b50d31 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -130,21 +130,24 @@ static const struct irq_domain_ops arcv2_irq_ops = {
 	.map = arcv2_irq_map,
 };

-static struct irq_domain *root_domain;

 static int __init
 init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
 {
+	struct irq_domain *root_domain;
+
 	if (parent)
 		panic("DeviceTree incore intc not a root irq controller\n");

 	root_domain = irq_domain_add_legacy(intc, NR_CPU_IRQS, 0, 0,
 					    &arcv2_irq_ops, NULL);
-
 	if (!root_domain)
 		panic("root irq domain not avail\n");

-	/* with this we don't need to export root_domain */
+	/*
+	 * Needed for primary domain lookup to succeed
+	 * This is a primary irqchip, and can never have a parent
+	 */
 	irq_set_default_host(root_domain);

 	return 0;
diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index 06bcedf19b62..c2df66624bbb 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -97,21 +97,23 @@ static const struct irq_domain_ops arc_intc_domain_ops = {
 	.map = arc_intc_domain_map,
 };

-static struct irq_domain *root_domain;
-
 static int __init
 init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
 {
+	struct irq_domain *root_domain;
+
 	if (parent)
 		panic("DeviceTree incore intc not a root irq controller\n");

 	root_domain = irq_domain_add_legacy(intc, NR_CPU_IRQS, 0, 0,
 					    &arc_intc_domain_ops, NULL);
-
 	if (!root_domain)
 		panic("root irq domain not avail\n");

-	/* with this we don't need to export root_domain */
+	/*
+	 * Needed for primary domain lookup to succeed
+	 * This is a primary irqchip, and can never have a parent
+	 */
 	irq_set_default_host(root_domain);

 	return 0;
diff --git a/arch/arc/kernel/irq.c b/arch/arc/kernel/irq.c
index ba17f85285cf..5c027005039b 100644
--- a/arch/arc/kernel/irq.c
+++ b/arch/arc/kernel/irq.c
@@ -41,14 +41,9 @@ void __init init_IRQ(void)
  * "C" Entry point for any ARC ISR, called from low level vector handler
  * @irq is the vector number read from ICAUSE reg of on-chip intc
  */
-void arch_do_IRQ(unsigned int irq, struct pt_regs *regs)
+void arch_do_IRQ(unsigned int hwirq, struct pt_regs *regs)
 {
-	struct pt_regs *old_regs = set_irq_regs(regs);
-
-	irq_enter();
-	generic_handle_irq(irq);
-	irq_exit();
-	set_irq_regs(old_regs);
+	handle_domain_irq(NULL, hwirq, regs);
 }

 /*
-- 
2.5.0
