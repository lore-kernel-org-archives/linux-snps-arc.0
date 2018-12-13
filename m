From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 13 Dec 2018 19:56:20 +0300
Subject: [PATCH v2 3/4] ARC: perf: move HW events mapping to separate function
In-Reply-To: <20181213165621.20817-1-Eugeniy.Paltsev@synopsys.com>
References: <20181213165621.20817-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181213165621.20817-4-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Move HW events mapping to separate function to make code more readable.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/kernel/perf_event.c | 48 ++++++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index d60aaaead421..248c7b61690a 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -530,11 +530,39 @@ static int arc_pmu_raw_alloc(struct device *dev)
 	return 0;
 }
 
+static inline bool event_in_hw_event_map(int i, char *name)
+{
+	if (!arc_pmu_ev_hw_map[i])
+		return false;
+
+	if (!strlen(arc_pmu_ev_hw_map[i]))
+		return false;
+
+	if (strcmp(arc_pmu_ev_hw_map[i], name))
+		return false;
+
+	return true;
+}
+
+static void arc_pmu_map_hw_event(int j, char *str)
+{
+	int i;
+
+	/* See if HW condition has been mapped to a perf event_id */
+	for (i = 0; i < ARRAY_SIZE(arc_pmu_ev_hw_map); i++) {
+		if (event_in_hw_event_map(i, str)) {
+			pr_debug("mapping perf event %2d to h/w event \'%8s\' (idx %d)\n",
+				 i, str, j);
+			arc_pmu->ev_hw_idx[i] = j;
+		}
+	}
+}
+
 static int arc_pmu_device_probe(struct platform_device *pdev)
 {
 	struct arc_reg_pct_build pct_bcr;
 	struct arc_reg_cc_build cc_bcr;
-	int i, j, has_interrupts;
+	int i, has_interrupts;
 	int counter_size;	/* in bits */
 
 	union cc_name {
@@ -582,23 +610,13 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 		arc_pmu->ev_hw_idx[i] = -1;
 
 	/* loop thru all available h/w condition indexes */
-	for (j = 0; j < cc_bcr.c; j++) {
-		write_aux_reg(ARC_REG_CC_INDEX, j);
+	for (i = 0; i < cc_bcr.c; i++) {
+		write_aux_reg(ARC_REG_CC_INDEX, i);
 		cc_name.indiv.word0 = read_aux_reg(ARC_REG_CC_NAME0);
 		cc_name.indiv.word1 = read_aux_reg(ARC_REG_CC_NAME1);
 
-		/* See if it has been mapped to a perf event_id */
-		for (i = 0; i < ARRAY_SIZE(arc_pmu_ev_hw_map); i++) {
-			if (arc_pmu_ev_hw_map[i] &&
-			    !strcmp(arc_pmu_ev_hw_map[i], cc_name.str) &&
-			    strlen(arc_pmu_ev_hw_map[i])) {
-				pr_debug("mapping perf event %2d to h/w event \'%8s\' (idx %d)\n",
-					 i, cc_name.str, j);
-				arc_pmu->ev_hw_idx[i] = j;
-			}
-		}
-
-		arc_pmu_add_raw_event_attr(j, cc_name.str);
+		arc_pmu_map_hw_event(i, cc_name.str);
+		arc_pmu_add_raw_event_attr(i, cc_name.str);
 	}
 
 	arc_pmu_events_attr_gr.attrs = arc_pmu->attrs;
-- 
2.14.5
