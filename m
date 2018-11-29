From: jose.abreu@synopsys.com (Jose Abreu)
Date: Thu, 29 Nov 2018 12:42:22 +0000
Subject: [PATCH] ARC: io.h: Implement reads{x}()/writes{x}()
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <bdcc49c9eab45bda6815b1419590943e603d8dc2.1543484040.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Some ARC CPU's do not support unaligned loads/stores. Currently, generic
implementation of reads{b/w/l}()/writes{b/w/l}() is being used with ARC.
This can lead to misfunction of some drivers as generic functions do a
plain dereference of a pointer that can be unaligned.

Let's use {get/put}_unaligned() helper instead of plain dereference of
pointer in order to fix this.

We do not implement readsq()/writesq() as we assume that only HS is a
64 Bit CPU and that it supports unaligned loads/stores.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
Tested-by: Vitor Soares <soares at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Joao Pinto <jpinto at synopsys.com>
Cc: Vitor Soares <soares at synopsys.com>
---
 arch/arc/include/asm/io.h | 48 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arc/include/asm/io.h b/arch/arc/include/asm/io.h
index c22b181e8206..ca42c84af042 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <asm/byteorder.h>
 #include <asm/page.h>
+#include <asm/unaligned.h>
 
 #ifdef CONFIG_ISA_ARCV2
 #include <asm/barrier.h>
@@ -94,6 +95,27 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
 	return w;
 }
 
+#define __raw_readsx(t,f) \
+static inline void __raw_reads##f(const volatile void __iomem *addr, \
+				  void *buffer, unsigned int count) \
+{ \
+	if (count) { \
+		u##t *buf = buffer; \
+\
+		do { \
+			u##t x = __raw_read##f(addr); \
+			put_unaligned(x, buf++); \
+		} while (--count); \
+	} \
+}
+
+#define __raw_readsb __raw_readsb
+__raw_readsx(8, b);
+#define __raw_readsw __raw_readsw
+__raw_readsx(16, w);
+#define __raw_readsl __raw_readsl
+__raw_readsx(32, l);
+
 #define __raw_writeb __raw_writeb
 static inline void __raw_writeb(u8 b, volatile void __iomem *addr)
 {
@@ -126,6 +148,26 @@ static inline void __raw_writel(u32 w, volatile void __iomem *addr)
 
 }
 
+#define __raw_writesx(t,f) \
+static inline void __raw_writes##f(volatile void __iomem *addr, \
+				   const void *buffer, unsigned int count) \
+{ \
+	if (count) { \
+		const u##t *buf = buffer; \
+\
+		do { \
+			__raw_write##f(get_unaligned(buf++), addr); \
+		} while (--count); \
+	} \
+}
+
+#define __raw_writesb __raw_writesb
+__raw_writesx(8, b);
+#define __raw_writesw __raw_writesw
+__raw_writesx(16, w);
+#define __raw_writesl __raw_writesl
+__raw_writesx(32, l);
+
 /*
  * MMIO can also get buffered/optimized in micro-arch, so barriers needed
  * Based on ARM model for the typical use case
@@ -141,10 +183,16 @@ static inline void __raw_writel(u32 w, volatile void __iomem *addr)
 #define readb(c)		({ u8  __v = readb_relaxed(c); __iormb(); __v; })
 #define readw(c)		({ u16 __v = readw_relaxed(c); __iormb(); __v; })
 #define readl(c)		({ u32 __v = readl_relaxed(c); __iormb(); __v; })
+#define readsb(p,d,l)		({ __raw_readsb(p,d,l); __iormb(); })
+#define readsw(p,d,l)		({ __raw_readsw(p,d,l); __iormb(); })
+#define readsl(p,d,l)		({ __raw_readsl(p,d,l); __iormb(); })
 
 #define writeb(v,c)		({ __iowmb(); writeb_relaxed(v,c); })
 #define writew(v,c)		({ __iowmb(); writew_relaxed(v,c); })
 #define writel(v,c)		({ __iowmb(); writel_relaxed(v,c); })
+#define writesb(p,d,l)		({ __iowmb(); __raw_writesb(p,d,l); })
+#define writesw(p,d,l)		({ __iowmb(); __raw_writesw(p,d,l); })
+#define writesl(p,d,l)		({ __iowmb(); __raw_writesl(p,d,l); })
 
 /*
  * Relaxed API for drivers which can handle barrier ordering themselves
-- 
2.7.4
