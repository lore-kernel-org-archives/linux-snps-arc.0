From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 14 Feb 2019 11:28:15 +0100
Subject: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
In-Reply-To: <4881796E12491D4BB15146FE0209CE64681DB01F@DE02WEMBXB.internal.synopsys.com>
References: <20190208105519.26750-1-abrodkin@synopsys.com>
 <81017fe4-b31f-4942-e822-a7b70008b74d@synopsys.com>
 <f83412d1e7fd4d67b4632c1f81fae963@AcuMS.aculab.com>
 <bfc65835-21f9-6d5e-791d-ee49113d939c@synopsys.com>
 <20190213125651.GP32494@hirez.programming.kicks-ass.net>
 <e6138aeb-9ce4-fbfa-4d6a-b76f189a3e47@synopsys.com>
 <4881796E12491D4BB15146FE0209CE64681DB01F@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190214102815.GF32494@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Thu, Feb 14, 2019@08:50:43AM +0000, Alexey Brodkin wrote:

> But that's pretty much the same for other 32-bit arches that have 64-bit atomics
> like ARM etc. From what I may see from ARM's documentation for LDREXD/SRREXD they
> require double-word alignment of data as well.
> 
> That said if for some reason atomic64_t variable is unaligned execution on
> any (or at least most) 32-bit architectures will lead to run-time failure,
> i.e. we'll know about it and this will be fixed.

On x86_32 we have cmpxchg8b that 'likes' 8b alignment, our atomic64_32
implementation has the explicit alignment in, however there
__alignof__(unsigned long long) is actually 8, so it all works.

Even though the hardware (obviously) never really requires alignment,
even for atomic ops (although that's coming, yay!).
