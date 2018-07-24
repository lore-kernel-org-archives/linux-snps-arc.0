From: rd.dunlab@gmail.com (Randy Dunlap)
Date: Tue, 24 Jul 2018 13:46:18 -0700
Subject: arc: some allmodconfig fixup patches
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180724204622.2366-1-rd.dunlab@gmail.com>
To: linux-snps-arc@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

Hi,

Here are a few patches that fix build errors or warnings that
I encountered while doing arc "allmodconfig" builds.

These patches do not fix all of the build issues.


 arch/arc/include/asm/delay.h            |    2 ++
 arch/arc/mm/cache.c                     |   11 ++++++-----
 arch/arc/plat-eznps/include/plat/ctop.h |    1 +
 arch/arc/plat-eznps/mtm.c               |    6 ++++--
 4 files changed, 13 insertions(+), 7 deletions(-)
