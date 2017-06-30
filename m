From: paulmck@linux.vnet.ibm.com (Paul E. McKenney)
Date: Thu, 29 Jun 2017 17:01:18 -0700
Subject: [PATCH RFC 10/26] arc: Remove spin_unlock_wait() arch-specific
 definitions
In-Reply-To: <20170629235918.GA6445@linux.vnet.ibm.com>
References: <20170629235918.GA6445@linux.vnet.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1498780894-8253-10-git-send-email-paulmck@linux.vnet.ibm.com>
To: linux-snps-arc@lists.infradead.org

There is no agreed-upon definition of spin_unlock_wait()'s semantics,
and it appears that all callers could do just as well with a lock/unlock
pair.  This commit therefore removes the underlying arch-specific
arch_spin_unlock_wait().

Signed-off-by: Paul E. McKenney <paulmck at linux.vnet.ibm.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: <linux-snps-arc at lists.infradead.org>
Cc: Will Deacon <will.deacon at arm.com>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Alan Stern <stern at rowland.harvard.edu>
Cc: Andrea Parri <parri.andrea at gmail.com>
Cc: Linus Torvalds <torvalds at linux-foundation.org>
---
 arch/arc/include/asm/spinlock.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arc/include/asm/spinlock.h b/arch/arc/include/asm/spinlock.h
index 233d5ffe6ec7..a325e6a36523 100644
--- a/arch/arc/include/asm/spinlock.h
+++ b/arch/arc/include/asm/spinlock.h
@@ -16,11 +16,6 @@
 #define arch_spin_is_locked(x)	((x)->slock != __ARCH_SPIN_LOCK_UNLOCKED__)
 #define arch_spin_lock_flags(lock, flags)	arch_spin_lock(lock)
 
-static inline void arch_spin_unlock_wait(arch_spinlock_t *lock)
-{
-	smp_cond_load_acquire(&lock->slock, !VAL);
-}
-
 #ifdef CONFIG_ARC_HAS_LLSC
 
 static inline void arch_spin_lock(arch_spinlock_t *lock)
-- 
2.5.2
