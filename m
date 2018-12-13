From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 13 Dec 2018 19:56:21 +0300
Subject: [PATCH v2 4/4] ARC: perf: avoid kernel killing where it is possible
In-Reply-To: <20181213165621.20817-1-Eugeniy.Paltsev@synopsys.com>
References: <20181213165621.20817-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181213165621.20817-5-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

No, not gonna die tonight.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/kernel/perf_event.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 0c4714906a06..b0f7eeffde9f 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -567,10 +567,12 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	BUILD_BUG_ON(ARC_PERF_MAX_COUNTERS > 32);
-	BUG_ON(pct_bcr.c > ARC_PERF_MAX_COUNTERS);
+	if (WARN_ON(pct_bcr.c > ARC_PERF_MAX_COUNTERS))
+		return -EINVAL;
 
 	READ_BCR(ARC_REG_CC_BUILD, cc_bcr);
-	BUG_ON(!cc_bcr.v); /* Counters exist but No countable conditions ? */
+	if (WARN(!cc_bcr.v, "Counters exist but No countable conditions?"))
+		return -EINVAL;
 
 	arc_pmu = devm_kzalloc(&pdev->dev, sizeof(struct arc_pmu), GFP_KERNEL);
 	if (!arc_pmu)
-- 
2.14.5
