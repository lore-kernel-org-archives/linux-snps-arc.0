From: rppt@linux.ibm.com (Mike Rapoport)
Date: Sun, 26 May 2019 18:38:15 +0300
Subject: [RFC/RFT WIP PATCH] arc: add sparsemem support
In-Reply-To: <1558885095-21540-1-git-send-email-rppt@linux.ibm.com>
References: <1558885095-21540-1-git-send-email-rppt@linux.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1558885095-21540-2-git-send-email-rppt@linux.ibm.com>
To: linux-snps-arc@lists.infradead.org

Add support for initialization of SPARSE memory model along with Kconfig
options that will allow its selection during the kernel configuration.

Certain configurations of ARC require that the memory that is not directly
mapped by the kernel (ZONE_HIGHMEM) will be below the memory that is always
mapped into the kernel page tables (ZONE_NORMAL).

For such configurations ZONE_NORMAL and ZONE_HIGHMEM were present on
different nodes.

With SPARSEMEM, there is a single node containing all the memory, but it is
initialized using dedicated free_area_init_node_exact_zones() routing that
takes the exact zone extents rather then their sizes.

Signed-off-by: Mike Rapoport <rppt at linux.ibm.com>
---
 arch/arc/Kconfig                 |  9 +++++
 arch/arc/include/asm/sparsemem.h | 13 +++++++
 arch/arc/mm/init.c               | 84 ++++++++++++++++++++++++++++------------
 include/linux/mm.h               |  3 ++
 mm/page_alloc.c                  | 37 ++++++++++++++++++
 5 files changed, 121 insertions(+), 25 deletions(-)
 create mode 100644 arch/arc/include/asm/sparsemem.h

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 23e063d..9b6c31d 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -47,6 +47,7 @@ config ARC
 	select OF_EARLY_FLATTREE
 	select PCI_SYSCALL if PCI
 	select PERF_USE_VMALLOC if ARC_CACHE_VIPT_ALIASING
+	select SPARSEMEM_STATIC if SPARSEMEM
 
 config ARCH_HAS_CACHE_LINE_SIZE
 	def_bool y
@@ -66,9 +67,15 @@ config GENERIC_CSUM
 config ARCH_DISCONTIGMEM_ENABLE
 	def_bool n
 
+config ARCH_SPARSEMEM_ENABLE
+	def_bool n
+
 config ARCH_FLATMEM_ENABLE
 	def_bool y
 
+config ARCH_SELECT_MEMORY_MODEL
+	def_bool n
+
 config MMU
 	def_bool y
 
@@ -449,6 +456,8 @@ config LINUX_RAM_BASE
 config HIGHMEM
 	bool "High Memory Support"
 	select ARCH_DISCONTIGMEM_ENABLE
+	select ARCH_SPARSEMEM_ENABLE
+	select ARCH_SELECT_MEMORY_MODEL
 	help
 	  With ARC 2G:2G address split, only upper 2G is directly addressable by
 	  kernel. Enable this to potentially allow access to rest of 2G and PAE
diff --git a/arch/arc/include/asm/sparsemem.h b/arch/arc/include/asm/sparsemem.h
new file mode 100644
index 0000000..b23bedd
--- /dev/null
+++ b/arch/arc/include/asm/sparsemem.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARC_SPARSEMEM_H
+#define _ASM_ARC_SPARSEMEM_H
+
+#ifdef CONFIG_ARC_HAS_PAE40
+#define MAX_PHYSMEM_BITS	40
+#define SECTION_SIZE_BITS	32
+#else
+#define MAX_PHYSMEM_BITS	32
+#define SECTION_SIZE_BITS	31
+#endif
+
+#endif /* _ASM_ARC_SPARSEMEM_H */
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 02b7a3b..ad9ba05 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -78,6 +78,62 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 		base, TO_MB(size), !in_use ? "Not used":"");
 }
 
+#ifdef CONFIG_SPARSEMEM
+static void setup_memory_model(void)
+{
+	unsigned long zones_size[MAX_NR_ZONES] = { 0 };
+	unsigned long zones_start[MAX_NR_ZONES] = { 0 };
+	unsigned long node_min_pfn = min_low_pfn;
+
+	memblocks_present();
+	sparse_init();
+
+	zones_start[ZONE_NORMAL] = min_low_pfn;
+	zones_size[ZONE_NORMAL] = max_low_pfn - min_low_pfn;
+
+	if (high_mem_sz) {
+		zones_start[ZONE_HIGHMEM] = min_high_pfn;
+		zones_size[ZONE_HIGHMEM] = max_high_pfn - min_high_pfn;
+
+		node_min_pfn = min(min_low_pfn, min_high_pfn);
+	}
+
+	free_area_init_node_exact_zones(0,		/* node-id */
+					node_min_pfn,	/* first pfn of node */
+					zones_size,	/* num pages per zone */
+					zones_start);	/* firts pfn of zone */
+}
+
+#elif defined(CONFIG_DISCONTIGMEM)
+
+static void setup_memory_model(void)
+{
+	unsigned long zones_size[MAX_NR_ZONES] = { 0 };
+	unsigned long zones_holes[MAX_NR_ZONES] = { 0 };
+
+	/*
+	 * Populate a new node with highmem
+	 *
+	 * On ARC (w/o PAE) HIGHMEM addresses are actually smaller (0 based)
+	 * than addresses in normal ala low memory (0x8000_0000 based).
+	 * Even with PAE, the huge peripheral space hole would waste a lot of
+	 * mem with single mem_map[]. This warrants a mem_map per region design.
+	 * Thus HIGHMEM on ARC is imlemented with DISCONTIGMEM.
+	 *
+	 * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
+	 * populated with normal memory zone while node 1 only has highmem
+	 */
+	node_set_online(1);
+
+	zones_size[ZONE_HIGHMEM] = max_high_pfn - min_high_pfn;
+
+	free_area_init_node(1,			/* node-id */
+			    zones_size,		/* num pages per zone */
+			    min_high_pfn,	/* first pfn of node */
+			    zones_holes);	/* holes */
+}
+#endif /* CONFIG_SPARSEMEM || CONFIG_DISCONTIGMEM */
+
 /*
  * First memory setup routine called from setup_arch()
  * 1. setup swapper's mm @init_mm
@@ -142,6 +198,7 @@ void __init setup_arch_memory(void)
 	zones_size[ZONE_NORMAL] = max_low_pfn - min_low_pfn;
 	zones_holes[ZONE_NORMAL] = 0;
 
+#ifdef CONFIG_FLATMEM
 	/*
 	 * We can't use the helper free_area_init(zones[]) because it uses
 	 * PAGE_OFFSET to compute the @min_low_pfn which would be wrong
@@ -153,34 +210,11 @@ void __init setup_arch_memory(void)
 			    min_low_pfn,	/* first pfn of node */
 			    zones_holes);	/* holes */
 
-#ifdef CONFIG_HIGHMEM
-	/*
-	 * Populate a new node with highmem
-	 *
-	 * On ARC (w/o PAE) HIGHMEM addresses are actually smaller (0 based)
-	 * than addresses in normal ala low memory (0x8000_0000 based).
-	 * Even with PAE, the huge peripheral space hole would waste a lot of
-	 * mem with single mem_map[]. This warrants a mem_map per region design.
-	 * Thus HIGHMEM on ARC is imlemented with DISCONTIGMEM.
-	 *
-	 * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
-	 * populated with normal memory zone while node 1 only has highmem
-	 */
-	node_set_online(1);
-
+#else
 	min_high_pfn = PFN_DOWN(high_mem_start);
 	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
 
-	zones_size[ZONE_NORMAL] = 0;
-	zones_holes[ZONE_NORMAL] = 0;
-
-	zones_size[ZONE_HIGHMEM] = max_high_pfn - min_high_pfn;
-	zones_holes[ZONE_HIGHMEM] = 0;
-
-	free_area_init_node(1,			/* node-id */
-			    zones_size,		/* num pages per zone */
-			    min_high_pfn,	/* first pfn of node */
-			    zones_holes);	/* holes */
+	setup_memory_model();
 
 	high_memory = (void *)(min_high_pfn << PAGE_SHIFT);
 	kmap_init();
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0e8834a..5d47dee 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2107,6 +2107,9 @@ extern void __init pagecache_init(void);
 extern void free_area_init(unsigned long * zones_size);
 extern void __init free_area_init_node(int nid, unsigned long * zones_size,
 		unsigned long zone_start_pfn, unsigned long *zholes_size);
+extern void __init free_area_init_node_exact_zones(int nid,
+		unsigned long node_start_pfn, unsigned long *zones_size,
+		unsigned long *zones_start);
 extern void free_initmem(void);
 
 /*
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 3b13d39..7a708b9 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6810,6 +6810,43 @@ void __init free_area_init_node(int nid, unsigned long *zones_size,
 	free_area_init_core(pgdat);
 }
 
+void __init free_area_init_node_exact_zones(int nid,
+					    unsigned long node_start_pfn,
+					    unsigned long *zones_size,
+					    unsigned long *zones_start)
+{
+	pg_data_t *pgdat = NODE_DATA(nid);
+	unsigned long totalpages = 0;
+	enum zone_type i;
+
+	/* pg_data_t should be reset to zero when it's allocated */
+	WARN_ON(pgdat->nr_zones || pgdat->kswapd_classzone_idx);
+
+	pgdat->node_id = nid;
+	pgdat->node_start_pfn = node_start_pfn;
+	pgdat->per_cpu_nodestats = NULL;
+
+	for (i = 0; i < MAX_NR_ZONES; i++) {
+		struct zone *zone = pgdat->node_zones + i;
+		unsigned long size = zones_size[i];
+
+		zone->zone_start_pfn = zones_start[i];
+		zone->spanned_pages = zone->present_pages = size;
+
+		totalpages += size;
+	}
+
+	pgdat->node_spanned_pages = totalpages;
+	pgdat->node_present_pages = totalpages;
+	printk(KERN_DEBUG "On node %d totalpages: %lu\n", pgdat->node_id,
+							totalpages);
+
+	alloc_node_mem_map(pgdat);
+	pgdat_set_deferred_range(pgdat);
+
+	free_area_init_core(pgdat);
+}
+
 #if !defined(CONFIG_FLAT_NODE_MEM_MAP)
 /*
  * Zero all valid struct pages in range [spfn, epfn), return number of struct
-- 
2.7.4
