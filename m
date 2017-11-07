From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 7 Nov 2017 14:13:00 -0800
Subject: [PATCH 0/4] ARC perf updates
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

Found these when cleaning up some old branches. The only controversial one
could be the last one.

Thx,
-Vineet

Vineet Gupta (4):
  ARCv2: perf: tweak overflow interrupt
  ARCv2: perf: optimize given that num counters <= 32
  ARC: perf: avoid vmalloc backed mmap
  ARCv2: entry: Reduce perf intr return path

 arch/arc/Kconfig                   |  2 +-
 arch/arc/include/asm/entry-arcv2.h |  2 ++
 arch/arc/kernel/entry-arcv2.S      | 23 +++++++++++++++++++++-
 arch/arc/kernel/perf_event.c       | 40 ++++++++++++++++++++------------------
 4 files changed, 46 insertions(+), 21 deletions(-)

-- 
2.7.4
