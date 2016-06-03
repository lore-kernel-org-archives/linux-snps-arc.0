From: tipbot@zytor.com (tip-bot for Vineet Gupta)
Date: Fri, 3 Jun 2016 03:51:53 -0700
Subject: [tip:perf/core] perf/abi: Change the errno for sampling event not
 supported in hardware
In-Reply-To: <1462786660-2900-3-git-send-email-vgupta@synopsys.com>
References: <1462786660-2900-3-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <tip-a1396555abff9ff9b74c2e4da13e27e81fd094b2@git.kernel.org>
To: linux-snps-arc@lists.infradead.org

Commit-ID:  a1396555abff9ff9b74c2e4da13e27e81fd094b2
Gitweb:     http://git.kernel.org/tip/a1396555abff9ff9b74c2e4da13e27e81fd094b2
Author:     Vineet Gupta <Vineet.Gupta1 at synopsys.com>
AuthorDate: Mon, 9 May 2016 15:07:40 +0530
Committer:  Ingo Molnar <mingo at kernel.org>
CommitDate: Fri, 3 Jun 2016 09:40:42 +0200

perf/abi: Change the errno for sampling event not supported in hardware

Change the return code for sampling event not supported from -ENOTSUPP
to -EOPNOTSUPP.

This allows userspace to identify this case specifically, instead of
printing the catch-all error message it did previously.

Technically this is an ABI change, but we think we can get away
with it.

Old behavior:
 -------
 | # perf record ls
 | Error:
 | The sys_perf_event_open() syscall returned with 524 (Unknown error 524)
 | for event (cycles:ppp).
 | /bin/dmesg may provide additional information.
 | No CONFIG_PERF_EVENTS=y kernel support configured?

New behavior:
 -------
 | # perf record ls
 | Error:
 | PMU Hardware doesn't support sampling/overflow-interrupts.

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
Link: http://lkml.kernel.org/r/1462786660-2900-3-git-send-email-vgupta at synopsys.com
Signed-off-by: Ingo Molnar <mingo at kernel.org>
---
 kernel/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index f94f164..5d48306 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -9309,7 +9309,7 @@ SYSCALL_DEFINE5(perf_event_open,
 
 	if (is_sampling_event(event)) {
 		if (event->pmu->capabilities & PERF_PMU_CAP_NO_INTERRUPT) {
-			err = -ENOTSUPP;
+			err = -EOPNOTSUPP;
 			goto err_alloc;
 		}
 	}
