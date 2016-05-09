From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 9 May 2016 15:07:40 +0530
Subject: [RFC 2/2] perf/core: change errno for sampling event not supported in
 hardware
In-Reply-To: <1462786660-2900-1-git-send-email-vgupta@synopsys.com>
References: <1462786660-2900-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1462786660-2900-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This allows userspace to identify this case specifically from the
catch all error msg it prints currently.

This is an ABI change

Before
-------
| # perf record ls
| Error:
| The sys_perf_event_open() syscall returned with 524 (Unknown error 524)
| for event (cycles:ppp).
| /bin/dmesg may provide additional information.
| No CONFIG_PERF_EVENTS=y kernel support configured?

Now
-------
| # perf record ls
| Error:
| PMU Hardware doesn't support sampling/overflow-interrupts.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 kernel/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 4e2ebf6f2f1f..41c5c7122987 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8435,7 +8435,7 @@ SYSCALL_DEFINE5(perf_event_open,
 
 	if (is_sampling_event(event)) {
 		if (event->pmu->capabilities & PERF_PMU_CAP_NO_INTERRUPT) {
-			err = -ENOTSUPP;
+			err = -EOPNOTSUPP;
 			goto err_alloc;
 		}
 	}
-- 
2.5.0
