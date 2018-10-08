From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 8 Oct 2018 19:54:50 +0000
Subject: [GIT PULL] ARC updates for 4.19-rc8
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B0A4DEA@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Greg,

Late in the cycle, but please pull ARC updates. We could have waited for next
release had it not been for the the clone syscall fix which is stable material.

Thx,
-Vineet

--------------->
The following changes since commit 11da3a7f84f19c26da6f86af878298694ede0804:

  Linux 4.19-rc3 (2018-09-09 17:26:43 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.19-rc8

for you to fetch changes up to c58a584f05e35d1d4342923cd7aac07d9c3d3d16:

  ARC: clone syscall to setp r25 as thread pointer (2018-10-05 14:33:29 -0700)

----------------------------------------------------------------
ARC updates for 4.19-rc8

 - Fix clone syscall to update Thread pointer register

 - Make/build updates (needed for AGL/OE builds)   [Alexey]

 - Typo fix [Colin Ian King]

----------------------------------------------------------------
Alexey Brodkin (2):
      ARC: build: Get rid of toolchain check
      ARC: build: Don't set CROSS_COMPILE in arch's Makefile

Colin Ian King (1):
      ARC: fix spelling mistake "entires" -> "entries"

Vineet Gupta (2):
      ARCv2: build: use mcpu=hs38 iso generic mcpu=archs
      ARC: clone syscall to setp r25 as thread pointer

 arch/arc/Kconfig          |  2 +-
 arch/arc/Makefile         | 26 ++------------------------
 arch/arc/kernel/process.c | 20 ++++++++++++++++++++
 3 files changed, 23 insertions(+), 25 deletions(-)
