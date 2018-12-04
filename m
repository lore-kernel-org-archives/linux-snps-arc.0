From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue,  4 Dec 2018 20:51:18 +0300
Subject: [PATCH] ARC: introduce basic 'perf annotate' support for ARC
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181204175118.25232-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Introduce basic 'perf annotate' support for ARC to be able
to use anotation via stdio interface.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 tools/perf/arch/arc/annotate/instructions.c |  9 +++++++++
 tools/perf/arch/common.c                    | 11 ++++++++++-
 tools/perf/util/annotate.c                  |  5 +++++
 3 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 tools/perf/arch/arc/annotate/instructions.c

diff --git a/tools/perf/arch/arc/annotate/instructions.c b/tools/perf/arch/arc/annotate/instructions.c
new file mode 100644
index 000000000000..2f00e995c7e3
--- /dev/null
+++ b/tools/perf/arch/arc/annotate/instructions.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/compiler.h>
+
+static int arc__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
+{
+	arch->initialized = true;
+	arch->objdump.comment_char = ';';
+	return 0;
+}
diff --git a/tools/perf/arch/common.c b/tools/perf/arch/common.c
index 82657c01a3b8..f7cb57c424d1 100644
--- a/tools/perf/arch/common.c
+++ b/tools/perf/arch/common.c
@@ -5,6 +5,13 @@
 #include "../util/util.h"
 #include "../util/debug.h"
 
+const char *const arc_triplets[] = {
+	"arc-linux-",
+	"arc-snps-linux-uclibc-",
+	"arc-snps-linux-gnu-",
+	NULL
+};
+
 const char *const arm_triplets[] = {
 	"arm-eabi-",
 	"arm-linux-androideabi-",
@@ -147,7 +154,9 @@ static int perf_env__lookup_binutils_path(struct perf_env *env,
 		zfree(&buf);
 	}
 
-	if (!strcmp(arch, "arm"))
+	if (!strcmp(arch, "arc"))
+		path_list = arc_triplets;
+	else if (!strcmp(arch, "arm"))
 		path_list = arm_triplets;
 	else if (!strcmp(arch, "arm64"))
 		path_list = arm64_triplets;
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 6936daf89ddd..66066fb4d644 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -134,6 +134,7 @@ static int arch__associate_ins_ops(struct arch* arch, const char *name, struct i
 	return 0;
 }
 
+#include "arch/arc/annotate/instructions.c"
 #include "arch/arm/annotate/instructions.c"
 #include "arch/arm64/annotate/instructions.c"
 #include "arch/x86/annotate/instructions.c"
@@ -142,6 +143,10 @@ static int arch__associate_ins_ops(struct arch* arch, const char *name, struct i
 #include "arch/sparc/annotate/instructions.c"
 
 static struct arch architectures[] = {
+	{
+		.name = "arc",
+		.init = arc__annotate_init,
+	},
 	{
 		.name = "arm",
 		.init = arm__annotate_init,
-- 
2.14.5
