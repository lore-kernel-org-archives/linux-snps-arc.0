From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 16 Dec 2015 17:54:00 +0530
Subject: [PATCH 2/2] ARC: dw2 unwind: Ignore CIE version !=1 gracefully
 instead of bailing
In-Reply-To: <1450268640-23055-1-git-send-email-vgupta@synopsys.com>
References: <1450268640-23055-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1450268640-23055-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC dwarf unwinder only supports CIE version == 1
The boot time dwarf sanitizer (part of binary lookup table constructor)
would simply bail if it saw CIE version == 3, rendering unwinder with a
NULL lookup table.

It seems libgcc linked with kernel does have such entries.

With fallback linear search removed, and a NULL binary lookup table,
unwinder fails to generate any stack trace.

So allow graceful ignoring of unsupported CIE entries.

This problem was initially seen in Alexey's setup (and not mine) as he
was using buildroot built toolchain (libgcc) which doesn't get built with
CFLAGS_FOR_TARGET="-gdwarf-2 which is my default

Fixes STAR 9000985048: "kernel unwinder broken with stock tools"

Fixes: 2e22502c080f ARC: dw2 unwind: Remove falllback linear search thru FDE entries
Reported-by Alexey Brodkin <abrodkin at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unwind.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 9f9ecc15556e..cf2828ab0905 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -293,13 +293,13 @@ static void init_unwind_hdr(struct unwind_table *table,
 		const u32 *cie = cie_for_fde(fde, table);
 		signed ptrType;
 
-		if (cie == &not_fde)
+		if (cie == &not_fde)	/* only process FDE here */
 			continue;
 		if (cie == NULL || cie == &bad_cie)
-			return;
+			continue;	/* say FDE->CIE.version != 1 */
 		ptrType = fde_pointer_type(cie);
 		if (ptrType < 0)
-			return;
+			continue;
 
 		ptr = (const u8 *)(fde + 2);
 		if (!read_pointer(&ptr, (const u8 *)(fde + 1) + *fde,
@@ -343,6 +343,10 @@ static void init_unwind_hdr(struct unwind_table *table,
 
 		if (fde[1] == 0xffffffff)
 			continue;	/* this is a CIE */
+
+		if (*(u8 *)(cie + 2) != 1)
+			continue;	/* FDE->CIE.version not supported */
+
 		ptr = (const u8 *)(fde + 2);
 		header->table[n].start = read_pointer(&ptr,
 						      (const u8 *)(fde + 1) +
@@ -519,7 +523,8 @@ static const u32 *cie_for_fde(const u32 *fde, const struct unwind_table *table)
 
 	if (*cie <= sizeof(*cie) + 4 || *cie >= fde[1] - sizeof(*fde)
 	    || (*cie & (sizeof(*cie) - 1))
-	    || (cie[1] != 0xffffffff))
+	    || (cie[1] != 0xffffffff)
+	    || ( *(u8 *)(cie + 2) != 1))   /* version 1 supported */
 		return NULL;	/* this is not a (valid) CIE */
 	return cie;
 }
-- 
1.9.1
