From: elfring@users.sourceforge.net (SF Markus Elfring)
Date: Sat, 15 Oct 2016 21:56:07 +0200
Subject: [PATCH] ARC-setup: Use seq_putc() in show_cpuinfo()
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <164a402a-de20-645d-00af-9a414cf745c4@users.sourceforge.net>
To: linux-snps-arc@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 15 Oct 2016 21:31:16 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring at users.sourceforge.net>
---
 arch/arc/kernel/setup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 3df7f9c..e3f5432 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -494,8 +494,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 
 	free_page((unsigned long)str);
 done:
-	seq_printf(m, "\n");
-
+	seq_putc(m, '\n');
 	return 0;
 }
 
-- 
2.10.1
