From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:10 +0530
Subject: [PATCH 12/17] ARC: dw2 unwind: Elide a loop if DW_CFA_register not
 present
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-13-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index b1a520afcbcb..6eb377c102c6 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -149,7 +149,7 @@ struct unwind_state {
 		uleb128_t reg, offs;
 	} cfa;
 	struct unwind_item regs[ARRAY_SIZE(reg_info)];
-	unsigned stackDepth;
+	unsigned stackDepth:8, has_cfa_register:8;
 	const u8 *label;
 	const u8 *stack[MAX_STACK_DEPTH];
 };
@@ -697,6 +697,7 @@ static int processCFI(const u8 *start, const u8 *end, unsigned long targetLoc,
 			case DW_CFA_register:
 				str = "cfa_register: ";
 				value = get_uleb128(&ptr.p8, end);
+				state->has_cfa_register = 1;
 				set_rule(value, Register, get_uleb128(&ptr.p8, end), state, str);
 				break;
 			case DW_CFA_remember_state:
@@ -1010,11 +1011,18 @@ int arc_unwind(struct unwind_frame_info *frame)
 	unw_debug("\nCFA reg: r%ld, off: %ld => [SP] 0x%lx\n",
 		  state.cfa.reg, state.cfa.offs, cfa);
 
-	for (i = 0; i < ARRAY_SIZE(state.regs); ++i) {
-		switch (state.regs[i].where) {
-		default:
-			break;
-		case Register:
+	/*
+	 * For DW_CFA_register instruction, save registers initial state
+	 * Note that a seperate pass is needed (vs. doing this in main loop below)
+	 * to capture state of those regs at time of entry into function since
+	 * the main loop below can possibly clobber them due to CFA ops of
+	 * function being processed
+	 *
+	 * Since ARC gcc doesn't seem to generate those (ABI thing ?) try to
+	 * optimize out the loop
+	 */
+	for (i = 0; state.has_cfa_register && i < ARRAY_SIZE(state.regs); ++i) {
+		if (state.regs[i].where == Register) {
 			if (state.regs[i].value >= ARRAY_SIZE(reg_info))
 				return -EIO;
 			switch (reg_info[state.regs[i].value].width) {
@@ -1039,7 +1047,6 @@ int arc_unwind(struct unwind_frame_info *frame)
 			default:
 				return -EIO;
 			}
-			break;
 		}
 	}
 
-- 
1.9.1
