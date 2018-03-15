From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 15 Mar 2018 12:28:29 +0100
Subject: arc_usr_cmpxchg and preemption
In-Reply-To: <1521105128.11552.64.camel@synopsys.com>
References: <1521045375.11552.27.camel@synopsys.com>
 <fdf30e76-f75d-9dda-26ca-ac011c41ee64@synopsys.com>
 <20180314175352.GP4064@hirez.programming.kicks-ass.net>
 <1521059931.11552.51.camel@synopsys.com>
 <20180315081845.GS4064@hirez.programming.kicks-ass.net>
 <1521105128.11552.64.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180315112829.GW4064@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Thu, Mar 15, 2018@09:12:09AM +0000, Alexey Brodkin wrote:
> On Thu, 2018-03-15@09:18 +0100, Peter Zijlstra wrote:

> > Also, it might make sense to stuff this implementation in some lib/ file
> > somewhere and make all platforms that need it use the same code, afaict
> > there really isn't anything platform specific to it.
> 
> Not clear which part do you mean here.
> Are you talking about entire cmpxchg syscall implementation?

Yep.

> Do you think there're many users of that quite an inefficient
> [compared to proper HW version] atomic exchange?

I think there's a bunch of architectures that are in the same boat.
m68k, arm, mips was mentioned. Sure, the moment an arch has hardware
support you don't need the syscall anymore.

I was just thinking it would be good to have a common implementation (if
possible) rather than 4-5 different copies of basically the same thing.
