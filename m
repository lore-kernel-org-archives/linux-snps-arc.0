From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 10 Nov 2016 17:44:45 +0100
Subject: [PATCH v2 02/11] NFSv4.1: work around -Wmaybe-uninitialized warning
In-Reply-To: <20161110164454.293477-1-arnd@arndb.de>
References: <20161110164454.293477-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161110164454.293477-3-arnd@arndb.de>
To: linux-snps-arc@lists.infradead.org

A bugfix introduced a harmless gcc warning in nfs4_slot_seqid_in_use
if we enable -Wmaybe-uninitialized again:

fs/nfs/nfs4session.c:203:54: error: 'cur_seq' may be used uninitialized in this function [-Werror=maybe-uninitialized]

gcc is not smart enough to conclude that the IS_ERR/PTR_ERR pair
results in a nonzero return value here. Using PTR_ERR_OR_ZERO()
instead makes this clear to the compiler.

Fixes: e09c978aae5b ("NFSv4.1: Fix Oopsable condition in server callback races")
Signed-off-by: Arnd Bergmann <arnd at arndb.de>
---
First submitted on Aug 31, but ended up not getting applied then
as the warning was disabled in v4.8-rc

Anna Schumaker said at the kernel summit that she had applied
it and would send it for 4.9, but as of 2016-11-09 it has not
made it into linux-next.

 fs/nfs/nfs4session.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/nfs/nfs4session.c b/fs/nfs/nfs4session.c
index b629730..150c5a1 100644
--- a/fs/nfs/nfs4session.c
+++ b/fs/nfs/nfs4session.c
@@ -178,12 +178,14 @@ static int nfs4_slot_get_seqid(struct nfs4_slot_table  *tbl, u32 slotid,
 	__must_hold(&tbl->slot_tbl_lock)
 {
 	struct nfs4_slot *slot;
+	int ret;
 
 	slot = nfs4_lookup_slot(tbl, slotid);
-	if (IS_ERR(slot))
-		return PTR_ERR(slot);
-	*seq_nr = slot->seq_nr;
-	return 0;
+	ret = PTR_ERR_OR_ZERO(slot);
+	if (!ret)
+		*seq_nr = slot->seq_nr;
+
+	return ret;
 }
 
 /*
-- 
2.9.0
