From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 9 Jun 2017 10:28:50 -0700
Subject: [RFC][PATCH] atomic: Fix atomic_set_release() for 'funny'
 architectures
In-Reply-To: <20170609111305.bn4ca4uscbp6pgxn@hirez.programming.kicks-ass.net>
References: <20170609092450.jwmldgtli57ozxgq@hirez.programming.kicks-ass.net>
 <20170609110506.yod47flaav3wgoj5@hirez.programming.kicks-ass.net>
 <20170609111305.bn4ca4uscbp6pgxn@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ecffd3a6-167b-c0ed-0121-1a3a4141f799@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/09/2017 04:13 AM, Peter Zijlstra wrote:
> On Fri, Jun 09, 2017@01:05:06PM +0200, Peter Zijlstra wrote:
> 
>> The spinlock based atomics should be SC, that is, none of them appear to
>> place extra barriers in atomic_cmpxchg() or any of the other SC atomic
>> primitives and therefore seem to rely on their spinlock implementation
>> being SC (I did not fully validate all that).
> 
> So I did see that ARC and PARISC have 'superfluous' smp_mb() calls
> around their spinlock implementation.
> 
> That is, for spinlock semantics you only need one _after_ lock and one
> _before_ unlock. But the atomic stuff relies on being SC and thus would
> need one before and after both lock and unlock.

Right we discussed this a while back: https://lkml.org/lkml/2015/6/11/276

At the time when I tried removing these extra barriers, hackbench regressed. I'm 
about to get a new quad core 1GHz chip (vs. the FPGA before) and will 
re-experiment. Likely we don't need it otherwise I will add a comment of this 
"feature"

> But ARC could probably optimize (if they still care about that hardware)
> by pulling out those barriers and putting it in the atomic
> implementation.

A bit confused here. Reading the lkml posting for this thread, you posted 2 
patches, and they had to do with atomic_set() for EZChip platform which is really 
special (no ll/sc). The extra smp_mb() is related to ll/sc variants. Just tryign 
to make sure that we are talking 2 different things here :-)

-Vineet
