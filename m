From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Sep 2016 17:22:13 -0700
Subject: NMI for ARC
In-Reply-To: <20151117131538.GZ3816@twins.programming.kicks-ass.net>
References: <1445286926.3913.13.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D210D@IN01WEMBXA.internal.synopsys.com>
 <20151117110749.GT3816@twins.programming.kicks-ass.net>
 <564B0E18.3040207@synopsys.com>
 <20151117122401.GY3816@twins.programming.kicks-ass.net>
 <20151117122540.GL11639@twins.programming.kicks-ass.net>
 <564B2341.4030409@synopsys.com>
 <20151117131538.GZ3816@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3b23d64c-2579-b72e-645a-e7ece3c1a3c6@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter,

On 11/17/2015 05:15 AM, Peter Zijlstra wrote:
> On Tue, Nov 17, 2015@06:23:21PM +0530, Vineet Gupta wrote:
>> On Tuesday 17 November 2015 05:55 PM, Peter Zijlstra wrote:
>>
>>> This is assuming you now have these NMIs we talked about earlier. If all
>>> you have are regular IRQs this is not possible, for we should be calling
>>> ->read() with IRQs disabled.
>>>
>>
>> No we don't yet. The first stab at it fell flat on floor.
>>
>> The NMI support from hardware is that is it provides different priorities, higher
>> one obviously able to interrupt lower one. However instructions like CLRI (disable
>> interrupts) will still lock out all interrupts.
>>
>> Thus local_irq_save()/restore() and local_irq_enable()/disable() now need to be
>> contextual.
>>
>>   - When running in prio 0 mode, they only need to enable 0
>>   - In prio 1, they need to enable both 0 and 1
>>
>> For irq_save()/restore() this is achievable by doing an additional STATUS32 read
>> at the time of save and passing that value to restore - so there's an additional
>> overhead - but ignoring that for now.
>>
>> Bummer is irq_disable()/enable() case: there's need to pass old prio state from
>> enable to disabled, so we need some sort of global state tracking - which in case
>> of SMP needs to be per cpu.... either keep something hot in a reg or pay the cost
>> of additional mem/cache line miss.
>>
>> I've not investigated how other arches do that. PPC seems to be using some sort of
>> soft irq state anyways.
> 
> Yeah, Sparc64 might be a better example, it more closely matches your
> hardware. See
> arch/sparc/include/asm/irqflags_64.h:arch_local_irq_save().

So I finally got around to doing this and as expected has turned out to be quite
some fun. I have a couple of questions and would really appreciate your inputs there.

1. Is it OK in general to short-circuit preemption off irq checks for NMI style
interrupts. The issue is we can get nested interrupts (timer followed by perf)
and one of them can cause resched_curr() to a user task - but we can't return to
user mode from inner interrupt. So it becomes easy if we don't even bother
checking for TIF_NEED_RESCHED in perf intr path. This also has slight advantage
that perf intr returns quickly. Implementation wise this requires a hack to bump
preemption count in the low level nmi handler - and revert that in nmi return path.

2. The low level return code, resume_user_mode_begin and/or resume_kernel_mode
require interrupt safety, does that need to be NMI safe as well. We ofcourse want
the very late register restore parts to be non-interruptible, but is this required
before we call prrempt_schedule_irq() off of asm code.

Thx,
-Vineet
