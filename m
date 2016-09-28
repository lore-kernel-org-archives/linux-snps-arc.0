From: peterz@infradead.org (Peter Zijlstra)
Date: Wed, 28 Sep 2016 09:16:42 +0200
Subject: NMI for ARC
In-Reply-To: <3b23d64c-2579-b72e-645a-e7ece3c1a3c6@synopsys.com>
References: <1445286926.3913.13.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D210D@IN01WEMBXA.internal.synopsys.com>
 <20151117110749.GT3816@twins.programming.kicks-ass.net>
 <564B0E18.3040207@synopsys.com>
 <20151117122401.GY3816@twins.programming.kicks-ass.net>
 <20151117122540.GL11639@twins.programming.kicks-ass.net>
 <564B2341.4030409@synopsys.com>
 <20151117131538.GZ3816@twins.programming.kicks-ass.net>
 <3b23d64c-2579-b72e-645a-e7ece3c1a3c6@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160928071642.GU2794@worktop>
To: linux-snps-arc@lists.infradead.org

On Tue, Sep 27, 2016@05:22:13PM -0700, Vineet Gupta wrote:

> > Yeah, Sparc64 might be a better example, it more closely matches your
> > hardware. See
> > arch/sparc/include/asm/irqflags_64.h:arch_local_irq_save().
> 
> So I finally got around to doing this and as expected has turned out to be quite
> some fun. I have a couple of questions and would really appreciate your inputs there.
> 
> 1. Is it OK in general to short-circuit preemption off irq checks for NMI style
> interrupts. 

Yes. If the NMI returns to kernel space you must not attempt preemption
for reasons you found :-), if the NMI returns to userspace you should do
the normal return to user bits, I think.

> 2. The low level return code, resume_user_mode_begin and/or resume_kernel_mode
> require interrupt safety, does that need to be NMI safe as well. We ofcourse want
> the very late register restore parts to be non-interruptible, but is this required
> before we call prrempt_schedule_irq() off of asm code.

Urgh, I'm never quite sure on the details here, I've Cc'ed Andy who
might actually know this off the top of his head. I'll try and dig
through x86 to see what it does.
