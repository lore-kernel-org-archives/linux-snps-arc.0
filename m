From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 17 Jul 2019 18:35:02 +0000
Subject: [PATCH] ARCv2: Don't pretend we may set U & DE bits in STATUS32
 with kflag
References: <20190716205034.42466-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <BN6PR1201MB003505F72EBBE443FADBC23CB6C90@BN6PR1201MB0035.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

On 7/16/19 1:51 PM, Alexey Brodkin wrote:
> As per PRM "kflag" instruction doesn't change state of
> DE-flag ("Delayed branch is pending") and U-flag ("User mode")
> in STATUS32 register so let's not act as if we can affect those bits.

I understand the motivation and indeed bits not writable by kflag should be
removed. But what if we do need to clear those bits out from status32 (assuming
they exist there in first place) and that kflag might not be the right instruction
to do that.
So the question to ask is do we need to clear U and DE bits from status32 and
answer from reading the PRM is no, we don't have to, as those are cleared already
when an exception is taken.

The likely reason this code is because back in arc700 days we used to have a
different version of this macro which atleast in original code relied on using the
pre-exception status32 (in pt_regs) - and that could easily have U and/or DE set
based hence needed clearing.

.macro FAKE_RET_FROM_EXCPN  reg

    ld  \reg, [sp, PT_status32]
    and \reg, \reg, ~(STATUS_U_MASK|STATUS_DE_MASK)
    or  \reg, \reg, STATUS_L_MASK
    sr  \reg, [erstatus]
    mov \reg, 55f
    sr  \reg, [eret]

    rtie
55:
.endm

This is not needed (even in arc700) if we are using the current "in-exception"
status32 for doing the early return.

Long story short, your patch is correct but we need to explain better why it is.
I've applied it locally with slight tweak to changelog to that effect.


> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>  arch/arc/include/asm/entry-arcv2.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
> index 225e7df2d8ed..6558e2edb583 100644
> --- a/arch/arc/include/asm/entry-arcv2.h
> +++ b/arch/arc/include/asm/entry-arcv2.h
> @@ -237,7 +237,7 @@
>  
>  .macro FAKE_RET_FROM_EXCPN
>  	lr      r9, [status32]
> -	bic     r9, r9, (STATUS_U_MASK|STATUS_DE_MASK|STATUS_AE_MASK)
> +	bic     r9, r9, STATUS_AE_MASK
>  	or      r9, r9, STATUS_IE_MASK
>  	kflag   r9
>  .endm
