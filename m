From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:14 +0530
Subject: [PATCH 16/17] ARC: dw2 unwind: skip regs not updated
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-17-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index e02d974ea789..d5ffb4a78104 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -142,13 +142,14 @@ struct unwind_item {
 
 struct unwind_state {
 	uleb128_t loc, org;
+	uleb128_t first_reg;
 	uleb128_t codeAlign;
 	sleb128_t dataAlign;
 	struct cfa {
 		uleb128_t reg, offs;
 	} cfa;
 	struct unwind_item regs[ARRAY_SIZE(reg_info)];
-	unsigned stackDepth:8, has_cfa_register:8;
+	unsigned stackDepth:8, has_cfa_register:8, pad:16;
 	const u8 *label;
 	const u8 *stack[MAX_STACK_DEPTH];
 };
@@ -597,6 +598,7 @@ static void set_rule(uleb128_t reg, enum item_location where, uleb128_t value,
 	if (reg < ARRAY_SIZE(state->regs)) {
 		state->regs[reg].where = where;
 		state->regs[reg].value = value;
+		state->first_reg = min(reg, state->first_reg);
 
 #ifdef UNWIND_DEBUG
 		switch (where) {
@@ -979,6 +981,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 			goto bad_unw;
 	}
 
+	state.first_reg = 13;
 	state.org = state.loc = startLoc;
 	memcpy(&state.cfa, &seed_CFA, sizeof(state.cfa));
 	state.codeAlign = table->cie.codeAlign;
@@ -1032,9 +1035,9 @@ int arc_unwind(struct unwind_frame_info *frame)
 		}
 	}
 
-	unw_debug("\nRegister state after evaluation with realtime Stack:\n");
+	unw_debug("\nRegister state after evaluation with realtime Stack @ %ld :\n", state.first_reg);
 	fptr = (unsigned long *)(&frame->regs);
-	for (i = 0; i < ARRAY_SIZE(state.regs); ++i, fptr++) {
+	for (i = state.first_reg; i < ARRAY_SIZE(state.regs); ++i, fptr++) {
 
 		switch (state.regs[i].where) {
 		case Nowhere:
-- 
1.9.1
