From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 30 Sep 2016 14:11:26 -0700
Subject: [PATCH] ARCv2: fix local_save_flags
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1475269886-10832-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Commit d9676fa152c83b ("ARCv2: Enable LOCKDEP"), changed
local_save_flags() to not return raw STATUS32 but encoded in the form
such that it could be fed directly to CLRI/SETI instructions.
However the STATUS32.E[] was not captured correctly as it corresponds to
bits [4:1] in the register and not [3:0]

Fixes: d9676fa152c83b ("ARCv2: Enable LOCKDEP")
Cc: Evgeny Voevodin <evgeny.voevodin at intel.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/irqflags-arcv2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/irqflags-arcv2.h b/arch/arc/include/asm/irqflags-arcv2.h
index d1ec7f6b31e0..e880dfa3fcd3 100644
--- a/arch/arc/include/asm/irqflags-arcv2.h
+++ b/arch/arc/include/asm/irqflags-arcv2.h
@@ -112,7 +112,7 @@ static inline long arch_local_save_flags(void)
 	 */
 	temp = (1 << 5) |
 		((!!(temp & STATUS_IE_MASK)) << CLRI_STATUS_IE_BIT) |
-		(temp & CLRI_STATUS_E_MASK);
+		((temp >> 1) & CLRI_STATUS_E_MASK);
 	return temp;
 }
 
-- 
2.7.4
