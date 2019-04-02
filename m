From: st5pub@yandex.ru (Andrey Abramov)
Date: Tue, 02 Apr 2019 23:49:05 +0300
Subject: [PATCH v3 3/5] ocfs2: dir, refcounttree,
 xattr: replace swap functions with built-in one
In-Reply-To: <824481554237711@sas1-23a37bc8251c.qloud-c.yandex.net>
References: <824481554237711@sas1-23a37bc8251c.qloud-c.yandex.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <997661554238145@iva8-b333b7f98ab0.qloud-c.yandex.net>
To: linux-snps-arc@lists.infradead.org

Replace dx_leaf_sort_swap, swap_refcount_rec and swap_xe functions
with built-in one, because they do only a simple byte to byte swap.

Since Spectre mitigations have made indirect function calls more
expensive, and the default simple byte copies swap is implemented
without them, an "optimized" custom swap function is now
a waste of time as well as code.

Signed-off-by: Andrey Abramov <st5pub at yandex.ru>
Reviewed by: George Spelvin <lkml at sdf.org>
---
v2->v3: nothing changed

 fs/ocfs2/dir.c          | 13 +------------
 fs/ocfs2/refcounttree.c | 13 +++----------
 fs/ocfs2/xattr.c        | 15 +++------------
 3 files changed, 7 insertions(+), 34 deletions(-)

diff --git a/fs/ocfs2/dir.c b/fs/ocfs2/dir.c
index c121abbdfc7d..4b86b181df0a 100644
--- a/fs/ocfs2/dir.c
+++ b/fs/ocfs2/dir.c
@@ -3529,16 +3529,6 @@ static int dx_leaf_sort_cmp(const void *a, const void *b)
 	return 0;
 }
 
-static void dx_leaf_sort_swap(void *a, void *b, int size)
-{
-	struct ocfs2_dx_entry *entry1 = a;
-	struct ocfs2_dx_entry *entry2 = b;
-
-	BUG_ON(size != sizeof(*entry1));
-
-	swap(*entry1, *entry2);
-}
-
 static int ocfs2_dx_leaf_same_major(struct ocfs2_dx_leaf *dx_leaf)
 {
 	struct ocfs2_dx_entry_list *dl_list = &dx_leaf->dl_list;
@@ -3799,8 +3789,7 @@ static int ocfs2_dx_dir_rebalance(struct ocfs2_super *osb, struct inode *dir,
 	 * This block is changing anyway, so we can sort it in place.
 	 */
 	sort(dx_leaf->dl_list.de_entries, num_used,
-	     sizeof(struct ocfs2_dx_entry), dx_leaf_sort_cmp,
-	     dx_leaf_sort_swap);
+	     sizeof(struct ocfs2_dx_entry), dx_leaf_sort_cmp, NULL);
 
 	ocfs2_journal_dirty(handle, dx_leaf_bh);
 
diff --git a/fs/ocfs2/refcounttree.c b/fs/ocfs2/refcounttree.c
index 1dc9a08e8bdc..7bbc94d23a0c 100644
--- a/fs/ocfs2/refcounttree.c
+++ b/fs/ocfs2/refcounttree.c
@@ -1400,13 +1400,6 @@ static int cmp_refcount_rec_by_cpos(const void *a, const void *b)
 	return 0;
 }
 
-static void swap_refcount_rec(void *a, void *b, int size)
-{
-	struct ocfs2_refcount_rec *l = a, *r = b;
-
-	swap(*l, *r);
-}
-
 /*
  * The refcount cpos are ordered by their 64bit cpos,
  * But we will use the low 32 bit to be the e_cpos in the b-tree.
@@ -1482,7 +1475,7 @@ static int ocfs2_divide_leaf_refcount_block(struct buffer_head *ref_leaf_bh,
 	 */
 	sort(&rl->rl_recs, le16_to_cpu(rl->rl_used),
 	     sizeof(struct ocfs2_refcount_rec),
-	     cmp_refcount_rec_by_low_cpos, swap_refcount_rec);
+	     cmp_refcount_rec_by_low_cpos, NULL);
 
 	ret = ocfs2_find_refcount_split_pos(rl, &cpos, &split_index);
 	if (ret) {
@@ -1507,11 +1500,11 @@ static int ocfs2_divide_leaf_refcount_block(struct buffer_head *ref_leaf_bh,
 
 	sort(&rl->rl_recs, le16_to_cpu(rl->rl_used),
 	     sizeof(struct ocfs2_refcount_rec),
-	     cmp_refcount_rec_by_cpos, swap_refcount_rec);
+	     cmp_refcount_rec_by_cpos, NULL);
 
 	sort(&new_rl->rl_recs, le16_to_cpu(new_rl->rl_used),
 	     sizeof(struct ocfs2_refcount_rec),
-	     cmp_refcount_rec_by_cpos, swap_refcount_rec);
+	     cmp_refcount_rec_by_cpos, NULL);
 
 	*split_cpos = cpos;
 	return 0;
diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
index 3a24ce3deb01..b3e6f42baf78 100644
--- a/fs/ocfs2/xattr.c
+++ b/fs/ocfs2/xattr.c
@@ -4175,15 +4175,6 @@ static int cmp_xe(const void *a, const void *b)
 	return 0;
 }
 
-static void swap_xe(void *a, void *b, int size)
-{
-	struct ocfs2_xattr_entry *l = a, *r = b, tmp;
-
-	tmp = *l;
-	memcpy(l, r, sizeof(struct ocfs2_xattr_entry));
-	memcpy(r, &tmp, sizeof(struct ocfs2_xattr_entry));
-}
-
 /*
  * When the ocfs2_xattr_block is filled up, new bucket will be created
  * and all the xattr entries will be moved to the new bucket.
@@ -4249,7 +4240,7 @@ static void ocfs2_cp_xattr_block_to_bucket(struct inode *inode,
 	trace_ocfs2_cp_xattr_block_to_bucket_end(offset, size, off_change);
 
 	sort(target + offset, count, sizeof(struct ocfs2_xattr_entry),
-	     cmp_xe, swap_xe);
+	     cmp_xe, NULL);
 }
 
 /*
@@ -4444,7 +4435,7 @@ static int ocfs2_defrag_xattr_bucket(struct inode *inode,
 	 */
 	sort(entries, le16_to_cpu(xh->xh_count),
 	     sizeof(struct ocfs2_xattr_entry),
-	     cmp_xe_offset, swap_xe);
+	     cmp_xe_offset, NULL);
 
 	/* Move all name/values to the end of the bucket. */
 	xe = xh->xh_entries;
@@ -4486,7 +4477,7 @@ static int ocfs2_defrag_xattr_bucket(struct inode *inode,
 	/* sort the entries by their name_hash. */
 	sort(entries, le16_to_cpu(xh->xh_count),
 	     sizeof(struct ocfs2_xattr_entry),
-	     cmp_xe, swap_xe);
+	     cmp_xe, NULL);
 
 	buf = bucket_buf;
 	for (i = 0; i < bucket->bu_blocks; i++, buf += blocksize)
-- 
2.21.0
