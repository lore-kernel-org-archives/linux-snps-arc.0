From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 16 Dec 2015 17:53:58 +0530
Subject: [PATCH 0/2] ARC dwarf unwinder fixes
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1450268640-23055-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Wreckage of removal of slowpath linear search

Vineet Gupta (2):
  ARC: dw2 unwind: Reinstante unwinding out of modules
  ARC: dw2 unwind: Ignore CIE version !=1 gracefully instead of bailing

 arch/arc/include/asm/unwind.h |  4 ----
 arch/arc/kernel/setup.c       |  1 -
 arch/arc/kernel/unwind.c      | 53 ++++++++++++++++++++++++++++---------------
 3 files changed, 35 insertions(+), 23 deletions(-)

-- 
1.9.1
