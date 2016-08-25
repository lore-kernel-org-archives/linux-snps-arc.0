From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 25 Aug 2016 14:47:27 +0300
Subject: [PATCH] arc: perf: Enable generic "cache-references" and
 "cache-misses" events
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1472125647-518-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

We used to live with PERF_COUNT_HW_CACHE_REFERENCES and
PERF_COUNT_HW_CACHE_REFERENCES not specified on ARC.

Those events are actually aliases to 2 cache events that we do support
and so this change sets "cache-reference" and "cache-misses" events
in the same way as "L1-dcache-loads" and L1-dcache-load-misses.

And while at it adding debug info for cache events as well as doing a
subtle fix in HW events debug info - config value is much better
represented by hex so we may see not only event index but as well other
control bits set (if they exist).

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: linux-snps-arc at lists.infradead.org
Cc: linux-kernel at vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme at redhat.com>
Cc: Peter Zijlstra <a.p.zijlstra at chello.nl>
Cc: stable at vger.kernel.org
---
 arch/arc/include/asm/perf_event.h | 3 +++
 arch/arc/kernel/perf_event.c      | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/perf_event.h b/arch/arc/include/asm/perf_event.h
index 5f07176..9185541 100644
--- a/arch/arc/include/asm/perf_event.h
+++ b/arch/arc/include/asm/perf_event.h
@@ -118,6 +118,9 @@ static const char * const arc_pmu_ev_hw_map[] = {
 	[PERF_COUNT_ARC_ICM] = "icm",		/* I-cache Miss */
 	[PERF_COUNT_ARC_EDTLB] = "edtlb",	/* D-TLB Miss */
 	[PERF_COUNT_ARC_EITLB] = "eitlb",	/* I-TLB Miss */
+
+	[PERF_COUNT_HW_CACHE_REFERENCES] = "imemrdc",	/* Instr: mem read cached */
+	[PERF_COUNT_HW_CACHE_MISSES] = "dclm",		/* D-cache Load Miss */
 };
 
 #define C(_x)			PERF_COUNT_HW_CACHE_##_x
diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 08f03d9..2ce24e7 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -179,8 +179,8 @@ static int arc_pmu_event_init(struct perf_event *event)
 		if (arc_pmu->ev_hw_idx[event->attr.config] < 0)
 			return -ENOENT;
 		hwc->config |= arc_pmu->ev_hw_idx[event->attr.config];
-		pr_debug("init event %d with h/w %d \'%s\'\n",
-			 (int) event->attr.config, (int) hwc->config,
+		pr_debug("init event %d with h/w %08x \'%s\'\n",
+			 (int)event->attr.config, (int)hwc->config,
 			 arc_pmu_ev_hw_map[event->attr.config]);
 		return 0;
 
@@ -189,6 +189,8 @@ static int arc_pmu_event_init(struct perf_event *event)
 		if (ret < 0)
 			return ret;
 		hwc->config |= arc_pmu->ev_hw_idx[ret];
+		pr_debug("init cache event with h/w %08x \'%s\'\n",
+			 (int)hwc->config, arc_pmu_ev_hw_map[ret]);
 		return 0;
 	default:
 		return -ENOENT;
-- 
2.7.4
