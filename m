From: noamc@ezchip.com (Noam Camus)
Date: Sat, 31 Oct 2015 15:15:13 +0200
Subject: [PATCH v1 06/20] ARC: Mark cpu online only after it has executed the
 per cpu init hook.
In-Reply-To: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446297327-16298-7-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

In SMP setup, master loops for each_present_cpu calling cpu_up() which
for ARC returns as soon as new cpu's status becomes online,
but it could still be initializing (see start_kernel_secondary())
Thus master can start cpu up for 2nd core,
while prev is still not fully up.
This can be issue for SMT system,
where first h/w thread of a core needs to be fully up before
moving on to next threads.

Signed-off-by: Noam Camus <noamc at ezchip.com>
Acked-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/smp.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index 5805878..946109f 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -126,6 +126,10 @@ void start_kernel_secondary(void)
 	current->active_mm = mm;
 	cpumask_set_cpu(cpu, mm_cpumask(mm));
 
+	/* Before we turn online */
+	if (machine_desc->init_cpu_smp)
+		machine_desc->init_cpu_smp(cpu);
+
 	notify_cpu_starting(cpu);
 	set_cpu_online(cpu, true);
 
@@ -135,9 +139,6 @@ void start_kernel_secondary(void)
 	if (plat_smp_ops.init_irq_cpu)
 		plat_smp_ops.init_irq_cpu(cpu);
 
-	if (machine_desc->init_cpu_smp)
-		machine_desc->init_cpu_smp(cpu);
-
 	arc_local_timer_setup();
 
 	local_irq_enable();
-- 
1.7.1
