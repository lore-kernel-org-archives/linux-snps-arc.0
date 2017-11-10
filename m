From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 10 Nov 2017 15:22:47 -0800
Subject: [PATCH] [ARC] update GLIBC_DYNAMIC_LINKER per glibc upstreaming
 review comments
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1510356167-8523-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

gcc/
	* config/arc/linux.h: GLIBC_DYNAMIC_LINKER update per glibc
	upstreaming review comments

Link: http://lists.infradead.org/pipermail/linux-snps-arc/2017-June/002634.html
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog              | 5 +++++
 gcc/config/arc/linux.h | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/ChangeLog b/ChangeLog
index abf3341c68c2..3bbd5cca2ebc 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -1,3 +1,8 @@
+2017-11-10  Vineet Gupta  <vgupta at synopsys.com>
+
+	* config/arc/linux.h: GLIBC_DYNAMIC_LINKER update per glibc
+	upstreaming review comments
+
 2017-10-27  Martin Liska  <mliska at suse.cz>
 
 	* Makefile.tpl: Use proper name of folder as it was renamed
diff --git a/gcc/config/arc/linux.h b/gcc/config/arc/linux.h
index 707347183ca5..21fc88c82cf9 100644
--- a/gcc/config/arc/linux.h
+++ b/gcc/config/arc/linux.h
@@ -29,7 +29,7 @@ along with GCC; see the file COPYING3.  If not see
     }						\
   while (0)
 
-#define GLIBC_DYNAMIC_LINKER   "/lib/ld-linux.so.2"
+#define GLIBC_DYNAMIC_LINKER   "/lib/ld-linux-arc.so.2"
 #define UCLIBC_DYNAMIC_LINKER  "/lib/ld-uClibc.so.0"
 
 /* Note that the default is to link against dynamic libraries, if they are
-- 
2.7.4
