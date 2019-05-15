From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 14 May 2019 17:29:33 -0700
Subject: [PATCH 6/9] ARC: mm: do_page_fault refactor #5: scoot no_context to
 end
In-Reply-To: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
References: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1557880176-24964-7-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This is different than the rest of signal handling stuff

No functional change

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/fault.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index 7f211b493170..c0a60aeb4abd 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -201,20 +201,6 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 		return;
 	}
 
-no_context:
-	/* Are we prepared to handle this kernel fault?
-	 *
-	 * (The kernel has valid exception-points in the source
-	 *  when it accesses user-memory. When it fails in one
-	 *  of those points, we find it in a table and do a jump
-	 *  to some fixup code that loads an appropriate error
-	 *  code)
-	 */
-	if (fixup_exception(regs))
-		return;
-
-	die("Oops", regs, address);
-
 out_of_memory:
 	up_read(&mm->mmap_sem);
 
@@ -233,4 +219,11 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 
 	tsk->thread.fault_address = address;
 	force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *)address, tsk);
+	return;
+
+no_context:
+	if (fixup_exception(regs))
+		return;
+
+	die("Oops", regs, address);
 }
-- 
2.7.4
