From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 14 Aug 2017 19:12:09 +0300
Subject: [PATCH 1/5] ARC: set and print cpu frequency at boot time
In-Reply-To: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
References: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170814161213.17522-2-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Print cpu frequency at boot time. In case we have pre-defined
cpu frequency value in device tree try to set it.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/kernel/setup.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 877cec8..b5fcc5d 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -464,12 +464,61 @@ void __init setup_arch(char **cmdline_p)
 	arc_unwind_init();
 }
 
+static int __init set_cpu_freq(int cpu_id)
+{
+	struct device_node *cpunode;
+	u32 cpu_freq_required;
+	struct clk *clk;
+	int ret;
+
+	cpunode = of_get_cpu_node(cpu_id, NULL);
+	if (cpunode == NULL) {
+		pr_err("Can't find CPU %d node.\n", cpu_id);
+		return -ENOENT;
+	}
+
+	clk = of_clk_get(cpunode, 0);
+	if (IS_ERR(clk)) {
+		pr_err("CPU %d missing clk.\n", cpu_id);
+		return PTR_ERR(clk);
+	}
+
+	ret = clk_prepare_enable(clk);
+	if (ret) {
+		pr_err("Couldn't enable CPU %d clk.\n", cpu_id);
+		return ret;
+	}
+
+	/*
+	 * In case we have pre-defined cpu frequency value in device tree
+	 * try to set it. Otherwise just print current cpu frequency.
+	 */
+	if (of_property_read_u32(cpunode, "cpu-freq", &cpu_freq_required)) {
+		pr_info("CPU %d has no cpu-freq param. Frequency is %lu Hz.\n",
+			cpu_id, clk_get_rate(clk));
+		return 0;
+	}
+
+	if (clk_set_rate(clk, cpu_freq_required))
+		pr_err("CPU %d frequency set failed. Probably fixed-clock is used for cpu.\n",
+		       cpu_id);
+
+	pr_info("CPU %d frequency is %lu Hz.\n", cpu_id, clk_get_rate(clk));
+
+	return 0;
+}
+
 /*
  * Called from start_kernel() - boot CPU only
  */
 void __init time_init(void)
 {
 	of_clk_init(NULL);
+	/*
+	 * As for now we have common clock for all cpu cores, so set
+	 * frequency only for master cpu.
+	 */
+	set_cpu_freq(0);
 	timer_probe();
 }
 
-- 
2.9.3
