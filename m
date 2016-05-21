From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:46:29 +0200
Subject: [PATCH 0073/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114629.2893-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index d1da603..a78d567 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -32,7 +32,7 @@
 #define __kernel_ok		(segment_eq(get_fs(), KERNEL_DS))
 
 /*
- * Algorthmically, for __user_ok() we want do:
+ * Algorithmically, for __user_ok() we want do:
  * 	(start < TASK_SIZE) && (start+len < TASK_SIZE)
  * where TASK_SIZE could either be retrieved from thread_info->addr_limit or
  * emitted directly in code.
-- 
2.8.2.534.g1f66975
