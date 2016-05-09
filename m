From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 9 May 2016 15:07:39 +0530
Subject: [RFC 1/2] tools/perf: Handle EOPNOTSUPP for sampling events
In-Reply-To: <1462786660-2900-1-git-send-email-vgupta@synopsys.com>
References: <1462786660-2900-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1462786660-2900-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This allows (with next change to perf core) for calling out in userspace
the exact reason for perf record failing when PMU doesn't support
overflow interrupts

Note that this needs to be put ahead of existing precise_ip check as
that gets hit otherwise for the sampling fail case as well.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 tools/perf/util/evsel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 738ce226002b..8bd220c63e19 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -2403,6 +2403,9 @@ int perf_evsel__open_strerror(struct perf_evsel *evsel, struct target *target,
 	 "No such device - did you specify an out-of-range profile CPU?\n");
 		break;
 	case EOPNOTSUPP:
+		if (evsel->attr.sample_period != 0)
+			return scnprintf(msg, size, "%s",
+	"PMU Hardware doesn't support sampling/overflow-interrupts.");
 		if (evsel->attr.precise_ip)
 			return scnprintf(msg, size, "%s",
 	"\'precise\' request may not be supported. Try removing 'p' modifier.");
-- 
2.5.0
