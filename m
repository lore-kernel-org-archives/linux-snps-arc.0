From: rd.dunlab@gmail.com (Randy Dunlap)
Date: Tue, 24 Jul 2018 13:46:19 -0700
Subject: [PATCH 1/4] arc: fix some build issues in delay.h
In-Reply-To: <20180724204622.2366-1-rd.dunlab@gmail.com>
References: <20180724204622.2366-1-rd.dunlab@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180724204622.2366-2-rd.dunlab@gmail.com>
To: linux-snps-arc@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors in arch/arc/'s delay.h:
- add <linux/delay.h> for loops_per_jiffy
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
Cc: Ofer Levi <oferle at mellanox.com>
Cc: linux-snps-arc at lists.infradead.org
---
 arch/arc/include/asm/delay.h |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20180723.orig/arch/arc/include/asm/delay.h
+++ linux-next-20180723/arch/arc/include/asm/delay.h
@@ -17,6 +17,8 @@
 #ifndef __ASM_ARC_UDELAY_H
 #define __ASM_ARC_UDELAY_H
 
+#include <linux/delay.h>
+#include <asm-generic/types.h>
 #include <asm/param.h>		/* HZ */
 
 static inline void __delay(unsigned long loops)
