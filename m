From: peterz@infradead.org (Peter Zijlstra)
Date: Mon, 9 Nov 2015 13:51:47 +0100
Subject: [PATCH v2 16/19] ARC: [plat-eznps] Use dedicated cpu_relax()
In-Reply-To: <5640912D.3010504@synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-17-git-send-email-noamc@ezchip.com>
 <20151109100503.GH17308@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA23075F44D1200@IN01WEMBXA.internal.synopsys.com>
 <20151109104533.GT3604@twins.programming.kicks-ass.net>
 <5640912D.3010504@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151109125147.GU3604@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Mon, Nov 09, 2015@05:57:25PM +0530, Vineet Gupta wrote:
> From e29de8efa621b825891dcc744c84965b38f6b868 Mon Sep 17 00:00:00 2001
> From: Vineet Gupta <vgupta at synopsys.com>
> Date: Mon, 9 Nov 2015 17:48:34 +0530
> Subject: [PATCH] ARC: cpu_relax() to be compiler barrier even for UP
> 
> cpu_relax() on ARC has been barrier only for SMP (and no-op for UP). Per
> recent discussions, it is safer to make it a compiler barrier
> unconditionally.
> 
> Link: http://lkml.kernel.org/r/53A7D3AA.9020100 at synopsys.com

Acked-by: Peter Zijlstra (Intel) <peterz at infradead.org>

> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/include/asm/processor.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
> index 44545354e9e8..1d694c1ef6d6 100644
> --- a/arch/arc/include/asm/processor.h
> +++ b/arch/arc/include/asm/processor.h
> @@ -57,11 +57,7 @@ struct task_struct;
>   * A lot of busy-wait loops in SMP are based off of non-volatile data otherwise
>   * get optimised away by gcc
>   */
> -#ifdef CONFIG_SMP
>  #define cpu_relax()	__asm__ __volatile__ ("" : : : "memory")
> -#else
> -#define cpu_relax()	do { } while (0)
> -#endif
> 
>  #define cpu_relax_lowlatency() cpu_relax()
> 
> -- 
> 1.9.1
> 
