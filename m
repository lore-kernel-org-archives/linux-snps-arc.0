From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:01 +0530
Subject: [PATCH 03/17] ARC: dw2 unwind: Remove handling of for signal frame
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/unwind.h |  3 ---
 arch/arc/kernel/unwind.c      | 11 ++---------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arc/include/asm/unwind.h b/arch/arc/include/asm/unwind.h
index 0e7f48e2686a..559ef55abce1 100644
--- a/arch/arc/include/asm/unwind.h
+++ b/arch/arc/include/asm/unwind.h
@@ -116,9 +116,6 @@ struct unwind_frame_info {
 	PTREGS_INFO(r31), \
 	PTREGS_INFO(r63)
 
-#define UNW_DEFAULT_RA(raItem, dataAlign) \
-	((raItem).where == Memory && !((raItem).value * (dataAlign) + 4))
-
 extern int arc_unwind(struct unwind_frame_info *frame);
 extern void arc_unwind_init(void);
 extern void arc_unwind_setup(void);
diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 44983b4d9e78..2f4a67f5a863 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -869,7 +869,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 #define FRAME_REG(r, t) (((t *)frame)[reg_info[r].offs])
 	const u32 *fde = NULL, *cie = NULL;
 	const u8 *ptr = NULL, *end = NULL;
-	unsigned long pc = UNW_PC(frame) - frame->call_frame;
+	unsigned long pc = UNW_PC(frame);
 	unsigned long startLoc = 0, endLoc = 0, cfa;
 	unsigned i;
 	signed ptrType = -1;
@@ -988,7 +988,6 @@ int arc_unwind(struct unwind_frame_info *frame)
 		state.cieEnd = ptr;	/* keep here temporarily */
 		ptr = (const u8 *)(cie + 2);
 		end = (const u8 *)(cie + 1) + *cie;
-		frame->call_frame = 1;
 		if ((state.version = *ptr) != 1)
 			cie = NULL;	/* unsupported version */
 		else if (*++ptr) {
@@ -1003,7 +1002,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 					case 'R':
 						continue;
 					case 'S':
-						frame->call_frame = 0;
+						/* signal frame not handled */
 						continue;
 					default:
 						break;
@@ -1147,12 +1146,6 @@ int arc_unwind(struct unwind_frame_info *frame)
 	unw_debug("\n");
 #endif
 
-	/* update frame */
-#ifndef CONFIG_AS_CFI_SIGNAL_FRAME
-	if (frame->call_frame
-	    && !UNW_DEFAULT_RA(state.regs[retAddrReg], state.dataAlign))
-		frame->call_frame = 0;
-#endif
 	cfa = FRAME_REG(state.cfa.reg, unsigned long) + state.cfa.offs;
 	startLoc = min_t(unsigned long, UNW_SP(frame), cfa);
 	endLoc = max_t(unsigned long, UNW_SP(frame), cfa);
-- 
1.9.1
