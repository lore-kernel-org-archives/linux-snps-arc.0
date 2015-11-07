From: noamc@ezchip.com (Noam Camus)
Date: Sat, 7 Nov 2015 12:52:25 +0200
Subject: [PATCH v2 07/19] ARC: rename smp operation init_irq_cpu() to
 init_per_cpu()
In-Reply-To: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446893557-29748-8-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

This will better reflect its description i.e. "any needed setup..."
and not just do an "IPI request".

Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/include/asm/smp.h |    4 ++--
 arch/arc/kernel/irq.c      |    4 ++--
 arch/arc/kernel/mcip.c     |    2 +-
 arch/arc/kernel/smp.c      |    4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arc/include/asm/smp.h b/arch/arc/include/asm/smp.h
index 133c867..9913804 100644
--- a/arch/arc/include/asm/smp.h
+++ b/arch/arc/include/asm/smp.h
@@ -48,7 +48,7 @@ extern int smp_ipi_irq_setup(int cpu, int irq);
  * @init_early_smp:	A SMP specific h/w block can init itself
  * 			Could be common across platforms so not covered by
  * 			mach_desc->init_early()
- * @init_irq_cpu:	Called for each core so SMP h/w block driver can do
+ * @init_per_cpu:	Called for each core so SMP h/w block driver can do
  * 			any needed setup per cpu (e.g. IPI request)
  * @cpu_kick:		For Master to kickstart a cpu (optionally at a PC)
  * @ipi_send:		To send IPI to a @cpu
@@ -57,7 +57,7 @@ extern int smp_ipi_irq_setup(int cpu, int irq);
 struct plat_smp_ops {
 	const char 	*info;
 	void		(*init_early_smp)(void);
-	void		(*init_irq_cpu)(int cpu);
+	void		(*init_per_cpu)(int cpu);
 	void		(*cpu_kick)(int cpu, unsigned long pc);
 	void		(*ipi_send)(int cpu);
 	void		(*ipi_clear)(int irq);
diff --git a/arch/arc/kernel/irq.c b/arch/arc/kernel/irq.c
index 2ee2265..a650650 100644
--- a/arch/arc/kernel/irq.c
+++ b/arch/arc/kernel/irq.c
@@ -29,8 +29,8 @@ void __init init_IRQ(void)
 
 #ifdef CONFIG_SMP
 	/* a SMP H/w block could do IPI IRQ request here */
-	if (plat_smp_ops.init_irq_cpu)
-		plat_smp_ops.init_irq_cpu(smp_processor_id());
+	if (plat_smp_ops.init_per_cpu)
+		plat_smp_ops.init_per_cpu(smp_processor_id());
 
 	if (machine_desc->init_cpu_smp)
 		machine_desc->init_cpu_smp(smp_processor_id());
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index 74a9b07..bd237ac 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -132,7 +132,7 @@ static void mcip_probe_n_setup(void)
 struct plat_smp_ops plat_smp_ops = {
 	.info		= smp_cpuinfo_buf,
 	.init_early_smp	= mcip_probe_n_setup,
-	.init_irq_cpu	= mcip_setup_per_cpu,
+	.init_per_cpu	= mcip_setup_per_cpu,
 	.ipi_send	= mcip_ipi_send,
 	.ipi_clear	= mcip_ipi_clear,
 };
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index 5805878..0b061a4 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -132,8 +132,8 @@ void start_kernel_secondary(void)
 	pr_info("## CPU%u LIVE ##: Executing Code...\n", cpu);
 
 	/* Some SMP H/w setup - for each cpu */
-	if (plat_smp_ops.init_irq_cpu)
-		plat_smp_ops.init_irq_cpu(cpu);
+	if (plat_smp_ops.init_per_cpu)
+		plat_smp_ops.init_per_cpu(cpu);
 
 	if (machine_desc->init_cpu_smp)
 		machine_desc->init_cpu_smp(cpu);
-- 
1.7.1
