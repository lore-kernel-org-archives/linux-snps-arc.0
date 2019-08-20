From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Wed, 21 Aug 2019 02:09:39 +0900
Subject: [PATCH 1/3] init/Kconfig: rework help of CONFIG_CC_OPTIMIZE_FOR_SIZE
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190820170941.26193-1-yamada.masahiro@socionext.com>
To: linux-snps-arc@lists.infradead.org

CONFIG_CC_OPTIMIZE_FOR_SIZE was originally an independent boolean
option, but commit 877417e6ffb9 ("Kbuild: change CC_OPTIMIZE_FOR_SIZE
definition") turned it into a choice between _PERFORMANCE and _SIZE.

The phrase "If unsure, say N." sounds like an independent option.
Reword the help text to make it appropriate for the choice menu.

Signed-off-by: Masahiro Yamada <yamada.masahiro at socionext.com>
---

 init/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index bf971b5c707d..149efd82447f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1219,10 +1219,8 @@ config CC_OPTIMIZE_FOR_SIZE
 	bool "Optimize for size"
 	imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED  # avoid false positives
 	help
-	  Enabling this option will pass "-Os" instead of "-O2" to
-	  your compiler resulting in a smaller kernel.
-
-	  If unsure, say N.
+	  Choosing this option will pass "-Os" to your compiler resulting
+	  in a smaller kernel.
 
 endchoice
 
-- 
2.17.1
