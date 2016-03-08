From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 8 Mar 2016 17:56:12 +0530
Subject: [PATCH v2 9/9] ARC: RIP arc_{get|set}_core_freq() clk API
In-Reply-To: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
References: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457439972-20285-10-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Alexey Brodkin <abrodkin@synopsys.com>

There are no more users of this - so RIP!

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
[vgupta: update changelog]
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/clk.h | 22 ----------------------
 arch/arc/kernel/Makefile   |  2 +-
 arch/arc/kernel/clk.c      | 21 ---------------------
 arch/arc/kernel/devtree.c  |  7 -------
 4 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 arch/arc/include/asm/clk.h
 delete mode 100644 arch/arc/kernel/clk.c

diff --git a/arch/arc/include/asm/clk.h b/arch/arc/include/asm/clk.h
deleted file mode 100644
index bf9d29f5bd53..000000000000
--- a/arch/arc/include/asm/clk.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * Copyright (C) 2012 Synopsys, Inc. (www.synopsys.com)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-#ifndef _ASM_ARC_CLK_H
-#define _ASM_ARC_CLK_H
-
-/* Although we can't really hide core_freq, the accessor is still better way */
-extern unsigned long core_freq;
-
-static inline unsigned long arc_get_core_freq(void)
-{
-	return core_freq;
-}
-
-extern int arc_set_core_freq(unsigned long);
-
-#endif
diff --git a/arch/arc/kernel/Makefile b/arch/arc/kernel/Makefile
index e7f3625a19b5..4f16967a0871 100644
--- a/arch/arc/kernel/Makefile
+++ b/arch/arc/kernel/Makefile
@@ -9,7 +9,7 @@
 CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
 
 obj-y	:= arcksyms.o setup.o irq.o time.o reset.o ptrace.o process.o devtree.o
-obj-y	+= signal.o traps.o sys.o troubleshoot.o stacktrace.o disasm.o clk.o
+obj-y	+= signal.o traps.o sys.o troubleshoot.o stacktrace.o disasm.o
 obj-$(CONFIG_ISA_ARCOMPACT)		+= entry-compact.o intc-compact.o
 obj-$(CONFIG_ISA_ARCV2)			+= entry-arcv2.o intc-arcv2.o
 
diff --git a/arch/arc/kernel/clk.c b/arch/arc/kernel/clk.c
deleted file mode 100644
index 10c7b0b5a079..000000000000
--- a/arch/arc/kernel/clk.c
+++ /dev/null
@@ -1,21 +0,0 @@
-/*
- * Copyright (C) 2012 Synopsys, Inc. (www.synopsys.com)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-#include <asm/clk.h>
-
-unsigned long core_freq = 80000000;
-
-/*
- * As of now we default to device-tree provided clock
- * In future we can determine this in early boot
- */
-int arc_set_core_freq(unsigned long freq)
-{
-	core_freq = freq;
-	return 0;
-}
diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
index fecbc96df828..f1e07c2344f8 100644
--- a/arch/arc/kernel/devtree.c
+++ b/arch/arc/kernel/devtree.c
@@ -14,7 +14,6 @@
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
-#include <asm/clk.h>
 #include <asm/mach_desc.h>
 
 #ifdef CONFIG_SERIAL_EARLYCON
@@ -63,8 +62,6 @@ const struct machine_desc * __init setup_machine_fdt(void *dt)
 {
 	const struct machine_desc *mdesc;
 	unsigned long dt_root;
-	const void *clk;
-	int len;
 
 	if (!early_init_dt_scan(dt))
 		return NULL;
@@ -74,10 +71,6 @@ const struct machine_desc * __init setup_machine_fdt(void *dt)
 		machine_halt();
 
 	dt_root = of_get_flat_dt_root();
-	clk = of_get_flat_dt_prop(dt_root, "clock-frequency", &len);
-	if (clk)
-		arc_set_core_freq(of_read_ulong(clk, len/4));
-
 	arc_set_early_base_baud(dt_root);
 
 	return mdesc;
-- 
2.5.0
