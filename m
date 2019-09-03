From: ebiederm@xmission.com (Eric W. Biederman)
Date: Tue, 03 Sep 2019 11:49:16 -0500
Subject: [PATCH AUTOSEL 4.19 111/167] signal/arc: Use force_sig_fault
 where appropriate
In-Reply-To: <20190903162519.7136-111-sashal@kernel.org> (Sasha Levin's
 message of "Tue, 3 Sep 2019 12:24:23 -0400")
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-111-sashal@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87ef0xqq9f.fsf@x220.int.ebiederm.org>
To: linux-snps-arc@lists.infradead.org

Sasha Levin <sashal at kernel.org> writes:

> From: "Eric W. Biederman" <ebiederm at xmission.com>
>
> [ Upstream commit 15773ae938d8d93d982461990bebad6e1d7a1830 ]

To the best of my knowledge this is just a clean up, no changes in
behavior are present.

The only reason I can see to backport this is so that later fixes could
be applied cleanly.

So while I have no objections to this patch being backported I don't see
why you would want to either.

> Acked-by: Vineet Gupta <vgupta at synopsys.com>
> Signed-off-by: "Eric W. Biederman" <ebiederm at xmission.com>
> Signed-off-by: Sasha Levin <sashal at kernel.org>
> ---
>  arch/arc/mm/fault.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
> index f28db0b112a30..a0366f9dca051 100644
> --- a/arch/arc/mm/fault.c
> +++ b/arch/arc/mm/fault.c
> @@ -66,14 +66,12 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  	struct vm_area_struct *vma = NULL;
>  	struct task_struct *tsk = current;
>  	struct mm_struct *mm = tsk->mm;
> -	siginfo_t info;
> +	int si_code;
>  	int ret;
>  	vm_fault_t fault;
>  	int write = regs->ecr_cause & ECR_C_PROTV_STORE;  /* ST/EX */
>  	unsigned int flags = FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
>  
> -	clear_siginfo(&info);
> -
>  	/*
>  	 * We fault-in kernel-space virtual memory on-demand. The
>  	 * 'reference' page table is init_mm.pgd.
> @@ -91,7 +89,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  			return;
>  	}
>  
> -	info.si_code = SEGV_MAPERR;
> +	si_code = SEGV_MAPERR;
>  
>  	/*
>  	 * If we're in an interrupt or have no user
> @@ -119,7 +117,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  	 * we can handle it..
>  	 */
>  good_area:
> -	info.si_code = SEGV_ACCERR;
> +	si_code = SEGV_ACCERR;
>  
>  	/* Handle protection violation, execute on heap or stack */
>  
> @@ -204,11 +202,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  	/* User mode accesses just cause a SIGSEGV */
>  	if (user_mode(regs)) {
>  		tsk->thread.fault_address = address;
> -		info.si_signo = SIGSEGV;
> -		info.si_errno = 0;
> -		/* info.si_code has been set above */
> -		info.si_addr = (void __user *)address;
> -		force_sig_info(SIGSEGV, &info, tsk);
> +		force_sig_fault(SIGSEGV, si_code, (void __user *)address, tsk);
>  		return;
>  	}
>  
> @@ -243,9 +237,5 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  		goto no_context;
>  
>  	tsk->thread.fault_address = address;
> -	info.si_signo = SIGBUS;
> -	info.si_errno = 0;
> -	info.si_code = BUS_ADRERR;
> -	info.si_addr = (void __user *)address;
> -	force_sig_info(SIGBUS, &info, tsk);
> +	force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *)address, tsk);
>  }
