From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 17 Nov 2015 13:22:08 +0100
Subject: [PATCH v2 18/19] ARC: [plat-eznps] replace sync with proper cpu
 barrier
In-Reply-To: <564B1182.7050107@synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-19-git-send-email-noamc@ezchip.com>
 <564B0BB1.8080709@synopsys.com>
 <20151117112343.GW3816@twins.programming.kicks-ass.net>
 <564B1182.7050107@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151117122208.GX3816@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 17, 2015@05:07:38PM +0530, Vineet Gupta wrote:
> > as is ARC-SMP seems to have a _lot_ of superfluous
> > barriers many of which have no explanation yet (I'm thinking of those
> > extra smp_mb()s in the lock primitives).
> 
> Other than the lock primitives can u think of any more.

Not of the top of my head.

> I verified that with llock/scond based spinlocks, those smp_mb() can be safely
> removed.

Good!

> I didn't send that patch over yet as part of puzzle is why removing them
> in EX based locks causes hackbench to jitter on quad core builds. This required
> some perf investigation but that seems to be causing some sort of livelock with
> callgraph profiling which is what I'm debugging currently :-)

So there's two superfluous barriers right; the one before LOCK and the
one after UNLOCK. Does removing either cause the jitter? I'm thinking
that maybe its the smp_mb after UNLOCK that force flushes the store
buffer that helps (MIPS has something similar).

> BTW since we are on the topic we have this loop in stack unwinder which can
> potentially cause RCU stalls, actual lockups etc. I was planning to add the
> following - does that seem fine to you.

Worries me more than anything. How could you get stuck in there?
