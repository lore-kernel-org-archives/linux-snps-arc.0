From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 2 Aug 2017 18:30:43 +0530
Subject: ARC stuff (was Re: [PATCH -v2 1/4] mm: Rework
 {set,clear,mm}_tlb_flush_pending())
In-Reply-To: <20170802114030.020058451@infradead.org>
References: <20170802113837.280183420@infradead.org>
 <20170802114030.020058451@infradead.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cd84f3b8-4881-c413-4670-f8c86ad10001@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/02/2017 05:19 PM, Peter Zijlstra wrote:
> Commit:
>
>    af2c1401e6f9 ("mm: numa: guarantee that tlb_flush_pending updates are visible before page table updates")
>
> added smp_mb__before_spinlock() to set_tlb_flush_pending(). I think we
> can solve the same problem without this barrier.
>
> If instead we mandate that mm_tlb_flush_pending() is used while
> holding the PTL we're guaranteed to observe prior
> set_tlb_flush_pending() instances.
>
> For this to work we need to rework migrate_misplaced_transhuge_page()
> a little and move the test up into do_huge_pmd_numa_page().
>
> NOTE: this relies on flush_tlb_range() to guarantee:
>
>     (1) it ensures that prior page table updates are visible to the
>         page table walker and

ARC doesn't have hw page walker so this is not relevant.

>     (2) it ensures that subsequent memory accesses are only made
>         visible after the invalidation has completed

flush_tlb_range() does a bunch of aux register accesses, I need to check with hw 
folks if those can be assumed to serializing w.r.t. memory ordering.
But if not then we need to add an explicit smb barrier (which will not be paired ? 
) and would be penalizing the other callers of flush_tlb_range(). Will a new API 
for this be an overkill ? Is a memory barrier needed here anyways - like ARM !


>
> This is required for architectures that implement TRANSPARENT_HUGEPAGE
> (arc, arm, arm64, mips, powerpc, s390, sparc, x86) or otherwise use
> mm_tlb_flush_pending() in their page-table operations (arm, arm64,
> x86).
>
> This appears true for:
>
>   - arm (DSB ISB before and after),
>   - arm64 (DSB ISHST before, and DSB ISH after),
>   - powerpc (PTESYNC before and after),
>   - s390 and x86 TLB invalidate are serializing instructions
>
> But I failed to understand the situation for:
>
>   - arc, mips, sparc
>
> Now SPARC64 is a wee bit special in that flush_tlb_range() is a no-op
> and it flushes the TLBs using arch_{enter,leave}_lazy_mmu_mode()
> inside the PTL. It still needs to guarantee the PTL unlock happens
> _after_ the invalidate completes.
>
> Vineet, Ralf and Dave could you guys please have a look?
>
> Cc: Russell King <linux at armlinux.org.uk>
> Cc: Will Deacon <will.deacon at arm.com>
> Cc: Benjamin Herrenschmidt <benh at kernel.crashing.org>
> Cc: Heiko Carstens <heiko.carstens at de.ibm.com>
> Cc: Ralf Baechle <ralf at linux-mips.org>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: "David S. Miller" <davem at davemloft.net>
> Cc: Mel Gorman <mgorman at suse.de>
> Cc: Rik van Riel <riel at redhat.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz at infradead.org>
> ---
>   include/linux/mm_types.h |   33 +++++++++++++++++++++++++++------
>   mm/huge_memory.c         |   20 ++++++++++++++++++++
>   mm/migrate.c             |    6 ------
>   3 files changed, 47 insertions(+), 12 deletions(-)
>
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -527,23 +527,44 @@ static inline cpumask_t *mm_cpumask(stru
>    */
>   static inline bool mm_tlb_flush_pending(struct mm_struct *mm)
>   {
> -	barrier();
> +	/*
> +	 * Must be called with PTL held; such that our PTL acquire will have
> +	 * observed the store from set_tlb_flush_pending().
> +	 */
>   	return mm->tlb_flush_pending;
>   }
>   static inline void set_tlb_flush_pending(struct mm_struct *mm)
>   {
>   	mm->tlb_flush_pending = true;
> -
>   	/*
> -	 * Guarantee that the tlb_flush_pending store does not leak into the
> -	 * critical section updating the page tables
> +	 * The only time this value is relevant is when there are indeed pages
> +	 * to flush. And we'll only flush pages after changing them, which
> +	 * requires the PTL.
> +	 *
> +	 * So the ordering here is:
> +	 *
> +	 *	mm->tlb_flush_pending = true;
> +	 *	spin_lock(&ptl);
> +	 *	...
> +	 *	set_pte_at();
> +	 *	spin_unlock(&ptl);
> +	 *
> +	 *				spin_lock(&ptl)
> +	 *				mm_tlb_flush_pending();
> +	 *				....
> +	 *				spin_unlock(&ptl);
> +	 *
> +	 *	flush_tlb_range();
> +	 *	mm->tlb_flush_pending = false;
> +	 *
> +	 * So the =true store is constrained by the PTL unlock, and the =false
> +	 * store is constrained by the TLB invalidate.
>   	 */
> -	smp_mb__before_spinlock();
>   }
>   /* Clearing is done after a TLB flush, which also provides a barrier. */
>   static inline void clear_tlb_flush_pending(struct mm_struct *mm)
>   {
> -	barrier();
> +	/* see set_tlb_flush_pending */
>   	mm->tlb_flush_pending = false;
>   }
>   #else
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1410,6 +1410,7 @@ int do_huge_pmd_numa_page(struct vm_faul
>   	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
>   	int page_nid = -1, this_nid = numa_node_id();
>   	int target_nid, last_cpupid = -1;
> +	bool need_flush = false;
>   	bool page_locked;
>   	bool migrated = false;
>   	bool was_writable;
> @@ -1496,10 +1497,29 @@ int do_huge_pmd_numa_page(struct vm_faul
>   	}
>   
>   	/*
> +	 * Since we took the NUMA fault, we must have observed the !accessible
> +	 * bit. Make sure all other CPUs agree with that, to avoid them
> +	 * modifying the page we're about to migrate.
> +	 *
> +	 * Must be done under PTL such that we'll observe the relevant
> +	 * set_tlb_flush_pending().
> +	 */
> +	if (mm_tlb_flush_pending(vma->vm_mm))
> +		need_flush = true;
> +
> +	/*
>   	 * Migrate the THP to the requested node, returns with page unlocked
>   	 * and access rights restored.
>   	 */
>   	spin_unlock(vmf->ptl);
> +
> +	/*
> +	 * We are not sure a pending tlb flush here is for a huge page
> +	 * mapping or not. Hence use the tlb range variant
> +	 */
> +	if (need_flush)
> +		flush_tlb_range(vma, haddr, haddr + HPAGE_PMD_SIZE);
> +
>   	migrated = migrate_misplaced_transhuge_page(vma->vm_mm, vma,
>   				vmf->pmd, pmd, vmf->address, page, target_nid);
>   	if (migrated) {
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -1937,12 +1937,6 @@ int migrate_misplaced_transhuge_page(str
>   		put_page(new_page);
>   		goto out_fail;
>   	}
> -	/*
> -	 * We are not sure a pending tlb flush here is for a huge page
> -	 * mapping or not. Hence use the tlb range variant
> -	 */
> -	if (mm_tlb_flush_pending(mm))
> -		flush_tlb_range(vma, mmun_start, mmun_end);
>   
>   	/* Prepare a page as a migration target */
>   	__SetPageLocked(new_page);
>
>
>
