From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 8 Mar 2019 09:37:48 +0100
Subject: [PATCH] ARCv2: spinlock: remove the extra smp_mb before lock,
 after unlock
In-Reply-To: <1552008946-8008-1-git-send-email-vgupta@synopsys.com>
References: <1552008946-8008-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190308083748.GP32477@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Thu, Mar 07, 2019@05:35:46PM -0800, Vineet Gupta wrote:
> @@ -68,8 +72,6 @@ static inline void arch_spin_unlock(arch_spinlock_t *lock)
>  	smp_mb();
>  
>  	lock->slock = __ARCH_SPIN_LOCK_UNLOCKED__;
> -
> -	smp_mb();
>  }
>  
>  /*

> @@ -226,8 +218,6 @@ static inline void arch_write_unlock(arch_rwlock_t *rw)
>  	smp_mb();
>  
>  	rw->counter = __ARCH_RW_LOCK_UNLOCKED__;
> -
> -	smp_mb();
>  }
>  
>  #else	/* !CONFIG_ARC_HAS_LLSC */

I'm thinking those assignments should be WRITE_ONCE() at the very least.
