From: peterx@redhat.com (Peter Xu)
Date: Tue, 6 Nov 2018 11:03:46 +0800
Subject: [PATCH RFC] mm: arc: fix potential double realease of mmap_sem
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075013A590E5E@us01wembx1.internal.synopsys.com>
References: <20181101032354.19351-1-peterx@redhat.com>
 <C2D7FE5348E1B147BCA15975FBA23075013A590E5E@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181106030346.GI7804@xz-x1>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 06, 2018@12:48:31AM +0000, Vineet Gupta wrote:
> On 10/31/18 8:24 PM, Peter Xu wrote:
> > In do_page_fault() of ARC we have:
> >
> >         ...
> > 	fault = handle_mm_fault(vma, address, flags);
> >
> >         /* If Pagefault was interrupted by SIGKILL, exit page fault "early" */
> >         if (unlikely(fatal_signal_pending(current))) {
> >                 if ((fault & VM_FAULT_ERROR) && !(fault & VM_FAULT_RETRY))
> >                         up_read(&mm->mmap_sem);     <---------------- [1]
> >                 if (user_mode(regs))
> >                         return;
> >         }
> >         ...
> > 	if (likely(!(fault & VM_FAULT_ERROR))) {
> >                 ...
> > 		return;
> > 	}
> >
> > 	if (fault & VM_FAULT_OOM)
> > 		goto out_of_memory;                <----------------- [2]
> > 	else if (fault & VM_FAULT_SIGSEGV)
> > 		goto bad_area;                     <----------------- [3]
> > 	else if (fault & VM_FAULT_SIGBUS)
> > 		goto do_sigbus;                    <----------------- [4]
> >
> > Logically it's possible that we might try to release the mmap_sem twice
> > by having a scenario like:
> >
> >         - task received SIGKILL,
> >         - task handled kernel mode page fault,
> >         - handle_mm_fault() returned with one of VM_FAULT_ERROR,
> >
> > Then we'll go into path [1] to release the mmap_sem, however we won't
> > return immediately since user_mode(regs) check will fail (a kernel page
> > fault).  Then we might go into either [2]-[4] and either of them will
> > try to release the mmap_sem again.
> >
> > To fix this, we only release the mmap_sem at [1] when we're sure we'll
> > quit immediately (after we checked with user_mode(regs)).
> 
> Hmm, do_page_fault() needs a serious makeover. There's a known problem in the area
> you touched (with test case) where we fail to relinquish the mmap_sem for which
> Alexey had provided a fix. But I'm going to redo this part now and CC you folks
> for review. OK ?

Fine with me.  Thanks,

-- 
Peter Xu
