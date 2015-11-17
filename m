From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 17 Nov 2015 18:23:21 +0530
Subject: NMI for ARC
In-Reply-To: <20151117122540.GL11639@twins.programming.kicks-ass.net>
References: <1445286926.3913.13.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D210D@IN01WEMBXA.internal.synopsys.com>
 <20151117110749.GT3816@twins.programming.kicks-ass.net>
 <564B0E18.3040207@synopsys.com>
 <20151117122401.GY3816@twins.programming.kicks-ass.net>
 <20151117122540.GL11639@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <564B2341.4030409@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 17 November 2015 05:55 PM, Peter Zijlstra wrote:

> This is assuming you now have these NMIs we talked about earlier. If all
> you have are regular IRQs this is not possible, for we should be calling
> ->read() with IRQs disabled.
> 

No we don't yet. The first stab at it fell flat on floor.

The NMI support from hardware is that is it provides different priorities, higher
one obviously able to interrupt lower one. However instructions like CLRI (disable
interrupts) will still lock out all interrupts.

Thus local_irq_save()/restore() and local_irq_enable()/disable() now need to be
contextual.

  - When running in prio 0 mode, they only need to enable 0
  - In prio 1, they need to enable both 0 and 1

For irq_save()/restore() this is achievable by doing an additional STATUS32 read
at the time of save and passing that value to restore - so there's an additional
overhead - but ignoring that for now.

Bummer is irq_disable()/enable() case: there's need to pass old prio state from
enable to disabled, so we need some sort of global state tracking - which in case
of SMP needs to be per cpu.... either keep something hot in a reg or pay the cost
of additional mem/cache line miss.

I've not investigated how other arches do that. PPC seems to be using some sort of
soft irq state anyways.
