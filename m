From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Mar 2016 14:57:20 +0530
Subject: [PATCH 1/2] ARC: [BE] Select correct CROSS_COMPILE prefix
In-Reply-To: <1457688441-31337-1-git-send-email-vgupta@synopsys.com>
References: <1457688441-31337-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457688441-31337-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This allows CONFIG_CPU_BIG_ENDIAN=y to build correctly out of the box,
w/o any other tweaks.

Cc: Noam Camus <noamc at ezchip.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Anton Kolesov <akolesov at synosys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index c8230f3395f2..babc09c61c6c 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -9,7 +9,11 @@
 UTS_MACHINE := arc
 
 ifeq ($(CROSS_COMPILE),)
+ifndef CONFIG_CPU_BIG_ENDIAN
 CROSS_COMPILE := arc-linux-
+else
+CROSS_COMPILE := arceb-linux-
+endif
 endif
 
 KBUILD_DEFCONFIG := nsim_700_defconfig
-- 
2.5.0
