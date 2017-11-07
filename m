From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 7 Nov 2017 14:13:02 -0800
Subject: [PATCH 2/4] ARCv2: perf: optimize given that num counters <= 32
In-Reply-To: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
References: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1510092784-19942-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

use ffz primitive which maps to ARCv2 instruction, vs. non atomic
__test_and_set_bit

It is unlikely if we will even have more than 32 counters, but still add
a BUILD_BUG to catch that

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/perf_event.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 0eaa132a2c90..8aec462d90fb 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -336,15 +336,12 @@ static int arc_pmu_add(struct perf_event *event, int flags)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 
-	if (__test_and_set_bit(idx, pmu_cpu->used_mask)) {
-		idx = find_first_zero_bit(pmu_cpu->used_mask,
-					  arc_pmu->n_counters);
-		if (idx == arc_pmu->n_counters)
-			return -EAGAIN;
-
-		__set_bit(idx, pmu_cpu->used_mask);
-		hwc->idx = idx;
-	}
+	idx = ffz(pmu_cpu->used_mask[0]);
+	if (idx == arc_pmu->n_counters)
+		return -EAGAIN;
+
+	__set_bit(idx, pmu_cpu->used_mask);
+	hwc->idx = idx;
 
 	write_aux_reg(ARC_REG_PCT_INDEX, idx);
 
@@ -465,6 +462,7 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 		pr_err("This core does not have performance counters!\n");
 		return -ENODEV;
 	}
+	BUILD_BUG_ON(ARC_PERF_MAX_COUNTERS > 32);
 	BUG_ON(pct_bcr.c > ARC_PERF_MAX_COUNTERS);
 
 	READ_BCR(ARC_REG_CC_BUILD, cc_bcr);
-- 
2.7.4
