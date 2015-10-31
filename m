From: noamc@ezchip.com (Noam Camus)
Date: Sat, 31 Oct 2015 15:15:22 +0200
Subject: [PATCH v1 15/20] ARC: [plat-eznps] Use dedicated identity auxiliary
 register.
In-Reply-To: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446297327-16298-16-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

With generic "identity" num of CPUs is limited to 256 (8 bit).
We use our alternative AUX register GLOBAL_ID (12 bit).
Now we can support up to 4096 CPUs.

Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/include/asm/entry-compact.h |    8 ++++++++
 arch/arc/kernel/ctx_sw.c             |   13 +++++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/arch/arc/include/asm/entry-compact.h b/arch/arc/include/asm/entry-compact.h
index 1aff3be..bf9a6a1 100644
--- a/arch/arc/include/asm/entry-compact.h
+++ b/arch/arc/include/asm/entry-compact.h
@@ -35,6 +35,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/irqflags-compact.h>
 #include <asm/thread_info.h>	/* For THREAD_SIZE */
+#include <plat/ctop.h>
 
 /*--------------------------------------------------------------
  * Switch to Kernel Mode stack if SP points to User Mode stack
@@ -298,9 +299,16 @@
 
 /* Get CPU-ID of this core */
 .macro  GET_CPU_ID  reg
+#ifdef CONFIG_ARC_PLAT_EZNPS
+	lr  \reg, [CTOP_AUX_LOGIC_GLOBAL_ID]
+#ifndef CONFIG_EZNPS_MTM_EXT
+	lsr \reg, \reg, 4
+#endif
+#else
 	lr  \reg, [identity]
 	lsr \reg, \reg, 8
 	bmsk \reg, \reg, 7
+#endif
 .endm
 
 #endif  /* __ASM_ARC_ENTRY_COMPACT_H */
diff --git a/arch/arc/kernel/ctx_sw.c b/arch/arc/kernel/ctx_sw.c
index c14a5be..92e2e82 100644
--- a/arch/arc/kernel/ctx_sw.c
+++ b/arch/arc/kernel/ctx_sw.c
@@ -16,6 +16,9 @@
 
 #include <asm/asm-offsets.h>
 #include <linux/sched.h>
+#ifdef CONFIG_ARC_PLAT_EZNPS
+#include <plat/ctop.h>
+#endif
 
 #define KSP_WORD_OFF 	((TASK_THREAD + THREAD_KSP) / 4)
 
@@ -69,9 +72,16 @@ __switch_to(struct task_struct *prev_task, struct task_struct *next_task)
 #ifndef CONFIG_SMP
 		"st  %2, [@_current_task]	\n\t"
 #else
+#ifdef CONFIG_ARC_PLAT_EZNPS
+		"lr   r24, [%4]		\n\t"
+#ifndef CONFIG_EZNPS_MTM_EXT
+		"lsr  r24, r24, 4		\n\t"
+#endif
+#else
 		"lr   r24, [identity]		\n\t"
 		"lsr  r24, r24, 8		\n\t"
 		"bmsk r24, r24, 7		\n\t"
+#endif
 		"add2 r24, @_current_task, r24	\n\t"
 		"st   %2,  [r24]		\n\t"
 #endif
@@ -109,6 +119,9 @@ __switch_to(struct task_struct *prev_task, struct task_struct *next_task)
 
 		: "=r"(tmp)
 		: "n"(KSP_WORD_OFF), "r"(next), "r"(prev)
+#ifdef CONFIG_ARC_PLAT_EZNPS
+		, "i"(CTOP_AUX_LOGIC_GLOBAL_ID)
+#endif
 		: "blink"
 	);
 
-- 
1.7.1
