From: rd.dunlab@gmail.com (rd_dunlab)
Date: Thu, 26 Jul 2018 20:16:35 -0700
Subject: [PATCH 3/4 v2] arc: fix data type errors in platform headers
In-Reply-To: <15326613951079@infradead.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1532661395712@infradead.org>
To: linux-snps-arc@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

Add <asm-generic/types.h> to fix build errors.
Both ctop.h and <soc/nps/common.h> use u32 types and cause many
errors.

Examples:
../include/soc/nps/common.h:71:4: error: unknown type name 'u32'
    u32 __reserved:20, cluster:4, core:4, thread:4;
../include/soc/nps/common.h:76:3: error: unknown type name 'u32'
   u32 value;
../include/soc/nps/common.h:124:4: error: unknown type name 'u32'
    u32 base:8, cl_x:4, cl_y:4,
../include/soc/nps/common.h:127:3: error: unknown type name 'u32'
   u32 value;

../arch/arc/plat-eznps/include/plat/ctop.h:83:4: error: unknown type name 'u32'
    u32 gen:1, gdis:1, clk_gate_dis:1, asb:1,
../arch/arc/plat-eznps/include/plat/ctop.h:86:3: error: unknown type name 'u32'
   u32 value;
../arch/arc/plat-eznps/include/plat/ctop.h:93:4: error: unknown type name 'u32'
    u32 csa:22, dmsid:6, __reserved:3, cs:1;
../arch/arc/plat-eznps/include/plat/ctop.h:95:3: error: unknown type name 'u32'
   u32 value;

Signed-off-by: Randy Dunlap <rdunlap at infradead.org>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Cc: Elad Kanfi <eladkan at mellanox.com>
Cc: Leon Romanovsky <leonro at mellanox.com>
Cc: Ofer Levi <oferle at mellanox.com>
---
v2: no change

 arch/arc/plat-eznps/include/plat/ctop.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20180723.orig/arch/arc/plat-eznps/include/plat/ctop.h
+++ linux-next-20180723/arch/arc/plat-eznps/include/plat/ctop.h
@@ -21,6 +21,7 @@
 #error "Incorrect ctop.h include"
 #endif
 
+#include <asm-generic/types.h>
 #include <soc/nps/common.h>
 
 /* core auxiliary registers */


-- 
