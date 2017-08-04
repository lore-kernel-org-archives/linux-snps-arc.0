From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 4 Aug 2017 11:38:05 +0200
Subject: update timer frequencies
In-Reply-To: <cd7ddf4e-ecde-8450-99c4-80932a7952d8@synopsys.com>
References: <1489137441.2333.46.camel@synopsys.com>
 <alpine.DEB.2.20.1703101113370.3681@nanos>
 <cd7ddf4e-ecde-8450-99c4-80932a7952d8@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170804093805.z5y2o6t6wp34ywln@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Fri, Aug 04, 2017@12:28:43PM +0530, Vineet Gupta wrote:

> The hardware is being changed and I had a couple of questions to help do it right:

Awesome ;-)

> 2. I'm not sure if the timer generating interrupts (periodic or oneshot)
> needs to be fed invariant fixed clk or dynamic core clk. Naively it should
> follow the core - but what happens to scheduled timers (say TCP timeouts):
> if this clk changes - they need to be canceled/updated. If it doesn't then
> the notion of timing is broken ? I'm likely not thinking this through
> correctly.

Please keep the timers on the very same clock as your clocksource.
clockevent and clocksource having different (and possibly) drifting
timelines is painful.

Having them on the same clock makes everything so much easier, since you
_know_ what time it is when they fire and won't have to recompute and
possibly rearm the timer.
