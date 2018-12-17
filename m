From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 17 Dec 2018 15:04:53 -0800
Subject: [PATCH] testsuite fix: timezone: failing due to permissions in cross
 testing
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545087893-29860-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

timezone test driver "zic" creates testdata directory wuth umask 755, so
only root owner/group has write permissions. However the buildroot
system created has sshd as default user, so sh fails to write to test
results in this folder. Work around by relaxing umask to 777

| /bin/sh: build/glibc-fa3b6cd5bdbc/build/timezone/testdata/America/New_York.test-result: Permission denied
| Makefile:96: recipe for target 'build/glibc-fa3b6cd5bdbc/build/timezone/testdata/America/New_York' failed
| make[2]: *** [build/glibc-fa3b6cd5bdbc/build/timezone/testdata/America/New_York] Error 1
| make[2]: Leaving directory 'build/glibc-fa3b6cd5bdbc/timezone'
| Makefile:258: recipe for target 'timezone/xtests' failed

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 timezone/zic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/timezone/zic.c b/timezone/zic.c
index cb1bf28bfbc8..b7a5b0f6c80c 100644
--- a/timezone/zic.c
+++ b/timezone/zic.c
@@ -39,7 +39,7 @@ typedef int_fast64_t	zic_t;
 #include <sys/stat.h>
 #endif
 #ifdef S_IRUSR
-#define MKDIR_UMASK (S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP|S_IXGRP|S_IROTH|S_IXOTH)
+#define MKDIR_UMASK (S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP|S_IWGRP|S_IXGRP|S_IROTH|S_IWOTH|S_IXOTH)
 #else
 #define MKDIR_UMASK 0755
 #endif
-- 
2.7.4
