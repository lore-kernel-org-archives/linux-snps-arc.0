From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 16 Sep 2019 23:36:00 +0000
Subject: [PATCH 3/6] ARC: mm: TLB Miss optim: avoid re-reading ECR
In-Reply-To: <20190916213207.12792-4-vgupta@synopsys.com>
References: <20190916213207.12792-1-vgupta@synopsys.com>
 <20190916213207.12792-4-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB0120D19524D7D3F184E2B181A18C0@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: Vineet Gupta <vgupta at synopsys.com>
> Sent: Monday, September 16, 2019 2:32 PM
> To: linux-snps-arc at lists.infradead.org
> Cc: Alexey Brodkin <abrodkin at synopsys.com>; Vineet Gupta <vgupta at synopsys.com>
> Subject: [PATCH 3/6] ARC: mm: TLB Miss optim: avoid re-reading ECR
> 
> For setting PTE Dirty bit, reuse the prior test for ST miss.
> 
> No need to reload ECR and test for ST cause code as the prev
> condition code is still valid (uncloberred)
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/mm/tlbex.S | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
> index 110c72536e8b..4c88148d4cd1 100644
> --- a/arch/arc/mm/tlbex.S
> +++ b/arch/arc/mm/tlbex.S
> @@ -380,9 +380,7 @@ ENTRY(EV_TLBMissD)
> 
>  	;----------------------------------------------------------------
>  	; UPDATE_PTE: Let Linux VM know that page was accessed/dirty

I'd suggest to put a BOLD comment here saying that we rely on previously
set condition flag so that whoever reads or (even worse) modifies that or
previous code keeps in mind that we shouldn't clobber a particular flag.

> -	lr      r3, [ecr]
>  	or      r0, r0, _PAGE_ACCESSED        ; Accessed bit always
> -	btst_s  r3,  ECR_C_BIT_DTLB_ST_MISS   ; See if it was a Write Access ?
>  	or.nz   r0, r0, _PAGE_DIRTY           ; if Write, set Dirty bit as well
>  	st_s    r0, [r1]                      ; Write back PTE

-Alexey
