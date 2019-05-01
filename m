From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 1 May 2019 09:09:56 -0700
Subject: [GIT PULL] ARC updates for 5.1 final
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ab49ac97-deee-e2db-71c7-5544b09aca4f@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull a few minor fixes for ARC.

Thx,
-Vineet

------------------->
The following changes since commit 79a3aaa7b82e3106be97842dedfd8429248896e6:

  Linux 5.1-rc3 (2019-03-31 14:39:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.1-final

for you to fetch changes up to 55c0c4c793b538fb438bcc72481b9dc2f79fe5a9:

  ARC: memset: fix build with L1_CACHE_SHIFT != 6 (2019-04-08 08:41:44 -0700)

----------------------------------------------------------------
ARC updates for 5.1 final

 - regression in memset if line size !64

 - avoid panic if PAE and IOC

----------------------------------------------------------------
Eugeniy Paltsev (1):
      ARC: memset: fix build with L1_CACHE_SHIFT != 6

Vineet Gupta (2):
      ARC: PAE40: don't panic and instead turn off hw ioc
      ARC: [hsdk] Make it easier to add PAE40 region to DTB

 arch/arc/boot/dts/hsdk.dts  | 13 +++++++------
 arch/arc/lib/memset-archs.S |  4 ++--
 arch/arc/mm/cache.c         | 31 ++++++++++++++++---------------
 3 files changed, 25 insertions(+), 23 deletions(-)
