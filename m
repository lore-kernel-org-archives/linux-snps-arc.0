From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 7 Sep 2018 11:21:12 -0700
Subject: [GIT PULL] ARC updates for 4.19-rc3
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4cb8dd19-a252-10c1-8dea-5479ced463fb@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

ARC updates for 4.19-rc3.

The DMA-IOC changes are technically merge-window stuff but that didn't happen due
to me being in fire drill inhouse. They have been reviewed a while back by
Christoph and it will help him with more DMA rework if merged now than in 4.20, so
please take them.

Please pull !

Thx,
-Vineet
-------------------->
The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.19-rc3

for you to fetch changes up to 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

----------------------------------------------------------------
ARC updates for 4.19-rc3

 - For for atomic_fetch_#op  [Will Deacon]

 - Enabling per device IOC [Eugeniy Paltsev]

 - Remove redundany gcc version checks [Masahiro Yamada]

 - Miscll platform config/DT updates [Alexey Brodkin]

----------------------------------------------------------------
