From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 18 Jan 2018 21:07:21 +0300
Subject: [PATCH] ARCv2: Don't pretend we may set L-bit in STATUS32 with kflag
 instruction
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180118180721.34330-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As per PRM "kflag" instruction doesn't change state of
L-flag ("Zero-Overhead loop disabled") in STATUS32 register
so let's not act as if we can affect this bit.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/include/asm/entry-arcv2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
index 257a68f3c2fe..309f4e6721b3 100644
--- a/arch/arc/include/asm/entry-arcv2.h
+++ b/arch/arc/include/asm/entry-arcv2.h
@@ -184,7 +184,7 @@
 .macro FAKE_RET_FROM_EXCPN
 	lr      r9, [status32]
 	bic     r9, r9, (STATUS_U_MASK|STATUS_DE_MASK|STATUS_AE_MASK)
-	or      r9, r9, (STATUS_L_MASK|STATUS_IE_MASK)
+	or      r9, r9, STATUS_IE_MASK
 	kflag   r9
 .endm
 
-- 
2.11.0
