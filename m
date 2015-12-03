From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:06 +0530
Subject: [PATCH 08/17] ARC: dw2 unwind: Don't verify FDE lookup table metadata
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-9-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

FDE Lookup table (eh_frame_header or it's equivalent constructed by hand)
is already setup correctly in setup_unwind_table(). There's no point
to re-parse it's header for every unwind call

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 37 ++++++++-----------------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 9f5ed6873c52..9b34038a7582 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -900,35 +900,16 @@ int arc_unwind(struct unwind_frame_info *frame)
 		return -EINVAL;
 
 	hdr = table->header;
+	if (hdr == NULL)
+		return -EINVAL;
 
-	smp_rmb();
-	if (hdr && hdr->version == 1) {
-		switch (hdr->table_enc & DW_EH_PE_FORM) {
-		case DW_EH_PE_native:
-			hdrEntrySz = sizeof(unsigned long);
-			break;
-		case DW_EH_PE_data2:
-			hdrEntrySz = 2;
-			break;
-		case DW_EH_PE_data4:
-			hdrEntrySz = 4;
-			break;
-		case DW_EH_PE_data8:
-			hdrEntrySz = 8;
-			break;
-		default:
-			hdrEntrySz = 0;
-			break;
-		}
+	hdrEntrySz = sizeof(unsigned long);
+	BUILD_BUG_ON(hdrEntrySz != sizeof(hdr->table[0].start));
+
+	ptr = (const u8*)(hdr->table);
+	end = (const u8*)(hdr) + table->hdrsz;
+	i = hdr->fde_count;
 
-		ptr = (const u8*)(hdr->eh_frame_ptr);
-		end = (const u8*)(hdr) + table->hdrsz;
-		if (hdrEntrySz
-		    && read_pointer(&ptr, end, hdr->eh_frame_ptr_enc) /* eh_frame_ptr */
-		    == (unsigned long)table->address
-		    && (i = read_pointer(&ptr, end, hdr->fde_count_enc)) > 0 /* fde_count */
-		    && i == (end - ptr) / (2 * hdrEntrySz)
-		    && !((end - ptr) % (2 * hdrEntrySz))) {
 			do {
 				const u8 *cur = ptr + (i / 2) * (2 * hdrEntrySz);
 
@@ -944,8 +925,6 @@ int arc_unwind(struct unwind_frame_info *frame)
 			    && (startLoc = read_pointer(&ptr, ptr + hdrEntrySz, hdr->table_enc)) != 0
 			    && pc >= startLoc)
 				fde = (void *)read_pointer(&ptr, ptr + hdrEntrySz, hdr->table_enc);
-		}
-	}
 
 	if (fde != NULL) {
 		cie = cie_for_fde(fde, table);
-- 
1.9.1
