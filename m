From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed,  5 Dec 2018 20:06:09 +0300
Subject: [PATCH 5/5] ARC: perf: remove useless ifdefs
In-Reply-To: <20181205170609.18690-1-Eugeniy.Paltsev@synopsys.com>
References: <20181205170609.18690-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181205170609.18690-6-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ifdef around 'arc_pmu_match' structure declaration is useless
as we refer to 'arc_pmu_match' in several places which aren't
guarded with ifdef.

Nevertheless 'ARC' option selects 'OF' unconditionally so we
can simply get rid of this ifdef.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/kernel/perf_event.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index b6207090aaa7..7786c1f005fb 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -643,14 +643,12 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 	return perf_pmu_register(&arc_pmu->pmu, "arc_pmu", PERF_TYPE_RAW);
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id arc_pmu_match[] = {
 	{ .compatible = "snps,arc700-pct" },
 	{ .compatible = "snps,archs-pct" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, arc_pmu_match);
-#endif
 
 static struct platform_driver arc_pmu_driver = {
 	.driver	= {
-- 
2.14.5
