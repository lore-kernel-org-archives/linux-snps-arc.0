From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 2 Aug 2018 07:08:49 +0000
Subject: [PATCH] ARC: Improve handling of fatal signals in do_page_fault()
In-Reply-To: <432f2efe-e7cd-7bf1-40f5-f35f8954f224@synopsys.com>
References: <20180629182005.10243-1-abrodkin@synopsys.com>
 <432f2efe-e7cd-7bf1-40f5-f35f8954f224@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3760e66a23a8ec1c1eb4ad0aaaed06c9d31a3f4f.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2018-08-01@12:49 -0700, Vineet Gupta wrote:
> Hi Alexey,
> 
> I was finally forced to revisit this for my glibc tst-tls3-malloc deadlock. And
> indeed with this change we don'tsee the deadlock. But see below..
> 
> 
> > @@ -139,12 +139,16 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
> >  	 */
> >  	fault = handle_mm_fault(vma, address, flags);
> >  
> > -	/* If Pagefault was interrupted by SIGKILL, exit page fault "early" */
> > +	/* If we need to retry but a fatal signal is pending, handle the
> > +	 * signal first. We do not need to release the mmap_sem because
> > +	 * it would already be released in __lock_page_or_retry in
> > +	 * mm/filemap.c. */
> 
> Right and we were already doing that: up_read() was called for !VM_FAULT_RETRY
> meaning we relied on the core mm to do that already for VM_FAULT_RETRY case.
> 
> The issue here was additional check for VM_FAULT_ERROR. Typically this is not set
> by handle_mm_fault() meaning for common user faults with signal pending, we were
> not calling up_read, hence the ensuing deadlock.

Right.

> >  	if (unlikely(fatal_signal_pending(current))) {
> > -		if ((fault & VM_FAULT_ERROR) && !(fault & VM_FAULT_RETRY))
> > -			up_read(&mm->mmap_sem);
> > -		if (user_mode(regs))
> > +		if (fault & VM_FAULT_RETRY) {
> > +			if (!user_mode(regs))
> > +				goto no_context;
> 
> Given this code is really tricky, lets only solve one problem with 1 one patch.

Agree.

> >  			return;
> > +		}
> >  	}
> 
> The fault handling is spaghetti mess of checks and more checks and has not really
> been touched since upstreaming. I need to clean it up and essentially rewrite it
> for v4.19

So would you like me to send a re-spin with less changes as discussed above so
we have something better for now and for back-porting to stable branches.

Or you're going to rewrite all that sometime soon yourself?

-Alexey
