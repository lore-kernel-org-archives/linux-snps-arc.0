From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 8 Dec 2017 11:12:41 -0800
Subject: [PATCH 2/2] ARC: provide for gcc "isolate path" induced generated
 abort calls
In-Reply-To: <1512760361-17663-1-git-send-email-vgupta@synopsys.com>
References: <1512760361-17663-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1512760361-17663-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

gcc toggle -fisolate-erroneous-paths-dereference (default at -O2
onwards) isolates faulty code paths such as null pointer access, divide
by zero etc. If gcc port doesnt implement __builtin_trap, an abort() is
generated which causes kernel link error hence this patch.

FWIW ARC gcc now has the builtin, but we need to handle this error for
older toolchains.

The code in question triggering gcc is in lib/mpi/mpih-div.o

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 9d27331fe69a..5e180090b17f 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -19,6 +19,7 @@
 #include <linux/of_fdt.h>
 #include <linux/of.h>
 #include <linux/cache.h>
+#include <linux/reboot.h>
 #include <asm/sections.h>
 #include <asm/arcregs.h>
 #include <asm/tlb.h>
@@ -637,3 +638,8 @@ static int __init topology_init(void)
 }
 
 subsys_initcall(topology_init);
+
+void __weak abort(void)
+{
+	machine_halt();
+}
-- 
2.7.4
