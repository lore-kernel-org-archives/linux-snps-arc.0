From: Lada.Trimasova@synopsys.com (Lada Trimasova)
Date: Wed,  9 Mar 2016 20:21:04 +0300
Subject: [PATCH] arc: use little endian accesses
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457544064-16167-1-git-send-email-ltrimas@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Memory access primitives should use cpu_to_le16, cpu_to_le32, le16_to_cpu
and le32_to_cpu because it is not really guaranteed that drivers handles
any ordering themselves.
For example, serial port driver doesn't work when kernel is build for
arc big endian architecture.

Signed-off-by: Lada Trimasova <ltrimas at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/io.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arc/include/asm/io.h b/arch/arc/include/asm/io.h
index 694ece8..0b3d5ea 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -129,15 +129,17 @@ static inline void __raw_writel(u32 w, volatile void __iomem *addr)
 #define writel(v,c)		({ __iowmb(); writel_relaxed(v,c); })
 
 /*
- * Relaxed API for drivers which can handle any ordering themselves
+ * This are defined to perform little endian accesses
  */
 #define readb_relaxed(c)	__raw_readb(c)
-#define readw_relaxed(c)	__raw_readw(c)
-#define readl_relaxed(c)	__raw_readl(c)
+#define readw_relaxed(c) ({ u16 __r = le16_to_cpu((__force __le16) \
+					__raw_readw(c)); __r; })
+#define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
+					__raw_readl(c)); __r; })
 
 #define writeb_relaxed(v,c)	__raw_writeb(v,c)
-#define writew_relaxed(v,c)	__raw_writew(v,c)
-#define writel_relaxed(v,c)	__raw_writel(v,c)
+#define writew_relaxed(v,c)	__raw_writew((__force u16) cpu_to_le16(v),c)
+#define writel_relaxed(v,c)	__raw_writel((__force u32) cpu_to_le32(v),c)
 
 #include <asm-generic/io.h>
 
-- 
2.5.0
