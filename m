From: ben@decadent.org.uk (Ben Hutchings)
Date: Thu, 07 Jun 2018 15:05:21 +0100
Subject: [PATCH 3.16 267/410] arm64: do not use print_symbol()
In-Reply-To: <lsq.1528380320.647747352@decadent.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <lsq.1528380321.214381661@decadent.org.uk>
To: linux-snps-arc@lists.infradead.org

3.16.57-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>

commit 4ef7963843d3243260aa335dfb9cb2fede06aacf upstream.

print_symbol() is a very old API that has been obsoleted by %pS format
specifier in a normal printk() call.

Replace print_symbol() with a direct printk("%pS") call.

Link: http://lkml.kernel.org/r/20171211125025.2270-3-sergey.senozhatsky at gmail.com
To: Andrew Morton <akpm at linux-foundation.org>
To: Russell King <linux at armlinux.org.uk>
To: Catalin Marinas <catalin.marinas at arm.com>
To: Mark Salter <msalter at redhat.com>
To: Tony Luck <tony.luck at intel.com>
To: David Howells <dhowells at redhat.com>
To: Yoshinori Sato <ysato at users.sourceforge.jp>
To: Guan Xuetao <gxt at mprc.pku.edu.cn>
To: Borislav Petkov <bp at alien8.de>
To: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
To: Thomas Gleixner <tglx at linutronix.de>
To: Peter Zijlstra <peterz at infradead.org>
To: Vineet Gupta <vgupta at synopsys.com>
To: Fengguang Wu <fengguang.wu at intel.com>
Cc: Steven Rostedt <rostedt at goodmis.org>
Cc: Petr Mladek <pmladek at suse.com>
Cc: LKML <linux-kernel at vger.kernel.org>
Cc: linux-arm-kernel at lists.infradead.org
Cc: linux-c6x-dev at linux-c6x.org
Cc: linux-ia64 at vger.kernel.org
Cc: linux-am33-list at redhat.com
Cc: linux-sh at vger.kernel.org
Cc: linux-edac at vger.kernel.org
Cc: x86 at kernel.org
Cc: linux-snps-arc at lists.infradead.org
Cc: Catalin Marinas <catalin.marinas at arm.com>
Cc: Will Deacon <will.deacon at arm.com>
Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
[pmladek at suse.com: updated commit message]
Signed-off-by: Petr Mladek <pmladek at suse.com>
[bwh: Backported to 3.16: adjust context]
Signed-off-by: Ben Hutchings <ben at decadent.org.uk>
---
 arch/arm64/kernel/process.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -31,7 +31,6 @@
 #include <linux/delay.h>
 #include <linux/reboot.h>
 #include <linux/interrupt.h>
-#include <linux/kallsyms.h>
 #include <linux/init.h>
 #include <linux/cpu.h>
 #include <linux/elfcore.h>
@@ -198,8 +197,8 @@ void __show_regs(struct pt_regs *regs)
 	}
 
 	show_regs_print_info(KERN_DEFAULT);
-	print_symbol("pc : %s\n", regs->pc);
-	print_symbol("lr : %s\n", lr);
+	printk("pc : %pS\n", (void *)regs->pc);
+	printk("lr : %pS\n", (void *)lr);
 	printk("sp : %016llx pstate : %08llx\n", sp, regs->pstate);
 	for (i = top_reg; i >= 0; i--) {
 		printk("x%-2d: %016llx ", i, regs->regs[i]);
