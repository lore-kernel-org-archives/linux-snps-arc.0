From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:13 +0530
Subject: [PATCH 15/17] ARC: dw2 unwind: Single exit point for instrumentation
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-16-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 4f739716f908..e02d974ea789 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -904,6 +904,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 	unsigned long *fptr;
 	unsigned long addr;
 	struct eh_frame_header *hdr;
+	int ret = -EINVAL;
 
 	unw_debug("\nUNWIND FRAME: -------------------------------------\n");
 	unw_debug("PC\t\t: 0x%lx %pS\nr31 [BLINK]\t: 0x%lx %pS\nr28 [SP]\t: 0x%lx\nr27 [FP]\t: 0x%lx\n",
@@ -912,7 +913,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 		  UNW_SP(frame), UNW_FP(frame));
 
 	if (UNW_PC(frame) == 0)
-		return -EINVAL;
+		goto bad_unw;
 
 #ifdef UNWIND_DEBUG0
 	{
@@ -926,11 +927,11 @@ int arc_unwind(struct unwind_frame_info *frame)
 
 	table = find_table(pc);
 	if (table == NULL)
-		return -EINVAL;
+		goto bad_unw;
 
 	hdr = table->header;
 	if (hdr == NULL)
-		return -EINVAL;
+		goto bad_unw;
 
 	s = i = 0;
 	e = hdr->fde_count - 1;
@@ -948,7 +949,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 	if (pc >= startLoc)
 		fde = (u32 *)hdr->table[i].fde;
 	else
-		return -EINVAL;
+		goto bad_unw;
 
 	memset(&state, 0, sizeof(state));
 	ptr = (const u8 *)(fde + 2);
@@ -956,7 +957,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 
 	ptrType = table->cie.fde_pointer_type;
 	if (read_pointer(&ptr, end, ptrType) != startLoc)
-		return -EINVAL;
+		goto bad_unw;
 
 	if (!(ptrType & DW_EH_PE_indirect))
 		ptrType &= DW_EH_PE_FORM | DW_EH_PE_signed;
@@ -967,14 +968,15 @@ int arc_unwind(struct unwind_frame_info *frame)
 	if (pc >= endLoc) {
 		unw_debug("Unwindo info missing for PC %lx: {%lx,%lx}\n",
 			  pc, startLoc, endLoc);
-		return -EINVAL;
+		ret = -ENOENT;
+		goto bad_unw;
 	}
 
 	if (table->cie.aug) {
 		uleb128_t augSize = get_uleb128(&ptr, end);
 
 		if ((ptr += augSize) > end)
-			return -EINVAL;
+			goto bad_unw;
 	}
 
 	state.org = state.loc = startLoc;
@@ -995,8 +997,10 @@ int arc_unwind(struct unwind_frame_info *frame)
 	    || state.loc > endLoc
 /*	   || state.regs[retAddrReg].where == Nowhere */
 	    || state.cfa.reg >= ARRAY_SIZE(reg_info)
-	    || state.cfa.offs % sizeof(unsigned long))
-		return -EIO;
+	    || state.cfa.offs % sizeof(unsigned long)) {
+		ret = -EIO;
+		goto bad_unw;
+	}
 
 	cfa = FRAME_REG(state.cfa.reg, unsigned long) + state.cfa.offs;
 	startLoc = min_t(unsigned long, UNW_SP(frame), cfa);
@@ -1022,7 +1026,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 	for (i = 0; state.has_cfa_register && i < ARRAY_SIZE(state.regs); ++i) {
 		if (state.regs[i].where == Register) {
 			if (state.regs[i].value >= ARRAY_SIZE(reg_info))
-				return -EIO;
+				goto bad_unw;
 
 			state.regs[i].value = FRAME_REG(state.regs[i].value, unsigned long);
 		}
@@ -1054,7 +1058,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 			    || addr < startLoc
 			    || addr + sizeof(unsigned long) < addr
 			    || addr + sizeof(unsigned long) > endLoc)
-					return -EIO;
+					goto bad_unw;
 
 			FRAME_REG(i, unsigned long) = *(unsigned long *)addr;
 			break;
@@ -1062,7 +1066,10 @@ int arc_unwind(struct unwind_frame_info *frame)
 		unw_debug("r%d: 0x%lx\n", i, *fptr);
 	}
 
-	return 0;
+	ret = 0;
+bad_unw:
+
+	return ret;
 #undef FRAME_REG
 }
 EXPORT_SYMBOL(arc_unwind);
-- 
1.9.1
