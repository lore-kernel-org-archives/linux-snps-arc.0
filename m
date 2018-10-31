From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 31 Oct 2018 21:54:23 +0300
Subject: [PATCH] perf: Disable libunwind for ARC & RISCV64
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181031185423.21100-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

libunwind is not yet ported for ARC & RISCV64 and on attempt
to build it for those arches we just get an error message.

If we explicitly disable libunwind it is gracefully handled by
perf build system and it just gets configured to not use it
so perf is still usable even on those arches.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Khem Raj <raj.khem at gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index af099043e1..bae4948751 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -26,6 +26,10 @@ PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
 PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit"
 PACKAGECONFIG[manpages] = ",,xmlto-native asciidoc-native"
 
+# libunwind is not yet ported for some architectures
+PACKAGECONFIG_remove_arc = "libunwind"
+PACKAGECONFIG_remove_riscv64 = "libunwind"
+
 DEPENDS = " \
     virtual/${MLPREFIX}libc \
     ${MLPREFIX}elfutils \
-- 
2.16.2
