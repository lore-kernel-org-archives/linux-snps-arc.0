From: mhocko@kernel.org (Michal Hocko)
Date: Wed, 30 Nov 2016 10:16:37 +0100
Subject: [RFC] ARC: mm: Restrict definition of pfn_valid() macro for
 CONFIG_FLATMEM
In-Reply-To: <1480433346-18054-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1480433346-18054-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161130091637.GC18437@dhcp22.suse.cz>
To: linux-snps-arc@lists.infradead.org

On Tue 29-11-16 18:29:06, Yuriy Kolerov wrote:
> Despite the fact that subtraction of unsigned integers is a defined
> behaviour however such operations can lead to unexpected results. Thus
> it is better to check both left and right boundaries to avoid potential
> bugs as it done in the generic page.h.

Why and which code would use an out of range pfn? Why other arches do
not need to care?

> 
> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> ---
>  arch/arc/include/asm/page.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
> index 296c342..81cfc6c7 100644
> --- a/arch/arc/include/asm/page.h
> +++ b/arch/arc/include/asm/page.h
> @@ -88,7 +88,7 @@ typedef pte_t * pgtable_t;
>  #define ARCH_PFN_OFFSET		virt_to_pfn(CONFIG_LINUX_LINK_BASE)
>  
>  #ifdef CONFIG_FLATMEM
> -#define pfn_valid(pfn)		(((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
> +#define pfn_valid(pfn)		((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
>  #endif
>  
>  /*
> -- 
> 2.7.4
> 

-- 
Michal Hocko
SUSE Labs
