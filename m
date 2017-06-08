From: noamca@mellanox.com (Noam Camus)
Date: Thu,  8 Jun 2017 18:20:30 +0300
Subject: [PATCH 06/11] ARC: [NUMA] added CONFIG_NUMA for plat-eznps
In-Reply-To: <1496935235-46507-1-git-send-email-noamca@mellanox.com>
References: <1496935235-46507-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1496935235-46507-7-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

This is needed for NPS400 where high memory is assigned to node1
where the associated addresses are lower than node0.
This use case is not typical and just using discontigmem is not enough
since nodes assumed to have increasing address range.
i.e. address range of node0 assumed to be lower than node1.

Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/Kconfig                |    9 +++++++++
 arch/arc/include/asm/topology.h |    6 ++++++
 arch/arc/kernel/setup.c         |    3 +++
 arch/arc/mm/init.c              |    6 ++++++
 4 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 54ba8e6..d1bbfd3 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -379,6 +379,15 @@ config ARC_HUGEPAGE_16M
 
 endchoice
 
+config NUMA
+	bool "NUMA Memory Allocation and Scheduler Support"
+	depends on SMP && DISCONTIGMEM
+	default y if ARC_PLAT_EZNPS
+	---help---
+	  NUMA memory allocation is required for NPS400 processors.
+	  The reason is that node1 in NPS400 is assigned to lower
+	  addresses than node0, which is not typical scenario.
+
 config NODES_SHIFT
 	int "Maximum NUMA Nodes (as a power of 2)"
 	default "0" if !DISCONTIGMEM
diff --git a/arch/arc/include/asm/topology.h b/arch/arc/include/asm/topology.h
index a9be3f8..dfbc2ab 100644
--- a/arch/arc/include/asm/topology.h
+++ b/arch/arc/include/asm/topology.h
@@ -1,6 +1,12 @@
 #ifndef _ASM_ARC_TOPOLOGY_H
 #define _ASM_ARC_TOPOLOGY_H
 
+#ifdef CONFIG_NUMA
+#define cpu_to_node(cpu)	((void)(cpu), 0)
+#define parent_node(node)	(node)
+#define cpumask_of_node(node)	((void)node, cpu_online_mask)
+#endif
+
 #ifdef CONFIG_NPS_CPU_TOPOLOGY
 
 #include <linux/cpumask.h>
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 5256205..5f04635 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -577,6 +577,9 @@ static int __init topology_init(void)
 {
 	int cpu;
 
+	for_each_online_node(cpu)
+		register_one_node(cpu);
+
 	for_each_present_cpu(cpu)
 		register_cpu(&per_cpu(cpu_topo_info, cpu), cpu);
 
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 8c9415e..f9f80d9 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -113,6 +113,10 @@ void __init setup_arch_memory(void)
 	init_mm.end_data = (unsigned long)_edata;
 	init_mm.brk = (unsigned long)_end;
 
+	node_set_online(0);
+	node_set_state(0, N_MEMORY);
+	node_set_state(0, N_NORMAL_MEMORY);
+
 	/* first page of system - kernel .vector starts here */
 	min_low_pfn = ARCH_PFN_OFFSET;
 
@@ -182,6 +186,8 @@ void __init setup_arch_memory(void)
 	 * populated with normal memory zone while node 1 only has highmem
 	 */
 	node_set_online(1);
+	node_set_state(1, N_MEMORY);
+	node_set_state(1, N_HIGH_MEMORY);
 
 	min_high_pfn = PFN_DOWN(high_mem_start);
 	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
-- 
1.7.1
