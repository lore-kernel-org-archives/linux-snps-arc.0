From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 14 Feb 2019 11:31:40 +0100
Subject: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
In-Reply-To: <e6138aeb-9ce4-fbfa-4d6a-b76f189a3e47@synopsys.com>
References: <20190208105519.26750-1-abrodkin@synopsys.com>
 <81017fe4-b31f-4942-e822-a7b70008b74d@synopsys.com>
 <f83412d1e7fd4d67b4632c1f81fae963@AcuMS.aculab.com>
 <bfc65835-21f9-6d5e-791d-ee49113d939c@synopsys.com>
 <20190213125651.GP32494@hirez.programming.kicks-ass.net>
 <e6138aeb-9ce4-fbfa-4d6a-b76f189a3e47@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190214103140.GG32494@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Wed, Feb 13, 2019@03:23:36PM -0800, Vineet Gupta wrote:
> On 2/13/19 4:56 AM, Peter Zijlstra wrote:
> >
> > Personally I think u64 and company should already force natural
> > alignment; but alas.
> 
> But there is an ISA/ABI angle here too. e.g. On 32-bit ARC, LDD (load double) is
> allowed to take a 32-bit aligned address to load a register pair. Thus all u64
> need not be 64-bit aligned (unless attribute aligned 8 etc) hence the relaxation
> in ABI (alignment of long long is 4). You could certainly argue that we end up
> undoing some of it anyways by defining things like ARCH_KMALLOC_MINALIGN to 8, but
> still...

So what happens if the data is then split across two cachelines; will a
STD vs LDD still be single-copy-atomic? I don't _think_ we rely on that
for > sizeof(unsigned long), with the obvious exception of atomic64_t,
but yuck...

So even though it is allowed by the chip; does it really make sense to
use this?
