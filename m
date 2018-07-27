From: rd.dunlab@gmail.com (rd_dunlab)
Date: Thu, 26 Jul 2018 20:16:35 -0700
Subject: [PATCH 0/4 v2] arc: some allmodconfig build fixes
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <15326613951079@infradead.org>
To: linux-snps-arc@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

Hi,

Here are a few patches that fix build errors or warnings that
I encountered while doing arc "allmodconfig" builds.

These patches do not fix all of the build issues.


 arch/arc/include/asm/delay.h            |    3 +++
 arch/arc/mm/cache.c                     |    7 ++++---
 arch/arc/plat-eznps/include/plat/ctop.h |    1 +
 arch/arc/plat-eznps/mtm.c               |    6 ++++--
 4 files changed, 12 insertions(+), 5 deletions(-)


-- 
