From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 29 Jun 2018 11:20:05 -0700
Subject: [PATCH] ARC: Improve handling of fatal signals in do_page_fault()
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180629182005.10243-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This was triggered by investigation of a deadlock after OOM killer invocation,
see [1] for more details.

Looks like our handling of fatal signal in do_page_fault() has some issues:

1. We only want to do special (read "early") handling of fatal signal
   if handle_mm_fault() returned VM_FAULT_RETRY so that we don't loop
   in retry loop endlessly, otherwise we'll handle that signal normally
   on exit from exception handler.

2. up_read() is not needed as indeed it will be done in __lock_page_or_retry()
   in mm/filemap.c.

With above comments in mind simplified version should be like that:
------------------------------->8---------------------------
	if (fatal_signal_pending(current)
		if (fault & VM_FAULT_RETRY)
			if (user_mode(regs))
				return;
------------------------------->8---------------------------

But looks like there's a room for improvement, see [2].
Instead of proceeding forward and then inevitably hitting retry path we
short-cut right to kernel fix-up code in no_context.

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2018-February/003403.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=746a272e44141af24a02f6c9b0f65f4c4598ed42

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/mm/fault.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index a0b7bd6d030d..17ed78e2f5eb 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -139,12 +139,16 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	 */
 	fault = handle_mm_fault(vma, address, flags);
 
-	/* If Pagefault was interrupted by SIGKILL, exit page fault "early" */
+	/* If we need to retry but a fatal signal is pending, handle the
+	 * signal first. We do not need to release the mmap_sem because
+	 * it would already be released in __lock_page_or_retry in
+	 * mm/filemap.c. */
 	if (unlikely(fatal_signal_pending(current))) {
-		if ((fault & VM_FAULT_ERROR) && !(fault & VM_FAULT_RETRY))
-			up_read(&mm->mmap_sem);
-		if (user_mode(regs))
+		if (fault & VM_FAULT_RETRY) {
+			if (!user_mode(regs))
+				goto no_context;
 			return;
+		}
 	}
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
-- 
2.17.1
