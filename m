From: rd.dunlab@gmail.com (rd_dunlab)
Date: Thu, 26 Jul 2018 20:16:35 -0700
Subject: [PATCH 4/4 v2] arc: fix printk warning in arc/plat-eznps/mtm.c
In-Reply-To: <15326613951079@infradead.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1532661395133@infradead.org>
To: linux-snps-arc@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

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

Signed-off-by: Randy Dunlap <rdunlap at infradead.org>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Cc: Elad Kanfi <eladkan at mellanox.com>
Cc: Leon Romanovsky <leonro at mellanox.com>
Cc: Ofer Levi <oferle at mellanox.com>
---
v2: no change

 arch/arc/plat-eznps/mtm.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- linux-next-20180723.orig/arch/arc/plat-eznps/mtm.c
+++ linux-next-20180723/arch/arc/plat-eznps/mtm.c
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


-- 
