From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 29 Jun 2018 22:39:07 +0300
Subject: [PATCH] ARC: prevent showing irrelevant exception info in signal
 message
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180629193907.17227-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

We process signals in the end of syscall/exception handler.
It the signal is fatal we print register's content using
show_regs function. show_regs() also prints information about
last exception happened.

In case of multicore system we can catch the situation when we
will print wrong information about exception. See the example:
______________________________
CPU-0: started to handle page fault
CPU-1: sent signal to process, which is executed on CPU-0
CPU-0: ended page fault handle. Started to process signal before
       returnig to userspace. Process signal, which is send from
       CPU-0. As th signal is fatal we call show_regs().
       show_regs() will show information about last exception
       which is *page fault* (instead of "trap" which is used for
       signals and happened on CPU-0)

So we will get message like this:
    /home/waitpid02
  potentially unexpected fatal signal 8.
  Path: /home/waitpid02
  CPU: 0 PID: 100 Comm: waitpid02 Not tainted 4.10.0-rc4 #2
  task: 9f11c200 task.stack: 9f3ae000

  [ECR   ]: 0x00050200 => Invalid Write @ 0x00000000 by insn @ 0x000123ec
  [EFA   ]: 0x00000000
  [BLINK ]: 0x123ea
  [ERET  ]: 0x123ec
    @off 0x123ec in [/home/waitpid02]
    VMA: 0x00010000 to 0x00016000
  [STAT32]: 0x80080882 : IE U
  BTA: 0x000123ea  SP: 0x5ffd3db0  FP: 0x00000000
  LPS: 0x20031684 LPE: 0x2003169a LPC: 0x00000006
  [-----other-info-----]

This message is confusing because it show information about page fault
( [ECR   ]: 0x00050200 => Invalid Write ) which is absolutely irrelevant
to signal.

This situation was reproduced with waitpid02 LTP test.
_____________________________

So remove printing information about exceptions from show_regs()
to avoid confusing messages. Print information about exceptions
only in required places instead of show_regs()

Now we don't print information about exceptions if signal is simply
send by another userspace app. So in case of waitpid02 we will print
next message:
_____________________________
    ./waitpid02
  potentially unexpected fatal signal 8.
  [STAT32]: 0x80080082 : IE U
  BTA: 0x20000fc4	 SP: 0x5ff8bd64	 FP: 0x00000000
  LPS: 0x200524a0	LPE: 0x200524b6	LPC: 0x00000006
  [-----other-info-----]
_____________________________

This patch fix
STAR 9001146055: waitpid02: Invalid Write @ 0x00000000 by insn @ 0x000123ec

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/include/asm/bug.h     |  1 +
 arch/arc/kernel/traps.c        |  1 +
 arch/arc/kernel/troubleshoot.c | 27 ++++++++++++++++++++-------
 arch/arc/mm/fault.c            |  2 ++
 4 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/arch/arc/include/asm/bug.h b/arch/arc/include/asm/bug.h
index 21ec82466d62..b9fd60f7d36b 100644
--- a/arch/arc/include/asm/bug.h
+++ b/arch/arc/include/asm/bug.h
@@ -16,6 +16,7 @@
 struct task_struct;
 
 void show_regs(struct pt_regs *regs);
+void show_exception_regs(struct pt_regs *regs);
 void show_stacktrace(struct task_struct *tsk, struct pt_regs *regs);
 void show_kernel_fault_diag(const char *str, struct pt_regs *regs,
 			    unsigned long address);
diff --git a/arch/arc/kernel/traps.c b/arch/arc/kernel/traps.c
index b123558bf0bb..fe41f0d9488f 100644
--- a/arch/arc/kernel/traps.c
+++ b/arch/arc/kernel/traps.c
@@ -50,6 +50,7 @@ unhandled_exception(const char *str, struct pt_regs *regs, siginfo_t *info)
 		tsk->thread.fault_address = (__force unsigned int)info->si_addr;
 
 		force_sig_info(info->si_signo, info, tsk);
+		show_exception_regs(regs);
 
 	} else {
 		/* If not due to copy_(to|from)_user, we are doomed */
diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
index 783b20354f8b..313aea25e638 100644
--- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -170,14 +170,9 @@ static void show_ecr_verbose(struct pt_regs *regs)
 	}
 }
 
-/************************************************************************
- *  API called by rest of kernel
- ***********************************************************************/
-
-void show_regs(struct pt_regs *regs)
+void show_exception_regs(struct pt_regs *regs)
 {
 	struct task_struct *tsk = current;
-	struct callee_regs *cregs;
 	char *buf;
 
 	buf = (char *)__get_free_page(GFP_KERNEL);
@@ -190,12 +185,28 @@ void show_regs(struct pt_regs *regs)
 	show_ecr_verbose(regs);
 
 	pr_info("[EFA   ]: 0x%08lx\n[BLINK ]: %pS\n[ERET  ]: %pS\n",
-		current->thread.fault_address,
+		tsk->thread.fault_address,
 		(void *)regs->blink, (void *)regs->ret);
 
 	if (user_mode(regs))
 		show_faulting_vma(regs->ret, buf); /* faulting code, not data */
 
+	free_page((unsigned long)buf);
+}
+
+/************************************************************************
+ *  API called by rest of kernel
+ ***********************************************************************/
+
+void show_regs(struct pt_regs *regs)
+{
+	struct callee_regs *cregs;
+	char *buf;
+
+	buf = (char *)__get_free_page(GFP_KERNEL);
+	if (!buf)
+		return;
+
 	pr_info("[STAT32]: 0x%08lx", regs->status32);
 
 #define STS_BIT(r, bit)	r->status32 & STATUS_##bit##_MASK ? #bit" " : ""
@@ -238,6 +249,8 @@ void show_kernel_fault_diag(const char *str, struct pt_regs *regs,
 	/* Show fault description */
 	pr_info("\n%s\n", str);
 
+	show_exception_regs(regs);
+
 	/* Caller and Callee regs */
 	show_regs(regs);
 
diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index a0b7bd6d030d..7e0e2591bb27 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -200,6 +200,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 		/* info.si_code has been set above */
 		info.si_addr = (void __user *)address;
 		force_sig_info(SIGSEGV, &info, tsk);
+		show_exception_regs(regs);
 		return;
 	}
 
@@ -239,4 +240,5 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	info.si_code = BUS_ADRERR;
 	info.si_addr = (void __user *)address;
 	force_sig_info(SIGBUS, &info, tsk);
+	show_exception_regs(regs);
 }
-- 
2.14.4
