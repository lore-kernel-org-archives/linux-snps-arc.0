From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 10 Jan 2019 16:26:24 -0800
Subject: [PATCH 0/3] Replace opencoded set_mask_bits
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1547166387-19785-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

I did these a while back and forget. Rebased to 5.0-rc1.
Please consider applying.

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
