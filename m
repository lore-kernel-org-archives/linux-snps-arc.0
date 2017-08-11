From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 11 Aug 2017 16:15:26 +0200
Subject: ARC stuff (was Re: [PATCH -v2 1/4] mm: Rework
 {set,clear,mm}_tlb_flush_pending())
In-Reply-To: <20170802131710.qplpoztjjyttbyol@hirez.programming.kicks-ass.net>
References: <20170802113837.280183420@infradead.org>
 <20170802114030.020058451@infradead.org>
 <cd84f3b8-4881-c413-4670-f8c86ad10001@synopsys.com>
 <20170802131710.qplpoztjjyttbyol@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170811141526.6uvv7iosfchsmjdk@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Wed, Aug 02, 2017@03:17:10PM +0200, Peter Zijlstra wrote:
> On Wed, Aug 02, 2017@06:30:43PM +0530, Vineet Gupta wrote:
> > flush_tlb_range() does a bunch of aux register accesses, I need to check
> > with hw folks if those can be assumed to serializing w.r.t. memory ordering.
> > But if not then we need to add an explicit smb barrier (which will not be
> > paired ? )
> 
> It would pair with the ACQUIRE from the PTL in the below example.
> 
> > and would be penalizing the other callers of flush_tlb_range().
> > Will a new API for this be an overkill ? Is a memory barrier needed here
> > anyways - like ARM !
> 
> It is needed at the very least if you do transparant huge pages as per
> the existing logic (this requirement isn't new per this patch, I was
> just the silly person wondering if flush_tlb_range() does indeed provide
> the ordering assumed).

Any word on this? It just got way worse and anything SMP needs to
provide this.

See commit:

  0a2dd266dd6b ("mm: make tlb_flush_pending global")

And these semantics are now required for the correct operation of KSM
and MADV_{FREE,DONT_NEED}.
