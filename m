From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 11 Feb 2016 14:58:25 +0530
Subject: [PATCH 0/2] Enable s390/arc/sparc to use generic thp deposit/withdraw
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1455182907-15445-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

This came out my debugging THP on ARC. The generic deposit/withdraw routines
can be easily adapted to work with pgtable_t != struct page *.

Build/Run tested on ARC only.

Thx,
-Vineet

Vineet Gupta (2):
  mm,thp: refactor generic deposit/withdraw routines for wider usage
  ARC: mm: THP: use generic THP deposit/withdraw

 arch/arc/include/asm/hugepage.h |  8 --------
 arch/arc/mm/tlb.c               | 37 -------------------------------------
 mm/pgtable-generic.c            | 27 +++++++++++++++++----------
 3 files changed, 17 insertions(+), 55 deletions(-)

-- 
2.5.0
