From: noamc@ezchip.com (Noam Camus)
Date: Tue, 1 Dec 2015 15:02:53 +0200
Subject: [PATCH v3 06/18] ARC: rwlock: disable interrupts in !LLSC variant
In-Reply-To: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
References: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1448974985-11487-7-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

If we hold rwlock and interrupt occures we may
end up spinning on it for ever during softirq.
Note that this lock is an internal lock
and since the lock is free to be used from any context,
the lock needs to be IRQ-safe.

Below you may see an example for interrupt we get while
nl_table_lock is holding its rw->lock_mutex and we spinned
on it for ever.

The concept for the fix was taken from SPARC.

[2015-05-12 19:16:12] Stack Trace:
[2015-05-12 19:16:12]   arc_unwind_core+0xb8/0x11c
[2015-05-12 19:16:12]   dump_stack+0x68/0xac
[2015-05-12 19:16:12]   _raw_read_lock+0xa8/0xac
[2015-05-12 19:16:12]   netlink_broadcast_filtered+0x56/0x35c
[2015-05-12 19:16:12]   nlmsg_notify+0x42/0xa4
[2015-05-12 19:16:13]   neigh_update+0x1fe/0x44c
[2015-05-12 19:16:13]   neigh_event_ns+0x40/0xa4
[2015-05-12 19:16:13]   arp_process+0x46e/0x5a8
[2015-05-12 19:16:13]   __netif_receive_skb_core+0x358/0x500
[2015-05-12 19:16:13]   process_backlog+0x92/0x154
[2015-05-12 19:16:13]   net_rx_action+0xb8/0x188
[2015-05-12 19:16:13]   __do_softirq+0xda/0x1d8
[2015-05-12 19:16:14]   irq_exit+0x8a/0x8c
[2015-05-12 19:16:14]   arch_do_IRQ+0x6c/0xa8
[2015-05-12 19:16:14]   handle_interrupt_level1+0xe4/0xf0

Signed-off-by: Noam Camus <noamc at ezchip.com>
Acked-by: Peter Zijlstra <peterz at infradead.org>
---
 arch/arc/include/asm/spinlock.h |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/arc/include/asm/spinlock.h b/arch/arc/include/asm/spinlock.h
index db8c59d..800e7c4 100644
--- a/arch/arc/include/asm/spinlock.h
+++ b/arch/arc/include/asm/spinlock.h
@@ -610,7 +610,9 @@ static inline void arch_spin_unlock(arch_spinlock_t *lock)
 static inline int arch_read_trylock(arch_rwlock_t *rw)
 {
 	int ret = 0;
+	unsigned long flags;
 
+	local_irq_save(flags);
 	arch_spin_lock(&(rw->lock_mutex));
 
 	/*
@@ -623,6 +625,7 @@ static inline int arch_read_trylock(arch_rwlock_t *rw)
 	}
 
 	arch_spin_unlock(&(rw->lock_mutex));
+	local_irq_restore(flags);
 
 	smp_mb();
 	return ret;
@@ -632,7 +635,9 @@ static inline int arch_read_trylock(arch_rwlock_t *rw)
 static inline int arch_write_trylock(arch_rwlock_t *rw)
 {
 	int ret = 0;
+	unsigned long flags;
 
+	local_irq_save(flags);
 	arch_spin_lock(&(rw->lock_mutex));
 
 	/*
@@ -646,6 +651,7 @@ static inline int arch_write_trylock(arch_rwlock_t *rw)
 		ret = 1;
 	}
 	arch_spin_unlock(&(rw->lock_mutex));
+	local_irq_restore(flags);
 
 	return ret;
 }
@@ -664,16 +670,24 @@ static inline void arch_write_lock(arch_rwlock_t *rw)
 
 static inline void arch_read_unlock(arch_rwlock_t *rw)
 {
+	unsigned long flags;
+
+	local_irq_save(flags);
 	arch_spin_lock(&(rw->lock_mutex));
 	rw->counter++;
 	arch_spin_unlock(&(rw->lock_mutex));
+	local_irq_restore(flags);
 }
 
 static inline void arch_write_unlock(arch_rwlock_t *rw)
 {
+	unsigned long flags;
+
+	local_irq_save(flags);
 	arch_spin_lock(&(rw->lock_mutex));
 	rw->counter = __ARCH_RW_LOCK_UNLOCKED__;
 	arch_spin_unlock(&(rw->lock_mutex));
+	local_irq_restore(flags);
 }
 
 #endif
-- 
1.7.1
