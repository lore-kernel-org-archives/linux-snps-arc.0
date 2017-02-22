From: Vladislav.Zakharov@synopsys.com (Vlad Zakharov)
Date: Wed, 22 Feb 2017 13:36:36 +0300
Subject: [PATCH] arc: get rate from clk driver instead of reading device tree
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1487759796-14418-1-git-send-email-vzakhar@synopsys.com>
To: linux-snps-arc@lists.infradead.org

We were reading clock rate directly from device tree "clock-frequency"
property of corresponding clock node in show_cpuinfo function.

Such approach is correct only in case cpu is always clocked by
"fixed-clock". If we use clock driver that allows rate to be changed
this won't work as rate may change during the time or even
"clock-frequency" property may not be presented at all.

So this commit replaces reading device tree with getting rate from clock
driver. This approach is much more flexible and will work for both fixed
and mutable clocks.

Signed-off-by: Vlad Zakharov <vzakhar at synopsys.com>
---
 arch/arc/kernel/setup.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 3093fa8..49b0804 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -10,6 +10,7 @@
 #include <linux/fs.h>
 #include <linux/delay.h>
 #include <linux/root_dev.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <linux/console.h>
@@ -488,7 +489,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 {
 	char *str;
 	int cpu_id = ptr_to_cpu(v);
-	struct device_node *core_clk = of_find_node_by_name(NULL, "core_clk");
+	struct device *cpu_dev = get_cpu_device(cpu_id);
+	struct clk *cpu_clk = clk_get(cpu_dev, "core_clk");
 	u32 freq = 0;
 
 	if (!cpu_online(cpu_id)) {
@@ -502,7 +504,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 
 	seq_printf(m, arc_cpu_mumbojumbo(cpu_id, str, PAGE_SIZE));
 
-	of_property_read_u32(core_clk, "clock-frequency", &freq);
+	freq = clk_get_rate(cpu_clk);
 	if (freq)
 		seq_printf(m, "CPU speed\t: %u.%02u Mhz\n",
 			   freq / 1000000, (freq / 10000) % 100);
-- 
2.7.4
