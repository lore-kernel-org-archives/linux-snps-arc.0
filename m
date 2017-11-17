From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 17 Nov 2017 15:42:50 -0800
Subject: [PATCH 4/4] ARCv2: entry: Reduce perf intr return path
In-Reply-To: <20171115101853.mtpamwkc5z4ptw2h@hirez.programming.kicks-ass.net>
References: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
 <1510092784-19942-5-git-send-email-vgupta@synopsys.com>
 <20171114102802.GA3165@worktop.lehotels.local>
 <8b2c70f0-fc51-fb9b-b799-9b85a3d3403b@gmail.com>
 <20171115101853.mtpamwkc5z4ptw2h@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4a28d9dc-b322-1a79-b1d1-c13db2f01ee7@synopsys.com>
To: linux-snps-arc@lists.infradead.org


>> But I was choosing to ignore it mainly to reduce the overhead of a
>> perf intr in general. A subsequent real interrupt could go thru thru
>> the gyrations of preemption etc.
> 
> So that's dangerous thinking... People that run a PREEMPT kernel
> generally tend to care about latency (esp. when combined with
> PREEMPT_RT).
> 
> And ignoring a preemption point gets these people upset (and missed
> preemptions are a royal friggin pain to debug).

Which implies that this patch goes to trash ! Unless we think that running 
instrumentation (perf) on production systems will not yield the same behavior in 
general.

>>> What do you (on ARC) do about irq_work ?
>>
>> Nothing ATM.

What I meant was lack of support for arch_irq_work_raise(). But given that we 
don't have NMIs (yet), this need *not* be a must as things could actually be 
scheduled in the regular intr return path ? At any rate arch_irq_work_raise() is 
not relevant for this discussion since NMIs are not involved.

> So the reason I'm asking is that some architectures that don't have NMIs
> call irq_work_run() at the very end of their perf-interrupt handler (ARM
> does this for instance).

But on ARC, we don't call irq_work_run() in perf intr return path and that seem to 
imply it is broken - as in latency to service a perf induced preemption.

> And the thing is, _that_ can and does do things like wakeups and will
> thus require doing the PREEMPT thing.

Reassures that this patch has to go to trash anyways, but I'm more worried about 
perf intr return for ARC in general.

>> Although I'm sure it is, can you please explain how irq_work is relevant in
>> the context of this patch.
> 
> Since the perf interrupt (in general) cannot call a whole lot of things
> for it needs to assume running from NMI context, it needs to defer
> things to a more regular context. It does this with irq_work.

And so do places such as flush_smp_call_function_queue() where the cross-core IPI 
could be an NMI.

> So for instance, when the output buffer reaches its watermark, we'll
> raise the irq_work to issue the wakeup of tasks that poll() on that.

Cool, thx for the explanation.
Perhaps I should put it in a Documentation/irq_work.txt pr some such !

Thx,
-Vineet
