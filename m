From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:10:59 +0530
Subject: [PATCH 01/17] ARC: dw2 unwind: Elide generation of const propagated
 clones
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

arc_unwind_core() is entry point into the actual dwarf unwinder and it
gets called by various kernel APIs which provide the unwinding context
(e.g. current task vs. a specific task, current pt_regs vs. some other
crash context's pt_regs...)

Currently multiple const propagated clones of arc_unwind_core() are
generated, which seems superfluous. The only performance critical call
is for perf callgrap unwinding, which being in a different compilation
unit, uses ths vanilla, non cp version anyways.

So prevent the clone functions generation

bloat-o-meter report

| add/remove: 0/1 grow/shrink: 4/0 up/down: 40/-1152 (-1112)
| function                                     old     new   delta
| save_stack_trace                               4      16     +12
| save_stack_trace_tsk                           4      14     +10
| get_wchan                                      4      14     +10
| show_stacktrace                               40      48      +8
| arc_unwind_core.constprop                   1152       -   -1152

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/kernel/Makefile b/arch/arc/kernel/Makefile
index e7f3625a19b5..f90e5fd6d5c8 100644
--- a/arch/arc/kernel/Makefile
+++ b/arch/arc/kernel/Makefile
@@ -7,6 +7,7 @@
 
 # Pass UTS_MACHINE for user_regset definition
 CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
+CFLAGS_stacktrace.o	+= -fno-ipa-cp-clone
 
 obj-y	:= arcksyms.o setup.o irq.o time.o reset.o ptrace.o process.o devtree.o
 obj-y	+= signal.o traps.o sys.o troubleshoot.o stacktrace.o disasm.o clk.o
-- 
1.9.1
