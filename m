From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 2 Nov 2015 07:48:54 +0000
Subject: [PATCH v1 19/20] ARC: [plat-eznps] replace sync with proper cpu
 barrier
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-20-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44CFD50@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

+CC Peter.

On Saturday 31 October 2015 06:53 PM, Noam Camus wrote:
> From: Tal Zilcer <talz at ezchip.com>
>
> In SMT system like we have the generic "sync" is not working with
> HW threads. The replacement is "schd.rw" instruction that is served
> as cpu barrier for HW threads.
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> ---
>  arch/arc/kernel/ctx_sw.c |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arc/kernel/ctx_sw.c b/arch/arc/kernel/ctx_sw.c
> index 92e2e82..2a2f50e 100644
> --- a/arch/arc/kernel/ctx_sw.c
> +++ b/arch/arc/kernel/ctx_sw.c
> @@ -61,7 +61,11 @@ __switch_to(struct task_struct *prev_task, struct task_struct *next_task)
>  		"st      sp, [r24]       \n\t"
>  #endif
>  
> +#ifdef CONFIG_EZNPS_MTM_EXT
> +		".word %5   \n\t"
> +#else
>  		"sync   \n\t"
> +#endif
>  
>  		/*
>  		 * setup _current_task with incoming tsk.
> @@ -122,6 +126,9 @@ __switch_to(struct task_struct *prev_task, struct task_struct *next_task)
>  #ifdef CONFIG_ARC_PLAT_EZNPS
>  		, "i"(CTOP_AUX_LOGIC_GLOBAL_ID)
>  #endif
> +#ifdef CONFIG_EZNPS_MTM_EXT
> +		, "i"(CTOP_INST_SCHD_RW)
> +#endif
>  		: "blink"
>  	);

Since u bring this up - I think we don't need the original SYNC and/or SMT thread
schedule at all.
The SYNC here is a historic relic at best and we can get rid of it per reasoning
below:

In UP context it is obviously useless, why would we want to stall the core for all
updates to stack memory of t0 to complete before loading kernel ode callee
registers from t1 stack's memory.

In SMP, we could have a potential race in which outdoing task could be
concurrently picked for running, thus the writes to stack here need to be visible
before the reads from stack on other core. But I think since this is the same rq,
there would be a taken spinlock and once a core gives it up, an smp barrier would
come naturally.

Peter do u concur ?
