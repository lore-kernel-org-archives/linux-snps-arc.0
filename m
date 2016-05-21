From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:45:35 +0200
Subject: [PATCH 0066/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114535.2502-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 02fabef..d4df6be 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -127,7 +127,7 @@ libs-y		+= arch/arc/lib/ $(LIBGCC)
 
 boot		:= arch/arc/boot
 
-#default target for make without any arguements.
+#default target for make without any arguments.
 KBUILD_IMAGE	:= bootpImage
 
 all:	$(KBUILD_IMAGE)
-- 
2.8.2.534.g1f66975
