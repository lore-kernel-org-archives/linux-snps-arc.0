From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:02 +0530
Subject: [PATCH 04/17] ARC: dw2 unwind: Remove FP based unwinding
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-5-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

FP is disabled for ARC and even if it was enabled, it won't help with
unwinding given ARC ABI so remove it.

Typical ABI would
 - save BLINK (return address) on stack
 - save FP on stack
 - anchor FP for this frame
 - save any callee-regs and/or carve frame for local vars

Thus FP remains fixed for frame and can be used to determine BLINK.

ARC ABI historically required saving callee-regs before anchoring FP,
thus rendering it useless for finding BLINK.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/unwind.h | 11 +----------
 arch/arc/kernel/unwind.c      | 45 ++-----------------------------------------
 2 files changed, 3 insertions(+), 53 deletions(-)

diff --git a/arch/arc/include/asm/unwind.h b/arch/arc/include/asm/unwind.h
index 559ef55abce1..03ace2cc8bc5 100644
--- a/arch/arc/include/asm/unwind.h
+++ b/arch/arc/include/asm/unwind.h
@@ -58,17 +58,7 @@ struct unwind_frame_info {
 #define UNW_PC(frame)		((frame)->regs.r63)
 #define UNW_SP(frame)		((frame)->regs.r28)
 #define UNW_BLINK(frame)	((frame)->regs.r31)
-
-/* Rajesh FIXME */
-#ifdef CONFIG_FRAME_POINTER
 #define UNW_FP(frame)		((frame)->regs.r27)
-#define FRAME_RETADDR_OFFSET	4
-#define FRAME_LINK_OFFSET	0
-#define STACK_BOTTOM_UNW(tsk)	STACK_LIMIT((tsk)->thread.ksp)
-#define STACK_TOP_UNW(tsk)	((tsk)->thread.ksp)
-#else
-#define UNW_FP(frame)		((void)(frame), 0)
-#endif
 
 #define STACK_LIMIT(ptr)	(((ptr) - 1) & ~(THREAD_SIZE - 1))
 
@@ -128,6 +118,7 @@ extern void unwind_remove_table(void *handle, int init_only);
 #define UNW_PC(frame) ((void)(frame), 0)
 #define UNW_SP(frame) ((void)(frame), 0)
 #define UNW_FP(frame) ((void)(frame), 0)
+#define UNW_FP(frame) ((void)(frame), 0)
 
 static inline void arc_unwind_init(void)
 {
diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 2f4a67f5a863..0993a81e112b 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -1057,50 +1057,9 @@ int arc_unwind(struct unwind_frame_info *frame)
 				fde = NULL;
 		}
 	}
-	if (cie == NULL || fde == NULL) {
-#ifdef CONFIG_FRAME_POINTER
-		unsigned long top, bottom;
-
-		top = STACK_TOP_UNW(frame->task);
-		bottom = STACK_BOTTOM_UNW(frame->task);
-#if FRAME_RETADDR_OFFSET < 0
-		if (UNW_SP(frame) < top && UNW_FP(frame) <= UNW_SP(frame)
-		    && bottom < UNW_FP(frame)
-#else
-		if (UNW_SP(frame) > top && UNW_FP(frame) >= UNW_SP(frame)
-		    && bottom > UNW_FP(frame)
-#endif
-		    && !((UNW_SP(frame) | UNW_FP(frame))
-			 & (sizeof(unsigned long) - 1))) {
-			unsigned long link;
-
-			if (!__get_user(link, (unsigned long *)
-					(UNW_FP(frame) + FRAME_LINK_OFFSET))
-#if FRAME_RETADDR_OFFSET < 0
-			    && link > bottom && link < UNW_FP(frame)
-#else
-			    && link > UNW_FP(frame) && link < bottom
-#endif
-			    && !(link & (sizeof(link) - 1))
-			    && !__get_user(UNW_PC(frame),
-					   (unsigned long *)(UNW_FP(frame)
-						+ FRAME_RETADDR_OFFSET)))
-			{
-				UNW_SP(frame) =
-				    UNW_FP(frame) + FRAME_RETADDR_OFFSET
-#if FRAME_RETADDR_OFFSET < 0
-				    -
-#else
-				    +
-#endif
-				    sizeof(UNW_PC(frame));
-				UNW_FP(frame) = link;
-				return 0;
-			}
-		}
-#endif
+	if (cie == NULL || fde == NULL)
 		return -ENXIO;
-	}
+
 	state.org = startLoc;
 	memcpy(&state.cfa, &badCFA, sizeof(state.cfa));
 
-- 
1.9.1
