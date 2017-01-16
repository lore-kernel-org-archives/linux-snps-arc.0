From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 16 Jan 2017 12:57:55 -0800
Subject: [PATCH 2/4] ARC: smp-boot: run-on-reset: add callback to allow non
 masters to wait
In-Reply-To: <1484600277-32345-1-git-send-email-vgupta@synopsys.com>
References: <1484600277-32345-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1484600277-32345-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Currently for halt-on-reset, non masters spin on a shared memory which
is wiggled by Master at right time. This is not efficient when hardware
support exists to stop and resume them from Master (using an external IP
block). More importantly Master might be setting up SLC or IO-Coherency
aperutes in early boot duting which other cores need NOT perturb the
coherency unit, thus need a mechanism that doesn't rely on polling
memory.

This just adds infrastructure for next patch which will add the hardware
support (MCIP Inter Core Debug Unit).

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/smp.h |  3 +++
 arch/arc/kernel/smp.c      | 17 +++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/smp.h b/arch/arc/include/asm/smp.h
index 0861007d9ef3..6187b9d14b03 100644
--- a/arch/arc/include/asm/smp.h
+++ b/arch/arc/include/asm/smp.h
@@ -50,6 +50,8 @@ extern int smp_ipi_irq_setup(int cpu, irq_hw_number_t hwirq);
  * 			mach_desc->init_early()
  * @init_per_cpu:	Called for each core so SMP h/w block driver can do
  * 			any needed setup per cpu (e.g. IPI request)
+ * @cpu_wait:		Non masters wait to be resumed later by master (to avoid
+ * 			perturbing SLC / cache coherency in early boot)
  * @cpu_kick:		For Master to kickstart a cpu (optionally at a PC)
  * @ipi_send:		To send IPI to a @cpu
  * @ips_clear:		To clear IPI received at @irq
@@ -58,6 +60,7 @@ struct plat_smp_ops {
 	const char 	*info;
 	void		(*init_early_smp)(void);
 	void		(*init_per_cpu)(int cpu);
+	void		(*cpu_wait)(int cpu);
 	void		(*cpu_kick)(int cpu, unsigned long pc);
 	void		(*ipi_send)(int cpu);
 	void		(*ipi_clear)(int irq);
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index 44a0d21ed342..e60c11b8f4b9 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -96,16 +96,25 @@ static void arc_default_smp_cpu_kick(int cpu, unsigned long pc)
 	wake_flag = cpu;
 }
 
+static void arc_default_smp_wait_to_boot(int cpu)
+{
+	while (wake_flag != cpu)
+		;
+
+	wake_flag = 0;
+}
+
 void arc_platform_smp_wait_to_boot(int cpu)
 {
 	/* for halt-on-reset, we've waited already */
 	if (IS_ENABLED(CONFIG_ARC_SMP_HALT_ON_RESET))
 		return;
 
-	while (wake_flag != cpu)
-		;
-
-	wake_flag = 0;
+	/* platform callback might fail */
+	if (plat_smp_ops.cpu_wait)
+		plat_smp_ops.cpu_wait(cpu);
+	else
+		arc_default_smp_wait_to_boot(cpu);
 }
 
 const char *arc_platform_smp_cpuinfo(void)
-- 
2.7.4
