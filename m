From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 14 May 2019 17:29:34 -0700
Subject: [PATCH 7/9] ARC: mm: do_page_fault refactor #6: error handlers to use
 same pattern
In-Reply-To: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
References: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1557880176-24964-8-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

 - up_read
 - if !user_mode
 - whatever error handling

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/fault.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index c0a60aeb4abd..0e1a222a97ad 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -194,22 +194,21 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 bad_area:
 	up_read(&mm->mmap_sem);
 
-	/* User mode accesses just cause a SIGSEGV */
-	if (user_mode(regs)) {
-		tsk->thread.fault_address = address;
-		force_sig_fault(SIGSEGV, si_code, (void __user *)address, tsk);
-		return;
-	}
+	if (!user_mode(regs))
+		goto no_context;
+
+	tsk->thread.fault_address = address;
+	force_sig_fault(SIGSEGV, si_code, (void __user *)address, tsk);
+	return;
 
 out_of_memory:
 	up_read(&mm->mmap_sem);
 
-	if (user_mode(regs)) {
-		pagefault_out_of_memory();
-		return;
-	}
+	if (!user_mode(regs))
+		goto no_context;
 
-	goto no_context;
+	pagefault_out_of_memory();
+	return;
 
 do_sigbus:
 	up_read(&mm->mmap_sem);
-- 
2.7.4
