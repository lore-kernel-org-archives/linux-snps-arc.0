From: peterz@infradead.org (Peter Zijlstra)
Date: Mon, 9 Nov 2015 11:45:33 +0100
Subject: [PATCH v2 16/19] ARC: [plat-eznps] Use dedicated cpu_relax()
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F44D1200@IN01WEMBXA.internal.synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-17-git-send-email-noamc@ezchip.com>
 <20151109100503.GH17308@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA23075F44D1200@IN01WEMBXA.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151109104533.GT3604@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Mon, Nov 09, 2015@10:22:27AM +0000, Vineet Gupta wrote:
> On Monday 09 November 2015 03:35 PM, Peter Zijlstra wrote:
> > On Sat, Nov 07, 2015@12:52:34PM +0200, Noam Camus wrote:
> >> diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
> >> index 7266ede..50f9bae 100644
> >> --- a/arch/arc/include/asm/processor.h
> >> +++ b/arch/arc/include/asm/processor.h
> >> @@ -58,12 +58,21 @@ struct task_struct;
> >>   * get optimised away by gcc
> >>   */
> >>  #ifdef CONFIG_SMP
> >> +#ifndef CONFIG_EZNPS_MTM_EXT
> >>  #define cpu_relax()	__asm__ __volatile__ ("" : : : "memory")
> >>  #else
> >> +#define cpu_relax()     \
> >> +	__asm__ __volatile__ (".word %0" : : "i"(CTOP_INST_SCHD_RW) : "memory")
> >> +#endif
> >> +#else
> >>  #define cpu_relax()	do { } while (0)
> > I'm fairly sure this is incorrect. Even on UP we expect cpu_relax() to
> > be a compiler barrier.
> 
> We discussed this a while back (why do https:/lkml.org/lkml/<year>/.... links work
> psuedo randomly)
> 
> http://marc.info/?l=linux-kernel&m=140350765530113

Hurm.. you have a better memory than me ;-)

So in general we assume cpu_relax() implies a barrier() and I think we
have loops like:

	while (!var)
		cpu_relax();

where var isn't volatile (or casted using READ_ONCE etc).

See for instance: kernel/time/timer.c:lock_timer_base() which has:

	for (;;) {
		u32 tf = timer->flags;

		if (!(tf & TIMER_MIGRATING)) {
		 ...
		}

		cpu_relax();
	}

So while TIMER_MIGRATING is set, it will only ever do regular loads,
which GCC is permitted to lift out if cpu_relax() is not a barrier.
