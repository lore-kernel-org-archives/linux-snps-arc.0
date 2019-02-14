From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 14 Feb 2019 13:24:11 +0100
Subject: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
In-Reply-To: <4881796E12491D4BB15146FE0209CE64681DB202@DE02WEMBXB.internal.synopsys.com>
References: <20190208105519.26750-1-abrodkin@synopsys.com>
 <81017fe4-b31f-4942-e822-a7b70008b74d@synopsys.com>
 <f83412d1e7fd4d67b4632c1f81fae963@AcuMS.aculab.com>
 <bfc65835-21f9-6d5e-791d-ee49113d939c@synopsys.com>
 <20190213125651.GP32494@hirez.programming.kicks-ass.net>
 <e6138aeb-9ce4-fbfa-4d6a-b76f189a3e47@synopsys.com>
 <20190214103140.GG32494@hirez.programming.kicks-ass.net>
 <4881796E12491D4BB15146FE0209CE64681DB122@DE02WEMBXB.internal.synopsys.com>
 <20190214110813.GK32494@hirez.programming.kicks-ass.net>
 <4881796E12491D4BB15146FE0209CE64681DB202@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190214122411.GN32494@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Thu, Feb 14, 2019@12:05:47PM +0000, Alexey Brodkin wrote:

> > > > So what happens if the data is then split across two cachelines; will a
> > > > STD vs LDD still be single-copy-atomic? I don't _think_ we rely on that
> > > > for > sizeof(unsigned long), with the obvious exception of atomic64_t,
> > > > but yuck...
> > >
> > > STD & LDD are simple store/load instructions so there's no problem for
> > > their 64-bit data to be from 2 subsequent cache lines as well as 2 pages
> > > (if we're that unlucky). Or you mean something else?
> > 
> > u64 x;
> > 
> > WRITE_ONCE(x, 0x1111111100000000);
> > WRITE_ONCE(x, 0x0000000011111111);
> > 
> > vs
> > 
> > t = READ_ONCE(x);
> > 
> > is t allowed to be 0x1111111111111111 ?
> > 
> > If the data is split between two cachelines, the hardware must do
> > something very funny to avoid that.
> > 
> > single-copy-atomicity requires that to never happen; IOW no load or
> > store tearing. You must observe 'whole' values, no mixing.
> > 
> > Linux requires READ_ONCE()/WRITE_ONCE() to be single-copy-atomic for
> > <=sizeof(unsigned long) and atomic*_read()/atomic*_set() for all atomic
> > types. Your atomic64_t alignment should ensure this is so.
> 
> Thanks for explanation!
> 
> I'm not completely sure about single-copy-atomic for our LDD/STD instructions
> (need to check with HW guys) but given above requirement:
> ---------------------------->8--------------------------
> READ_ONCE()/WRITE_ONCE() to be single-copy-atomic for <=sizeof(unsigned long)
> ---------------------------->8--------------------------
> that's OK for them (LDD/STD) to not follow this, right? As they are obviously
> longer than "unsigned long".

Correct.

> Though I'm wondering if READ_ONCE()/WRITE_ONCE() could be used on 64-bit data
> even on 32-bit arches?

Some people were talking about just that a while ago; there's a number
of 32bit platforms (including arm-v7) that can actually do this and
there would be some performance benefits.

But this is currently not done (in generic code) afaik. And once they do
this, it would be under some CONFIG knob.

In particular, things like:

  - u64_stats_sync.h
  - most CONFIG_64BIT chunks from kernel/sched/fair.c

and ISTR there were some other cases.

> Now as for LLOCKD/SCONDD which implement single instruction 64-bit atomics require
> double-word alignment and so cannot possible span between cache lines.
> 
> So what am I missing here?

atomic64_{set,read}() will use STD/LDD resp and should be
single-copy-atomic vs the LLOCKD/SCONDD. But that again is aligned
properly so I don't see problems there.

Aside of that just me being curious and paranoid at the same time.
