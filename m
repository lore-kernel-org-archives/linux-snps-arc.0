From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 28 Nov 2016 08:39:10 -0800
Subject: [PATCH] ARC: mm: PAE40: Cast pfn to pte_t in pfn_pte() macro
In-Reply-To: <1480306037-15415-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1480306037-15415-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2d471006-127f-a5bc-dee2-4c8f6e67e9f5@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Yuriy,

Indeed good find. My nits and not-quite-nits below :-)

On 11/27/2016 08:07 PM, Yuriy Kolerov wrote:
> Originally pfn_pte(pfn, prot) macro had this definition:
> 
>     __pte(((pfn) << PAGE_SHIFT) | pgprot_val(prot))
> 
> The value of pfn (Page Frame Number) is shifted to the left to get the
> value of pte (Page Table Entry). Usually a 4-byte value is passed to
> this macro as value of pfn. However if Linux is configured with support
> of PAE40 then value of pte has 8-byte type because it must contain
> additional 8 bits of the physical address. Thus if value of pfn
> represents a physical page frame above of 4GB boundary then
> shifting of pfn to the left by PAGE_SHIFT wipes most significant
> bits of the 40-bit physical address.
> 
> As a result all physical addresses above of 4GB boundary in systems
> with PAE40 are mapped to virtual address incorrectly. An error may
> occur when the kernel tries to unmap such bad pages:
> 
>     [ECR   ]: 0x00050100 => Invalid Read @ 0x41414144 by insn @ 0x801644c6
>     [EFA   ]: 0x41414144
>     [BLINK ]: unmap_page_range+0x134/0x700
>     [ERET  ]: unmap_page_range+0x17a/0x700
>     [STAT32]: 0x8008021e : IE K
>     BTA: 0x801644c6	 SP: 0x901a5e84	 FP: 0x5ff35de8
>     LPS: 0x8026462c	LPE: 0x80264630	LPC: 0x00000000
>     r00: 0x8fcc4fc0	r01: 0x2fe68000	r02: 0x41414140
>     r03: 0x2c05c000	r04: 0x2fe6a000	r05: 0x0009ffff
>     r06: 0x901b6898	r07: 0x2fe68000	r08: 0x00000001
>     r09: 0x804a807c	r10: 0x0000067e	r11: 0xffffffff
>     r12: 0x80164480
>     Stack Trace:
>       unmap_page_range+0x17a/0x700
>       unmap_vmas+0x46/0x64
>       do_munmap+0x210/0x450
>       SyS_munmap+0x2c/0x50
>       EV_Trap+0xfc/0x100

This is all too verbose. You need to describe the problem in fewer words

 - Also subject needs to say "Fix kernel crash with PAE40..." and possibly include
   the small test case which triggered it. It needs to describe the "why",
   "how" is already explained in patch. And if that is not sufficient,
   please add comments...

> So the value of pfn must be casted to pte_t before shifting to
> ensure that 40-bit address will not be truncated:
> 
>     __pte(((pte_t) (pfn) << PAGE_SHIFT) | pgprot_val(prot))

Why are you duplicating the patch contents in changelog.

> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> ---
>  arch/arc/include/asm/pgtable.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
> index 89eeb37..77bc51c 100644
> --- a/arch/arc/include/asm/pgtable.h
> +++ b/arch/arc/include/asm/pgtable.h
> @@ -280,7 +280,8 @@ static inline void pmd_set(pmd_t *pmdp, pte_t *ptep)
>  
>  #define pte_page(pte)		pfn_to_page(pte_pfn(pte))
>  #define mk_pte(page, prot)	pfn_pte(page_to_pfn(page), prot)
> -#define pfn_pte(pfn, prot)	__pte(((pfn) << PAGE_SHIFT) | pgprot_val(prot))
> +#define pfn_pte(pfn, prot) \
> +	__pte(((pte_t) (pfn) << PAGE_SHIFT) | pgprot_val(prot))

The idea is right, and will work - but it breaks something else. Did you do a git
log on this file as this is exactly what we used to have before commit
1c3c90930392 "ARC: mm: fix build breakage with STRICT_MM_TYPECHECKS". Technically
your patch should have been a simple Revert of the above commit.

But as Alexey suggested in his reply, we can use the ARM approach:

+#define pfn_pte(pfn, prot)     __pte(__pfn_to_phys(pfn) | pgprot_val(prot))

-Vineet
