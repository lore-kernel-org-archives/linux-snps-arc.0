From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 16 May 2019 17:24:09 +0000
Subject: [PATCH 4/9] ARC: mm: do_page_fault refactor #3: tidyup vma access
 permission code
In-Reply-To: <1557880176-24964-5-git-send-email-vgupta@synopsys.com>
References: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
 <1557880176-24964-5-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1558027448.2682.11.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2019-05-14@17:29 -0700, Vineet Gupta wrote:
> The coding pattern to NOT intialize variables at declaration time but
> rather near code which makes us eof them makes it much easier to grok
> the overall logic, specially when the init is not simply 0 or 1
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/mm/fault.c | 39 +++++++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
> index f1175685d914..ae890a8d5ebf 100644
> --- a/arch/arc/mm/fault.c
> +++ b/arch/arc/mm/fault.c
> @@ -67,9 +67,9 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  	struct task_struct *tsk = current;
>  	struct mm_struct *mm = tsk->mm;
>  	int si_code = SEGV_MAPERR;
> +	unsigned int write = 0, exec = 0, mask;

Probably it's better to use 'bool' type for 'write' and 'exec' as we really use them as a boolean variables.


>  	vm_fault_t fault;
> -	int write = regs->ecr_cause & ECR_C_PROTV_STORE;  /* ST/EX */
> -	unsigned int flags = FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
> +	unsigned int flags;
>  
>  	/*
>  	 * NOTE! We MUST NOT take any locks for this case. We may
> @@ -91,8 +91,18 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  	if (faulthandler_disabled() || !mm)
>  		goto no_context;
>  
> +	if (regs->ecr_cause & ECR_C_PROTV_STORE)	/* ST/EX */
> +		write = 1;
> +	else if ((regs->ecr_vec == ECR_V_PROTV) &&
> +	         (regs->ecr_cause == ECR_C_PROTV_INST_FETCH))
> +		exec = 1;
> +
> +	flags = FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
>  	if (user_mode(regs))
>  		flags |= FAULT_FLAG_USER;
> +	if (write)
> +		flags |= FAULT_FLAG_WRITE;
> +
>  retry:
>  	down_read(&mm->mmap_sem);
>  
> @@ -105,24 +115,17 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  	}
>  
>  	/*
> -	 * Ok, we have a good vm_area for this memory access, so
> -	 * we can handle it..
> +	 * vm_area is good, now check permissions for this memory access
>  	 */
> -	si_code = SEGV_ACCERR;
> -
> -	/* Handle protection violation, execute on heap or stack */
> -
> -	if ((regs->ecr_vec == ECR_V_PROTV) &&
> -	    (regs->ecr_cause == ECR_C_PROTV_INST_FETCH))
> +	mask = VM_READ;
> +	if (write)
> +		mask = VM_WRITE;
> +	if (exec)
> +		mask = VM_EXEC;
> +
> +	if (!(vma->vm_flags & mask)) {
> +		si_code = SEGV_ACCERR;
>  		goto bad_area;
> -
> -	if (write) {
> -		if (!(vma->vm_flags & VM_WRITE))
> -			goto bad_area;
> -		flags |= FAULT_FLAG_WRITE;
> -	} else {
> -		if (!(vma->vm_flags & (VM_READ | VM_EXEC)))
> -			goto bad_area;
>  	}
>  
>  	/*
-- 
 Eugeniy Paltsev
