From: peterz@infradead.org (Peter Zijlstra)
Date: Mon, 2 Nov 2015 11:03:11 +0100
Subject: [PATCH v1 05/20] ARC: rwlock: disable interrupts in !LLSC variant
In-Reply-To: <56373019.6080501@synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-6-git-send-email-noamc@ezchip.com>
 <56373019.6080501@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151102100311.GO17308@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Mon, Nov 02, 2015@03:12:49PM +0530, Vineet Gupta wrote:
> > @@ -664,16 +670,24 @@ static inline void arch_write_lock(arch_rwlock_t *rw)
> >  
> >  static inline void arch_read_unlock(arch_rwlock_t *rw)
> >  {
> > +	unsigned long flags;
> > +
> > +	local_irq_save(flags);
> >  	arch_spin_lock(&(rw->lock_mutex));
> 
> 
> Isn't raw_spin_lock_irqsave() equivalent and more concise ?

You might run into header file recursion issues; also raw_spinlock has
lockdep annotations added, whereas the above does not.
