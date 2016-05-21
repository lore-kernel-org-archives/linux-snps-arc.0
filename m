From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:47:05 +0200
Subject: [PATCH 0078/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114705.3294-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/kernel/troubleshoot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
index a6f91e8..934150e 100644
--- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -276,7 +276,7 @@ static int tlb_stats_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
-/* called on user read(): display the couters */
+/* called on user read(): display the counters */
 static ssize_t tlb_stats_output(struct file *file,	/* file descriptor */
 				char __user *user_buf,	/* user buffer */
 				size_t len,		/* length of buffer */
-- 
2.8.2.534.g1f66975
