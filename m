From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 16 Apr 2019 20:10:18 +0300
Subject: [PATCH 0/3] ARC: cache: allow to autodetect L1 cache line size
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190416171021.20049-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Allow to autodetect L1 I/D caches line size in runtime instead of
relying on value provided via kconfig.

This patch series is inspired by https://gitsnps.internal.synopsys.com/
arc_oss/linux/commit/c229c6e2e7a62269e2929943ccda2b04149e5b27
however has the following improvements:
 * we don't touch any generic code, so it's easier to upstream it.
 * autodetection can be disabled via kconfig.
 * changes are rebased on latest kernel version.

Eugeniy Paltsev (3):
  ARC: cache: declare cache-related defines via ARC_MAX_CACHE_SHIFT
  ARC: cache: check cache configuration on each CPU
  ARC: cache: allow to autodetect L1 cache line size

 arch/arc/Kconfig             |  10 +++
 arch/arc/include/asm/cache.h |  20 ++++--
 arch/arc/lib/memset-archs.S  |   8 ++-
 arch/arc/mm/cache.c          | 147 ++++++++++++++++++++++++++++++++-----------
 4 files changed, 141 insertions(+), 44 deletions(-)

-- 
2.14.5
