From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Fri,  1 Sep 2017 17:05:49 +0100
Subject: [PATCH v3] arc: Re-enable MMU upon a Machine Check exception
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <d0f55ba3b94de5c1bb7c93cbadb9829fa6889fed.1504281896.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

I recently came upon a scenario where I would get a double fault
after a machine check error. It turns out that for Ksymbol lookup
to work with modules we need to have MMU enabled because module
address is mapped in the cached space.

This patch re-enables the MMU before calling die() so that
stacktracing of modules work when a machine check exception happens.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>

Changes from v2:
	- Rephrased commit title and description
Changes from v1:
	- Moved MMU re-enable to machine check exception handler
---
 arch/arc/kernel/traps.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arc/kernel/traps.c b/arch/arc/kernel/traps.c
index ff83e78..d92f161 100644
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
@@ -103,6 +105,9 @@ int do_misaligned_access(unsigned long address, struct pt_regs *regs,
  */
 void do_machine_check_fault(unsigned long address, struct pt_regs *regs)
 {
+	/* MMU must be enabled for Ksymbol lookup in modules */
+	write_aux_reg(ARC_REG_PID, MMU_ENABLE | read_aux_reg(ARC_REG_PID));
+
 	die("Machine Check Exception", regs, address);
 }
 
-- 
1.9.1
