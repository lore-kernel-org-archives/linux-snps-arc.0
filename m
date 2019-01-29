From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 29 Jan 2019 13:49:37 +0300
Subject: [PATCH 0/5] introduce unaligned access under a Kconfig option
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190129104942.31705-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As of today we enable unaligned access unconditionally on ARCv2.
Lets move it under Kconfig option and use it actively in SW if it is
enabled.

While I'm at it fix and optimise ARCv2 memcpy implementaion.

Eugeniy Paltsev (5):
  ARCv2: lib: memcpy: fix doing prefetchw outside of buffer
  ARCv2: introduce unaligned access under a Kconfig option
  ARCv2: Enable unaligned access in early ASM code
  ARCv2: use unaligned access in SW
  ARCv2: LIB: MEMCPY: fixed and optimised routine

 arch/arc/Kconfig                      | 13 ++++++++++
 arch/arc/Makefile                     |  6 +++++
 arch/arc/include/asm/irqflags-arcv2.h |  4 +++
 arch/arc/kernel/head.S                | 14 +++++++++++
 arch/arc/kernel/intc-arcv2.c          |  2 +-
 arch/arc/lib/Makefile                 |  5 +++-
 arch/arc/lib/memcpy-archs-unaligned.S | 46 +++++++++++++++++++++++++++++++++++
 arch/arc/lib/memcpy-archs.S           | 14 -----------
 8 files changed, 88 insertions(+), 16 deletions(-)
 create mode 100644 arch/arc/lib/memcpy-archs-unaligned.S

-- 
2.14.5
