From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 8 Mar 2019 09:35:42 +0100
Subject: [PATCH] ARCv2: spinlock: remove the extra smp_mb before lock,
 after unlock
In-Reply-To: <1552008946-8008-1-git-send-email-vgupta@synopsys.com>
References: <1552008946-8008-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190308083542.GO32477@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Thu, Mar 07, 2019@05:35:46PM -0800, Vineet Gupta wrote:

>  - ARCv2 LLSC based spinlocks smp_mb() both before and after the LLSC
>    instructions, which is not required per lkmm ACQ/REL semantics.
>    smp_mb() is only needed _after_ lock and _before_ unlock.
>    So remove the extra barriers.

Right; I have memories of mentioning this earlier ;-)

> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/include/asm/spinlock.h | 45 +++++++++++------------------------------
>  1 file changed, 12 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arc/include/asm/spinlock.h b/arch/arc/include/asm/spinlock.h
> index 2ba04a7db621..be603859fb04 100644
> --- a/arch/arc/include/asm/spinlock.h
> +++ b/arch/arc/include/asm/spinlock.h
> @@ -21,8 +21,6 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
>  {
>  	unsigned int val;
>  
> -	smp_mb();
> -
>  	__asm__ __volatile__(
>  	"1:	llock	%[val], [%[slock]]	\n"
>  	"	breq	%[val], %[LOCKED], 1b	\n"	/* spin while LOCKED */
> @@ -34,6 +32,14 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
>  	  [LOCKED]	"r"	(__ARCH_SPIN_LOCK_LOCKED__)
>  	: "memory", "cc");
>  
> +	/*
> +	 * ACQUIRE barrier to ensure load/store after taking the lock
> +	 * don't "bleed-up" out of the critical section (leak-in is allowed)
> +	 * http://www.spinics.net/lists/kernel/msg2010409.html
> +	 *
> +	 * ARCv2 only has load-load, store-store and all-all barrier
> +	 * thus need the full all-all barrier
> +	 */
>  	smp_mb();
>  }

Two things:

 - have you considered doing a ticket lock instead of the test-and-set
   lock? Ticket locks are not particularly difficult to implement (see
   arch/arm/include/asm/spinlock.h for an example) and have much better
   worst case performance.

   (also; you can then easily convert to qrwlock, removing your custom
   rwlock implementation)

 - IFF (and please do verify this with your hardware people) the bnz
   after your scond can be considered a proper control dependency and
   thereby guarantees later stores will not bubble up, then you can get
   away with adding an smp_rmb(), see smp_acquire__after_ctrl_dep() and
   its comment.

   Your unlock will still need the smp_mb() before, such that the whole
   things will be RCsc.

> @@ -309,8 +290,7 @@ static inline void arch_spin_unlock(arch_spinlock_t *lock)
>  	: "memory");
>  
>  	/*
> -	 * superfluous, but keeping for now - see pairing version in
> -	 * arch_spin_lock above
> +	 * see pairing version/comment in arch_spin_lock above
>  	 */
>  	smp_mb();
>  }
