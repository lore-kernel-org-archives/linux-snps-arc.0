From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Nov 2016 16:16:51 -0800
Subject: [GIT PULL] ARC fixes for 4.9-final !
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <04458eb2-54f2-84d4-aeb3-6a86261f8f32@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull ARC fixes for 4.9.

Thx,
-Vineet

---------->
The following changes since commit e5517c2a5a49ed5e99047008629f1cd60246ea0e:

  Linux 4.9-rc7 (2016-11-27 13:08:04 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.9-final

for you to fetch changes up to 6a8b2ca702b279bea0e8f0363056439352e2081c:

  ARC: mm: PAE40: Fix crash at munmap (2016-11-29 09:12:08 -0800)

----------------------------------------------------------------
ARC fixes for 4.9 final

 - PAE40 crash	[Yuriy]
 - Disabling IO-Coherency by default
 - Using a different inline asm constraint for Zero Overhead loops

----------------------------------------------------------------
Vineet Gupta (2):
      ARC: Don't use "+l" inline asm constraint
      ARC: mm: IOC: Don't enable IOC by default

Yuriy Kolerov (1):
      ARC: mm: PAE40: Fix crash at munmap

 arch/arc/include/asm/delay.h   | 9 +++++----
 arch/arc/include/asm/pgtable.h | 2 +-
 arch/arc/mm/cache.c            | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)
