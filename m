From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 22 Aug 2016 20:33:42 +0300
Subject: [PATCH] perf tools: Fix static building
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471887222-26270-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

With commit e3d09ec8126f ("tools lib traceevent: Export dynamic symbols
used by traceevent plugins") we started to add "--dynamic-list" in
LDFLAGS. One side-effect of that was inability to build really
statically-linked perf.

I.e. even if "LDFLAGS=-static" were passed on perf building command-line
it had no effect and perf was built dynamically.

This change disables setup of "--dynamic-list" if LDFLAGS contains
"-static" option.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Arnaldo Carvalho de Melo <acme at redhat.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Wang Nan <wangnan0 at huawei.com>
Cc: Jiri Olsa <jolsa at kernel.org>
Cc: He Kuang <hekuang at huawei.com>
Cc: Masami Hiramatsu <masami.hiramatsu.pt at hitachi.com>
Cc: Namhyung Kim <namhyung at kernel.org>
Cc: Peter Zijlstra <a.p.zijlstra at chello.nl>
Cc: Zefan Li <lizefan at huawei.com>
Cc: pi3orama at 163.com
---
 tools/perf/Makefile.perf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 2d908750..e9acc7c 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -236,7 +236,9 @@ LIBTRACEEVENT = $(TE_PATH)libtraceevent.a
 export LIBTRACEEVENT
 
 LIBTRACEEVENT_DYNAMIC_LIST = $(TE_PATH)libtraceevent-dynamic-list
+ifeq ($(filter -static,$(LDFLAGS)),)
 LIBTRACEEVENT_DYNAMIC_LIST_LDFLAGS = -Xlinker --dynamic-list=$(LIBTRACEEVENT_DYNAMIC_LIST)
+endif
 
 LIBAPI = $(API_PATH)libapi.a
 export LIBAPI
-- 
2.7.4
