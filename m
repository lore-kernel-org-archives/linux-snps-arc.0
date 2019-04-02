From: st5pub@yandex.ru (Andrey Abramov)
Date: Tue, 02 Apr 2019 23:45:08 +0300
Subject: [PATCH v3 1/5] arch/arc: unwind.c: replace swap function with
 built-in one
In-Reply-To: <824481554237711@sas1-23a37bc8251c.qloud-c.yandex.net>
References: <824481554237711@sas1-23a37bc8251c.qloud-c.yandex.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <988881554237908@iva6-3ac3de5fcc31.qloud-c.yandex.net>
To: linux-snps-arc@lists.infradead.org

Replace swap_eh_frame_hdr_table_entries with built-in one, because
swap_eh_frame_hdr_table_entries does a simple byte to byte swap.

Since Spectre mitigations have made indirect function calls more
expensive, and the default simple byte copies swap is implemented
without them, an "optimized" custom swap function is now
a waste of time as well as code.

Signed-off-by: Andrey Abramov <st5pub at yandex.ru>
Reviewed by: George Spelvin <lkml at sdf.org>
Acked-by: Vineet Gupta <vgupta at synopsys.com>
---
v2->v3: nothing changed

 arch/arc/kernel/unwind.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 271e9fafa479..7610fe84afea 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -248,20 +248,6 @@ static int cmp_eh_frame_hdr_table_entries(const void *p1, const void *p2)
 	return (e1->start > e2->start) - (e1->start < e2->start);
 }
 
-static void swap_eh_frame_hdr_table_entries(void *p1, void *p2, int size)
-{
-	struct eh_frame_hdr_table_entry *e1 = p1;
-	struct eh_frame_hdr_table_entry *e2 = p2;
-	unsigned long v;
-
-	v = e1->start;
-	e1->start = e2->start;
-	e2->start = v;
-	v = e1->fde;
-	e1->fde = e2->fde;
-	e2->fde = v;
-}
-
 static void init_unwind_hdr(struct unwind_table *table,
 			    void *(*alloc) (unsigned long))
 {
@@ -354,10 +340,8 @@ static void init_unwind_hdr(struct unwind_table *table,
 	}
 	WARN_ON(n != header->fde_count);
 
-	sort(header->table,
-	     n,
-	     sizeof(*header->table),
-	     cmp_eh_frame_hdr_table_entries, swap_eh_frame_hdr_table_entries);
+	sort(header->table, n,
+	     sizeof(*header->table), cmp_eh_frame_hdr_table_entries, NULL);
 
 	table->hdrsz = hdrSize;
 	smp_wmb();
-- 
2.21.0
