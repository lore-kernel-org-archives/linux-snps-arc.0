From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 17 Nov 2015 09:14:59 +0000
Subject: local64_cmpxchg() in arc_perf_event_update()
References: <1445286926.3913.13.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D210D@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 20 October 2015 02:05 AM, Alexey Brodkin wrote:
> Hi Vineet,
>
> Looking at a patch that Peter Z mentioned:
> http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/include/linux/perf_event.h?id=b0e878759452314676f
> bdd71df4ac67e7d08de5d
>
>
> And it says here http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/include/linux/perf_event.h#n160
> --------->8----------
> 	/*
> 	 * The last observed hardware counter value, updated with a
> 	 * local64_cmpxchg() such that pmu::read() can be called nested.
> 	 */
> 	local64_t			prev_count;
> --------->8----------
>
> So now I think we may want to return to local64_cmpxchg() in arc_perf_event_update() as well.
> The reason is having no control over generic perf code we cannot really guarantee that pmu->read() won't
> happen at random moment right before we enter perf IRQ handler (where we execute arc_perf_event_update() directly).
>
> In other words arc_perf_event_update() is used in IRQ handler and outside it and chances are that
> function will be reentered at some point.
>
> Agree?

Let's check with Peter as I'm not sure how exactly the read call will nest for
same counter on same core ?

But if they do then indeed, then commit 1fe8bfa5ff3b (ARCv2: perf: implement
"event_set_period") needs to be partially reverted.

-Vineet
