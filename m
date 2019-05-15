From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 14 May 2019 17:29:30 -0700
Subject: [PATCH 3/9] ARC: mm: do_page_fault refactor #2: remove short lived
 variable
In-Reply-To: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
References: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1557880176-24964-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Compiler will do this anyways, still..

No functional change.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/fault.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index 94d242740ac5..f1175685d914 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -67,23 +67,18 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	struct task_struct *tsk = current;
 	struct mm_struct *mm = tsk->mm;
 	int si_code = SEGV_MAPERR;
-	int ret;
 	vm_fault_t fault;
 	int write = regs->ecr_cause & ECR_C_PROTV_STORE;  /* ST/EX */
 	unsigned int flags = FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
 
 	/*
-	 * We fault-in kernel-space virtual memory on-demand. The
-	 * 'reference' page table is init_mm.pgd.
-	 *
 	 * NOTE! We MUST NOT take any locks for this case. We may
 	 * be in an interrupt or a critical region, and should
 	 * only copy the information from the master page table,
 	 * nothing more.
 	 */
 	if (address >= VMALLOC_START && !user_mode(regs)) {
-		ret = handle_kernel_vaddr_fault(address);
-		if (unlikely(ret))
+		if (unlikely(handle_kernel_vaddr_fault(address)))
 			goto no_context;
 		else
 			return;
-- 
2.7.4
