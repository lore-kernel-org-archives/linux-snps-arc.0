From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:46:07 +0200
Subject: [PATCH 0070/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114607.2715-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index f904899..16b630f 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -78,7 +78,7 @@ struct task_struct;
 #define KSTK_ESP(tsk)   (task_pt_regs(tsk)->sp)
 
 /*
- * Where abouts of Task's sp, fp, blink when it was last seen in kernel mode.
+ * Where about of Task's sp, fp, blink when it was last seen in kernel mode.
  * Look in process.c for details of kernel stack layout
  */
 #define TSK_K_ESP(tsk)		(tsk->thread.ksp)
-- 
2.8.2.534.g1f66975
