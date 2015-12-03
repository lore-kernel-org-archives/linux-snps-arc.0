From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:03 +0530
Subject: [PATCH 05/17] ARC: dw2 unwind: Better printing
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-6-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 123 +++++++++++++++++------------------------------
 1 file changed, 45 insertions(+), 78 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 0993a81e112b..2bb3c1c048bb 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -629,40 +629,40 @@ static signed fde_pointer_type(const u32 *cie)
 	return DW_EH_PE_native | DW_EH_PE_abs;
 }
 
-static int advance_loc(unsigned long delta, struct unwind_state *state)
+static int advance_loc(unsigned long delta, struct unwind_state *state, char *str)
 {
 	state->loc += delta * state->codeAlign;
 
 	/* FIXME_Rajesh: Probably we are defining for the initial range as well;
 	   return delta > 0;
 	 */
-	unw_debug("delta %3lu => loc 0x%lx: ", delta, state->loc);
+	unw_debug("%sdelta %3lu => loc 0x%lx\n", str, delta, state->loc);
 	return 1;
 }
 
 static void set_rule(uleb128_t reg, enum item_location where, uleb128_t value,
-		     struct unwind_state *state)
+		     struct unwind_state *state, char *str)
 {
 	if (reg < ARRAY_SIZE(state->regs)) {
 		state->regs[reg].where = where;
 		state->regs[reg].value = value;
 
 #ifdef UNWIND_DEBUG
-		unw_debug("r%lu: ", reg);
 		switch (where) {
 		case Nowhere:
-			unw_debug("s ");
+			unw_debug("%sr%lu: s \n", str, reg);
 			break;
 		case Memory:
-			unw_debug("c(%lu) ", value);
+			unw_debug("%sr%lu: c(%lu) \n", str, reg, value);
 			break;
 		case Register:
-			unw_debug("r(%lu) ", value);
+			unw_debug("%sr%lu: r(%lu) \n", str, reg, value);
 			break;
 		case Value:
-			unw_debug("v(%lu) ", value);
+			unw_debug("%sr%lu: v(%lu) \n", str, reg, value);
 			break;
 		default:
+			unw_debug("%sr%lu: ???\n", str, reg);
 			break;
 		}
 #endif
@@ -689,6 +689,7 @@ static int processCFI(const u8 *start, const u8 *end, unsigned long targetLoc,
 			return result;
 	}
 	for (ptr.p8 = start; result && ptr.p8 < end;) {
+		char *str = NULL;
 		switch (*ptr.p8 >> 6) {
 			uleb128_t value;
 
@@ -707,59 +708,52 @@ static int processCFI(const u8 *start, const u8 *end, unsigned long targetLoc,
 				unw_debug("cfa_set_loc: 0x%lx ", state->loc);
 				break;
 			case DW_CFA_advance_loc1:
-				unw_debug("\ncfa advance loc1:");
+				str = "cfa advance loc1:";
 				result = ptr.p8 < end
-				    && advance_loc(*ptr.p8++, state);
+				    && advance_loc(*ptr.p8++, state, str);
 				break;
 			case DW_CFA_advance_loc2:
 				value = *ptr.p8++;
 				value += *ptr.p8++ << 8;
-				unw_debug("\ncfa advance loc2:");
+				str = "cfa advance loc2:";
 				result = ptr.p8 <= end + 2
-				    /* && advance_loc(*ptr.p16++, state); */
-				    && advance_loc(value, state);
+				    /* && advance_loc(*ptr.p16++, state, str); */
+				    && advance_loc(value, state, str);
 				break;
 			case DW_CFA_advance_loc4:
-				unw_debug("\ncfa advance loc4:");
+				str = "cfa advance loc4:";
 				result = ptr.p8 <= end + 4
-				    && advance_loc(*ptr.p32++, state);
+				    && advance_loc(*ptr.p32++, state, str);
 				break;
 			case DW_CFA_offset_extended:
 				value = get_uleb128(&ptr.p8, end);
-				unw_debug("cfa_offset_extended: ");
-				set_rule(value, Memory,
-					 get_uleb128(&ptr.p8, end), state);
+				str = "cfa_offset_extended: ";
+				set_rule(value, Memory, get_uleb128(&ptr.p8, end), state, str);
 				break;
 			case DW_CFA_val_offset:
 				value = get_uleb128(&ptr.p8, end);
-				set_rule(value, Value,
-					 get_uleb128(&ptr.p8, end), state);
+				set_rule(value, Value, get_uleb128(&ptr.p8, end), state, str);
 				break;
 			case DW_CFA_offset_extended_sf:
 				value = get_uleb128(&ptr.p8, end);
-				set_rule(value, Memory,
-					 get_sleb128(&ptr.p8, end), state);
+				set_rule(value, Memory, get_sleb128(&ptr.p8, end), state, str);
 				break;
 			case DW_CFA_val_offset_sf:
 				value = get_uleb128(&ptr.p8, end);
-				set_rule(value, Value,
-					 get_sleb128(&ptr.p8, end), state);
+				set_rule(value, Value, get_sleb128(&ptr.p8, end), state, str);
 				break;
 			case DW_CFA_restore_extended:
-				unw_debug("cfa_restore_extended: ");
+				str = "cfa_restore_extended: ";
 			case DW_CFA_undefined:
-				unw_debug("cfa_undefined: ");
+				str = "cfa_undefined: ";
 			case DW_CFA_same_value:
-				unw_debug("cfa_same_value: ");
-				set_rule(get_uleb128(&ptr.p8, end), Nowhere, 0,
-					 state);
+				str = "cfa_same_value: ";
+				set_rule(get_uleb128(&ptr.p8, end), Nowhere, 0, state, str);
 				break;
 			case DW_CFA_register:
-				unw_debug("cfa_register: ");
+				str = "cfa_register: ";
 				value = get_uleb128(&ptr.p8, end);
-				set_rule(value,
-					 Register,
-					 get_uleb128(&ptr.p8, end), state);
+				set_rule(value, Register, get_uleb128(&ptr.p8, end), state, str);
 				break;
 			case DW_CFA_remember_state:
 				unw_debug("cfa_remember_state: ");
@@ -798,8 +792,8 @@ static int processCFI(const u8 *start, const u8 *end, unsigned long targetLoc,
 				/*nobreak*/
 			case DW_CFA_def_cfa_offset:
 				state->cfa.offs = get_uleb128(&ptr.p8, end);
-				unw_debug("cfa_def_cfa_offset: 0x%lx ",
-					  state->cfa.offs);
+				unw_debug("cfa_def_cfa_offset: r%ld: %ld\n",
+					  state->cfa.reg, state->cfa.offs);
 				break;
 			case DW_CFA_def_cfa_sf:
 				state->cfa.reg = get_uleb128(&ptr.p8, end);
@@ -824,7 +818,7 @@ static int processCFI(const u8 *start, const u8 *end, unsigned long targetLoc,
 					 Memory,
 					 (uleb128_t) 0 - get_uleb128(&ptr.p8,
 								     end),
-					 state);
+					 state, str);
 				break;
 			case DW_CFA_GNU_window_save:
 			default:
@@ -834,18 +828,17 @@ static int processCFI(const u8 *start, const u8 *end, unsigned long targetLoc,
 			}
 			break;
 		case 1:
-			unw_debug("\ncfa_adv_loc: ");
-			result = advance_loc(*ptr.p8++ & 0x3f, state);
+			str = "cfa_adv_loc: ";
+			result = advance_loc(*ptr.p8++ & 0x3f, state, str);
 			break;
 		case 2:
-			unw_debug("cfa_offset: ");
+			str = "cfa_offset: ";
 			value = *ptr.p8++ & 0x3f;
-			set_rule(value, Memory, get_uleb128(&ptr.p8, end),
-				 state);
+			set_rule(value, Memory, get_uleb128(&ptr.p8, end), state, str);
 			break;
 		case 3:
-			unw_debug("cfa_restore: ");
-			set_rule(*ptr.p8++ & 0x3f, Nowhere, 0, state);
+			str = "cfa_restore: ";
+			set_rule(*ptr.p8++ & 0x3f, Nowhere, 0, state, str);
 			break;
 		}
 
@@ -879,15 +872,16 @@ int arc_unwind(struct unwind_frame_info *frame)
 	unsigned long *fptr;
 	unsigned long addr;
 
-	unw_debug("\n\nUNWIND FRAME:\n");
-	unw_debug("PC: 0x%lx BLINK: 0x%lx, SP: 0x%lx, FP: 0x%x\n",
-		  UNW_PC(frame), UNW_BLINK(frame), UNW_SP(frame),
-		  UNW_FP(frame));
+	unw_debug("\nUNWIND FRAME: -------------------------------------\n");
+	unw_debug("PC\t\t: 0x%lx %pS\nr31 [BLINK]\t: 0x%lx %pS\nr28 [SP]\t: 0x%lx\nr27 [FP]\t: 0x%lx\n",
+		  UNW_PC(frame), (void *)UNW_PC(frame),
+		  UNW_BLINK(frame), (void *)UNW_BLINK(frame),
+		  UNW_SP(frame), UNW_FP(frame));
 
 	if (UNW_PC(frame) == 0)
 		return -EINVAL;
 
-#ifdef UNWIND_DEBUG
+#ifdef UNWIND_DEBUG0
 	{
 		unsigned long *sptr = (unsigned long *)UNW_SP(frame);
 		unw_debug("\nStack Dump:\n");
@@ -1063,7 +1057,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 	state.org = startLoc;
 	memcpy(&state.cfa, &badCFA, sizeof(state.cfa));
 
-	unw_debug("\nProcess instructions\n");
+	unw_debug("\nProcess CFA\n");
 
 	/* process instructions
 	 * For ARC, we optimize by having blink(retAddrReg) with
@@ -1078,33 +1072,6 @@ int arc_unwind(struct unwind_frame_info *frame)
 	    || state.cfa.offs % sizeof(unsigned long))
 		return -EIO;
 
-#ifdef UNWIND_DEBUG
-	unw_debug("\n");
-
-	unw_debug("\nRegister State Based on the rules parsed from FDE:\n");
-	for (i = 0; i < ARRAY_SIZE(state.regs); ++i) {
-
-		if (REG_INVALID(i))
-			continue;
-
-		switch (state.regs[i].where) {
-		case Nowhere:
-			break;
-		case Memory:
-			unw_debug(" r%d: c(%lu),", i, state.regs[i].value);
-			break;
-		case Register:
-			unw_debug(" r%d: r(%lu),", i, state.regs[i].value);
-			break;
-		case Value:
-			unw_debug(" r%d: v(%lu),", i, state.regs[i].value);
-			break;
-		}
-	}
-
-	unw_debug("\n");
-#endif
-
 	cfa = FRAME_REG(state.cfa.reg, unsigned long) + state.cfa.offs;
 	startLoc = min_t(unsigned long, UNW_SP(frame), cfa);
 	endLoc = max_t(unsigned long, UNW_SP(frame), cfa);
@@ -1113,7 +1080,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 		endLoc = max(STACK_LIMIT(cfa), cfa);
 	}
 
-	unw_debug("\nCFA reg: 0x%lx, offset: 0x%lx =>  0x%lx\n",
+	unw_debug("\nCFA reg: r%ld, off: %ld => [SP] 0x%lx\n",
 		  state.cfa.reg, state.cfa.offs, cfa);
 
 	for (i = 0; i < ARRAY_SIZE(state.regs); ++i) {
@@ -1232,7 +1199,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 
 			break;
 		}
-		unw_debug("r%d: 0x%lx ", i, *fptr);
+		unw_debug("r%d: 0x%lx\n", i, *fptr);
 	}
 
 	return 0;
-- 
1.9.1
