From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:46:42 +0200
Subject: [PATCH 0075/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114642.2995-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/kernel/perf_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 8b134cf..aa0d261 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -108,7 +108,7 @@ static void arc_perf_event_update(struct perf_event *event,
 	int64_t delta = new_raw_count - prev_raw_count;
 
 	/*
-	 * We don't afaraid of hwc->prev_count changing beneath our feet
+	 * We aren't afraid of hwc->prev_count changing beneath our feet
 	 * because there's no way for us to re-enter this function anytime.
 	 */
 	local64_set(&hwc->prev_count, new_raw_count);
-- 
2.8.2.534.g1f66975
