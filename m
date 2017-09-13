From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Wed, 13 Sep 2017 12:24:09 +0100
Subject: [PATCH] ARC: Memory barriers for everyone!
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0962ea206d9480abb7084bfbca86237cfc69b16b.1505301175.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

By default __iormb() and __iowmb() translate into a do { } while(0) for
AXS10x platform. As ARC700 supports the sync op we can use the standard
memory barriers that are supplied by asm-generic headers.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Joao Pinto <jpinto at synopsys.com>
---
Hi Vineet,

This is the final patch for the series which should fix all the stacktracing
mechanism for Bus Error messages. In this one we force memory barriers for
all IO operations which will prevent op reordering by gcc and which will
*really* correct blink and eret regs to show where exactly the error happened.

With this fix I get a correct stacktrace upon a readl() from a non-existent
register which causes a Bus Error. Without this, I would get non-correct
blink and eret addresses because the ld operation would launch a bus error
way after we performed readl().

I am sending this but I'm not exactly sure if all platforms support
the sync op. Could you confirm this?

Best regards,
Jose Miguel Abreu
---
 arch/arc/include/asm/io.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arc/include/asm/io.h b/arch/arc/include/asm/io.h
index c22b181..712defd 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -12,15 +12,10 @@
 #include <linux/types.h>
 #include <asm/byteorder.h>
 #include <asm/page.h>
-
-#ifdef CONFIG_ISA_ARCV2
 #include <asm/barrier.h>
+
 #define __iormb()		rmb()
 #define __iowmb()		wmb()
-#else
-#define __iormb()		do { } while (0)
-#define __iowmb()		do { } while (0)
-#endif
 
 extern void __iomem *ioremap(phys_addr_t paddr, unsigned long size);
 extern void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
-- 
1.9.1
