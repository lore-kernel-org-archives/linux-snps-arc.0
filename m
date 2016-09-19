From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 19 Sep 2016 10:08:28 -0700
Subject: [PATCH] ARC: [plat-eznps] add missing atomic_fetch_xxx operations
In-Reply-To: <1474263280-26203-1-git-send-email-noamca@mellanox.com>
References: <1474263280-26203-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <78b621bf-2bc4-f4c8-1d13-8fd6fa483ac8@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/18/2016 10:34 PM, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
>
> Build brekeage since last changes to generic atomic operations.
> Added couple of missing macros which are now mandatory
>
> Signed-off-by: Noam Camus <noamca at mellanox.com>

Added to for-next !

Thx,
-Vineet



> ---
>  arch/arc/include/asm/atomic.h |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arc/include/asm/atomic.h b/arch/arc/include/asm/atomic.h
> index 4e3c1b6..4f732bf 100644
> --- a/arch/arc/include/asm/atomic.h
> +++ b/arch/arc/include/asm/atomic.h
> @@ -284,6 +284,7 @@ static inline int atomic_fetch_##op(int i, atomic_t *v)			\
>  ATOMIC_OPS(add, +=, CTOP_INST_AADD_DI_R2_R2_R3)
>  #define atomic_sub(i, v) atomic_add(-(i), (v))
>  #define atomic_sub_return(i, v) atomic_add_return(-(i), (v))
> +#define atomic_fetch_sub(i, v) atomic_fetch_add(-(i), (v))
>  
>  #undef ATOMIC_OPS
>  #define ATOMIC_OPS(op, c_op, asm_op)					\
> @@ -292,6 +293,7 @@ ATOMIC_OPS(add, +=, CTOP_INST_AADD_DI_R2_R2_R3)
>  
>  ATOMIC_OPS(and, &=, CTOP_INST_AAND_DI_R2_R2_R3)
>  #define atomic_andnot(mask, v) atomic_and(~(mask), (v))
> +#define atomic_fetch_andnot(mask, v) atomic_fetch_and(~(mask), (v))
>  ATOMIC_OPS(or, |=, CTOP_INST_AOR_DI_R2_R2_R3)
>  ATOMIC_OPS(xor, ^=, CTOP_INST_AXOR_DI_R2_R2_R3)
>  
