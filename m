From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 29 Jul 2016 12:50:18 -0700
Subject: [GIT PULL] ARC changes for 4.8-rc1
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b01a01e6-c1c8-891f-9c75-6fee1897bff4@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull.

Thx,
-Vineet

----->
The following changes since commit 92d21ac74a9e3c09b0b01c764e530657e4c85c49:

  Linux 4.7-rc7 (2016-07-10 20:24:59 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.8-rc1

for you to fetch changes up to 3925a16ae980c79d1a8fd182d7f9487da1edd4dc:

  ARC: mm: don't loose PTE_SPECIAL in pte_modify() (2016-07-28 12:38:17 -0700)

----------------------------------------------------------------
ARC updates for 4.8-rc1

Things have been calm here - nothing much except for a few fixes

----------------------------------------------------------------
Alexey Brodkin (1):
      ARC: typo fix in mm/ioremap.c

Vineet Gupta (2):
      ARC: fix linux-next build breakage
      ARC: mm: don't loose PTE_SPECIAL in pte_modify()

Vladimir Kondratiev (1):
      ARC: dma: fix address translation in arc_dma_free

 arch/arc/include/asm/pgtable.h | 2 +-
 arch/arc/kernel/setup.c        | 1 +
 arch/arc/mm/dma.c              | 3 ++-
 arch/arc/mm/ioremap.c          | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)
