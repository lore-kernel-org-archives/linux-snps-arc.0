From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Sat, 26 Dec 2015 07:01:22 +0000
Subject: [GIT PULL] ARC fixes for 4.4-rc7
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E82F2C@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Sorry for this late pull request, but these are all important fixes for code
introduced/updated in this release which we will otherwise end up back porting.

Please pull and wish you happy holidays !

Thx,
-Vineet
--------------->
The following changes since commit 4ef7675344d687a0ef5b0d7c0cee12da005870c0:

  Linux 4.4-rc6 (2015-12-20 16:06:09 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.4-rc7-fixes

for you to fetch changes up to 6b538db7c6b091960c57b23feae5431fc82286e7:

  ARC: dw2 unwind: Catch Dwarf SNAFUs early (2015-12-21 14:01:49 +0530)

----------------------------------------------------------------
ARC fixes for
 - Unwinder rework (A revert followed by better fix)
 - Build errors: MMUv2, modules with -Os
 - highmem section mismatch build splat

----------------------------------------------------------------
Alexey Brodkin (1):
      ARC: mm: fix building for MMU v2

Vineet Gupta (5):
      ARC: mm: HIGHMEM: Fix section mismatch splat
      ARC: Fix linking errors with CONFIG_MODULE + CONFIG_CC_OPTIMIZE_FOR_SIZE
      Revert "ARC: dw2 unwind: Ignore CIE version !=1 gracefully instead of bailing"
      ARC: dw2 unwind: Don't bail for CIE.version != 1
      ARC: dw2 unwind: Catch Dwarf SNAFUs early

 arch/arc/Makefile            |  2 +-
 arch/arc/include/asm/cache.h |  2 --
 arch/arc/kernel/unwind.c     | 28 +++++++++++-----------------
 arch/arc/mm/highmem.c        |  4 ++--
 4 files changed, 14 insertions(+), 22 deletions(-)
