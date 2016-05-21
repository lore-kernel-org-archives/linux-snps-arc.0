From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:46:37 +0200
Subject: [PATCH 0074/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114637.2943-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/include/uapi/asm/swab.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/uapi/asm/swab.h b/arch/arc/include/uapi/asm/swab.h
index 095599a..71f3918 100644
--- a/arch/arc/include/uapi/asm/swab.h
+++ b/arch/arc/include/uapi/asm/swab.h
@@ -74,7 +74,7 @@
 	__tmp ^ __in;						\
 })
 
-#elif (ARC_BSWAP_TYPE == 2)	/* Custom single cycle bwap instruction */
+#elif (ARC_BSWAP_TYPE == 2)	/* Custom single cycle bswap instruction */
 
 #define __arch_swab32(x)						\
 ({									\
-- 
2.8.2.534.g1f66975
