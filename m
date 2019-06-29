From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Sat, 29 Jun 2019 00:12:09 +0000
Subject: [GIT PULL] ARC fixes for 5.2-rc7
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b799ad4e-cafb-bf1f-3d92-34a5035ea7b5@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull some fixes for ARC.

Thx,
-Vineet

------------->
The following changes since commit d1fdb6d8f6a4109a4263176c84b899076a5f8008:

  Linux 5.2-rc4 (2019-06-08 20:24:46 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.2-rc7

for you to fetch changes up to ec9b4feb1e41587c15d43d237844193318389dc3:

  ARC: [plat-hsdk]: unify memory apertures configuration (2019-06-11 11:48:34 -0700)

----------------------------------------------------------------
ARC fixes for 5.2-rc7

 - hsdk platform unifying apertures

 - build system CROSS_COMPILE prefix

----------------------------------------------------------------
Alexey Brodkin (1):
      ARC: build: Try to guess CROSS_COMPILE with cc-cross-prefix

Eugeniy Paltsev (1):
      ARC: [plat-hsdk]: unify memory apertures configuration

 arch/arc/Makefile             |   4 ++
 arch/arc/plat-hsdk/platform.c | 161 +++++++++++++++++++++++++++++++++++++++---
 2 files changed, 157 insertions(+), 8 deletions(-)
