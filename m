From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 22 Dec 2016 17:09:08 +0300
Subject: [PATCH 0/2] Minor fixes for CCMs
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1482415750-5471-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

It turned out current implementation of CCM support doesn't work at all.
There're 2 isseus:
 * Data/code which is supposed to be in DCCM or ICCM accordingly gets
   merged in common .data and .text sections so CCMs won't be used
 * Kerenl will panic on early boot because comparison of CCM sizes
   is implemented incorrectly

This short series fixes both issues above so CCMs are usable again.
And both patches indeed should be back-ported to stable kernels.

Alexey Brodkin (2):
  arc: rename xCCM sections so they are not merged in global .data/.text
  arc: Fix xCCM size check

 arch/arc/include/asm/linkage.h | 6 +++---
 arch/arc/kernel/setup.c        | 4 ++--
 arch/arc/kernel/vmlinux.lds.S  | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.7.4
