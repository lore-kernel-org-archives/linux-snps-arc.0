From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 29 Sep 2016 12:48:03 -0700
Subject: NMI for ARC
In-Reply-To: <CALCETrWZ47facpNA0Juf4e9cJN9BsN7YO+8RdSeU2q=uaUgYFw@mail.gmail.com>
References: <20151117122401.GY3816@twins.programming.kicks-ass.net>
 <20151117122540.GL11639@twins.programming.kicks-ass.net>
 <564B2341.4030409@synopsys.com>
 <20151117131538.GZ3816@twins.programming.kicks-ass.net>
 <3b23d64c-2579-b72e-645a-e7ece3c1a3c6@synopsys.com>
 <20160928071642.GU2794@worktop>
 <CALCETrXJCGMW7DcAVw5mkfiOce4u+3OM3_QLkE117ewU_Hzpsg@mail.gmail.com>
 <20160928203748.GU5012@twins.programming.kicks-ass.net>
 <CALCETrVz48j=fmWtXN9wtSbAP6LNcb-=Uf6biq-9EmMQ=zM8zA@mail.gmail.com>
 <75783d4b-98bf-5d60-a844-20d4eec88ac9@synopsys.com>
 <20160929064341.GH3318@worktop.controleur.wifipass.org>
 <a7fb2709-decd-7aa9-57c4-b996c7755c33@synopsys.com>
 <CALCETrWZ47facpNA0Juf4e9cJN9BsN7YO+8RdSeU2q=uaUgYFw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <245c485e-6350-bd7f-97f2-4e35be2c8e2a@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/29/2016 11:54 AM, Andy Lutomirski wrote:
>> So lets first see how a single priority intr works on ARC (maybe on other arches
>> > as well).
>> >
>> > 1. task t1 enters kernel syscall (Trap Exception on ARC), handler drops down to
>> > pure kernel model and proceeds into syscall handler.
>> > 2. while in handler, some intr is taken, which causes a reschedule to task t2.
>> > 3. t2's control flow returns (say it was in syscall when originally
>> > scheduled-out). It needs to return to user mode but cpu needs to return from
>> > active interrupt. So we return to user mode, "riding" the intr return path. Means
>> > intr in step #2 returns to a different PC and execution mode (user vs. kernel etc).
>> >
> For the benefit of people who don't know what an "active interrupt" is
> (x86 has no such concept in hardware), can you elaborate a bit? 

A bit set in AUX_IRQ_ACTIVE register which says cpu is servicing an interrupt (of
prio X - see bottom for more details). ARC has RTIE instruction to return from
intr/exception/pure-kernel-mode. In HS38 cores, h/w saves the regfile on taken
interrupts (and not exceptions). Thus RTIE needs to know about return from intr or
exception (pure kernel mode is same as exceptions). In that sense there is a
distinction between intr mode and pure kernel mode.

> On
> x86, for all practical purposes [1], an interrupt kicks the CPU into
> kernel mode, and the kernel is free to return however it likes.  It
> can do a standard interrupt return right back to the interrupted
> context, but it can also switch stacks and do whatever some other
> thread was doing.

That is the true for ARC as well. A taken interrupt can return form orig taken
intr context or it can return in the context of a sched-in task which itself had
entered kernel via a syscall. The auto-saved regfile for interrupts is compatible
with hand saved regs for traps/exceptions so it doesn't really matter.

So when I started with initial nmi support, I was lacking equivalent of
nmi_enter() in the perf intr handler. That in turn led to this nested intr + sched
of user task situation. With that fixed (originally by just fudging the soft
preempt count in nmi entry/exit), I was able to solve this.
So even if TIF_NEED_RESCHED was already set (by outer intr say), nmi returned path
won't resched because of in_nmi() being true.

My original question to Peter was, whether it is OK to elide TIF_NEED_RESCHED
checks for nmi handlers, as an optimization, so that perf intr returns faster.

>> > Now the same scheme doesn't work out of the box when u have intr and nmi. We have
>> > to actively ensure that nmi doesn't lead to a __schedule() sans user code. And
>> > this is done by bumping preempt_count(NMI_OFFSET) in entry of nmi handler.
> The perf NMI code won't schedule.  In general, you just need to ensure
> that is_nmi() is true.  Any kernel code that touches normal locks,
> schedules, gets page faults without extreme caution, etc. needs to be
> aware that nmis are special.

Exactly this bit is what I was missing in the first place.


> [1] There's an exception on 64-bit AMD CPUs because AMD blew it.
> Also, x86 NMI return is itself severely overcomplicated because we don't
> have good control over NMI nesting.

For ARC (HS38 cores), there are 16 interrupt priorities (0-high, 15-lowest) and
each active interrupt has a bit in AUX_IRQ_ACTIVE. If a prio X is active, another
prio X can't be taken (you can only take higher prio). In that sense nmi (aka prio
0) can't nest for us.

-Vineet
