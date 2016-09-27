From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Sep 2016 07:53:56 -0700
Subject: [PATCH] perf: remove orphan DEBUG_PERF_USE_VMALLOC
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1474988036-22260-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This doesn't seem to be used anywhere

Cc: Andrew Morton <akpm at linux-foundation.org>
Cc: Kees Cook <keescook at chromium.org>
Cc: Johannes Weiner <hannes at cmpxchg.org>
Cc: Tejun Heo <tj at kernel.org>
Cc: Arnd Bergmann <arnd at arndb.de>
Cc: Petr Mladek <pmladek at suse.com>
Cc: Ard Biesheuvel <ard.biesheuvel at linaro.org>
Cc: Thomas Garnier <thgarnie at google.com>
Cc: Nicolas Pitre <nicolas.pitre at linaro.org>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: linux-snps-arc at lists.infradead.org
Cc: linux-kernel at vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 init/Kconfig | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index cac3f096050d..934a61f6e2cc 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1707,19 +1707,6 @@ config PERF_EVENTS
 
 	  Say Y if unsure.
 
-config DEBUG_PERF_USE_VMALLOC
-	default n
-	bool "Debug: use vmalloc to back perf mmap() buffers"
-	depends on PERF_EVENTS && DEBUG_KERNEL && !PPC
-	select PERF_USE_VMALLOC
-	help
-	 Use vmalloc memory to back perf mmap() buffers.
-
-	 Mostly useful for debugging the vmalloc code on platforms
-	 that don't require it.
-
-	 Say N if unsure.
-
 endmenu
 
 config VM_EVENT_COUNTERS
-- 
2.7.4
