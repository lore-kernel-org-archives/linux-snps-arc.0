From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 14 Mar 2016 13:35:20 +0530
Subject: [PATCH] mm: slub: Ensure that slab_unlock() is atomic
In-Reply-To: <20160309114054.GJ6356@twins.programming.kicks-ass.net>
References: <1457447457-25878-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1603080857360.4047@east.gentwo.org>
 <56DEF3D3.6080008@synopsys.com>
 <alpine.DEB.2.20.1603081438020.4268@east.gentwo.org>
 <56DFC604.6070407@synopsys.com>
 <20160309101349.GJ6344@twins.programming.kicks-ass.net>
 <56E0024F.4070401@synopsys.com>
 <20160309114054.GJ6356@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56E670C0.7080901@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Wednesday 09 March 2016 05:10 PM, Peter Zijlstra wrote:

> ---
> Subject: bitops: Do not default to __clear_bit() for __clear_bit_unlock()
> 
> __clear_bit_unlock() is a special little snowflake. While it carries the
> non-atomic '__' prefix, it is specifically documented to pair with
> test_and_set_bit() and therefore should be 'somewhat' atomic.
> 
> Therefore the generic implementation of __clear_bit_unlock() cannot use
> the fully non-atomic __clear_bit() as a default.
> 
> If an arch is able to do better; is must provide an implementation of
> __clear_bit_unlock() itself.
> 
> Specifically, this came up as a result of hackbench livelock'ing in
> slab_lock() on ARC with SMP + SLUB + !LLSC.
> 
> The issue was incorrect pairing of atomic ops.
> 
> slab_lock() -> bit_spin_lock() -> test_and_set_bit()
> slab_unlock() -> __bit_spin_unlock() -> __clear_bit()
> 
> The non serializing __clear_bit() was getting "lost"
> 
> 80543b8e:	ld_s       r2,[r13,0] <--- (A) Finds PG_locked is set
> 80543b90:	or         r3,r2,1    <--- (B) other core unlocks right here
> 80543b94:	st_s       r3,[r13,0] <--- (C) sets PG_locked (overwrites unlock)
> 
> Fixes ARC STAR 9000817404 (and probably more).
> 
> Cc: stable at vger.kernel.org
> Reported-by: Vineet Gupta <Vineet.Gupta1 at synopsys.com>
> Tested-by: Vineet Gupta <Vineet.Gupta1 at synopsys.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz at infradead.org>

Peter, I don't see this in linux-next yet. I'm hoping you will send it Linus' way
for 4.6-rc1.

Thx,
-Vineet
