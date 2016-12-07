From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed,  7 Dec 2016 18:55:54 +0300
Subject: [PATCH] arc: Allow selection of master core
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1481126154-17491-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

We used to think that core0 is always so-called master-core
which is executed before all other cores and does some preparation
before allowing other cores to start or continue execution.

But in some cases we may want another core to be that master or we
may only run Linux on subset of cores in SMP SoC so core0 won't be
an option any longer.

That change introduces new Kconfig option that allows explicit selection
of the master core.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/Kconfig       | 17 +++++++++++++++++
 arch/arc/kernel/head.S |  2 +-
 arch/arc/kernel/smp.c  |  6 +++---
 arch/arc/mm/cache.c    |  4 +++-
 4 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 6e89585b5ea0..c0969274874f 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -204,6 +204,23 @@ config ARC_SMP_HALT_ON_RESET
 	  at designated entry point. For other case, all jump to common
 	  entry point and spin wait for Master's signal.
 
+config ARC_MASTER_CORE
+	int "Master core index"
+	range 0 NR_CPUS
+	default "0"
+	help
+	  Any core might be used as a master, i.e. the one which does initial
+	  low-level setup before real SMP stuff is ready to be used.
+	  Default 0 (the first core) is what you most probably need but if you
+	  know what you are doing other cores might be used as a master.
+	  This is especially useful if one wants to run Linux just on one core out of
+	  many in SMP SoC and that core to be not the first one.
+
+	  Note that value MUST BE <= (NR_CPUS - 1), i.e. if NR_CPUS=4 then master core
+	  MUST BE in a range 0, 1, 2, 3. Unfortunately in Kconfig there's no way to
+	  set a range with expression, so it checks for <= NR_CPUS which is not entirely
+	  correct!
+
 endif	#SMP
 
 config ARC_MCIP
diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
index 689dd867fdff..92d203e9c57f 100644
--- a/arch/arc/kernel/head.S
+++ b/arch/arc/kernel/head.S
@@ -69,7 +69,7 @@ ENTRY(stext)
 
 #ifdef CONFIG_SMP
 	GET_CPU_ID  r5
-	cmp	r5, 0
+	cmp	r5, CONFIG_ARC_MASTER_CORE
 	mov.nz	r0, r5
 #ifdef CONFIG_ARC_SMP_HALT_ON_RESET
 	; Non-Master can proceed as system would be booted sufficiently
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index 88674d972c9d..3b1642a9c0b5 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -92,13 +92,13 @@ static volatile int wake_flag;
 
 static void arc_default_smp_cpu_kick(int cpu, unsigned long pc)
 {
-	BUG_ON(cpu == 0);
-	wake_flag = cpu;
+	BUG_ON(cpu == CONFIG_ARC_MASTER_CORE);
+	wake_flag = BIT(cpu);
 }
 
 void arc_platform_smp_wait_to_boot(int cpu)
 {
-	while (wake_flag != cpu)
+	while (wake_flag != BIT(cpu))
 		;
 
 	wake_flag = 0;
diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index 3f443ab770e0..1260ff311114 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -933,14 +933,16 @@ void arc_cache_init(void)
 
 	printk(arc_cache_mumbojumbo(0, str, sizeof(str)));
 
+#ifdef CONFIG_SMP
 	/*
 	 * Only master CPU needs to execute rest of function:
 	 *  - Assume SMP so all cores will have same cache config so
 	 *    any geomtry checks will be same for all
 	 *  - IOC setup / dma callbacks only need to be setup once
 	 */
-	if (cpu)
+	if (cpu != CONFIG_ARC_MASTER_CORE)
 		return;
+#endif
 
 	if (IS_ENABLED(CONFIG_ARC_HAS_ICACHE)) {
 		struct cpuinfo_arc_cache *ic = &cpuinfo_arc700[cpu].icache;
-- 
2.7.4
