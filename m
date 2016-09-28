From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 28 Sep 2016 15:44:17 -0700
Subject: NMI for ARC
In-Reply-To: <CALCETrVz48j=fmWtXN9wtSbAP6LNcb-=Uf6biq-9EmMQ=zM8zA@mail.gmail.com>
References: <C2D7FE5348E1B147BCA15975FBA23075F44D210D@IN01WEMBXA.internal.synopsys.com>
 <20151117110749.GT3816@twins.programming.kicks-ass.net>
 <564B0E18.3040207@synopsys.com>
 <20151117122401.GY3816@twins.programming.kicks-ass.net>
 <20151117122540.GL11639@twins.programming.kicks-ass.net>
 <564B2341.4030409@synopsys.com>
 <20151117131538.GZ3816@twins.programming.kicks-ass.net>
 <3b23d64c-2579-b72e-645a-e7ece3c1a3c6@synopsys.com>
 <20160928071642.GU2794@worktop>
 <CALCETrXJCGMW7DcAVw5mkfiOce4u+3OM3_QLkE117ewU_Hzpsg@mail.gmail.com>
 <20160928203748.GU5012@twins.programming.kicks-ass.net>
 <CALCETrVz48j=fmWtXN9wtSbAP6LNcb-=Uf6biq-9EmMQ=zM8zA@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <671e1614-8847-8a5f-676d-b312e4abd097@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/28/2016 03:26 PM, Andy Lutomirski wrote:
>>>>> 2. The low level return code, resume_user_mode_begin and/or resume_kernel_mode
>>>>> > > >> require interrupt safety, does that need to be NMI safe as well. We ofcourse want
>>>>> > > >> the very late register restore parts to be non-interruptible, but is this required
>>>>> > > >> before we call prrempt_schedule_irq() off of asm code.
>>>> > > >
>>>> > > > Urgh, I'm never quite sure on the details here, I've Cc'ed Andy who
>>>> > > > might actually know this off the top of his head. I'll try and dig
>>>> > > > through x86 to see what it does.
>>> > >
>>> > > On x86, it's quite simple.  IRQs are *always* off during the final
>>> > > register restore, and we don't re-check for preemption there.  x86
>>> > > handles preemption after turning off IRQs, and IRQs are guaranteed to
>>> > > stay off until we actually return to userspace.
>>> > >
>>> > > The code is almost entirely in C in arch/x86/entry/common.c.  There
>>> > > isn't anything particularly x86-speficic in there.
>> >
>> > Right, so what I think Vineet is asking is if we need to disable NMIs as
>> > well, we cannot on x86 disable NMIs so no.
>> >
> The same argument works here, too: an NMI won't set TIF_NEED_RESCHED
> without sending an IPI, so we can't miss a wakeup.

The case I saw was different: timer intr (normal prio) comes in - scheduler_tick()
sets TIF_NEED_RESCHED and before this intr return, it gets interrupted by perf
intr (higher prio) and we decide not to follow through on preemption because a
nested intr can't return to userspace anyways.
