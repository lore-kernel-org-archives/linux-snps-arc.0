From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 6 Nov 2018 00:48:31 +0000
Subject: [PATCH RFC] mm: arc: fix potential double realease of mmap_sem
References: <20181101032354.19351-1-peterx@redhat.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075013A590E5E@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/31/18 8:24 PM, Peter Xu wrote:
> In do_page_fault() of ARC we have:
>
>         ...
> 	fault = handle_mm_fault(vma, address, flags);
>
>         /* If Pagefault was interrupted by SIGKILL, exit page fault "early" */
>         if (unlikely(fatal_signal_pending(current))) {
>                 if ((fault & VM_FAULT_ERROR) && !(fault & VM_FAULT_RETRY))
>                         up_read(&mm->mmap_sem);     <---------------- [1]
>                 if (user_mode(regs))
>                         return;
>         }
>         ...
> 	if (likely(!(fault & VM_FAULT_ERROR))) {
>                 ...
> 		return;
> 	}
>
> 	if (fault & VM_FAULT_OOM)
> 		goto out_of_memory;                <----------------- [2]
> 	else if (fault & VM_FAULT_SIGSEGV)
> 		goto bad_area;                     <----------------- [3]
> 	else if (fault & VM_FAULT_SIGBUS)
> 		goto do_sigbus;                    <----------------- [4]
>
> Logically it's possible that we might try to release the mmap_sem twice
> by having a scenario like:
>
>         - task received SIGKILL,
>         - task handled kernel mode page fault,
>         - handle_mm_fault() returned with one of VM_FAULT_ERROR,
>
> Then we'll go into path [1] to release the mmap_sem, however we won't
> return immediately since user_mode(regs) check will fail (a kernel page
> fault).  Then we might go into either [2]-[4] and either of them will
> try to release the mmap_sem again.
>
> To fix this, we only release the mmap_sem at [1] when we're sure we'll
> quit immediately (after we checked with user_mode(regs)).

Hmm, do_page_fault() needs a serious makeover. There's a known problem in the area
you touched (with test case) where we fail to relinquish the mmap_sem for which
Alexey had provided a fix. But I'm going to redo this part now and CC you folks
for review. OK ?

>
> CC: Vineet Gupta <vgupta at synopsys.com>
> CC: "Eric W. Biederman" <ebiederm at xmission.com>
> CC: Peter Xu <peterx at redhat.com>
> CC: Andrew Morton <akpm at linux-foundation.org>
> CC: Souptick Joarder <jrdr.linux at gmail.com>
> CC: Andrea Arcangeli <aarcange at redhat.com>
> CC: linux-snps-arc at lists.infradead.org
> CC: linux-kernel at vger.kernel.org
> Signed-off-by: Peter Xu <peterx at redhat.com>
> ---
>
> I noticed this only by reading the code.  Neither have I verified the
> issue, nor have I tested the patch since I even don't know how to (I'm
> totally unfamiliar with the arc architecture).  However I'm posting this
> out first to see whether there's any quick feedback, and in case it's a
> valid issue that we've ignored.
> ---
>  arch/arc/mm/fault.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
> index c9da6102eb4f..2d28c3dad5c1 100644
> --- a/arch/arc/mm/fault.c
> +++ b/arch/arc/mm/fault.c
> @@ -142,11 +142,10 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  	fault = handle_mm_fault(vma, address, flags);
>  
>  	/* If Pagefault was interrupted by SIGKILL, exit page fault "early" */
> -	if (unlikely(fatal_signal_pending(current))) {
> -		if ((fault & VM_FAULT_ERROR) && !(fault & VM_FAULT_RETRY))
> +	if (unlikely(fatal_signal_pending(current) && user_mode(regs))) {
> +		if (!(fault & VM_FAULT_RETRY))
>  			up_read(&mm->mmap_sem);
> -		if (user_mode(regs))
> -			return;
> +		return;
>  	}
>  
>  	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
