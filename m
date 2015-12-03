From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:09 +0530
Subject: [PATCH 11/17] ARC: dw2 unwind: Elide REG_INVALID check
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-12-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

REG_INVALID checks if reg_info[*].width is zero, which is compile time
contant set to NON zero. No point in checking it.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index f2a486d9dac2..b1a520afcbcb 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -48,10 +48,6 @@ static const struct {
 	unsigned width:BITS_PER_LONG / 2;
 } reg_info[] = { UNW_REGISTER_INFO };
 
-#ifndef REG_INVALID
-#define REG_INVALID(r) (reg_info[r].width == 0)
-#endif
-
 #define DW_CFA_nop                          0x00
 #define DW_CFA_set_loc                      0x01
 #define DW_CFA_advance_loc1                 0x02
@@ -868,9 +864,7 @@ static int cie_validate(const u32 *cie, struct cie *t_cie)
 	t_cie->fde_pointer_type = ptrType;
 
 	if (ptr > end
-	    || retAddrReg >= ARRAY_SIZE(reg_info)
-	    || REG_INVALID(retAddrReg)
-	    || reg_info[retAddrReg].width != sizeof(unsigned long))
+	    || retAddrReg >= ARRAY_SIZE(reg_info))
 		return 0;
 
 	unw_debug("\nDwarf Unwinder setup: CIE Info:\n");
@@ -1017,19 +1011,11 @@ int arc_unwind(struct unwind_frame_info *frame)
 		  state.cfa.reg, state.cfa.offs, cfa);
 
 	for (i = 0; i < ARRAY_SIZE(state.regs); ++i) {
-		if (REG_INVALID(i)) {
-			if (state.regs[i].where == Nowhere)
-				continue;
-			return -EIO;
-		}
 		switch (state.regs[i].where) {
 		default:
 			break;
 		case Register:
-			if (state.regs[i].value >= ARRAY_SIZE(reg_info)
-			    || REG_INVALID(state.regs[i].value)
-			    || reg_info[i].width >
-			    reg_info[state.regs[i].value].width)
+			if (state.regs[i].value >= ARRAY_SIZE(reg_info))
 				return -EIO;
 			switch (reg_info[state.regs[i].value].width) {
 			case sizeof(u8):
@@ -1061,8 +1047,6 @@ int arc_unwind(struct unwind_frame_info *frame)
 	fptr = (unsigned long *)(&frame->regs);
 	for (i = 0; i < ARRAY_SIZE(state.regs); ++i, fptr++) {
 
-		if (REG_INVALID(i))
-			continue;
 		switch (state.regs[i].where) {
 		case Nowhere:
 			if (reg_info[i].width != sizeof(UNW_SP(frame))
-- 
1.9.1
