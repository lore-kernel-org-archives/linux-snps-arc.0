From: rd.dunlab@gmail.com (rd_dunlab)
Date: Thu, 26 Jul 2018 20:16:35 -0700
Subject: [PATCH 1/4 v2] arc: fix build errors in arc/include/asm/delay.h
In-Reply-To: <15326613951079@infradead.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <15326613952848@infradead.org>
To: linux-snps-arc@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors in arch/arc/'s delay.h:
- add "extern unsigned long loops_per_jiffy;"
- add <asm-generic/types.h> for "u64"

In file included from ../drivers/infiniband/hw/cxgb3/cxio_hal.c:32:
../arch/arc/include/asm/delay.h: In function '__udelay':
../arch/arc/include/asm/delay.h:61:12: error: 'u64' undeclared (first use in this function)
  loops = ((u64) usecs * 4295 * HZ * loops_per_jiffy) >> 32;
            ^~~

In file included from ../drivers/infiniband/hw/cxgb3/cxio_hal.c:32:
../arch/arc/include/asm/delay.h: In function '__udelay':
../arch/arc/include/asm/delay.h:63:37: error: 'loops_per_jiffy' undeclared (first use in this function)
  loops = ((u64) usecs * 4295 * HZ * loops_per_jiffy) >> 32;
                                     ^~~~~~~~~~~~~~~

Signed-off-by: Randy Dunlap <rdunlap at infradead.org>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Cc: Elad Kanfi <eladkan at mellanox.com>
Cc: Leon Romanovsky <leonro at mellanox.com>
Cc: Ofer Levi <oferle at mellanox.com>
---
v2: add extern for loops_per_jiffy instead of including <linux/delay.h>
	for it

 arch/arc/include/asm/delay.h |    3 +++
 1 file changed, 3 insertions(+)

--- linux-next-20180723.orig/arch/arc/include/asm/delay.h
+++ linux-next-20180723/arch/arc/include/asm/delay.h
@@ -17,8 +17,11 @@
 #ifndef __ASM_ARC_UDELAY_H
 #define __ASM_ARC_UDELAY_H
 
+#include <asm-generic/types.h>
 #include <asm/param.h>		/* HZ */
 
+extern unsigned long loops_per_jiffy;
+
 static inline void __delay(unsigned long loops)
 {
 	__asm__ __volatile__(


-- 
