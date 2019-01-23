From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 23 Jan 2019 12:33:01 -0800
Subject: [PATCH v2 0/3] Replace opencoded set_mask_bits
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548275584-18096-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

Repost of [1] rebased on 5.0-rc3 + accumulated Acked-by/Reviewed-by.
No code changes since v1.

Please consider applying.

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2019-January/005201.html

Thx,
-Vineet

Vineet Gupta (3):
  coredump: Replace opencoded set_mask_bits()
  fs: inode_set_flags() replace opencoded set_mask_bits()
  bitops.h: set_mask_bits() to return old value

 fs/exec.c              | 7 +------
 fs/inode.c             | 8 +-------
 include/linux/bitops.h | 2 +-
 3 files changed, 3 insertions(+), 14 deletions(-)

-- 
2.7.4
