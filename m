From: peterz@infradead.org (Peter Zijlstra)
Date: Mon, 2 Nov 2015 10:26:54 +0100
Subject: [PATCH v1 19/20] ARC: [plat-eznps] replace sync with proper cpu
 barrier
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F44CFD50@IN01WEMBXA.internal.synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-20-git-send-email-noamc@ezchip.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44CFD50@IN01WEMBXA.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151102092654.GM17308@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Mon, Nov 02, 2015@07:48:54AM +0000, Vineet Gupta wrote:
> Since u bring this up - I think we don't need the original SYNC and/or
> SMT thread schedule at all.  The SYNC here is a historic relic at best
> and we can get rid of it per reasoning below:
> 
> In UP context it is obviously useless, why would we want to stall the
> core for all updates to stack memory of t0 to complete before loading
> kernel ode callee registers from t1 stack's memory.
> 
> In SMP, we could have a potential race in which outdoing task could be
> concurrently picked for running, thus the writes to stack here need to
> be visible before the reads from stack on other core. But I think
> since this is the same rq, there would be a taken spinlock and once a
> core gives it up, an smp barrier would come naturally.
> 
> Peter do u concur ?

I'm still somewhat jet-lagged, but I think the below reference should
answer your question:

lkml.kernel.org/r/20150917130125.GL3816 at twins.programming.kicks-ass.net

I (still) need to update that patch and send it out again.

But I think it answers your question; we do not rely on arch code to
provide barriers for the generic code.

Now, if for some reason the arch code has further constraints, then
maybe, but I don't think so.
