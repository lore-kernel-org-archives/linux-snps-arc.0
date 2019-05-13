From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 13 May 2019 11:11:35 -0700
Subject: [PATCH v2] ARC: Send SIGSEGV if userspace process accesses kernel
 virtual memory
In-Reply-To: <20190513172800.27940-1-Eugeniy.Paltsev@synopsys.com>
References: <20190513172800.27940-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <771bef88-7691-18d4-76a7-6d6eafcc1b37@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 5/13/19 10:28 AM, Eugeniy Paltsev wrote:
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
> Fix that by checking that VMALLOC_FAULT was caused in kernel mode
> before trying to handle it.

Merge both the line above, say ... "Ensure that kernel virtual addresses are only
handled for faults in kernel mode"

> Thus we can use @no_context label, removing the need for
> @bad_area_nosemaphore and untangling the code mess a bit.

Say ... "And while we are here, remove @bad_area_nosemaphore label, untangling the
code mess a bit"

> 
> Cc: <stable at vger.kernel.org> # 4.20+

Why just 4.20, this needs to go back as far as possible !

> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  arch/arc/mm/fault.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
> index 8df1638259f3..6836095251ed 100644
> --- a/arch/arc/mm/fault.c
> +++ b/arch/arc/mm/fault.c
> @@ -66,7 +66,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  	struct vm_area_struct *vma = NULL;
>  	struct task_struct *tsk = current;
>  	struct mm_struct *mm = tsk->mm;
> -	int si_code = 0;
> +	int si_code = SEGV_MAPERR;
>  	int ret;
>  	vm_fault_t fault;
>  	int write = regs->ecr_cause & ECR_C_PROTV_STORE;  /* ST/EX */
> @@ -81,16 +81,14 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  	 * only copy the information from the master page table,
>  	 * nothing more.
>  	 */
> -	if (address >= VMALLOC_START) {
> +	if (address >= VMALLOC_START && !user_mode(regs)) {
>  		ret = handle_kernel_vaddr_fault(address);
>  		if (unlikely(ret))
> -			goto bad_area_nosemaphore;
> +			goto no_context;
>  		else
>  			return;
>  	}
>  
> -	si_code = SEGV_MAPERR;
> -
>  	/*
>  	 * If we're in an interrupt or have no user
>  	 * context, we must not take the fault..
> @@ -198,7 +196,6 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  bad_area:
>  	up_read(&mm->mmap_sem);
>  
> -bad_area_nosemaphore:
>  	/* User mode accesses just cause a SIGSEGV */
>  	if (user_mode(regs)) {
>  		tsk->thread.fault_address = address;
> 
