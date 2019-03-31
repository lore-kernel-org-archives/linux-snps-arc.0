From: st5pub@yandex.ru (Andrey Abramov)
Date: Sun, 31 Mar 2019 21:47:12 +0300
Subject: [PATCH v2 4/5] ubifs: find.c: replace swap function with built-in one
In-Reply-To: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
References: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20479221554058032@sas1-fb8a605c4548.qloud-c.yandex.net>
To: linux-snps-arc@lists.infradead.org

Replace swap_dirty_idx function with built-in one,
because swap_dirty_idx does only a simple byte to byte swap.

Since Spectre mitigations have made indirect function calls more
expensive, and the default simple byte copies swap is implemented
without them, an "optimized" custom swap function is now
a waste of time as well as code.

Signed-off-by: Andrey Abramov <st5pub at yandex.ru>
Reviewed by: George Spelvin <lkml at sdf.org>
---
 fs/ubifs/find.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index f9646835b026..5deaae7fcead 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -747,12 +747,6 @@ static int cmp_dirty_idx(const struct ubifs_lprops **a,
 	return lpa->dirty + lpa->free - lpb->dirty - lpb->free;
 }
 
-static void swap_dirty_idx(struct ubifs_lprops **a, struct ubifs_lprops **b,
-			   int size)
-{
-	swap(*a, *b);
-}
-
 /**
  * ubifs_save_dirty_idx_lnums - save an array of the most dirty index LEB nos.
  * @c: the UBIFS file-system description object
@@ -772,8 +766,7 @@ int ubifs_save_dirty_idx_lnums(struct ubifs_info *c)
 	       sizeof(void *) * c->dirty_idx.cnt);
 	/* Sort it so that the dirtiest is now at the end */
 	sort(c->dirty_idx.arr, c->dirty_idx.cnt, sizeof(void *),
-	     (int (*)(const void *, const void *))cmp_dirty_idx,
-	     (void (*)(void *, void *, int))swap_dirty_idx);
+	     (int (*)(const void *, const void *))cmp_dirty_idx, NULL);
 	dbg_find("found %d dirty index LEBs", c->dirty_idx.cnt);
 	if (c->dirty_idx.cnt)
 		dbg_find("dirtiest index LEB is %d with dirty %d and free %d",
-- 
2.21.0
