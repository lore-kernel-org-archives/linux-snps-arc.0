From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 14 May 2019 17:29:35 -0700
Subject: [PATCH 8/9] ARC: mm: do_page_fault refactor #7: fold the various
 error handling
In-Reply-To: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
References: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1557880176-24964-9-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

 - single up_read() call vs. 4
 - so much easier on eyes

Technically it seems like @bad_area label moved up, but even in old
regime, it was a special case of delivering SIGSEGV unconditionally
which we now do as well, although with checks.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/fault.c | 46 +++++++++++++---------------------------------
 1 file changed, 13 insertions(+), 33 deletions(-)

diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index 0e1a222a97ad..20402217d9da 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -66,7 +66,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	struct vm_area_struct *vma = NULL;
 	struct task_struct *tsk = current;
 	struct mm_struct *mm = tsk->mm;
-	int si_code = SEGV_MAPERR;
+	int sig, si_code = SEGV_MAPERR;
 	unsigned int write = 0, exec = 0, mask;
 	vm_fault_t fault;			/* handle_mm_fault() output */
 	unsigned int flags;			/* handle_mm_fault() input */
@@ -177,47 +177,27 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 		return;
 	}
 
-	if (fault & VM_FAULT_OOM)
-		goto out_of_memory;
-	else if (fault & VM_FAULT_SIGSEGV)
-		goto bad_area;
-	else if (fault & VM_FAULT_SIGBUS)
-		goto do_sigbus;
-
-	/* no man's land */
-	BUG();
-
-	/*
-	 * Something tried to access memory that isn't in our memory map..
-	 * Fix it, but check if it's kernel or user first..
-	 */
 bad_area:
 	up_read(&mm->mmap_sem);
 
 	if (!user_mode(regs))
 		goto no_context;
 
-	tsk->thread.fault_address = address;
-	force_sig_fault(SIGSEGV, si_code, (void __user *)address, tsk);
-	return;
-
-out_of_memory:
-	up_read(&mm->mmap_sem);
-
-	if (!user_mode(regs))
-		goto no_context;
-
-	pagefault_out_of_memory();
-	return;
-
-do_sigbus:
-	up_read(&mm->mmap_sem);
+	if (fault & VM_FAULT_OOM) {
+		pagefault_out_of_memory();
+		return;
+	}
 
-	if (!user_mode(regs))
-		goto no_context;
+	if (fault & VM_FAULT_SIGBUS) {
+		sig = SIGBUS;
+		si_code = BUS_ADRERR;
+	}
+	else {
+		sig = SIGSEGV;
+	}
 
 	tsk->thread.fault_address = address;
-	force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *)address, tsk);
+	force_sig_fault(sig, si_code, (void __user *)address, tsk);
 	return;
 
 no_context:
-- 
2.7.4
