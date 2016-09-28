From: luto@amacapital.net (Andy Lutomirski)
Date: Wed, 28 Sep 2016 12:25:11 -0700
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
Message-ID: <CALCETrXJCGMW7DcAVw5mkfiOce4u+3OM3_QLkE117ewU_Hzpsg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Sep 28, 2016@12:16 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> On Tue, Sep 27, 2016@05:22:13PM -0700, Vineet Gupta wrote:
>
>> > Yeah, Sparc64 might be a better example, it more closely matches your
>> > hardware. See
>> > arch/sparc/include/asm/irqflags_64.h:arch_local_irq_save().
>>
>> So I finally got around to doing this and as expected has turned out to be quite
>> some fun. I have a couple of questions and would really appreciate your inputs there.
>>
>> 1. Is it OK in general to short-circuit preemption off irq checks for NMI style
>> interrupts.
>
> Yes. If the NMI returns to kernel space you must not attempt preemption
> for reasons you found :-),

Last time I looked at this, I decided that there was no reason that
NMIs would ever need to handle preemption.  Even if the NMI hit
interruptible kernel code, anything that would cause preemption to be
needed would either send an IPI (and thus cause preemption) right
after the NMI fiinished.  NMI handlers themselves have no business
setting TIF_NEED_RESCHED or similar.

> if the NMI returns to userspace you should do
> the normal return to user bits, I think.

x86 does this for simplicity.  There was a really nasty corner case
that I could only figure out how to solve by special casing NMIs from
user space.  I'm not sure that it's actually necessary from a
non-arch-specific POV to handle all the usual return-to-userspace work
on NMI.  But maybe perf NMIs can send signals?

x86's MCEs *do* need the full return-to-userspace handling for memory
failure to work right.  MCE is kind of like NMI...

>
>> 2. The low level return code, resume_user_mode_begin and/or resume_kernel_mode
>> require interrupt safety, does that need to be NMI safe as well. We ofcourse want
>> the very late register restore parts to be non-interruptible, but is this required
>> before we call prrempt_schedule_irq() off of asm code.
>
> Urgh, I'm never quite sure on the details here, I've Cc'ed Andy who
> might actually know this off the top of his head. I'll try and dig
> through x86 to see what it does.

On x86, it's quite simple.  IRQs are *always* off during the final
register restore, and we don't re-check for preemption there.  x86
handles preemption after turning off IRQs, and IRQs are guaranteed to
stay off until we actually return to userspace.

The code is almost entirely in C in arch/x86/entry/common.c.  There
isn't anything particularly x86-speficic in there.
