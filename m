From: vbabka@suse.cz (Vlastimil Babka)
Date: Tue, 8 Mar 2016 16:32:29 +0100
Subject: [PATCH] mm: slub: Ensure that slab_unlock() is atomic
In-Reply-To: <1457447457-25878-1-git-send-email-vgupta@synopsys.com>
References: <1457447457-25878-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56DEF08D.607@suse.cz>
To: linux-snps-arc@lists.infradead.org

On 03/08/2016 03:30 PM, Vineet Gupta wrote:
> We observed livelocks on ARC SMP setup when running hackbench with SLUB.
> This hardware configuration lacks atomic instructions (LLOCK/SCOND) thus
> kernel resorts to a central @smp_bitops_lock to protect any R-M-W ops
> suh as test_and_set_bit()

Sounds like this architecture should then redefine __clear_bit_unlock
and perhaps other non-atomic __X_bit() variants to be atomic, and not
defer this requirement to places that use the API?

> The spinlock itself is implemented using Atomic [EX]change instruction
> which is always available.
> 
> The race happened when both cores tried to slab_lock() the same page.
> 
>    c1		    c0
> -----------	-----------
> slab_lock
> 		slab_lock
> slab_unlock
> 		Not observing the unlock
> 
> This in turn happened because slab_unlock() doesn't serialize properly
> (doesn't use atomic clear) with a concurrent running
> slab_lock()->test_and_set_bit()
> 
> Cc: Christoph Lameter <cl at linux.com>
> Cc: Pekka Enberg <penberg at kernel.org>
> Cc: David Rientjes <rientjes at google.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim at lge.com>
> Cc: Andrew Morton <akpm at linux-foundation.org>
> Cc: Noam Camus <noamc at ezchip.com>
> Cc: <stable at vger.kernel.org>
> Cc: <linux-mm at kvack.org>
> Cc: <linux-kernel at vger.kernel.org>
> Cc: <linux-snps-arc at lists.infradead.org>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  mm/slub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index d8fbd4a6ed59..b7d345a508dc 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -345,7 +345,7 @@ static __always_inline void slab_lock(struct page *page)
>  static __always_inline void slab_unlock(struct page *page)
>  {
>  	VM_BUG_ON_PAGE(PageTail(page), page);
> -	__bit_spin_unlock(PG_locked, &page->flags);
> +	bit_spin_unlock(PG_locked, &page->flags);
>  }
>  
>  static inline void set_page_slub_counters(struct page *page, unsigned long counters_new)
> 
