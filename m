From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 2 Nov 2015 06:23:49 +0000
Subject: [PATCH v1 07/20] ARC: mm: use generic macros _BITUL()
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-8-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44CFC74@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 31 October 2015 06:49 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
>
> PGDIR_SIZE() cannot use "1UL" since it is called from mm/tlbex.S
> by VMALLOC_START. _BITUL() solves this build error.
>
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> ---
>  arch/arc/include/asm/pgtable.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
> index 57af2f0..372a282 100644
> --- a/arch/arc/include/asm/pgtable.h
> +++ b/arch/arc/include/asm/pgtable.h
> @@ -210,7 +210,7 @@
>  #define BITS_FOR_PGD	(32 - BITS_FOR_PTE - BITS_IN_PAGE)
>  
>  #define PGDIR_SHIFT	(32 - BITS_FOR_PGD)
> -#define PGDIR_SIZE	(1UL << PGDIR_SHIFT)	/* vaddr span, not PDG sz */
> +#define PGDIR_SIZE	_BITUL(PGDIR_SHIFT)	/* vaddr span, not PDG sz */
>  #define PGDIR_MASK	(~(PGDIR_SIZE-1))
>  
>  #define	PTRS_PER_PTE	_BITUL(BITS_FOR_PTE)

For bisectability, please squash this with patch 4/20, and append the changelog of
this patch to 4/20

-Vineet
