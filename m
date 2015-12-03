From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:07 +0530
Subject: [PATCH 09/17] ARC: dw2 unwind: Use striaght forward code to implement
 binary lookup
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-10-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The {start, pc} entries are already word aligned, no need to use
read_pointer() inefficiency !

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 9b34038a7582..6a09ffa0b697 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -866,7 +866,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 	const u8 *ptr = NULL, *end = NULL;
 	unsigned long pc = UNW_PC(frame);
 	unsigned long startLoc = 0, endLoc = 0, cfa;
-	unsigned i;
+	unsigned i, s, e;
 	signed ptrType = -1;
 	uleb128_t retAddrReg = 0;
 	const struct unwind_table *table;
@@ -874,7 +874,6 @@ int arc_unwind(struct unwind_frame_info *frame)
 	unsigned long *fptr;
 	unsigned long addr;
 	struct eh_frame_header *hdr;
-	unsigned long hdrEntrySz;
 
 	unw_debug("\nUNWIND FRAME: -------------------------------------\n");
 	unw_debug("PC\t\t: 0x%lx %pS\nr31 [BLINK]\t: 0x%lx %pS\nr28 [SP]\t: 0x%lx\nr27 [FP]\t: 0x%lx\n",
@@ -903,28 +902,23 @@ int arc_unwind(struct unwind_frame_info *frame)
 	if (hdr == NULL)
 		return -EINVAL;
 
-	hdrEntrySz = sizeof(unsigned long);
-	BUILD_BUG_ON(hdrEntrySz != sizeof(hdr->table[0].start));
+	s = i = 0;
+	e = hdr->fde_count - 1;
 
-	ptr = (const u8*)(hdr->table);
-	end = (const u8*)(hdr) + table->hdrsz;
-	i = hdr->fde_count;
-
-			do {
-				const u8 *cur = ptr + (i / 2) * (2 * hdrEntrySz);
-
-				startLoc = read_pointer(&cur, cur + hdrEntrySz, hdr->table_enc);
-				if (pc < startLoc)
-					i /= 2;
-				else {
-					ptr = cur - hdrEntrySz;
-					i = (i + 1) / 2;
-				}
-			} while (startLoc && i > 1);
-			if (i == 1
-			    && (startLoc = read_pointer(&ptr, ptr + hdrEntrySz, hdr->table_enc)) != 0
-			    && pc >= startLoc)
-				fde = (void *)read_pointer(&ptr, ptr + hdrEntrySz, hdr->table_enc);
+	do {
+		if (pc < startLoc)
+			e = i;
+		else
+			s = i;
+		i = s + (e - s) / 2;
+		startLoc = hdr->table[i].start;
+		unw_debug("s %d e %d i %d startLoc %lx\n", s, e, i, startLoc)
+	} while ((e - s) > 1);
+
+	if (pc >= startLoc)
+		fde = (u32 *)hdr->table[i].fde;
+	else
+		return -EINVAL;
 
 	if (fde != NULL) {
 		cie = cie_for_fde(fde, table);
-- 
1.9.1
