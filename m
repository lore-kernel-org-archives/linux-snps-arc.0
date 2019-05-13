From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 13 May 2019 17:41:53 +0300
Subject: [PATCH] ARC: Send SIGSEGV if userspace process accesses kernel
 virtual memory
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190513144153.6112-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As of today if userspace process tries to access address which belongs
to kernel virtual memory area and kernel have mapping for this address
that process hangs instead of receiving SIGSEGV and being killed.

Steps to reproduce:
Create userspace application which reads from the beginning of
kernel-space virtual memory area (I.E. read from 0x7000_0000 on most
of existing platforms):
------------------------>8-----------------
 #include <stdlib.h>
 #include <stdint.h>

 int main(int argc, char *argv[])
 {
 	volatile uint32_t temp;

 	temp = *(uint32_t *)(0x70000000);
 }
------------------------>8-----------------
That application hangs after such memory access.

Fix that by checking which access (user or kernel) caused the exception
before handling kernel virtual address fault.

Cc: <stable at vger.kernel.org> # 4.20+
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/mm/fault.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index 8df1638259f3..53fb4ba6cd08 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -66,7 +66,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	struct vm_area_struct *vma = NULL;
 	struct task_struct *tsk = current;
 	struct mm_struct *mm = tsk->mm;
-	int si_code = 0;
+	int si_code = SEGV_ACCERR;
 	int ret;
 	vm_fault_t fault;
 	int write = regs->ecr_cause & ECR_C_PROTV_STORE;  /* ST/EX */
@@ -82,6 +82,10 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 	 * nothing more.
 	 */
 	if (address >= VMALLOC_START) {
+		/* Forbid userspace to access kernel-space virtual memory */
+		if (unlikely(user_mode(regs)))
+			goto bad_area_nosemaphore;
+
 		ret = handle_kernel_vaddr_fault(address);
 		if (unlikely(ret))
 			goto bad_area_nosemaphore;
-- 
2.14.5
