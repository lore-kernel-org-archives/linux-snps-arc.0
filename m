From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Fri,  1 Sep 2017 12:39:57 +0100
Subject: [PATCH] arc: Re-enable MMU upon die()
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <d2b588da61b35312a3126b605685f22bc30fc3ae.1504265945.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

I recently came upon a scenario where I would get a double fault
after a machine check error. It turns out that for Ksymbol lookup
to work with modules we need to have MMU enabled because module
address is mapped in the cached space.

This patch re-enables the MMU before start printing the stacktrace
making stacktracing of modules work upon a fatal exception.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/kernel/traps.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arc/kernel/traps.c b/arch/arc/kernel/traps.c
index ff83e78..9533e06 100644
--- a/arch/arc/kernel/traps.c
+++ b/arch/arc/kernel/traps.c
@@ -19,6 +19,8 @@
 #include <linux/ptrace.h>
 #include <linux/kprobes.h>
 #include <linux/kgdb.h>
+#include <asm/arcregs.h>
+#include <asm/mmu.h>
 #include <asm/setup.h>
 #include <asm/unaligned.h>
 #include <asm/kprobes.h>
@@ -30,6 +32,9 @@ void __init trap_init(void)
 
 void die(const char *str, struct pt_regs *regs, unsigned long address)
 {
+	/* MMU must be enabled for Ksymbol lookup in modules */
+	write_aux_reg(ARC_REG_PID, MMU_ENABLE | read_aux_reg(ARC_REG_PID));
+
 	show_kernel_fault_diag(str, regs, address);
 
 	/* DEAD END */
-- 
1.9.1
