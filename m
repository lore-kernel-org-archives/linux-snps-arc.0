From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed,  5 Dec 2018 20:06:04 +0300
Subject: [PATCH 0/5] introduce Kernel PMU events support
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181205170609.18690-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Introduce Kernel PMU events support and refactor ARC-specific perf code. 

Eugeniy Paltsev (5):
  ARC: perf: trivial code cleanup
  ARC: perf: introduce Kernel PMU events support
  ARC: perf: fix of kernel data types using
  ARC: perf: fix description comment
  ARC: perf: remove useless ifdefs

 arch/arc/kernel/perf_event.c | 179 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 141 insertions(+), 38 deletions(-)

-- 
2.14.5
