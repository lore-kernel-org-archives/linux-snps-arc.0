From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 13 Dec 2018 19:56:17 +0300
Subject: [PATCH v2 0/4] introduce Kernel PMU events support
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181213165621.20817-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Introduce Kernel PMU events support and refactor ARC-specific perf code. 

Eugeniy Paltsev (4):
  ARC: perf: trivial code cleanup
  ARC: perf: introduce Kernel PMU events support
  ARC: perf: move HW events mapping to separate function
  ARC: perf: avoid kernel killing where it is possible

 arch/arc/kernel/perf_event.c | 228 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 169 insertions(+), 59 deletions(-)

-- 
2.14.5
