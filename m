From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:08 +0530
Subject: [PATCH 10/17] ARC: dw2 unwind: CIE parsing/validation done only once
 at startup
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-11-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

There is only 1 CIE per unwind table and applicable to all FDEs, so
validate it only once. No need to do validate it when prcoessing the FDE
itself.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 336 +++++++++++++++++++++--------------------------
 1 file changed, 153 insertions(+), 183 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 6a09ffa0b697..f2a486d9dac2 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -122,6 +122,13 @@ static struct unwind_table {
 	} core, init;
 	const void *address;
 	unsigned long size;
+	struct cie {
+		unsigned version:8, aug:8, pad:16;
+		uleb128_t codeAlign;
+		sleb128_t dataAlign;
+		int       fde_pointer_type;
+		uleb128_t retAddrReg;
+	} cie;
 	struct eh_frame_header *header;
 	unsigned long hdrsz;
 	struct unwind_table *link;
@@ -140,20 +147,18 @@ struct unwind_item {
 
 struct unwind_state {
 	uleb128_t loc, org;
-	const u8 *cieStart, *cieEnd;
 	uleb128_t codeAlign;
 	sleb128_t dataAlign;
 	struct cfa {
 		uleb128_t reg, offs;
 	} cfa;
 	struct unwind_item regs[ARRAY_SIZE(reg_info)];
-	unsigned stackDepth:8;
-	unsigned version:8;
+	unsigned stackDepth;
 	const u8 *label;
 	const u8 *stack[MAX_STACK_DEPTH];
 };
 
-static const struct cfa badCFA = { ARRAY_SIZE(reg_info), 1 };
+static struct cfa seed_CFA = { ARRAY_SIZE(reg_info), 1 };
 
 static struct unwind_table *find_table(unsigned long pc)
 {
@@ -214,7 +219,7 @@ void __init arc_unwind_init(void)
 
 static const u32 bad_cie, not_fde;
 static const u32 *cie_for_fde(const u32 *fde, const struct unwind_table *);
-static signed fde_pointer_type(const u32 *cie);
+static int cie_validate(const u32 *cie, struct cie *t_cie);
 
 static int cmp_eh_frame_hdr_table_entries(const void *p1, const void *p2)
 {
@@ -245,7 +250,10 @@ static void __init setup_unwind_table(struct unwind_table *table,
 	unsigned long tableSize = table->size, hdrSize;
 	unsigned n;
 	const u32 *fde;
+	int ptrType;
 	struct eh_frame_header *header;
+	int n_cie = 0, len = 0;
+	char cie_orig[64];
 
 	if (table->header)
 		return;
@@ -261,19 +269,26 @@ static void __init setup_unwind_table(struct unwind_table *table,
 	     tableSize > sizeof(*fde) && tableSize - sizeof(*fde) >= *fde;
 	     tableSize -= sizeof(*fde) + *fde, fde += 1 + *fde / sizeof(*fde)) {
 		const u32 *cie = cie_for_fde(fde, table);
-		signed ptrType;
 
-		if (cie == &not_fde)
+		if (cie == &not_fde) {
+			if (n_cie++ == 0) {
+				len = cie_validate(&fde[0], &table->cie);
+				if (!len)
+					panic("Invalid CIE\n");
+
+				memcpy(&cie_orig[0], &fde[0], len);
+			} else {
+				if (memcmp(&fde[0], &cie_orig[0], len) != 0)
+					panic("Multiple CIEs not same\n");
+			}
 			continue;
+		}
 		if (cie == NULL || cie == &bad_cie)
 			return;
-		ptrType = fde_pointer_type(cie);
-		if (ptrType < 0)
-			return;
 
 		ptr = (const u8 *)(fde + 2);
 		if (!read_pointer(&ptr, (const u8 *)(fde + 1) + *fde,
-								ptrType)) {
+								table->cie.fde_pointer_type)) {
 			/* FIXME_Rajesh We have 4 instances of null addresses
 			 * instead of the initial loc addr
 			 * return;
@@ -303,19 +318,17 @@ static void __init setup_unwind_table(struct unwind_table *table,
 
 	BUILD_BUG_ON(offsetof(typeof(*header), table)
 		     % __alignof(typeof(*header->table)));
+
+	ptrType = table->cie.fde_pointer_type;
 	for (fde = table->address, tableSize = table->size, n = 0;
 	     tableSize;
 	     tableSize -= sizeof(*fde) + *fde, fde += 1 + *fde / sizeof(*fde)) {
-		/* const u32 *cie = fde + 1 - fde[1] / sizeof(*fde); */
-		const u32 *cie = (const u32 *)(fde[1]);
-
 		if (fde[1] == 0xffffffff)
 			continue;	/* this is a CIE */
 		ptr = (const u8 *)(fde + 2);
 		header->table[n].start = read_pointer(&ptr,
-						      (const u8 *)(fde + 1) +
-						      *fde,
-						      fde_pointer_type(cie));
+						      (const u8 *)(fde + 1) + *fde,
+						      ptrType);
 		header->table[n].fde = (unsigned long)fde;
 		++n;
 	}
@@ -572,65 +585,6 @@ static unsigned long read_pointer(const u8 **pLoc, const void *end,
 	return value;
 }
 
-static signed fde_pointer_type(const u32 *cie)
-{
-	const u8 *ptr = (const u8 *)(cie + 2);
-	unsigned version = *ptr;
-
-	if (version != 1)
-		return -1;	/* unsupported */
-
-	if (*++ptr) {
-		const char *aug;
-		const u8 *end = (const u8 *)(cie + 1) + *cie;
-		uleb128_t len;
-
-		/* check if augmentation size is first (and thus present) */
-		if (*ptr != 'z')
-			return -1;
-
-		/* check if augmentation string is nul-terminated */
-		aug = (const void *)ptr;
-		ptr = memchr(aug, 0, end - ptr);
-		if (ptr == NULL)
-			return -1;
-
-		++ptr;		/* skip terminator */
-		get_uleb128(&ptr, end);	/* skip code alignment */
-		get_sleb128(&ptr, end);	/* skip data alignment */
-		/* skip return address column */
-		version <= 1 ? (void) ++ptr : (void)get_uleb128(&ptr, end);
-		len = get_uleb128(&ptr, end);	/* augmentation length */
-
-		if (ptr + len < ptr || ptr + len > end)
-			return -1;
-
-		end = ptr + len;
-		while (*++aug) {
-			if (ptr >= end)
-				return -1;
-			switch (*aug) {
-			case 'L':
-				++ptr;
-				break;
-			case 'P':{
-					signed ptrType = *ptr++;
-
-					if (!read_pointer(&ptr, end, ptrType)
-					    || ptr > end)
-						return -1;
-				}
-				break;
-			case 'R':
-				return *ptr;
-			default:
-				return -1;
-			}
-		}
-	}
-	return DW_EH_PE_native | DW_EH_PE_abs;
-}
-
 static int advance_loc(unsigned long delta, struct unwind_state *state, char *str)
 {
 	state->loc += delta * state->codeAlign;
@@ -682,14 +636,6 @@ static int processCFI(const u8 *start, const u8 *end, unsigned long targetLoc,
 	int result = 1;
 	u8 opcode;
 
-	if (start != state->cieStart) {
-		state->loc = state->org;
-		result =
-		    processCFI(state->cieStart, state->cieEnd, 0, ptrType,
-			       state);
-		if (targetLoc == 0 && state->label == NULL)
-			return result;
-	}
 	for (ptr.p8 = start; result && ptr.p8 < end;) {
 		char *str = NULL;
 		switch (*ptr.p8 >> 6) {
@@ -775,7 +721,7 @@ static int processCFI(const u8 *start, const u8 *end, unsigned long targetLoc,
 
 					state->label =
 					    state->stack[state->stackDepth - 1];
-					memcpy(&state->cfa, &badCFA,
+					memcpy(&state->cfa, &seed_CFA,
 					       sizeof(state->cfa));
 					memset(state->regs, 0,
 					       sizeof(state->regs));
@@ -857,12 +803,102 @@ static int processCFI(const u8 *start, const u8 *end, unsigned long targetLoc,
 		targetLoc < state->loc && */  state->label == NULL));
 }
 
+/*
+ * Returns length of CIE (0 if invalid)
+ */
+static int cie_validate(const u32 *cie, struct cie *t_cie)
+{
+	const u8 *ptr = NULL, *end = NULL;
+	u8 version;
+	uleb128_t retAddrReg = 0;
+	int ptrType = DW_EH_PE_native | DW_EH_PE_abs;
+	struct unwind_state state;
+
+	if (cie == NULL)
+		return 0;
+
+	ptr = (const u8 *)(cie + 2);
+	end = (const u8 *)(cie + 1) + *cie;
+	if ((version = *ptr) != 1)
+		return 0;	/* unsupported version */
+
+	t_cie->version = version;
+
+	if (*++ptr) {
+		/* check if augmentation size is first (thus present) */
+		if (*ptr == 'z') {
+			t_cie->aug = 1;
+			while (++ptr < end && *ptr) {
+				switch (*ptr) {
+				/* chk for ignorable or already handled
+				 * nul-terminated augmentation string */
+				case 'L':
+				case 'P':
+				case 'R':
+					continue;
+				case 'S':	/* signal frame */
+					continue;
+				default:
+					break;
+				}
+				break;
+			}
+		}
+		if (ptr >= end || *ptr)
+			return 0;
+	}
+	++ptr;	/* skip terminator */
+
+	t_cie->codeAlign = get_uleb128(&ptr, end);
+	t_cie->dataAlign = get_sleb128(&ptr, end);
+
+	if (t_cie->codeAlign == 0 || t_cie->dataAlign == 0 || ptr >= end)
+		return 0;
+
+	retAddrReg = version <= 1 ? *ptr++ : get_uleb128(&ptr, end);
+	t_cie->retAddrReg = retAddrReg;
+
+	/* skip augmentation data */
+	if (((const char *)(cie + 2))[1] == 'z') {
+		get_uleb128(&ptr, end);  /* augSize */
+
+		if (*ptr++ == 'R')	/* FDE pointer encoding type */
+			ptrType = *ptr;
+	}
+	t_cie->fde_pointer_type = ptrType;
+
+	if (ptr > end
+	    || retAddrReg >= ARRAY_SIZE(reg_info)
+	    || REG_INVALID(retAddrReg)
+	    || reg_info[retAddrReg].width != sizeof(unsigned long))
+		return 0;
+
+	unw_debug("\nDwarf Unwinder setup: CIE Info:\n");
+	unw_debug("code Align: %lu\n", t_cie->codeAlign);
+	unw_debug("data Align: %ld\n", t_cie->dataAlign);
+	unw_debug("Return Address register r%d\n",  (int)t_cie->retAddrReg);
+	unw_debug("FDE pointer type %d\n",  ptrType);
+	unw_debug("CFI Instructions for CIE:\n");
+
+	memset(&state, sizeof(state), 0);
+
+	/* CIE has rules for Default CFA */
+	if (!processCFI(ptr, end, 0, ptrType, &state)
+	    || state.cfa.reg >= ARRAY_SIZE(reg_info)
+	    || state.cfa.offs % sizeof(unsigned long))
+		return 0;
+
+	memcpy(&seed_CFA, &state.cfa, sizeof(state.cfa));
+
+	return end - (const u8 *)cie;
+}
+
 /* Unwind to previous to frame.  Returns 0 if successful, negative
  * number in case of an error. */
 int arc_unwind(struct unwind_frame_info *frame)
 {
 #define FRAME_REG(r, t) (((t *)frame)[reg_info[r].offs])
-	const u32 *fde = NULL, *cie = NULL;
+	const u32 *fde = NULL;
 	const u8 *ptr = NULL, *end = NULL;
 	unsigned long pc = UNW_PC(frame);
 	unsigned long startLoc = 0, endLoc = 0, cfa;
@@ -920,107 +956,41 @@ int arc_unwind(struct unwind_frame_info *frame)
 	else
 		return -EINVAL;
 
-	if (fde != NULL) {
-		cie = cie_for_fde(fde, table);
-		ptr = (const u8 *)(fde + 2);
-		if (cie != NULL
-		    && cie != &bad_cie
-		    && cie != &not_fde
-		    && (ptrType = fde_pointer_type(cie)) >= 0
-		    && read_pointer(&ptr, (const u8 *)(fde + 1) + *fde, ptrType) == startLoc) {
-			if (!(ptrType & DW_EH_PE_indirect))
-				ptrType &= DW_EH_PE_FORM | DW_EH_PE_signed;
-				endLoc = startLoc + read_pointer(&ptr, (const u8 *)(fde + 1) + *fde, ptrType);
-			if (pc >= endLoc) {
-				fde = NULL;
-				cie = NULL;
-			}
-		} else {
-			fde = NULL;
-			cie = NULL;
-		}
-	}
-	if (cie != NULL) {
-		memset(&state, 0, sizeof(state));
-		state.cieEnd = ptr;	/* keep here temporarily */
-		ptr = (const u8 *)(cie + 2);
-		end = (const u8 *)(cie + 1) + *cie;
-		if ((state.version = *ptr) != 1)
-			cie = NULL;	/* unsupported version */
-		else if (*++ptr) {
-			/* check if augmentation size is first (thus present) */
-			if (*ptr == 'z') {
-				while (++ptr < end && *ptr) {
-					switch (*ptr) {
-					/* chk for ignorable or already handled
-					 * nul-terminated augmentation string */
-					case 'L':
-					case 'P':
-					case 'R':
-						continue;
-					case 'S':
-						/* signal frame not handled */
-						continue;
-					default:
-						break;
-					}
-					break;
-				}
-			}
-			if (ptr >= end || *ptr)
-				cie = NULL;
-		}
-		++ptr;
-	}
-	if (cie != NULL) {
-		/* get code aligment factor */
-		state.codeAlign = get_uleb128(&ptr, end);
-		/* get data aligment factor */
-		state.dataAlign = get_sleb128(&ptr, end);
-		if (state.codeAlign == 0 || state.dataAlign == 0 || ptr >= end)
-			cie = NULL;
-		else {
-			retAddrReg =
-			    state.version <= 1 ? *ptr++ : get_uleb128(&ptr,
-								      end);
-			unw_debug("CIE Frame Info:\n");
-			unw_debug("return Address register 0x%lx\n",
-				  retAddrReg);
-			unw_debug("data Align: %ld\n", state.dataAlign);
-			unw_debug("code Align: %lu\n", state.codeAlign);
-			/* skip augmentation */
-			if (((const char *)(cie + 2))[1] == 'z') {
-				uleb128_t augSize = get_uleb128(&ptr, end);
-
-				ptr += augSize;
-			}
-			if (ptr > end || retAddrReg >= ARRAY_SIZE(reg_info)
-			    || REG_INVALID(retAddrReg)
-			    || reg_info[retAddrReg].width !=
-			    sizeof(unsigned long))
-				cie = NULL;
-		}
+	memset(&state, 0, sizeof(state));
+	ptr = (const u8 *)(fde + 2);
+	end = (const u8 *)(fde + 1) + *fde;
+
+	ptrType = table->cie.fde_pointer_type;
+	if (read_pointer(&ptr, end, ptrType) != startLoc)
+		return -EINVAL;
+
+	if (!(ptrType & DW_EH_PE_indirect))
+		ptrType &= DW_EH_PE_FORM | DW_EH_PE_signed;
+
+	endLoc = startLoc + read_pointer(&ptr, end, ptrType);
+
+	/* For symbols not present, this is mostly hit (not startLoc check above) */
+	if (pc >= endLoc) {
+		unw_debug("Unwindo info missing for PC %lx: {%lx,%lx}\n",
+			  pc, startLoc, endLoc);
+		return -EINVAL;
 	}
-	if (cie != NULL) {
-		state.cieStart = ptr;
-		ptr = state.cieEnd;
-		state.cieEnd = end;
-		end = (const u8 *)(fde + 1) + *fde;
-		/* skip augmentation */
-		if (((const char *)(cie + 2))[1] == 'z') {
-			uleb128_t augSize = get_uleb128(&ptr, end);
-
-			if ((ptr += augSize) > end)
-				fde = NULL;
-		}
+
+	if (table->cie.aug) {
+		uleb128_t augSize = get_uleb128(&ptr, end);
+
+		if ((ptr += augSize) > end)
+			return -EINVAL;
 	}
-	if (cie == NULL || fde == NULL)
-		return -ENXIO;
 
-	state.org = startLoc;
-	memcpy(&state.cfa, &badCFA, sizeof(state.cfa));
+	state.org = state.loc = startLoc;
+	memcpy(&state.cfa, &seed_CFA, sizeof(state.cfa));
+	state.codeAlign = table->cie.codeAlign;
+	state.dataAlign = table->cie.dataAlign;
+
+	retAddrReg =  table->cie.retAddrReg;
 
-	unw_debug("\nProcess CFA\n");
+	unw_debug("\nProcess FDE:\n");
 
 	/* process instructions
 	 * For ARC, we optimize by having blink(retAddrReg) with
-- 
1.9.1
