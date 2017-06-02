From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 2 Jun 2017 11:36:17 -0700
Subject: [PATCH v2 08/11] ARC: [plat-eznps] spinlock aware for MTM
In-Reply-To: <1495954328-28736-9-git-send-email-noamca@mellanox.com>
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
 <1495954328-28736-9-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <180d8e76-fa00-b138-0d5f-720b116228b8@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 05/27/2017 11:52 PM, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
> 
> This way when we execute "ex" during trying to hold lock we can switch to
> other HW thread and utilize the core intead of just spinning on a lock.
> 
> We noticed about 10% improvement of execution time with hackbench test.
> 
> Signed-off-by: Noam Camus <noamca at mellanox.com>
> ---
>   arch/arc/include/asm/spinlock.h |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arc/include/asm/spinlock.h b/arch/arc/include/asm/spinlock.h
> index 233d5ff..0a54ce7 100644
> --- a/arch/arc/include/asm/spinlock.h
> +++ b/arch/arc/include/asm/spinlock.h
> @@ -252,9 +252,15 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
>   
>   	__asm__ __volatile__(
>   	"1:	ex  %0, [%1]		\n"
> +#ifdef CONFIG_EZNPS_MTM_EXT
> +	"	.word %3		\n"
> +#endif
>   	"	breq  %0, %2, 1b	\n"
>   	: "+&r" (val)
>   	: "r"(&(lock->slock)), "ir"(__ARCH_SPIN_LOCK_LOCKED__)
> +#ifdef CONFIG_EZNPS_MTM_EXT
> +	, "i"(CTOP_INST_SCHD_RW)
> +#endif
>   	: "memory");
>   
>   	/*
> 

This is ugly - I will fix it up here to create an NPS version of arch_spin_lock !

-Vineet
