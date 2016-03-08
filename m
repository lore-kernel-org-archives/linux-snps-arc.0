From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 8 Mar 2016 17:56:11 +0530
Subject: [PATCH v2 8/9] ARC: [plat-axs] Don't use arc_{get|set}_core_freq()
 for manipulating core clk
In-Reply-To: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
References: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457439972-20285-9-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Alexey Brodkin <abrodkin@synopsys.com>

For AXS103, certain bitfile configurations may not work with stock
"clock-frequency" specified in DT. Instead of duplicating the DT files, we
fixup the DT in-place.

This used to be done differently - as in top level "clock-frequency" was
read very early from FDT and exported using arc_{get|set}_core_freq()
also used in setting up clockevent/clocksource timers

This homebrew clk API served well for legacy timer probe (non DT)

However TIMERS are now probed from DT and use "core_clk" defined in DT,
and thus can no longer use the top level "clock-frequency".
This change reduces the number of users of ARC clk hack and paves way
for removal.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
[vgupta: broken out of from bigger patch]
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/setup.c       | 12 +++++++-----
 arch/arc/plat-axs10x/axs10x.c | 27 +++++++++++++++++++++------
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index b2921a3bd924..6fff28be695d 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -23,7 +23,6 @@
 #include <asm/page.h>
 #include <asm/irq.h>
 #include <asm/unwind.h>
-#include <asm/clk.h>
 #include <asm/mach_desc.h>
 #include <asm/smp.h>
 
@@ -229,10 +228,6 @@ static char *arc_cpu_mumbojumbo(int cpu_id, char *buf, int len)
 	if (tbl->info.id == 0)
 		n += scnprintf(buf + n, len - n, "UNKNOWN ARC Processor\n");
 
-	n += scnprintf(buf + n, len - n, "CPU speed\t: %u.%02u Mhz\n",
-		       (unsigned int)(arc_get_core_freq() / 1000000),
-		       (unsigned int)(arc_get_core_freq() / 10000) % 100);
-
 	n += scnprintf(buf + n, len - n, "Timers\t\t: %s%s%s%s\nISA Extn\t: ",
 		       IS_AVAIL1(cpu->extn.timer0, "Timer0 "),
 		       IS_AVAIL1(cpu->extn.timer1, "Timer1 "),
@@ -487,6 +482,10 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 {
 	char *str;
 	int cpu_id = ptr_to_cpu(v);
+	struct device_node *pll = of_find_node_by_name(NULL, "core_clk");
+	u32 freq;
+
+	of_property_read_u32(pll, "clock-frequency", &freq);
 
 	if (!cpu_online(cpu_id)) {
 		seq_printf(m, "processor [%d]\t: Offline\n", cpu_id);
@@ -498,6 +497,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		goto done;
 
 	seq_printf(m, arc_cpu_mumbojumbo(cpu_id, str, PAGE_SIZE));
+	seq_printf(m, "CPU speed\t: %u.%02u Mhz\n",
+		   (unsigned int)(freq / 1000000),
+		   (unsigned int)(freq / 10000) % 100);
 
 	seq_printf(m, "Bogo MIPS\t: %lu.%02lu\n",
 		   loops_per_jiffy / (500000 / HZ),
diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
index 1b0f0f458a2b..9701c93f315d 100644
--- a/arch/arc/plat-axs10x/axs10x.c
+++ b/arch/arc/plat-axs10x/axs10x.c
@@ -14,10 +14,11 @@
  *
  */
 
+#include <linux/of_fdt.h>
 #include <linux/of_platform.h>
+#include <linux/libfdt.h>
 
 #include <asm/asm-offsets.h>
-#include <asm/clk.h>
 #include <asm/io.h>
 #include <asm/mach_desc.h>
 #include <asm/mcip.h>
@@ -389,6 +390,13 @@ axs103_set_freq(unsigned int id, unsigned int fd, unsigned int od)
 
 static void __init axs103_early_init(void)
 {
+	int offset = fdt_path_offset(initial_boot_params, "/cpu_card/core_clk");
+	const struct fdt_property *prop = fdt_get_property(initial_boot_params,
+							   offset,
+							   "clock-frequency",
+							   NULL);
+	u32 freq = be32_to_cpu(*(u32*)(prop->data)) / 1000000, orig = freq;
+
 	/*
 	 * AXS103 configurations for SMP/QUAD configurations share device tree
 	 * which defaults to 90 MHz. However recent failures of Quad config
@@ -401,12 +409,12 @@ static void __init axs103_early_init(void)
 #ifdef CONFIG_ARC_MCIP
 	unsigned int num_cores = (read_aux_reg(ARC_REG_MCIP_BCR) >> 16) & 0x3F;
 	if (num_cores > 2)
-		arc_set_core_freq(50 * 1000000);
+		freq = 50;
 	else if (num_cores == 2)
-		arc_set_core_freq(75 * 1000000);
+		freq = 75;
 #endif
 
-	switch (arc_get_core_freq()/1000000) {
+	switch (freq) {
 	case 33:
 		axs103_set_freq(1, 1, 1);
 		break;
@@ -431,11 +439,18 @@ static void __init axs103_early_init(void)
 		 * DT "clock-frequency" might not match with board value.
 		 * Hence update it to match the board value.
 		 */
-		arc_set_core_freq(axs103_get_freq() * 1000000);
+		freq = axs103_get_freq();
 		break;
 	}
 
-	pr_info("Freq is %dMHz\n", axs103_get_freq());
+	pr_info("Freq is %dMHz\n", freq);
+
+	/* Patching .dtb in-place with new core clock value */
+	if (freq != orig ) {
+		freq = cpu_to_be32(freq * 1000000);
+		fdt_setprop_inplace(initial_boot_params, offset,
+				    "clock-frequency", &freq, sizeof(freq));
+	}
 
 	/* Memory maps already config in pre-bootloader */
 
-- 
2.5.0
