From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 10 Jan 2019 16:26:26 -0800
Subject: [PATCH 2/3] fs: inode_set_flags() replace opencoded set_mask_bits()
In-Reply-To: <1547166387-19785-1-git-send-email-vgupta@synopsys.com>
References: <1547166387-19785-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1547166387-19785-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

It seems that 5f16f3225b0624 and 00a1a053ebe5, both with same commitlog
("ext4: atomically set inode->i_flags in ext4_set_inode_flags()")
introduced the set_mask_bits API, but somehow missed not using it in
ext4 in the end

Also, set_mask_bits is used in fs quite a bit and we can possibly come up
with a generic llsc based implementation (w/o the cmpxchg loop)

Cc: Alexander Viro <viro at zeniv.linux.org.uk>
Cc: Theodore Ts'o <tytso at mit.edu>
Cc: Peter Zijlstra (Intel) <peterz at infradead.org>
Cc: linux-fsdevel at vger.kernel.org
Cc: linux-kernel at vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 fs/inode.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 0cd47fe0dbe5..799b0c4beda8 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2096,14 +2096,8 @@ EXPORT_SYMBOL(inode_dio_wait);
 void inode_set_flags(struct inode *inode, unsigned int flags,
 		     unsigned int mask)
 {
-	unsigned int old_flags, new_flags;
-
 	WARN_ON_ONCE(flags & ~mask);
-	do {
-		old_flags = READ_ONCE(inode->i_flags);
-		new_flags = (old_flags & ~mask) | flags;
-	} while (unlikely(cmpxchg(&inode->i_flags, old_flags,
-				  new_flags) != old_flags));
+	set_mask_bits(&inode->i_flags, mask, flags);
 }
 EXPORT_SYMBOL(inode_set_flags);
 
-- 
2.7.4
