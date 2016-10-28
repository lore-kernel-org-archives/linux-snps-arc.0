From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 28 Oct 2016 15:09:09 -0700
Subject: [PATCH] [ARC] define SIZE_TYPE and PTRDIFF_TYPE correctly
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477692549-17331-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This silences tons of -Wformat= warnings when building ARC Linux kernel
with gcc 6.x (and restores the ARC gcc 4.8.x behaviour) which had
similar fix.

gcc/
2016-10-28  Vineet Gupta <vgupta at synopsys.com>

        * config/arc/arc.h (SIZE_TYPE): define as unsigned int.
	* (PTRDIFF_TYPE): define as int.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 gcc/config/arc/arc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/gcc/config/arc/arc.h b/gcc/config/arc/arc.h
index cf13a7fa9fc3..0b579c44ee12 100644
--- a/gcc/config/arc/arc.h
+++ b/gcc/config/arc/arc.h
@@ -282,10 +282,10 @@ if (GET_MODE_CLASS (MODE) == MODE_INT		\
 #define DEFAULT_SIGNED_CHAR 0
 
 #undef SIZE_TYPE
-#define SIZE_TYPE "long unsigned int"
+#define SIZE_TYPE "unsigned int"
 
 #undef PTRDIFF_TYPE
-#define PTRDIFF_TYPE "long int"
+#define PTRDIFF_TYPE "int"
 
 #undef WCHAR_TYPE
 #define WCHAR_TYPE "int"
-- 
2.7.4
