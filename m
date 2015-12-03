From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:05 +0530
Subject: [PATCH 07/17] ARC: dw2 unwind: Refactor the FDE lookup table
 (eh_frame_header) code
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-8-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

 - Reduce 1 level of indenatation
 - Use struct members to identify what's going on !
 - Nothing semantical

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 175 ++++++++++++++++++++++-------------------------
 1 file changed, 83 insertions(+), 92 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index f57a0d50185c..9f5ed6873c52 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -101,6 +101,20 @@ static const struct {
 typedef unsigned long uleb128_t;
 typedef signed long sleb128_t;
 
+struct eh_frame_hdr_table_entry {
+	unsigned long start, fde;
+};
+
+struct eh_frame_header {
+	u8 version;
+	u8 eh_frame_ptr_enc;
+	u8 fde_count_enc;
+	u8 table_enc;
+	unsigned long eh_frame_ptr;
+	unsigned int fde_count;
+	struct eh_frame_hdr_table_entry table[];
+} __attribute__ ((__packed__));
+
 static struct unwind_table {
 	struct {
 		unsigned long pc;
@@ -108,7 +122,7 @@ static struct unwind_table {
 	} core, init;
 	const void *address;
 	unsigned long size;
-	const unsigned char *header;
+	struct eh_frame_header *header;
 	unsigned long hdrsz;
 	struct unwind_table *link;
 	const char *name;
@@ -185,7 +199,7 @@ static void init_unwind_table(struct unwind_table *table, const char *name,
 
 	table->hdrsz = header_size;
 	smp_wmb();
-	table->header = header_start;
+	table->header = (struct eh_frame_header *)header_start;
 	table->link = NULL;
 	table->name = name;
 }
@@ -202,10 +216,6 @@ static const u32 bad_cie, not_fde;
 static const u32 *cie_for_fde(const u32 *fde, const struct unwind_table *);
 static signed fde_pointer_type(const u32 *cie);
 
-struct eh_frame_hdr_table_entry {
-	unsigned long start, fde;
-};
-
 static int cmp_eh_frame_hdr_table_entries(const void *p1, const void *p2)
 {
 	const struct eh_frame_hdr_table_entry *e1 = p1;
@@ -235,15 +245,7 @@ static void __init setup_unwind_table(struct unwind_table *table,
 	unsigned long tableSize = table->size, hdrSize;
 	unsigned n;
 	const u32 *fde;
-	struct {
-		u8 version;
-		u8 eh_frame_ptr_enc;
-		u8 fde_count_enc;
-		u8 table_enc;
-		unsigned long eh_frame_ptr;
-		unsigned int fde_count;
-		struct eh_frame_hdr_table_entry table[];
-	} __attribute__ ((__packed__)) *header;
+	struct eh_frame_header *header;
 
 	if (table->header)
 		return;
@@ -326,7 +328,7 @@ static void __init setup_unwind_table(struct unwind_table *table,
 
 	table->hdrsz = hdrSize;
 	smp_wmb();
-	table->header = (const void *)header;
+	table->header = header;
 }
 
 static void *__init balloc(unsigned long sz)
@@ -871,6 +873,8 @@ int arc_unwind(struct unwind_frame_info *frame)
 	struct unwind_state state;
 	unsigned long *fptr;
 	unsigned long addr;
+	struct eh_frame_header *hdr;
+	unsigned long hdrEntrySz;
 
 	unw_debug("\nUNWIND FRAME: -------------------------------------\n");
 	unw_debug("PC\t\t: 0x%lx %pS\nr31 [BLINK]\t: 0x%lx %pS\nr28 [SP]\t: 0x%lx\nr27 [FP]\t: 0x%lx\n",
@@ -892,88 +896,75 @@ int arc_unwind(struct unwind_frame_info *frame)
 #endif
 
 	table = find_table(pc);
-	if (table != NULL) {
-		const u8 *hdr = table->header;
-		unsigned long tableSize;
-
-		smp_rmb();
-		if (hdr && hdr[0] == 1) {
-			switch (hdr[3] & DW_EH_PE_FORM) {
-			case DW_EH_PE_native:
-				tableSize = sizeof(unsigned long);
-				break;
-			case DW_EH_PE_data2:
-				tableSize = 2;
-				break;
-			case DW_EH_PE_data4:
-				tableSize = 4;
-				break;
-			case DW_EH_PE_data8:
-				tableSize = 8;
-				break;
-			default:
-				tableSize = 0;
-				break;
-			}
-			ptr = hdr + 4;
-			end = hdr + table->hdrsz;
-			if (tableSize && read_pointer(&ptr, end, hdr[1])
-			    == (unsigned long)table->address
-			    && (i = read_pointer(&ptr, end, hdr[2])) > 0
-			    && i == (end - ptr) / (2 * tableSize)
-			    && !((end - ptr) % (2 * tableSize))) {
-				do {
-					const u8 *cur =
-					    ptr + (i / 2) * (2 * tableSize);
-
-					startLoc = read_pointer(&cur,
-								cur + tableSize,
-								hdr[3]);
-					if (pc < startLoc)
-						i /= 2;
-					else {
-						ptr = cur - tableSize;
-						i = (i + 1) / 2;
-					}
-				} while (startLoc && i > 1);
-				if (i == 1
-				    && (startLoc = read_pointer(&ptr,
-								ptr + tableSize,
-								hdr[3])) != 0
-				    && pc >= startLoc)
-					fde = (void *)read_pointer(&ptr,
-								   ptr +
-								   tableSize,
-								   hdr[3]);
-			}
+	if (table == NULL)
+		return -EINVAL;
+
+	hdr = table->header;
+
+	smp_rmb();
+	if (hdr && hdr->version == 1) {
+		switch (hdr->table_enc & DW_EH_PE_FORM) {
+		case DW_EH_PE_native:
+			hdrEntrySz = sizeof(unsigned long);
+			break;
+		case DW_EH_PE_data2:
+			hdrEntrySz = 2;
+			break;
+		case DW_EH_PE_data4:
+			hdrEntrySz = 4;
+			break;
+		case DW_EH_PE_data8:
+			hdrEntrySz = 8;
+			break;
+		default:
+			hdrEntrySz = 0;
+			break;
 		}
 
-		if (fde != NULL) {
-			cie = cie_for_fde(fde, table);
-			ptr = (const u8 *)(fde + 2);
-			if (cie != NULL
-			    && cie != &bad_cie
-			    && cie != &not_fde
-			    && (ptrType = fde_pointer_type(cie)) >= 0
-			    && read_pointer(&ptr,
-					    (const u8 *)(fde + 1) + *fde,
-					    ptrType) == startLoc) {
-				if (!(ptrType & DW_EH_PE_indirect))
-					ptrType &=
-					    DW_EH_PE_FORM | DW_EH_PE_signed;
-				endLoc =
-				    startLoc + read_pointer(&ptr,
-							    (const u8 *)(fde +
-									 1) +
-							    *fde, ptrType);
-				if (pc >= endLoc) {
-					fde = NULL;
-					cie = NULL;
+		ptr = (const u8*)(hdr->eh_frame_ptr);
+		end = (const u8*)(hdr) + table->hdrsz;
+		if (hdrEntrySz
+		    && read_pointer(&ptr, end, hdr->eh_frame_ptr_enc) /* eh_frame_ptr */
+		    == (unsigned long)table->address
+		    && (i = read_pointer(&ptr, end, hdr->fde_count_enc)) > 0 /* fde_count */
+		    && i == (end - ptr) / (2 * hdrEntrySz)
+		    && !((end - ptr) % (2 * hdrEntrySz))) {
+			do {
+				const u8 *cur = ptr + (i / 2) * (2 * hdrEntrySz);
+
+				startLoc = read_pointer(&cur, cur + hdrEntrySz, hdr->table_enc);
+				if (pc < startLoc)
+					i /= 2;
+				else {
+					ptr = cur - hdrEntrySz;
+					i = (i + 1) / 2;
 				}
-			} else {
+			} while (startLoc && i > 1);
+			if (i == 1
+			    && (startLoc = read_pointer(&ptr, ptr + hdrEntrySz, hdr->table_enc)) != 0
+			    && pc >= startLoc)
+				fde = (void *)read_pointer(&ptr, ptr + hdrEntrySz, hdr->table_enc);
+		}
+	}
+
+	if (fde != NULL) {
+		cie = cie_for_fde(fde, table);
+		ptr = (const u8 *)(fde + 2);
+		if (cie != NULL
+		    && cie != &bad_cie
+		    && cie != &not_fde
+		    && (ptrType = fde_pointer_type(cie)) >= 0
+		    && read_pointer(&ptr, (const u8 *)(fde + 1) + *fde, ptrType) == startLoc) {
+			if (!(ptrType & DW_EH_PE_indirect))
+				ptrType &= DW_EH_PE_FORM | DW_EH_PE_signed;
+				endLoc = startLoc + read_pointer(&ptr, (const u8 *)(fde + 1) + *fde, ptrType);
+			if (pc >= endLoc) {
 				fde = NULL;
 				cie = NULL;
 			}
+		} else {
+			fde = NULL;
+			cie = NULL;
 		}
 	}
 	if (cie != NULL) {
-- 
1.9.1
