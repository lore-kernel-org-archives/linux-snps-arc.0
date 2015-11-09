From: peterz@infradead.org (Peter Zijlstra)
Date: Mon, 9 Nov 2015 11:05:03 +0100
Subject: [PATCH v2 16/19] ARC: [plat-eznps] Use dedicated cpu_relax()
In-Reply-To: <1446893557-29748-17-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-17-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151109100503.GH17308@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Sat, Nov 07, 2015@12:52:34PM +0200, Noam Camus wrote:
> diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
> index 7266ede..50f9bae 100644
> --- a/arch/arc/include/asm/processor.h
> +++ b/arch/arc/include/asm/processor.h
> @@ -58,12 +58,21 @@ struct task_struct;
>   * get optimised away by gcc
>   */
>  #ifdef CONFIG_SMP
> +#ifndef CONFIG_EZNPS_MTM_EXT
>  #define cpu_relax()	__asm__ __volatile__ ("" : : : "memory")
>  #else
> +#define cpu_relax()     \
> +	__asm__ __volatile__ (".word %0" : : "i"(CTOP_INST_SCHD_RW) : "memory")
> +#endif
> +#else
>  #define cpu_relax()	do { } while (0)

I'm fairly sure this is incorrect. Even on UP we expect cpu_relax() to
be a compiler barrier.

>  #endif
>  
> +#ifndef CONFIG_EZNPS_MTM_EXT
>  #define cpu_relax_lowlatency() cpu_relax()
> +#else
> +#define cpu_relax_lowlatency() barrier()
> +#endif

At which point you can unconditionally use that definition.

>  
>  #define copy_segments(tsk, mm)      do { } while (0)
>  #define release_segments(mm)        do { } while (0)
> -- 
> 1.7.1
> 
