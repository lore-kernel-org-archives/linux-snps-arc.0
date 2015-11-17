From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 17 Nov 2015 12:07:49 +0100
Subject: local64_cmpxchg() in arc_perf_event_update()
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F44D210D@IN01WEMBXA.internal.synopsys.com>
References: <1445286926.3913.13.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D210D@IN01WEMBXA.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151117110749.GT3816@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 17, 2015@09:14:59AM +0000, Vineet Gupta wrote:
> Let's check with Peter as I'm not sure how exactly the read call will
> nest for same counter on same core ?

Various possible ways, but the easiest is userspace doing a sys_read()
on the counter while the NMI happens.
