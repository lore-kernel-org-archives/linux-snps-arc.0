From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 30 Jun 2016 14:40:26 +0530
Subject: [GIT PULL] ARC fixes for 4.7-rc6
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5774E202.1020801@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

A couple of fixes for ARC. Please pull !

Thx,
-Vineet

------------>
The following changes since commit 5edb56491d4812c42175980759da53388e5d86f5:

  Linux 4.7-rc3 (2016-06-12 07:20:35 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.7-rc6-fixes

for you to fetch changes up to 9bd54517ee86cb164c734f72ea95aeba4804f10b:

  arc: unwind: warn only once if DW2_UNWIND is disabled (2016-06-28 11:11:44 +0530)

----------------------------------------------------------------
ARC Fix for 4.7-rc6

- Reinstate dwarf unwinder/loadable-modules with new gnu tools

----------------------------------------------------------------
Alexey Brodkin (1):
      arc: unwind: warn only once if DW2_UNWIND is disabled

Vineet Gupta (1):
      ARC: unwind: ensure that .debug_frame is generated (vs. .eh_frame)

 arch/arc/Makefile            | 2 --
 arch/arc/kernel/stacktrace.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)
