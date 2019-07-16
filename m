From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 16 Jul 2019 23:50:34 +0300
Subject: [PATCH] ARCv2: Don't pretend we may set U & DE bits in STATUS32 with
 kflag
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190716205034.42466-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As per PRM "kflag" instruction doesn't change state of
DE-flag ("Delayed branch is pending") and U-flag ("User mode")
in STATUS32 register so let's not act as if we can affect those bits.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/include/asm/entry-arcv2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
index 225e7df2d8ed..6558e2edb583 100644
--- a/arch/arc/include/asm/entry-arcv2.h
+++ b/arch/arc/include/asm/entry-arcv2.h
@@ -237,7 +237,7 @@
 
 .macro FAKE_RET_FROM_EXCPN
 	lr      r9, [status32]
-	bic     r9, r9, (STATUS_U_MASK|STATUS_DE_MASK|STATUS_AE_MASK)
+	bic     r9, r9, STATUS_AE_MASK
 	or      r9, r9, STATUS_IE_MASK
 	kflag   r9
 .endm
-- 
2.16.2
