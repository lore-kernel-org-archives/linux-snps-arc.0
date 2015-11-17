From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 17 Nov 2015 13:25:40 +0100
Subject: local64_cmpxchg() in arc_perf_event_update()
In-Reply-To: <20151117122401.GY3816@twins.programming.kicks-ass.net>
References: <1445286926.3913.13.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D210D@IN01WEMBXA.internal.synopsys.com>
 <20151117110749.GT3816@twins.programming.kicks-ass.net>
 <564B0E18.3040207@synopsys.com>
 <20151117122401.GY3816@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151117122540.GL11639@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 17, 2015@01:24:01PM +0100, Peter Zijlstra wrote:
> On Tue, Nov 17, 2015@04:53:04PM +0530, Vineet Gupta wrote:
> > That means Alexey need to revert the hunk ?
> 
> Yes, I think so.

This is assuming you now have these NMIs we talked about earlier. If all
you have are regular IRQs this is not possible, for we should be calling
->read() with IRQs disabled.
