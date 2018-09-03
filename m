From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Mon,  3 Sep 2018 18:55:51 +0200
Subject: [PATCH 4.14 065/165] arc: [plat-eznps] fix data type errors in
 platform headers
In-Reply-To: <20180903165655.003605184@linuxfoundation.org>
References: <20180903165655.003605184@linuxfoundation.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180903165658.378689867@linuxfoundation.org>
To: linux-snps-arc@lists.infradead.org

4.14-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit b1f32ce1c3d2c11959b7e6a2c58dc5197c581966 ]

Add <linux/types.h> to fix build errors.
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

Cc: linux-snps-arc at lists.infradead.org
Cc: Ofer Levi <oferle at mellanox.com>
Reviewed-by: Leon Romanovsky <leonro at mellanox.com>
Signed-off-by: Randy Dunlap <rdunlap at infradead.org>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Sasha Levin <alexander.levin at microsoft.com>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
---
 arch/arc/plat-eznps/include/plat/ctop.h |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/arc/plat-eznps/include/plat/ctop.h
+++ b/arch/arc/plat-eznps/include/plat/ctop.h
@@ -21,6 +21,7 @@
 #error "Incorrect ctop.h include"
 #endif
 
+#include <linux/types.h>
 #include <soc/nps/common.h>
 
 /* core auxiliary registers */
