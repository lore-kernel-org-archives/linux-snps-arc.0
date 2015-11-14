From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Sat, 14 Nov 2015 13:21:40 +0530
Subject: [GIT PULL] ARC urgent fixes for 4.4-rc1
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5646E80C.1010807@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Found a couple of brown paper bag bugs with the prev pull request (including a SMP
build breakage report from Guenter). Since these are urgent I also decided to send
over a bunch of other pending fixes which could have otherwise waited an rc or
two. Please pull.

Thx,
-Vineet
----------------->
The following changes since commit 5a364c2a1762e8a78721fafc93144509c0b6cb84:

  ARC: mm: PAE40 support (2015-10-29 18:41:30 +0530)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.4-rc1-part2

for you to fetch changes up to 30b9dbee895ff0d5cbf155bd1ef3f0f5992bca6f:

  ARC: Fix silly typo in MAINTAINERS file (2015-11-14 13:12:31 +0530)

----------------------------------------------------------------
ARC fixes for 4.4-rc1
- A bunch of brown paper bag bugs (MAINTAINERS list email, SMP build failure)
- cpu_relax() now compiler barrier for UP as well
- Handling of userspace Bus Errors for ARCompact builds

----------------------------------------------------------------
Vineet Gupta (6):
      ARCv2: lib: memcpy: use local symbols
      ARC: remove extraneous header include
      ARC: [arcompact] Handle bus error from userspace as Interrupt not exception
      ARC: use ASL assembler mnemonic
      ARC: cpu_relax() to be compiler barrier even for UP
      ARC: Fix silly typo in MAINTAINERS file

 MAINTAINERS                      |  2 +-
 arch/arc/include/asm/processor.h |  4 ----
 arch/arc/kernel/entry-arcv2.S    | 19 +++++++++++++++
 arch/arc/kernel/entry-compact.S  | 29 ++++++++++++++++++----
 arch/arc/kernel/entry.S          | 17 -------------
 arch/arc/lib/memcpy-archs.S      | 52 ++++++++++++++++++++--------------------
 arch/arc/mm/tlbex.S              |  6 ++---
 arch/arc/plat-sim/platform.c     |  1 -
 8 files changed, 74 insertions(+), 56 deletions(-)
