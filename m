From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 17 Aug 2016 13:00:50 -0700
Subject: [PATCH] tools lib: Reinstate strlcpy() header guard with __UCLIBC__
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471464050-18044-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

perf tools build in recent kernels spews splat when cross compiling with uClibc

|   CC       util/alias.o
| In file included from tools/perf/util/../ui/../util/cache.h:8:0,
|                 from tools/perf/util/../ui/helpline.h:7,
|                 from tools/perf/util/debug.h:8,
|                 from arch/../util/cpumap.h:9,
|                 from arch/../util/env.h:5,
|                 from arch/common.h:4,
|                 from arch/common.c:3:
| tools/include/linux/string.h:12:15: warning: redundant redeclaration of ?strlcpy? [-Wredundant-decls]
|  extern size_t strlcpy(char *dest, const char *src, size_t size);
               ^
This is after commit 61a6445e463a31 ("tools lib: Guard the strlcpy() header with
__GLIBC__"). While the commit was right in theory, issue is uClibc also
defines __GLIBC__ for application headers.

Instead of reverting the commit, manually revert with some addeed commentary to
same effect.

Cc: Adrian Hunter <adrian.hunter at intel.com>
Cc: Alexey Brodkin <Alexey.Brodkin at synopsys.com>
Cc: David Ahern <dsahern at gmail.com>
Cc: Jiri Olsa <jolsa at kernel.org>
Cc: Namhyung Kim <namhyung at kernel.org>
Cc: Wang Nan <wangnan0 at huawei.com>
Cc: Petri Gynther <pgynther at google.com>
Cc: Peter Zijlstra (Intel) <peterz at infradead.org>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 tools/include/linux/string.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/include/linux/string.h b/tools/include/linux/string.h
index b96879477311..5a9e30334ffa 100644
--- a/tools/include/linux/string.h
+++ b/tools/include/linux/string.h
@@ -8,7 +8,12 @@ void *memdup(const void *src, size_t len);
 
 int strtobool(const char *s, bool *res);
 
-#ifdef __GLIBC__
+/*
+ * Ideally instead of blacklisting libs which define this already (uclibc,
+ * musl..), we could whitelist libs which reuire it (glibc). However uClibc
+ * also defines __GLIBC__ for user application headers
+ */
+#ifndef __UCLIBC__
 extern size_t strlcpy(char *dest, const char *src, size_t size);
 #endif
 
-- 
2.7.4
