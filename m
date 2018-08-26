From: gregkh@linuxfoundation.org (gregkh@linuxfoundation.org)
Date: Sun, 26 Aug 2018 09:14:10 +0200
Subject: Patch "arc: [plat-eznps] fix data type errors in platform headers"
 has been added to the 4.14-stable tree
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <15352676505146@kroah.com>
To: linux-snps-arc@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    arc: [plat-eznps] fix data type errors in platform headers

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arc-fix-data-type-errors-in-platform-headers.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable at vger.kernel.org> know about it.


>From foo at baz Sun Aug 26 09:13:00 CEST 2018
From: Randy Dunlap <rdunlap@infradead.org>
Date: Sun, 29 Jul 2018 11:10:51 -0700
Subject: arc: [plat-eznps] fix data type errors in platform headers

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


Patches currently in stable-queue which might be from rdunlap at infradead.org are

queue-4.14/usb-phy-fix-ppc64-build-errors-in-phy-fsl-usb.c.patch
queue-4.14/arc-fix-printk-warning-in-arc-plat-eznps-mtm.c.patch
queue-4.14/arc-add-missing-struct-nps_host_reg_aux_dpc.patch
queue-4.14/net-prevent-isa-drivers-from-building-on-ppc32.patch
queue-4.14/arc-fix-build-errors-in-arc-include-asm-delay.h.patch
queue-4.14/arc-fix-data-type-errors-in-platform-headers.patch
queue-4.14/media-staging-omap4iss-include-asm-cacheflush.h-after-generic-includes.patch
queue-4.14/arc-fix-type-warnings-in-arc-mm-cache.c.patch
