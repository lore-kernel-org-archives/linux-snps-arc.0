From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 19 Sep 2016 14:49:32 -0700
Subject: [PATCH 2/3] ARC: dw2 unwind: factor CIE specifics for
 .eh_frame/.debug_frame
In-Reply-To: <1474321773-18166-1-git-send-email-vgupta@synopsys.com>
References: <1474321773-18166-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1474321773-18166-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This paves way for switching to .eh_frame based unwindiing

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 0587bf121d11..4e5dbe7617a1 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -111,6 +111,8 @@ UNW_REGISTER_INFO};
 #define DW_EH_PE_indirect 0x80
 #define DW_EH_PE_omit     0xff
 
+#define CIE_ID	0xffffffffUL
+
 typedef unsigned long uleb128_t;
 typedef signed long sleb128_t;
 
@@ -232,6 +234,7 @@ void __init arc_unwind_init(void)
 
 static const u32 bad_cie, not_fde;
 static const u32 *cie_for_fde(const u32 *fde, const struct unwind_table *);
+static const u32 *__cie_for_fde(const u32 *fde);
 static signed fde_pointer_type(const u32 *cie);
 
 struct eh_frame_hdr_table_entry {
@@ -338,10 +341,9 @@ static void init_unwind_hdr(struct unwind_table *table,
 	for (fde = table->address, tableSize = table->size, n = 0;
 	     tableSize;
 	     tableSize -= sizeof(*fde) + *fde, fde += 1 + *fde / sizeof(*fde)) {
-		/* const u32 *cie = fde + 1 - fde[1] / sizeof(*fde); */
-		const u32 *cie = (const u32 *)(fde[1]);
+		const u32 *cie = __cie_for_fde(fde);
 
-		if (fde[1] == 0xffffffff)
+		if (fde[1] == CIE_ID)
 			continue;	/* this is a CIE */
 		ptr = (const u8 *)(fde + 2);
 		header->table[n].start = read_pointer(&ptr,
@@ -504,6 +506,16 @@ static sleb128_t get_sleb128(const u8 **pcur, const u8 *end)
 	return value;
 }
 
+static const u32 *__cie_for_fde(const u32 *fde)
+{
+	const u32 *cie;
+
+	/* cie = fde + 1 - fde[1] / sizeof(*fde); */
+	cie = (u32 *) fde[1];
+
+	return cie;
+}
+
 static const u32 *cie_for_fde(const u32 *fde, const struct unwind_table *table)
 {
 	const u32 *cie;
@@ -511,19 +523,18 @@ static const u32 *cie_for_fde(const u32 *fde, const struct unwind_table *table)
 	if (!*fde || (*fde & (sizeof(*fde) - 1)))
 		return &bad_cie;
 
-	if (fde[1] == 0xffffffff)
+	if (fde[1] == CIE_ID)
 		return &not_fde;	/* this is a CIE */
 
 	if ((fde[1] & (sizeof(*fde) - 1)))
 /* || fde[1] > (unsigned long)(fde + 1) - (unsigned long)table->address) */
 		return NULL;	/* this is not a valid FDE */
 
-	/* cie = fde + 1 - fde[1] / sizeof(*fde); */
-	cie = (u32 *) fde[1];
+	cie = __cie_for_fde(fde);
 
 	if (*cie <= sizeof(*cie) + 4 || *cie >= fde[1] - sizeof(*fde)
 	    || (*cie & (sizeof(*cie) - 1))
-	    || (cie[1] != 0xffffffff))
+	    || (cie[1] != CIE_ID))
 		return NULL;	/* this is not a (valid) CIE */
 	return cie;
 }
-- 
2.7.4
