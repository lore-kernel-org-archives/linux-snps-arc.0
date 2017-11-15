From: peterz@infradead.org (Peter Zijlstra)
Date: Wed, 15 Nov 2017 11:18:53 +0100
Subject: [PATCH 4/4] ARCv2: entry: Reduce perf intr return path
In-Reply-To: <8b2c70f0-fc51-fb9b-b799-9b85a3d3403b@gmail.com>
References: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
 <1510092784-19942-5-git-send-email-vgupta@synopsys.com>
 <20171114102802.GA3165@worktop.lehotels.local>
 <8b2c70f0-fc51-fb9b-b799-9b85a3d3403b@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171115101853.mtpamwkc5z4ptw2h@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 14, 2017@03:01:26PM -0800, Vineet Gupta wrote:
> On 11/14/2017 02:28 AM, Peter Zijlstra wrote:
> > On Tue, Nov 07, 2017@02:13:04PM -0800, Vineet Gupta wrote:
> > > In the more likely case of returning to kernel from perf interrupt, do a
> > > fast path returning w/o bothering about CONFIG_PREEMPT etc
> > 
> > I think this needs more explaining and certainly also deserves a code
> > comment.
> 
> Sure ! It was a quick hack mainly to solicit feedback.
> 
> 
> > Is the argument something along these lines?
> > 
> >    Assumes the interrupt will never set TIF_NEED_RESCHED;
> >    therefore no preemption is ever required on return from
> >    the interrupt.
> 
> No. I don't think we can assume that.

Well, given we run that code from NMI context on a number of platforms
(x86 being one of them) it can not in fact do things like wakeups.

So the pure perf-interrupt part should never set TIF_NEED_RESCHED.

I think we can actually make that assumption.

> But I was choosing to ignore it mainly to reduce the overhead of a
> perf intr in general. A subsequent real interrupt could go thru thru
> the gyrations of preemption etc.

So that's dangerous thinking... People that run a PREEMPT kernel
generally tend to care about latency (esp. when combined with
PREEMPT_RT).

And ignoring a preemption point gets these people upset (and missed
preemptions are a royal friggin pain to debug).

> > What do you (on ARC) do about irq_work ?
> 
> Nothing ATM.

So the reason I'm asking is that some architectures that don't have NMIs
call irq_work_run() at the very end of their perf-interrupt handler (ARM
does this for instance).

And the thing is, _that_ can and does do things like wakeups and will
thus require doing the PREEMPT thing.

> Although I'm sure it is, can you please explain how irq_work is relevant in
> the context of this patch.

Since the perf interrupt (in general) cannot call a whole lot of things
for it needs to assume running from NMI context, it needs to defer
things to a more regular context. It does this with irq_work.

So for instance, when the output buffer reaches its watermark, we'll
raise the irq_work to issue the wakeup of tasks that poll() on that.
