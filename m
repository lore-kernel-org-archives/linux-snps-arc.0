From: peterz@infradead.org (Peter Zijlstra)
Date: Wed, 2 Aug 2017 15:17:10 +0200
Subject: ARC stuff (was Re: [PATCH -v2 1/4] mm: Rework
 {set,clear,mm}_tlb_flush_pending())
In-Reply-To: <cd84f3b8-4881-c413-4670-f8c86ad10001@synopsys.com>
References: <20170802113837.280183420@infradead.org>
 <20170802114030.020058451@infradead.org>
 <cd84f3b8-4881-c413-4670-f8c86ad10001@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170802131710.qplpoztjjyttbyol@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Wed, Aug 02, 2017@06:30:43PM +0530, Vineet Gupta wrote:
> On 08/02/2017 05:19 PM, Peter Zijlstra wrote:
> > Commit:
> > 
> >    af2c1401e6f9 ("mm: numa: guarantee that tlb_flush_pending updates are visible before page table updates")
> > 
> > added smp_mb__before_spinlock() to set_tlb_flush_pending(). I think we
> > can solve the same problem without this barrier.
> > 
> > If instead we mandate that mm_tlb_flush_pending() is used while
> > holding the PTL we're guaranteed to observe prior
> > set_tlb_flush_pending() instances.
> > 
> > For this to work we need to rework migrate_misplaced_transhuge_page()
> > a little and move the test up into do_huge_pmd_numa_page().
> > 
> > NOTE: this relies on flush_tlb_range() to guarantee:
> > 
> >     (1) it ensures that prior page table updates are visible to the
> >         page table walker and
> 
> ARC doesn't have hw page walker so this is not relevant.

Well, you still want your software walker to observe the new PTE entries
before you start shooting down the old ones. So I would expect at least
an smp_wmb() before the TLB invalidate to order against another CPU
doing a software TLB fill, such that the other CPU will indeed observe
the new PTE after it has observed the TLB missing.

> >     (2) it ensures that subsequent memory accesses are only made
> >         visible after the invalidation has completed
> 
> flush_tlb_range() does a bunch of aux register accesses, I need to check
> with hw folks if those can be assumed to serializing w.r.t. memory ordering.
> But if not then we need to add an explicit smb barrier (which will not be
> paired ? )

It would pair with the ACQUIRE from the PTL in the below example.

> and would be penalizing the other callers of flush_tlb_range().
> Will a new API for this be an overkill ? Is a memory barrier needed here
> anyways - like ARM !

It is needed at the very least if you do transparant huge pages as per
the existing logic (this requirement isn't new per this patch, I was
just the silly person wondering if flush_tlb_range() does indeed provide
the ordering assumed).

But yes, lots of architectures do provide this ordering already and
some, like ARM and PPC do so with quite expensive barriers.

To me it's also a natural / expected ordering, but that could just be
me :-)

> >   	/*
> > +	 * The only time this value is relevant is when there are indeed pages
> > +	 * to flush. And we'll only flush pages after changing them, which
> > +	 * requires the PTL.
> > +	 *
> > +	 * So the ordering here is:
> > +	 *
> > +	 *	mm->tlb_flush_pending = true;
> > +	 *	spin_lock(&ptl);
> > +	 *	...
> > +	 *	set_pte_at();
> > +	 *	spin_unlock(&ptl);
> > +	 *
> > +	 *				spin_lock(&ptl)
> > +	 *				mm_tlb_flush_pending();
> > +	 *				....
> > +	 *				spin_unlock(&ptl);
> > +	 *
> > +	 *	flush_tlb_range();
> > +	 *	mm->tlb_flush_pending = false;
> > +	 *
> > +	 * So the =true store is constrained by the PTL unlock, and the =false
> > +	 * store is constrained by the TLB invalidate.
> >   	 */
> >   }
> >   /* Clearing is done after a TLB flush, which also provides a barrier. */

See, not a new requirement.. I only mucked with the ordering for
setting it, clearing already relied on the flush_tlb_range().

> >   static inline void clear_tlb_flush_pending(struct mm_struct *mm)
> >   {
> > +	/* see set_tlb_flush_pending */
> >   	mm->tlb_flush_pending = false;
> >   }
