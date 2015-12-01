From: noamc@ezchip.com (Noam Camus)
Date: Tue, 1 Dec 2015 15:02:55 +0200
Subject: [PATCH v3 08/18] ARC: Mark secondary cpu online only after all HW
 setup is done
In-Reply-To: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
References: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1448974985-11487-9-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

In SMP setup, master loops for each_present_cpu calling cpu_up().
For ARC it returns as soon as new cpu's status becomes online,
However secondary may still do HW initializing,
machine or platform hook level.

So turn secondary online only after all HW setup is done.
Signed-off-by: Noam Camus <noamc at ezchip.com>
Acked-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/smp.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index 0b061a4..bc0e4f6 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -126,11 +126,6 @@ void start_kernel_secondary(void)
 	current->active_mm = mm;
 	cpumask_set_cpu(cpu, mm_cpumask(mm));
 
-	notify_cpu_starting(cpu);
-	set_cpu_online(cpu, true);
-
-	pr_info("## CPU%u LIVE ##: Executing Code...\n", cpu);
-
 	/* Some SMP H/w setup - for each cpu */
 	if (plat_smp_ops.init_per_cpu)
 		plat_smp_ops.init_per_cpu(cpu);
@@ -138,6 +133,11 @@ void start_kernel_secondary(void)
 	if (machine_desc->init_cpu_smp)
 		machine_desc->init_cpu_smp(cpu);
 
+	notify_cpu_starting(cpu);
+	set_cpu_online(cpu, true);
+
+	pr_info("## CPU%u LIVE ##: Executing Code...\n", cpu);
+
 	arc_local_timer_setup();
 
 	local_irq_enable();
-- 
1.7.1
