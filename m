From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 14 May 2019 17:29:32 -0700
Subject: [PATCH 5/9] ARC: mm: do_page_fault refactor #4: consolidate retry
 related logic
In-Reply-To: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
References: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1557880176-24964-6-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

stats update code can now elide "retry" check and additional level of
indentation since all retry handling is done ahead of it already

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/fault.c | 60 +++++++++++++++++++++++++++--------------------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index ae890a8d5ebf..7f211b493170 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -68,8 +68,8 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	struct mm_struct *mm = tsk->mm;
 	int si_code = SEGV_MAPERR;
 	unsigned int write = 0, exec = 0, mask;
-	vm_fault_t fault;
-	unsigned int flags;
+	vm_fault_t fault;			/* handle_mm_fault() output */
+	unsigned int flags;			/* handle_mm_fault() input */
 
 	/*
 	 * NOTE! We MUST NOT take any locks for this case. We may
@@ -128,49 +128,51 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 		goto bad_area;
 	}
 
-	/*
-	 * If for any reason at all we couldn't handle the fault,
-	 * make sure we exit gracefully rather than endlessly redo
-	 * the fault.
-	 */
 	fault = handle_mm_fault(vma, address, flags);
 
-	if (fatal_signal_pending(current)) {
+	/*
+	 * Fault retry nuances
+	 */
+	if (unlikely(fault & VM_FAULT_RETRY)) {
 
 		/*
-		 * if fault retry, mmap_sem already relinquished by core mm
-		 * so OK to return to user mode (with signal handled first)
+		 * If fault needs to be retried, handle any pending signals
+		 * first (by returning to user mode).
+		 * mmap_sem already relinquished by core mm for RETRY case
 		 */
-		if (fault & VM_FAULT_RETRY) {
+		if (fatal_signal_pending(current)) {
 			if (!user_mode(regs))
 				goto no_context;
 			return;
 		}
+		/*
+		 * retry state machine
+		 */
+		if (flags & FAULT_FLAG_ALLOW_RETRY) {
+			flags &= ~FAULT_FLAG_ALLOW_RETRY;
+			flags |= FAULT_FLAG_TRIED;
+			goto retry;
+		}
 	}
 
+	/*
+	 * Major/minor page fault accounting
+	 * (in case of retry we only land here once)
+	 */
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 
 	if (likely(!(fault & VM_FAULT_ERROR))) {
-		if (flags & FAULT_FLAG_ALLOW_RETRY) {
-			/* To avoid updating stats twice for retry case */
-			if (fault & VM_FAULT_MAJOR) {
-				tsk->maj_flt++;
-				perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ, 1,
-					      regs, address);
-			} else {
-				tsk->min_flt++;
-				perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1,
-					      regs, address);
-			}
-
-			if (fault & VM_FAULT_RETRY) {
-				flags &= ~FAULT_FLAG_ALLOW_RETRY;
-				flags |= FAULT_FLAG_TRIED;
-				goto retry;
-			}
+		if (fault & VM_FAULT_MAJOR) {
+			tsk->maj_flt++;
+			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ, 1,
+				      regs, address);
+		} else {
+			tsk->min_flt++;
+			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1,
+				      regs, address);
 		}
 
-		/* Fault Handled Gracefully */
+		/* Normal return path: fault Handled Gracefully */
 		up_read(&mm->mmap_sem);
 		return;
 	}
-- 
2.7.4
