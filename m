From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 23 Feb 2016 11:39:50 +0100
Subject: Interesting csd deadlock on ARC
In-Reply-To: <56CC32A3.5020804@synopsys.com>
References: <56C6BA82.1060909@synopsys.com> <56CBEC66.2030401@synopsys.com>
 <20160223095824.GH6356@twins.programming.kicks-ass.net>
 <56CC32A3.5020804@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160223103950.GJ6356@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Tue, Feb 23, 2016@03:51:23PM +0530, Vineet Gupta wrote:
> > 
> > Now the distinct difference between arch_irq_work_raise() and
> > arch_send_call_function_single_ipi() is that arch_irq_work_raise()
> > should be NMI-safe.
> 
> Ok - so when I implement interrupt priorities (aka NMI for ARC), this needs to be
> highest.

So on x86 the issue is that the NMI can interrupt someone else writing
to the lapic. So there's a bit of extra care to be taken.

If your platform doesn't suffer such issues, then that should be fine.

The only requirement for irq_work is that it runs after the NMI
completes and runs from regular IRQ context. There are no strict
interrupt priority requirements, only that it happens.

> > I seem to have forgotten the status of NMIs on ARC, but this is
> > something to make a note of.
> 
> Not had a chance to go back to it since we last discussed.
> I've just been swamped with bug fixing like this one :-(

Yeah, I'm familiar with the problem ...
