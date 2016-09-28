From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 28 Sep 2016 10:58:06 -0700
Subject: NMI for ARC
In-Reply-To: <20160928071642.GU2794@worktop>
References: <1445286926.3913.13.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D210D@IN01WEMBXA.internal.synopsys.com>
 <20151117110749.GT3816@twins.programming.kicks-ass.net>
 <564B0E18.3040207@synopsys.com>
 <20151117122401.GY3816@twins.programming.kicks-ass.net>
 <20151117122540.GL11639@twins.programming.kicks-ass.net>
 <564B2341.4030409@synopsys.com>
 <20151117131538.GZ3816@twins.programming.kicks-ass.net>
 <3b23d64c-2579-b72e-645a-e7ece3c1a3c6@synopsys.com>
 <20160928071642.GU2794@worktop>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3b5cbc7c-ed5c-af95-8dc9-25fd92277e98@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/28/2016 12:16 AM, Peter Zijlstra wrote:
>> 1. Is it OK in general to short-circuit preemption off irq checks for NMI style
>> > interrupts. 
> Yes. If the NMI returns to kernel space you must not attempt preemption
> for reasons you found :-), if the NMI returns to userspace you should do
> the normal return to user bits, I think.

Just to add, eliding preemption check in return path might not be sufficient as we
could still have timer intr leading to scheduler_tick() - whcih is what i found as
well ;-) So scheduler nevertheless needs to be told to not reschedule in this code
path.

So eliding preempt-off-irq just becomes an optimization for NMI code paths IMHO.

Now I was a stupid fool, fudging preemption counts in low level code, to achieve
this, whereas we have nice generic nmi_{enter,exit}() and in_nmi() helpers which
can be used.

Thx,
-Vineet
