From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 6 May 2016 17:52:25 +0530
Subject: [GIT PULL] ARC updates for 4.6-rc7
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <572C8C81.5080203@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Late in the cycle, but this has fixes for couple of issues: a PAE40 boot crash and
Arnd spotting lack of barriers in BE io-accessors. The 3rd patch for enabling
highmem in low physical mem ;-) honestly is more than a "fix" but its been in
works for some time, seems to be stable in testing and enables 2 of our customers
to go forward with 4.6 kernel.

Please pull !

Thx,
-Vineet

------------->
The following changes since commit 1b10cb21d888c021bedbe678f7c26aee1bf04ffa:

  ARC: add support for reserved memory defined by device tree (2016-04-27 17:06:56
+0530)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.6-rc7-fixes

for you to fetch changes up to 26f9d5fd82ca20fe536cb493ec7cf5628f8997e5:

  ARC: support HIGHMEM even without PAE40 (2016-05-05 16:35:46 +0530)

----------------------------------------------------------------
ARC fixes for 4.6-rc7

 - Fix for PTE truncation in PAE40 builds
 - Fix for big endian IO accessors lacking IO barrier
 - Allow HIGHMEM to work with low physical addresses

----------------------------------------------------------------
Vineet Gupta (3):
      ARC: Add missing io barriers to io{read,write}{16,32}be()
      ARC: Fix PAE40 boot failures due to PTE truncation
      ARC: support HIGHMEM even without PAE40

 arch/arc/Kconfig               | 13 ++++++++++
 arch/arc/include/asm/io.h      | 27 ++++++++++++++-------
 arch/arc/include/asm/mmzone.h  | 43 +++++++++++++++++++++++++++++++++
 arch/arc/include/asm/page.h    | 15 ++++++++----
 arch/arc/include/asm/pgtable.h | 13 +++++-----
 arch/arc/mm/init.c             | 54 ++++++++++++++++++++++++++++++------------
 6 files changed, 130 insertions(+), 35 deletions(-)
