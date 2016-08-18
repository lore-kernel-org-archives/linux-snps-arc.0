From: acme@kernel.org (Arnaldo Carvalho de Melo)
Date: Thu, 18 Aug 2016 17:40:53 -0300
Subject: [PATCH 2/3] tools lib: Reinstate strlcpy() header guard with
 __UCLIBC__
In-Reply-To: <1471552854-26972-1-git-send-email-acme@kernel.org>
References: <1471552854-26972-1-git-send-email-acme@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471552854-26972-3-git-send-email-acme@kernel.org>
To: linux-snps-arc@lists.infradead.org

From: Vineet Gupta <Vineet.Gupta1@synopsys.com>

perf tools build in recent kernels spews splat when cross compiling with uClibc:

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
__GLIBC__").

The problem is uClibc also defines __GLIBC__ for exported headers for
applications. So add that specific check to not trip for uClibc.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Cc: Adrian Hunter <adrian.hunter at intel.com>
Cc: Alexey Brodkin <Alexey.Brodkin at synopsys.com>
Cc: David Ahern <dsahern at gmail.com>
Cc: Jiri Olsa <jolsa at kernel.org>
Cc: Josh Poimboeuf <jpoimboe at redhat.com>
Cc: Namhyung Kim <namhyung at kernel.org>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Petri Gynther <pgynther at google.com>
Cc: Wang Nan <wangnan0 at huawei.com>
Cc: linux-snps-arc at lists.infradead.org
Link: http://lkml.kernel.org/r/1471537703-16439-1-git-send-email-vgupta at synopsys.com
Signed-off-by: Arnaldo Carvalho de Melo <acme at redhat.com>
---
 tools/include/linux/string.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/include/linux/string.h b/tools/include/linux/string.h
index b96879477311..f436d2420a18 100644
--- a/tools/include/linux/string.h
+++ b/tools/include/linux/string.h
@@ -8,7 +8,11 @@ void *memdup(const void *src, size_t len);
 
 int strtobool(const char *s, bool *res);
 
-#ifdef __GLIBC__
+/*
+ * glibc based builds needs the extern while uClibc doesn't.
+ * However uClibc headers also define __GLIBC__ hence the hack below
+ */
+#if defined(__GLIBC__) && !defined(__UCLIBC__)
 extern size_t strlcpy(char *dest, const char *src, size_t size);
 #endif
 
-- 
2.7.4
