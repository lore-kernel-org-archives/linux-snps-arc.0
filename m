From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 2 Nov 2015 07:54:16 +0000
Subject: [PATCH v1 16/20] ARC: [plat-eznps] Use dedicated cpu_relax()
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-17-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44CFD70@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 31 October 2015 06:52 PM, Noam Camus wrote:
> From: Tal Zilcer <talz at ezchip.com>
>
> Since the CTOP is SMT hardware multi-threaded, we need to hint
> the HW that now will be a very good time to do a hardware
> thread context switching. This is done by issuing the schd.rw
> instruction (binary coded here so as to not require specific
> revision of GCC to build the kernel).
> sched.rw means that Thread becomes eligible for execution by
> the threads scheduler after all pending read/write
> transactions were completed.
>
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> Cc: Peter Zijlstra <peterz at infradead.org>

Acked-by: Vineet Gupta <vgupta at synopsys.com>

> ---
>  arch/arc/include/asm/processor.h |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
> index 7266ede..f1a51a6 100644
> --- a/arch/arc/include/asm/processor.h
> +++ b/arch/arc/include/asm/processor.h
> @@ -58,7 +58,12 @@ struct task_struct;
>   * get optimised away by gcc
>   */
>  #ifdef CONFIG_SMP
> +#ifdef CONFIG_EZNPS_MTM_EXT
> +#define cpu_relax()     \
> +	__asm__ __volatile__ (".word %0" : : "i"(CTOP_INST_SCHD_RW) : "memory")
> +#else
>  #define cpu_relax()	__asm__ __volatile__ ("" : : : "memory")
> +#endif
>  #else
>  #define cpu_relax()	do { } while (0)
>  #endif
