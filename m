From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Wed, 20 Sep 2017 20:25:30 +0900
Subject: [PATCH] arc: remove redundant UTS_MACHINE define in arch/arc/Makefile
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1505906730-21904-1-git-send-email-yamada.masahiro@socionext.com>
To: linux-snps-arc@lists.infradead.org

The top-level Makefile sets the default of UTS_MACHINE to $(ARCH).

If ARCH and UTS_MACHINE match, arch/$(ARCH)/Makefile need not specify
UTS_MACHINE explicitly.

Signed-off-by: Masahiro Yamada <yamada.masahiro at socionext.com>
---

 arch/arc/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 3a4b52b..d37f49d 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -6,8 +6,6 @@
 # published by the Free Software Foundation.
 #
 
-UTS_MACHINE := arc
-
 ifeq ($(CROSS_COMPILE),)
 ifndef CONFIG_CPU_BIG_ENDIAN
 CROSS_COMPILE := arc-linux-
-- 
2.7.4
