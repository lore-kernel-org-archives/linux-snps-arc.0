From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 30 Jan 2019 19:32:39 +0300
Subject: [PATCH v2 0/5] introduce unaligned access under a Kconfig option
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190130163244.10870-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As of today we enable unaligned access unconditionally on ARCv2.
Lets move it under Kconfig option and use it actively in SW if it is
enabled.

While I'm at it fix and optimise ARCv2 memcpy implementaion.

Changes v1->v2:
 * Rebase onto last ARC changes.
 * Don't add dummy symbol to ARC Kconfig
 * Print info about unaligned access status in kernel log

Eugeniy Paltsev (5):
  ARCv2: lib: memcpy: fix doing prefetchw outside of buffer
  ARCv2: introduce unaligned access under a Kconfig option
  ARCv2: use unaligned access in SW
  ARCv2: LIB: MEMCPY: fixed and optimised routine
  ARC: boot log: print unaligned memory access details

 arch/arc/Kconfig                      |  9 +++++++
 arch/arc/Makefile                     |  6 +++++
 arch/arc/include/asm/irqflags-arcv2.h |  4 +++
 arch/arc/kernel/head.S                | 14 +++++++----
 arch/arc/kernel/intc-arcv2.c          |  2 +-
 arch/arc/kernel/setup.c               | 13 +++++++---
 arch/arc/lib/Makefile                 |  8 +++++-
 arch/arc/lib/memcpy-archs-unaligned.S | 46 +++++++++++++++++++++++++++++++++++
 arch/arc/lib/memcpy-archs.S           | 14 -----------
 9 files changed, 92 insertions(+), 24 deletions(-)
 create mode 100644 arch/arc/lib/memcpy-archs-unaligned.S

-- 
2.14.5
