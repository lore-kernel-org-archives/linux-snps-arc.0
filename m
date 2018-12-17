From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 17 Dec 2018 12:54:23 +0300
Subject: [PATCH] ARC: perf: map 'ijmptak' to generic 'branches' event
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181217095423.20318-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Map 'ijmptak' event (all jump instructions that are taken)
instead of 'ijmp' event (all jump and branch instructions)
to generic 'branches' event as taken jump is more interesting
metric for us due to the possible significantly greater
overhead of taken jumps.

'ijmptak' event is available on both ARCv1 and ARCv2.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/include/asm/perf_event.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/perf_event.h b/arch/arc/include/asm/perf_event.h
index 9185541035cc..6958545390f0 100644
--- a/arch/arc/include/asm/perf_event.h
+++ b/arch/arc/include/asm/perf_event.h
@@ -103,7 +103,8 @@ static const char * const arc_pmu_ev_hw_map[] = {
 
 	/* counts condition */
 	[PERF_COUNT_HW_INSTRUCTIONS] = "iall",
-	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] = "ijmp", /* Excludes ZOL jumps */
+	/* All jump instructions that are taken */
+	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] = "ijmptak",
 	[PERF_COUNT_ARC_BPOK]         = "bpok",	  /* NP-NT, PT-T, PNT-NT */
 #ifdef CONFIG_ISA_ARCV2
 	[PERF_COUNT_HW_BRANCH_MISSES] = "bpmp",
-- 
2.14.5
