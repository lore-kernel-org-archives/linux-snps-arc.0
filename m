From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 30 May 2019 09:48:34 -0700
Subject: [PATCH 9/9] ARC: mm: do_page_fault refactor #8: release mmap_sem
 sooner
In-Reply-To: <1557880176-24964-10-git-send-email-vgupta@synopsys.com>
References: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
 <1557880176-24964-10-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <d7284369-52a6-71e5-65ae-75ec389eb92b@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 5/14/19 5:29 PM, Vineet Gupta wrote:
> In case of successful page fault handling, this patch releases mmap_sem
> before updating the perf stat event for major/minor faults. So even
> though the contention reduction is NOT supe rhigh, it is still an
> improvement.

This patch causes regression: LMBench lat_sig triggers a bogus oom.

The issue is not due to code movement of up_read() but as artifact of @fault
initialized to VM_FAULT_ERROR. The lat_sig invalid access doesn't take
handle_mm_fault() instead it hits !VM_WRITE case for write access leading to use
of "initialized" value of @fault VM_FAULT_ERROR which includes VM_FAULT_OOM hence
the bogus oom handling.


> There's an additional code size improvement as we only have 2 up_read()
> calls now.
> 
> Note to myself:
> --------------
> 
> 1. Given the way it is done, we are forced to move @bad_area label earlier
>    causing the various "goto bad_area" cases to hit perf stat code.
> 
>  - PERF_COUNT_SW_PAGE_FAULTS is NOW updated for access errors which is what
>    arm/arm64 seem to be doing as well (with slightly different code)
>  - PERF_COUNT_SW_PAGE_FAULTS_{MAJ,MIN} must NOT be updated for the
>    error case which is guarded by now setting @fault initial value
>    to VM_FAULT_ERROR which serves both cases when handle_mm_fault()
>    returns error or is not called at all.
> 
> 2. arm/arm64 use two homebrew fault flags VM_FAULT_BAD{MAP,MAPACCESS}
>    which I was inclined to add too but seems not needed for ARC
> 
>  - given that we have everything is 1 function we cabn stil use goto
>  - we setup si_code at the right place (arm* do that in the end)
>  - we init fault already to error value which guards entry into perf
>    stats event update
> 
> Cc: Peter Zijlstra <peterz at infradead.org>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/mm/fault.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
> index 20402217d9da..e93ea06c214c 100644
> --- a/arch/arc/mm/fault.c
> +++ b/arch/arc/mm/fault.c
> @@ -68,7 +68,7 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  	struct mm_struct *mm = tsk->mm;
>  	int sig, si_code = SEGV_MAPERR;
>  	unsigned int write = 0, exec = 0, mask;
> -	vm_fault_t fault;			/* handle_mm_fault() output */
> +	vm_fault_t fault = VM_FAULT_ERROR;	/* handle_mm_fault() output */
>  	unsigned int flags;			/* handle_mm_fault() input */
>  
>  	/*
> @@ -155,6 +155,9 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  		}
>  	}
>  
> +bad_area:
> +	up_read(&mm->mmap_sem);
> +
>  	/*
>  	 * Major/minor page fault accounting
>  	 * (in case of retry we only land here once)
> @@ -173,13 +176,9 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  		}
>  
>  		/* Normal return path: fault Handled Gracefully */
> -		up_read(&mm->mmap_sem);
>  		return;
>  	}
>  
> -bad_area:
> -	up_read(&mm->mmap_sem);
> -
>  	if (!user_mode(regs))
>  		goto no_context;
>  
> 
