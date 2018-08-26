From: gregkh@linuxfoundation.org (gregkh@linuxfoundation.org)
Date: Sun, 26 Aug 2018 09:14:10 +0200
Subject: Patch "arc: [plat-eznps] fix printk warning in arc/plat-eznps/mtm.c"
 has been added to the 4.14-stable tree
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <15352676502994@kroah.com>
To: linux-snps-arc@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    arc: [plat-eznps] fix printk warning in arc/plat-eznps/mtm.c

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arc-fix-printk-warning-in-arc-plat-eznps-mtm.c.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable at vger.kernel.org> know about it.


>From foo at baz Sun Aug 26 09:13:00 CEST 2018
From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, 26 Jul 2018 20:16:35 -0700
Subject: arc: [plat-eznps] fix printk warning in arc/plat-eznps/mtm.c

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 9e2ea405543d9ddfe05b351f1679e53bd9c11f80 ]

Fix printk format warning in arch/arc/plat-eznps/mtm.c:

In file included from ../include/linux/printk.h:7,
                 from ../include/linux/kernel.h:14,
                 from ../include/linux/list.h:9,
                 from ../include/linux/smp.h:12,
                 from ../arch/arc/plat-eznps/mtm.c:17:
../arch/arc/plat-eznps/mtm.c: In function 'set_mtm_hs_ctr':
../include/linux/kern_levels.h:5:18: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long int' [-Wformat=]
 #define KERN_SOH "\001"  /* ASCII Start Of Header */
                  ^~~~~~
../include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
 #define KERN_ERR KERN_SOH "3" /* error conditions */
                  ^~~~~~~~
../include/linux/printk.h:308:9: note: in expansion of macro 'KERN_ERR'
  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         ^~~~~~~~
../arch/arc/plat-eznps/mtm.c:166:3: note: in expansion of macro 'pr_err'
   pr_err("** Invalid @nps_mtm_hs_ctr [%d] needs to be [%d:%d] (incl)\n",
   ^~~~~~
../arch/arc/plat-eznps/mtm.c:166:40: note: format string is defined here
   pr_err("** Invalid @nps_mtm_hs_ctr [%d] needs to be [%d:%d] (incl)\n",
                                       ~^
                                       %ld
The hs_ctr variable can just be int instead of long, so also change
kstrtol() to kstrtoint() and leave the format string as %d.

Also add 2 header files since they are used in mtm.c and we prefer
not to depend on accidental/indirect #includes.

Cc: linux-snps-arc at lists.infradead.org
Cc: Ofer Levi <oferle at mellanox.com>
Reviewed-by: Leon Romanovsky <leonro at mellanox.com>
Signed-off-by: Randy Dunlap <rdunlap at infradead.org>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Sasha Levin <alexander.levin at microsoft.com>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
---
 arch/arc/plat-eznps/mtm.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/arch/arc/plat-eznps/mtm.c
+++ b/arch/arc/plat-eznps/mtm.c
@@ -15,6 +15,8 @@
  */
 
 #include <linux/smp.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/io.h>
 #include <linux/log2.h>
 #include <asm/arcregs.h>
@@ -157,10 +159,10 @@ void mtm_enable_core(unsigned int cpu)
 /* Verify and set the value of the mtm hs counter */
 static int __init set_mtm_hs_ctr(char *ctr_str)
 {
-	long hs_ctr;
+	int hs_ctr;
 	int ret;
 
-	ret = kstrtol(ctr_str, 0, &hs_ctr);
+	ret = kstrtoint(ctr_str, 0, &hs_ctr);
 
 	if (ret || hs_ctr > MT_HS_CNT_MAX || hs_ctr < MT_HS_CNT_MIN) {
 		pr_err("** Invalid @nps_mtm_hs_ctr [%d] needs to be [%d:%d] (incl)\n",


Patches currently in stable-queue which might be from rdunlap at infradead.org are

queue-4.14/usb-phy-fix-ppc64-build-errors-in-phy-fsl-usb.c.patch
queue-4.14/arc-fix-printk-warning-in-arc-plat-eznps-mtm.c.patch
queue-4.14/arc-add-missing-struct-nps_host_reg_aux_dpc.patch
queue-4.14/net-prevent-isa-drivers-from-building-on-ppc32.patch
queue-4.14/arc-fix-build-errors-in-arc-include-asm-delay.h.patch
queue-4.14/arc-fix-data-type-errors-in-platform-headers.patch
queue-4.14/media-staging-omap4iss-include-asm-cacheflush.h-after-generic-includes.patch
queue-4.14/arc-fix-type-warnings-in-arc-mm-cache.c.patch
