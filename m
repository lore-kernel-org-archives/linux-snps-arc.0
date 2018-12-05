From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed,  5 Dec 2018 20:06:07 +0300
Subject: [PATCH 3/5] ARC: perf: fix of kernel data types using
In-Reply-To: <20181205170609.18690-1-Eugeniy.Paltsev@synopsys.com>
References: <20181205170609.18690-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181205170609.18690-4-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Use u32, u64, s64 instead of uint32_t, uint64_t, int64_t

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/kernel/perf_event.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 97b88b00c418..8c88837fcd83 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -101,10 +101,10 @@ static struct arc_pmu *arc_pmu;
 static DEFINE_PER_CPU(struct arc_pmu_cpu, arc_pmu_cpu);
 
 /* read counter #idx; note that counter# != event# on ARC! */
-static uint64_t arc_pmu_read_counter(int idx)
+static u64 arc_pmu_read_counter(int idx)
 {
-	uint32_t tmp;
-	uint64_t result;
+	u32 tmp;
+	u64 result;
 
 	/*
 	 * ARC supports making 'snapshots' of the counters, so we don't
@@ -113,7 +113,7 @@ static uint64_t arc_pmu_read_counter(int idx)
 	write_aux_reg(ARC_REG_PCT_INDEX, idx);
 	tmp = read_aux_reg(ARC_REG_PCT_CONTROL);
 	write_aux_reg(ARC_REG_PCT_CONTROL, tmp | ARC_REG_PCT_CONTROL_SN);
-	result = (uint64_t) (read_aux_reg(ARC_REG_PCT_SNAPH)) << 32;
+	result = (u64) (read_aux_reg(ARC_REG_PCT_SNAPH)) << 32;
 	result |= read_aux_reg(ARC_REG_PCT_SNAPL);
 
 	return result;
@@ -122,9 +122,9 @@ static uint64_t arc_pmu_read_counter(int idx)
 static void arc_perf_event_update(struct perf_event *event,
 				  struct hw_perf_event *hwc, int idx)
 {
-	uint64_t prev_raw_count = local64_read(&hwc->prev_count);
-	uint64_t new_raw_count = arc_pmu_read_counter(idx);
-	int64_t delta = new_raw_count - prev_raw_count;
+	u64 prev_raw_count = local64_read(&hwc->prev_count);
+	u64 new_raw_count = arc_pmu_read_counter(idx);
+	s64 delta = new_raw_count - prev_raw_count;
 
 	/*
 	 * We aren't afraid of hwc->prev_count changing beneath our feet
@@ -231,7 +231,7 @@ static int arc_pmu_event_init(struct perf_event *event)
 /* starts all counters */
 static void arc_pmu_enable(struct pmu *pmu)
 {
-	uint32_t tmp;
+	u32 tmp;
 	tmp = read_aux_reg(ARC_REG_PCT_CONTROL);
 	write_aux_reg(ARC_REG_PCT_CONTROL, (tmp & 0xffff0000) | 0x1);
 }
@@ -239,7 +239,7 @@ static void arc_pmu_enable(struct pmu *pmu)
 /* stops all counters */
 static void arc_pmu_disable(struct pmu *pmu)
 {
-	uint32_t tmp;
+	u32 tmp;
 	tmp = read_aux_reg(ARC_REG_PCT_CONTROL);
 	write_aux_reg(ARC_REG_PCT_CONTROL, (tmp & 0xffff0000) | 0x0);
 }
@@ -544,7 +544,7 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 
 	union cc_name {
 		struct {
-			uint32_t word0, word1;
+			u32 word0, word1;
 			char sentinel;
 		} indiv;
 		char str[ARCPMU_EVENT_NAME_LEN];
-- 
2.14.5
