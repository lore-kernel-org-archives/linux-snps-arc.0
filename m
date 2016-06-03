From: tipbot@zytor.com (tip-bot for Vineet Gupta)
Date: Fri, 3 Jun 2016 03:52:18 -0700
Subject: [tip:perf/core] tools/perf: Handle -EOPNOTSUPP for sampling events
In-Reply-To: <1462786660-2900-2-git-send-email-vgupta@synopsys.com>
References: <1462786660-2900-2-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <tip-dc89e75a9412db5b1105a140182ec1e35a8351b4@git.kernel.org>
To: linux-snps-arc@lists.infradead.org

Commit-ID:  dc89e75a9412db5b1105a140182ec1e35a8351b4
Gitweb:     http://git.kernel.org/tip/dc89e75a9412db5b1105a140182ec1e35a8351b4
Author:     Vineet Gupta <Vineet.Gupta1 at synopsys.com>
AuthorDate: Mon, 9 May 2016 15:07:39 +0530
Committer:  Ingo Molnar <mingo at kernel.org>
CommitDate: Fri, 3 Jun 2016 09:41:11 +0200

tools/perf: Handle -EOPNOTSUPP for sampling events

This allows (with a previous change to the perf error return ABI) for
calling out in userspace the exact reason for perf record failing
when PMU doesn't support overflow interrupts.

Note that this needs to be put ahead of existing precise_ip check as
that gets hit otherwise for the sampling fail case as well.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz at infradead.org>
Cc: <acme at redhat.com>
Cc: <linux-snps-arc at lists.infradead.org>
Cc: <vincent.weaver at maine.edu>
Cc: Alexander Shishkin <alexander.shishkin at linux.intel.com>
Cc: Arnaldo Carvalho de Melo <acme at redhat.com>
Cc: Jiri Olsa <jolsa at redhat.com>
Cc: Linus Torvalds <torvalds at linux-foundation.org>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Stephane Eranian <eranian at google.com>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Vince Weaver <vincent.weaver at maine.edu>
Cc: Vineet Gupta <Vineet.Gupta1 at synopsys.com>
Link: http://lkml.kernel.org/r/1462786660-2900-2-git-send-email-vgupta at synopsys.com
Signed-off-by: Ingo Molnar <mingo at kernel.org>
---
 tools/perf/util/evsel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 245ac50..8d30cbd 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -2384,6 +2384,9 @@ int perf_evsel__open_strerror(struct perf_evsel *evsel, struct target *target,
 	 "No such device - did you specify an out-of-range profile CPU?");
 		break;
 	case EOPNOTSUPP:
+		if (evsel->attr.sample_period != 0)
+			return scnprintf(msg, size, "%s",
+	"PMU Hardware doesn't support sampling/overflow-interrupts.");
 		if (evsel->attr.precise_ip)
 			return scnprintf(msg, size, "%s",
 	"\'precise\' request may not be supported. Try removing 'p' modifier.");
