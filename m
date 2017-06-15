From: noamca@mellanox.com (Noam Camus)
Date: Thu, 15 Jun 2017 11:43:54 +0300
Subject: [PATCH v3 04/11] ARC: Add CPU topology
In-Reply-To: <1497516241-16446-1-git-send-email-noamca@mellanox.com>
References: <1497516241-16446-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1497516241-16446-5-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

Now it is used for NPS SoC for multi-core of 256 cores
and SMT of 16 HW threads per core.

This way with topology the scheduler is much efficient in
creating domains and later using them.

Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/Kconfig                |   27 ++++++++
 arch/arc/include/asm/Kbuild     |    1 -
 arch/arc/include/asm/topology.h |   34 +++++++++++
 arch/arc/kernel/Makefile        |    1 +
 arch/arc/kernel/setup.c         |    4 +-
 arch/arc/kernel/smp.c           |    5 ++
 arch/arc/kernel/topology.c      |  125 +++++++++++++++++++++++++++++++++++++++
 7 files changed, 194 insertions(+), 3 deletions(-)
 create mode 100644 arch/arc/include/asm/topology.h
 create mode 100644 arch/arc/kernel/topology.c

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index f464f97..08a9003 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -202,6 +202,33 @@ config ARC_SMP_HALT_ON_RESET
 	  at designated entry point. For other case, all jump to common
 	  entry point and spin wait for Master's signal.
 
+config NPS_CPU_TOPOLOGY
+	bool "Support cpu topology definition"
+	depends on EZNPS_MTM_EXT
+	default y
+	help
+	  Support NPS cpu topology definition.
+	  NPS400 got 16 clusters of cores.
+	  NPS400 cluster got 16 cores.
+	  NPS core got 16 symetrical threads.
+	  Totally there are such 4096 threads (NR_CPUS=4096)
+
+config SCHED_MC
+	bool "Multi-core scheduler support"
+	depends on NPS_CPU_TOPOLOGY
+	help
+	  Multi-core scheduler support improves the CPU scheduler's decision
+	  making when dealing with multi-core CPU chips at a cost of slightly
+	  increased overhead in some places. If unsure say N here.
+
+config SCHED_SMT
+	bool "SMT scheduler support"
+	depends on NPS_CPU_TOPOLOGY
+	help
+	  Improves the CPU scheduler's decision making when dealing with
+	  MultiThreading at a cost of slightly increased overhead in some
+	  places. If unsure say N here.
+
 endif	#SMP
 
 config ARC_MCIP
diff --git a/arch/arc/include/asm/Kbuild b/arch/arc/include/asm/Kbuild
index 7bee4e4..d8cb607 100644
--- a/arch/arc/include/asm/Kbuild
+++ b/arch/arc/include/asm/Kbuild
@@ -43,7 +43,6 @@ generic-y += stat.h
 generic-y += statfs.h
 generic-y += termbits.h
 generic-y += termios.h
-generic-y += topology.h
 generic-y += trace_clock.h
 generic-y += types.h
 generic-y += ucontext.h
diff --git a/arch/arc/include/asm/topology.h b/arch/arc/include/asm/topology.h
new file mode 100644
index 0000000..a9be3f8
--- /dev/null
+++ b/arch/arc/include/asm/topology.h
@@ -0,0 +1,34 @@
+#ifndef _ASM_ARC_TOPOLOGY_H
+#define _ASM_ARC_TOPOLOGY_H
+
+#ifdef CONFIG_NPS_CPU_TOPOLOGY
+
+#include <linux/cpumask.h>
+
+struct cputopo_nps {
+	int thread_id;
+	int core_id;
+	cpumask_t thread_sibling;
+	cpumask_t core_sibling;
+};
+
+extern struct cputopo_nps cpu_topology[NR_CPUS];
+
+#define topology_core_id(cpu)          (cpu_topology[cpu].core_id)
+#define topology_core_cpumask(cpu)     (&cpu_topology[cpu].core_sibling)
+#define topology_sibling_cpumask(cpu)  (&cpu_topology[cpu].thread_sibling)
+
+void init_cpu_topology(void);
+void store_cpu_topology(unsigned int cpuid);
+const struct cpumask *cpu_coregroup_mask(int cpu);
+
+#else
+
+static inline void init_cpu_topology(void) { }
+static inline void store_cpu_topology(unsigned int cpuid) { }
+
+#endif
+
+#include <asm-generic/topology.h>
+
+#endif /* _ASM_ARC_TOPOLOGY_H */
diff --git a/arch/arc/kernel/Makefile b/arch/arc/kernel/Makefile
index 8942c5c..46af80a 100644
--- a/arch/arc/kernel/Makefile
+++ b/arch/arc/kernel/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_ARC_EMUL_UNALIGNED) 	+= unaligned.o
 obj-$(CONFIG_KGDB)			+= kgdb.o
 obj-$(CONFIG_ARC_METAWARE_HLINK)	+= arc_hostlink.o
 obj-$(CONFIG_PERF_EVENTS)		+= perf_event.o
+obj-$(CONFIG_NPS_CPU_TOPOLOGY)		+= topology.o
 
 obj-$(CONFIG_ARC_FPU_SAVE_RESTORE)	+= fpu.o
 CFLAGS_fpu.o   += -mdpfp
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index de29ea9..379ebda 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -571,14 +571,14 @@ static void c_stop(struct seq_file *m, void *v)
 	.show	= show_cpuinfo
 };
 
-static DEFINE_PER_CPU(struct cpu, cpu_topology);
+static DEFINE_PER_CPU(struct cpu, cpu_topo_info);
 
 static int __init topology_init(void)
 {
 	int cpu;
 
 	for_each_present_cpu(cpu)
-	    register_cpu(&per_cpu(cpu_topology, cpu), cpu);
+		register_cpu(&per_cpu(cpu_topo_info, cpu), cpu);
 
 	return 0;
 }
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index f462671..91668c5 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -67,6 +67,9 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	int i;
 
+	init_cpu_topology();
+	store_cpu_topology(smp_processor_id());
+
 	/*
 	 * if platform didn't set the present map already, do it now
 	 * boot cpu is set to present already by init/main.c
@@ -151,6 +154,8 @@ void start_kernel_secondary(void)
 	if (machine_desc->init_per_cpu)
 		machine_desc->init_per_cpu(cpu);
 
+	store_cpu_topology(cpu);
+
 	notify_cpu_starting(cpu);
 	set_cpu_online(cpu, true);
 
diff --git a/arch/arc/kernel/topology.c b/arch/arc/kernel/topology.c
new file mode 100644
index 0000000..3feb7c9
--- /dev/null
+++ b/arch/arc/kernel/topology.c
@@ -0,0 +1,125 @@
+/*
+ * Copyright (C) 2015 Synopsys, Inc. (www.synopsys.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/export.h>
+#include <linux/init.h>
+#include <linux/percpu.h>
+#include <linux/node.h>
+#include <linux/nodemask.h>
+#include <linux/of.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/sched/topology.h>
+#include <plat/smp.h>
+
+/*
+ * cpu topology table
+ */
+struct cputopo_nps cpu_topology[NR_CPUS];
+EXPORT_SYMBOL_GPL(cpu_topology);
+
+const struct cpumask *cpu_coregroup_mask(int cpu)
+{
+	return &cpu_topology[cpu].core_sibling;
+}
+
+static void update_siblings_masks(unsigned int cpuid)
+{
+	struct cputopo_nps *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
+	int cpu;
+	struct global_id global_topo, global_id_topo;
+
+	global_id_topo.value = cpuid;
+
+	/* update core and thread sibling masks */
+	for_each_possible_cpu(cpu) {
+		cpu_topo = &cpu_topology[cpu];
+		global_topo.value = cpu;
+
+		if (global_id_topo.cluster != global_topo.cluster)
+			continue;
+
+		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
+		if (cpu != cpuid)
+			cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
+
+		if (cpuid_topo->core_id != cpu_topo->core_id)
+			continue;
+
+		cpumask_set_cpu(cpuid, &cpu_topo->thread_sibling);
+		if (cpu != cpuid)
+			cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
+	}
+
+	/* Do not proceed before masks are written */
+	smp_wmb();
+}
+
+/*
+ * store_cpu_topology is called at boot when only one cpu is running
+ * and with the mutex cpu_hotplug.lock locked, when several cpus have booted,
+ * which prevents simultaneous write access to cpu_topology array
+ */
+void store_cpu_topology(unsigned int cpuid)
+{
+	struct cputopo_nps *cpuid_topo = &cpu_topology[cpuid];
+	struct global_id gid;
+
+	/* If the cpu topology has been already set, just return */
+	if (cpuid_topo->core_id != -1)
+		return;
+
+	gid.value = cpuid;
+
+	cpuid_topo->thread_id = gid.thread;
+	cpuid_topo->core_id = ((gid.cluster << 4) | gid.core);
+
+	update_siblings_masks(cpuid);
+
+	pr_debug("CPU%u: thread %d, core %d\n",
+		 cpuid, cpu_topology[cpuid].thread_id,
+		 cpu_topology[cpuid].core_id);
+}
+
+static struct sched_domain_topology_level nps_topology[] = {
+#ifdef CONFIG_SCHED_SMT
+	{ cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT) },
+#endif
+#ifdef CONFIG_SCHED_MC
+	{ cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
+#endif
+	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
+	{ NULL, },
+};
+
+/*
+ * init_cpu_topology is called at boot when only one cpu is running
+ * which prevent simultaneous write access to cpu_topology array
+ */
+void __init init_cpu_topology(void)
+{
+	unsigned int cpu;
+
+	/* init core mask */
+	for_each_possible_cpu(cpu) {
+		struct cputopo_nps *cpu_topo = &(cpu_topology[cpu]);
+
+		cpu_topo->thread_id = -1;
+		cpu_topo->core_id =  -1;
+		cpumask_clear(&cpu_topo->core_sibling);
+		cpumask_clear(&cpu_topo->thread_sibling);
+	}
+
+	/* Do not proceed before masks are written */
+	smp_wmb();
+
+	/* Set scheduler topology descriptor */
+	set_sched_topology(nps_topology);
+}
-- 
1.7.1
