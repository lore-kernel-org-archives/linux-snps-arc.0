From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 29 Sep 2016 09:47:08 -0700
Subject: NMI for ARC
In-Reply-To: <20160929064341.GH3318@worktop.controleur.wifipass.org>
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
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a7fb2709-decd-7aa9-57c4-b996c7755c33@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/28/2016 11:43 PM, Peter Zijlstra wrote:
> On Wed, Sep 28, 2016@06:20:29PM -0700, Vineet Gupta wrote:
>> On 09/28/2016 03:26 PM, Andy Lutomirski wrote:

> 
> 
> 	user	irq	nmi
> 
> 	|
> 	|
> 	`-----> .
> 		|
> 		|
> 		|
> 		`----->	.
> 			|
> 			|
> 		. <-----'
> 	. <-----'
> 	|
> 	|
> 
> So what Andy is saying is that NMI context never sets TIF_NEED_RESCHED,

Can we we be absolutely sure about that. A perf intr, vmalloc based mmap can go
thru various hoops and. Is it not possible that it hits a reschedule, setting
TIF_NEED_RESCHED

> this means that return from NMI never needs to check for preemption
> etc..

I don't think this implies from prev one. In my example, timer interrupt triggers
a TIF_NEED_RESCHED and irq_exit -> __do_softirq() it hits the perf intr

> Now your return from IRQ obviously should, the normal way. If the IRQ
> return gets interrupted by the NMI nothing special should occur. The
> return from NMI should simply resume the return from IRQ.
> 
> So I'm a little confused by your timer interrupt example, it _should_ do
> the preemption, the nested interrupt (NMI) will return to the regular
> interrupt which should resume its normal return preemption or not.

So lets first see how a single priority intr works on ARC (maybe on other arches
as well).

1. task t1 enters kernel syscall (Trap Exception on ARC), handler drops down to
pure kernel model and proceeds into syscall handler.
2. while in handler, some intr is taken, which causes a reschedule to task t2.
3. t2's control flow returns (say it was in syscall when originally
scheduled-out). It needs to return to user mode but cpu needs to return from
active interrupt. So we return to user mode, "riding" the intr return path. Means
intr in step #2 returns to a different PC and execution mode (user vs. kernel etc).

Now the same scheme doesn't work out of the box when u have intr and nmi. We have
to actively ensure that nmi doesn't lead to a __schedule() sans user code. And
this is done by bumping preempt_count(NMI_OFFSET) in entry of nmi handler.
