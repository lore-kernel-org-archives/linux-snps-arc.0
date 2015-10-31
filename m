From: noamc@ezchip.com (Noam Camus)
Date: Sat, 31 Oct 2015 15:15:15 +0200
Subject: [PATCH v1 08/20] ARC: Use res_service as entry point for secondaries
In-Reply-To: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446297327-16298-9-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Tal Zilcer <talz@ezchip.com>

At cpu_kick() we call res_service which can be implement by each
platform and override gerneric weak definition.

Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/include/asm/smp.h |    2 +-
 arch/arc/kernel/smp.c      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/smp.h b/arch/arc/include/asm/smp.h
index 133c867..db05793 100644
--- a/arch/arc/include/asm/smp.h
+++ b/arch/arc/include/asm/smp.h
@@ -30,7 +30,7 @@ extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
  * APIs provided by arch SMP code to rest of arch code
  */
 extern void __init smp_init_cpus(void);
-extern void first_lines_of_secondary(void);
+extern void res_service(void);
 extern const char *arc_platform_smp_cpuinfo(void);
 
 /*
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index 946109f..546079f 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -167,7 +167,7 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 
 	if (plat_smp_ops.cpu_kick)
 		plat_smp_ops.cpu_kick(cpu,
-				(unsigned long)first_lines_of_secondary);
+				(unsigned long)res_service);
 	else
 		arc_default_smp_cpu_kick(cpu, (unsigned long)NULL);
 
-- 
1.7.1
