From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 30 May 2016 17:01:44 +0530
Subject: [PATCH-REBASED 0/2] report perf sampling failing due to PMU lacking
 overflow intr support
In-Reply-To: <alpine.DEB.2.20.1605121903470.18777@macbook-air>
References: <alpine.DEB.2.20.1605121903470.18777@macbook-air>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464607906-16012-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

This is a repost of RFC [1], rebased on 4.7-rc1, to print pretty PMU lacking
overflow interrupt support if user tries perf sampling.

At the time of RFC review, both PeterZ and Vince seemed convinced to go ahead
with this patch despite the ABI change [2].

Thx,
-Vineet


[1] http://lists.infradead.org/pipermail/linux-snps-arc/2016-May/001014.html
[2] http://lists.infradead.org/pipermail/linux-snps-arc/2016-May/001032.html

Vineet Gupta (2):
  tools/perf: Handle EOPNOTSUPP for sampling events
  perf/core: change errno for sampling event not supported in hardware

 kernel/events/core.c    | 2 +-
 tools/perf/util/evsel.c | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.5.0
