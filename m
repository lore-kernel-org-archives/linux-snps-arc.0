From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 14 Feb 2019 10:44:49 +0000
Subject: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
In-Reply-To: <20190214103140.GG32494@hirez.programming.kicks-ass.net>
References: <20190208105519.26750-1-abrodkin@synopsys.com>
 <81017fe4-b31f-4942-e822-a7b70008b74d@synopsys.com>
 <f83412d1e7fd4d67b4632c1f81fae963@AcuMS.aculab.com>
 <bfc65835-21f9-6d5e-791d-ee49113d939c@synopsys.com>
 <20190213125651.GP32494@hirez.programming.kicks-ass.net>
 <e6138aeb-9ce4-fbfa-4d6a-b76f189a3e47@synopsys.com>
 <20190214103140.GG32494@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE64681DB122@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter,

> -----Original Message-----
> From: Peter Zijlstra <peterz at infradead.org>
> Sent: Thursday, February 14, 2019 1:32 PM
> To: Vineet Gupta <vineet.gupta1 at synopsys.com>
> Cc: David Laight <David.Laight at ACULAB.COM>; Alexey Brodkin <alexey.brodkin at synopsys.com>; linux-snps-
> arc at lists.infradead.org; Arnd Bergmann <arnd.bergmann at linaro.org>; linux-kernel at vger.kernel.org;
> stable at vger.kernel.org; Mark Rutland <mark.rutland at arm.com>
> Subject: Re: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
> 
> On Wed, Feb 13, 2019@03:23:36PM -0800, Vineet Gupta wrote:
> > On 2/13/19 4:56 AM, Peter Zijlstra wrote:
> > >
> > > Personally I think u64 and company should already force natural
> > > alignment; but alas.
> >
> > But there is an ISA/ABI angle here too. e.g. On 32-bit ARC, LDD (load double) is
> > allowed to take a 32-bit aligned address to load a register pair. Thus all u64
> > need not be 64-bit aligned (unless attribute aligned 8 etc) hence the relaxation
> > in ABI (alignment of long long is 4). You could certainly argue that we end up
> > undoing some of it anyways by defining things like ARCH_KMALLOC_MINALIGN to 8, but
> > still...
> 
> So what happens if the data is then split across two cachelines; will a
> STD vs LDD still be single-copy-atomic? I don't _think_ we rely on that
> for > sizeof(unsigned long), with the obvious exception of atomic64_t,
> but yuck...

STD & LDD are simple store/load instructions so there's no problem for
their 64-bit data to be from 2 subsequent cache lines as well as 2 pages
(if we're that unlucky). Or you mean something else?

> So even though it is allowed by the chip; does it really make sense to
> use this?

It gives performance benefits when dealing with either 64-bit or even
larger buffers, see how we use it in our string routines like here [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arc/lib/memset-archs.S#n81

-Alexey
