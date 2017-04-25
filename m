From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 25 Apr 2017 13:56:14 -0700
Subject: [GIT PULL] ARC fixes for 4.11-final
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c6344d3e-0ce2-8ab0-6bc8-5b8cb3988d6a@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Couple of late fixes for ARC, better for them to go now then request backports.

Please pull.

Thx,
-Vineet

------>
The following changes since commit 39da7c509acff13fc8cb12ec1bb20337c988ed36:

  Linux 4.11-rc6 (2017-04-09 09:49:44 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.11-final

for you to fetch changes up to 3d5e80125a6e5649c6bdad8d5780e39ea422c67d:

  ARCv2: entry: save Accumulator register pair (r58:59) if present (2017-04-20
15:37:49 -0700)

----------------------------------------------------------------
Last minute fixes for ARC

 - Build error in Mellanox nps platform

 - addressing lack of saving FPU regs in releavnt configs

----------------------------------------------------------------
Noam Camus (1):
      ARC: [plat-eznps] Fix build error

Vineet Gupta (1):
      ARCv2: entry: save Accumulator register pair (r58:59) if present

 arch/arc/Kconfig                   |  8 ++++++++
 arch/arc/include/asm/atomic.h      |  3 ++-
 arch/arc/include/asm/entry-arcv2.h | 10 ++++++++++
 arch/arc/include/asm/ptrace.h      |  4 ++++
 arch/arc/kernel/setup.c            | 30 +++++++++++++++++++++---------
 5 files changed, 45 insertions(+), 10 deletions(-)
