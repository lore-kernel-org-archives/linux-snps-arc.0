From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 13 May 2019 16:15:01 +0000
Subject: [PATCH] ARC: Send SIGSEGV if userspace process accesses kernel
 virtual memory
References: <20190513144153.6112-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501A2512567@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 5/13/19 7:41 AM, Eugeniy Paltsev wrote:
> As of today if userspace process tries to access address which belongs
> to kernel virtual memory area and kernel have mapping for this address
> that process hangs instead of receiving SIGSEGV and being killed.
>
> Steps to reproduce:
> Create userspace application which reads from the beginning of
> kernel-space virtual memory area (I.E. read from 0x7000_0000 on most
> of existing platforms):
> ------------------------>8-----------------
>  #include <stdlib.h>
>  #include <stdint.h>
>
>  int main(int argc, char *argv[])
>  {
>  	volatile uint32_t temp;
>
>  	temp = *(uint32_t *)(0x70000000);
>  }
> ------------------------>8-----------------
> That application hangs after such memory access.
>
> Fix that by checking which access (user or kernel) caused the exception
> before handling kernel virtual address fault.
>
> Cc: <stable at vger.kernel.org> # 4.20+
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  arch/arc/mm/fault.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
> index 8df1638259f3..53fb4ba6cd08 100644
> --- a/arch/arc/mm/fault.c
> +++ b/arch/arc/mm/fault.c
> @@ -66,7 +66,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  	struct vm_area_struct *vma = NULL;
>  	struct task_struct *tsk = current;
>  	struct mm_struct *mm = tsk->mm;
> -	int si_code = 0;
> +	int si_code = SEGV_ACCERR;
>  	int ret;
>  	vm_fault_t fault;
>  	int write = regs->ecr_cause & ECR_C_PROTV_STORE;  /* ST/EX */
> @@ -82,6 +82,10 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  	 * nothing more.
>  	 */
>  	if (address >= VMALLOC_START) {
> +		/* Forbid userspace to access kernel-space virtual memory */
> +		if (unlikely(user_mode(regs)))
> +			goto bad_area_nosemaphore;
> +
>  		ret = handle_kernel_vaddr_fault(address);
>  		if (unlikely(ret))
>  			goto bad_area_nosemaphore;

LGTM. However I have an old patch as part of do_page_fault cleanup - the idea is
to delete one label, but hopefully it will fix ur case too - can u please give it
a spin with ur test case and report here. I will update the changelog

---->
>From 942c55d1ccbd3db12409a3dcdb1d20747041862b Mon Sep 17 00:00:00 2001
From: Vineet Gupta <vgupta@synopsys.com>
Date: Mon, 10 Dec 2018 18:15:17 -0800
Subject: [PATCH] ARC: mm: do_page_fault fixes #2: remove label
 bad_area_nosemaphore

This is first step in untangling the code mess.

VMALLOC_FAULT is only handled kernel mode so failure in its handling can
assume kernel mode, thus we can use @no_context label, removing the need
for @bad_area_nosemaphore

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/fault.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index 8df1638259f3..342c0820c9e3 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -81,10 +81,10 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
      * only copy the information from the master page table,
      * nothing more.
      */
-    if (address >= VMALLOC_START) {
+    if (address >= VMALLOC_START && !user_mode(regs)) {
         ret = handle_kernel_vaddr_fault(address);
         if (unlikely(ret))
-            goto bad_area_nosemaphore;
+            goto no_context;
         else
             return;
     }
@@ -198,7 +198,6 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 bad_area:
     up_read(&mm->mmap_sem);
 
-bad_area_nosemaphore:
     /* User mode accesses just cause a SIGSEGV */
     if (user_mode(regs)) {
         tsk->thread.fault_address = address;
-- 
2.7.4
