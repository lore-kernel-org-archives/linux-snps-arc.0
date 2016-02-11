From: schwidefsky@de.ibm.com (Martin Schwidefsky)
Date: Thu, 11 Feb 2016 12:20:23 +0100
Subject: [PATCH 1/2] mm,thp: refactor generic deposit/withdraw routines
 for wider usage
In-Reply-To: <56BC682D.6070808@synopsys.com>
References: <1455182907-15445-1-git-send-email-vgupta@synopsys.com>
 <1455182907-15445-2-git-send-email-vgupta@synopsys.com>
 <20160211112223.0acc8237@mschwide> <56BC682D.6070808@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160211122023.6d719513@mschwide>
To: linux-snps-arc@lists.infradead.org

On Thu, 11 Feb 2016 16:23:33 +0530
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> On Thursday 11 February 2016 03:52 PM, Martin Schwidefsky wrote:
> > On Thu, 11 Feb 2016 14:58:26 +0530
> > Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> > 
> >> Generic pgtable_trans_huge_deposit()/pgtable_trans_huge_withdraw()
> >> assume pgtable_t to be struct page * which is not true for all arches.
> >> Thus arc, s390, sparch end up with their own copies despite no special
> >> hardware requirements (unlike powerpc).
> > 
> > s390 does have a special hardware requirement. pgtable_t is an address
> > for a 2K block of memory. It is *not* equivalent to a struct page *
> > which refers to a 4K block of memory. That has been the whole point
> > to introduce pgtable_t.
> 
> Actually my reference to hardware requirement was more like powerpc style save a
> hash value some where etc.
> 
> Now pgtable_t need not be struct page * even if the actual sizes are same - e.g.
> in ARC port I kept pgtable_t as pte_t * simply to avoid a few page_address() calls
> in mm code (you could argue that is was a micro-optimization, anyways..)
> 
> So given I know nothing about s390 MMU internals, I still think you can switch to
> the update generic version despite 2K vs. 4K. Agree ?

No, we can not. For s390 a page table is aligned on a 2K boundary and is
only half the size of a page (except for KVM but that is another story).
For s390 a pgtable_t is a pointer to the memory location with the 256 ptes
and not a struct page *.

The cast "struct page *new = (struct page*)pgtable;" in your first patch
is already broken, "new" points to the memory of the page table and
the list_head operations will clobber that memory. You try to fix it up
with the memset to zero in pgtable_trans_huge_withdraw but that does not
correct the pte entries for s390 as an invalid page-table entry is *not*
all zeros.

In short, please let s390 keep its own copy of deposit/withdraw.

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
