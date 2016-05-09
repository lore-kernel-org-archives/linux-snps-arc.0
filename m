From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 9 May 2016 15:07:38 +0530
Subject: [RFC 0/2] report perf sampling failing due to PMU lacking overflow
 intr support
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1462786660-2900-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

A couple of minor patches to print better PMU lacking overflow intr support
such as in ARC700 cores.

This is an ABI change so might be controversial hence RFC.

Despite triviality, I've seperated the change into 2 pacthes - for different maintainers
and also kept userspace change first to keep it bisectable.

Comments welcome !

Thx,
-Vineet

Vineet Gupta (2):
  tools/perf: Handle EOPNOTSUPP for sampling events
  perf/core: change errno for sampling event not supported in hardware

 kernel/events/core.c    | 2 +-
 tools/perf/util/evsel.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.5.0
