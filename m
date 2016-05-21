From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:46:22 +0200
Subject: [PATCH 0072/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114622.2840-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/thread_info.h b/arch/arc/include/asm/thread_info.h
index 3af6745..2d79e52 100644
--- a/arch/arc/include/asm/thread_info.h
+++ b/arch/arc/include/asm/thread_info.h
@@ -103,7 +103,7 @@ static inline __attribute_const__ struct thread_info *current_thread_info(void)
 
 /*
  * _TIF_ALLWORK_MASK includes SYSCALL_TRACE, but we don't need it.
- * SYSCALL_TRACE is anways seperately/unconditionally tested right after a
+ * SYSCALL_TRACE is anyway seperately/unconditionally tested right after a
  * syscall, so all that reamins to be tested is _TIF_WORK_MASK
  */
 
-- 
2.8.2.534.g1f66975
