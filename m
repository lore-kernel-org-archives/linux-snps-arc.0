From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 2 Nov 2015 08:02:56 +0000
Subject: [PATCH v1 14/20] ARC: [plat-eznps] Use dedicated SMP barriers
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-15-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44CFD86@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 31 October 2015 06:52 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
>
> NPS device got 256 cores and each got 16 HW threads (SMT).
> We use EZchip dedicated ISA to trigger HW scheduler of the
> core that current HW thread belongs to.
> This scheduling makes sure that data beyond barrier is available
> to all HW threads in core and by that to all in device (4K).
>
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> Cc: Peter Zijlstra <peterz at infradead.org>
> ---
>  arch/arc/include/asm/barrier.h |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arc/include/asm/barrier.h b/arch/arc/include/asm/barrier.h
> index a720998..c8229b8 100644
> --- a/arch/arc/include/asm/barrier.h
> +++ b/arch/arc/include/asm/barrier.h
> @@ -34,6 +34,12 @@
>  
>  #ifdef CONFIG_ISA_ARCOMPACT
>  
> +#ifdef CONFIG_ARC_PLAT_EZNPS
> +#include <plat/ctop.h>
> +#define mb()	asm volatile (".word %0" : : "i"(CTOP_INST_SCHD_RW) : "memory")
> +#define rmb()	asm volatile (".word %0" : : "i"(CTOP_INST_SCHD_RD) : "memory")

Do u need this even for mandatory barriers whose semantics are not related to SMP
at all ? I think you need them only for smb_*

Following is a good introduction to difference between the two !
https://community.arm.com/groups/processors/blog/2011/04/11/memory-access-ordering-part-2--barriers-and-the-linux-kernel

> +#else
> +
>  /*
>   * ARCompact based cores (ARC700) only have SYNC instruction which is super
>   * heavy weight as it flushes the pipeline as well.
> @@ -41,6 +47,8 @@
>   */
>  
>  #define mb()	asm volatile("sync\n" : : : "memory")
> +#endif /* CONFIG_ARC_PLAT_EZNPS */
> +
>  #endif
>  
>  #include <asm-generic/barrier.h>
