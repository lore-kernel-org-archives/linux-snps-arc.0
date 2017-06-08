From: noamca@mellanox.com (Noam Camus)
Date: Thu,  8 Jun 2017 18:20:25 +0300
Subject: [PATCH 01/11] ARC: set level of log per CPU during boot to be debug
 level
In-Reply-To: <1496935235-46507-1-git-send-email-noamca@mellanox.com>
References: <1496935235-46507-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1496935235-46507-2-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

The reasons are:
1) speeding up boot time, becomes critical for many CPUs machine,
   e.g. NPS400 with 4K CPUs
2) shorten kernel log at boot time, again easy to scan for large
   scale machines such NPS400

Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/kernel/setup.c |    6 +++---
 arch/arc/kernel/smp.c   |    4 ++--
 arch/arc/mm/cache.c     |    2 +-
 arch/arc/mm/tlb.c       |    2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index fc8211f..8494b31 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -385,13 +385,13 @@ void setup_processor(void)
 	read_arc_build_cfg_regs();
 	arc_init_IRQ();
 
-	printk(arc_cpu_mumbojumbo(cpu_id, str, sizeof(str)));
+	pr_debug("%s", arc_cpu_mumbojumbo(cpu_id, str, sizeof(str)));
 
 	arc_mmu_init();
 	arc_cache_init();
 
-	printk(arc_extn_mumbojumbo(cpu_id, str, sizeof(str)));
-	printk(arc_platform_smp_cpuinfo());
+	pr_debug("%s", arc_extn_mumbojumbo(cpu_id, str, sizeof(str)));
+	pr_debug("%s", arc_platform_smp_cpuinfo());
 
 	arc_chk_core_config();
 }
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index f462671..d1aa917 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -177,8 +177,8 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 
 	secondary_idle_tsk = idle;
 
-	pr_info("Idle Task [%d] %p", cpu, idle);
-	pr_info("Trying to bring up CPU%u ...\n", cpu);
+	pr_debug("Idle Task [%d] %p", cpu, idle);
+	pr_debug("Trying to bring up CPU%u ...\n", cpu);
 
 	if (plat_smp_ops.cpu_kick)
 		plat_smp_ops.cpu_kick(cpu,
diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index 3329d0d..15bc3e3 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -1188,7 +1188,7 @@ void __ref arc_cache_init(void)
 	unsigned int __maybe_unused cpu = smp_processor_id();
 	char str[256];
 
-	printk(arc_cache_mumbojumbo(0, str, sizeof(str)));
+	pr_debug("%s", arc_cache_mumbojumbo(0, str, sizeof(str)));
 
 	/*
 	 * Only master CPU needs to execute rest of function:
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index d0126fd..c5e70d8 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -814,7 +814,7 @@ void arc_mmu_init(void)
 	char str[256];
 	struct cpuinfo_arc_mmu *mmu = &cpuinfo_arc700[smp_processor_id()].mmu;
 
-	printk(arc_mmu_mumbojumbo(0, str, sizeof(str)));
+	pr_debug("%s", arc_mmu_mumbojumbo(0, str, sizeof(str)));
 
 	/*
 	 * Can't be done in processor.h due to header include depenedencies
-- 
1.7.1
