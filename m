From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Mar 2016 06:47:54 +0000
Subject: big endian builds
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E8F650@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

So for big endian kernel builds, just selecting the CONFIG_CPU_BIG_ENDIAN is not
sufficient, we also need to manually change the CROSS_COMPILE prefix to arceb-xxx.

@Anton, is that what you do for verification builds !

@Noam I presume your defconfig has CONFIG_CROSS_COMPILE or you have set in env
variable ?


The kernel build system needs to take take care of that. Do you guys have issues
with patch below

------------>
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index c8230f3395f2..4abcdb89e391 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -9,8 +9,12 @@
 UTS_MACHINE := arc
 
 ifeq ($(CROSS_COMPILE),)
+ifndef CONFIG_CPU_BIG_ENDIAN
+CROSS_COMPILE := arceb-linux-
+else
 CROSS_COMPILE := arc-linux-
 endif
+endif
