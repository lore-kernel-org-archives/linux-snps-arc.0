From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 14 Feb 2019 08:50:43 +0000
Subject: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
In-Reply-To: <e6138aeb-9ce4-fbfa-4d6a-b76f189a3e47@synopsys.com>
References: <20190208105519.26750-1-abrodkin@synopsys.com>
 <81017fe4-b31f-4942-e822-a7b70008b74d@synopsys.com>
 <f83412d1e7fd4d67b4632c1f81fae963@AcuMS.aculab.com>
 <bfc65835-21f9-6d5e-791d-ee49113d939c@synopsys.com>
 <20190213125651.GP32494@hirez.programming.kicks-ass.net>
 <e6138aeb-9ce4-fbfa-4d6a-b76f189a3e47@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE64681DB01F@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet, Peter, all,

> -----Original Message-----
> From: Vineet Gupta <vgupta at synopsys.com>
> Sent: Thursday, February 14, 2019 2:24 AM
> To: Peter Zijlstra <peterz at infradead.org>
> Cc: David Laight <David.Laight at ACULAB.COM>; Alexey Brodkin <alexey.brodkin at synopsys.com>; linux-snps-
> arc at lists.infradead.org; Arnd Bergmann <arnd.bergmann at linaro.org>; linux-kernel at vger.kernel.org;
> stable at vger.kernel.org; Mark Rutland <mark.rutland at arm.com>
> Subject: Re: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
> 
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
> 
> > I though that was part of the reason we have __u64
> > and co., so that ABI is invariant to kernel alignment changes.
> 
> Apparently not.
> 
> >>> I suspect the slab allocator should be returning 8 byte aligned addresses
> >>> on all systems....
> >>
> >> why ? As I understand it is still not fool proof against the expected alignment of
> >> inner members. There ought to be a better way to enforce all this.
> >
> > I agree that for ARC ARCH_SLAB_MINALIGN should be at least 8.
> 
> This issue aside, are there other reasons ? Because making it 8 on ARC is just
> pending the eventuality for later.

But that's pretty much the same for other 32-bit arches that have 64-bit atomics
like ARM etc. From what I may see from ARM's documentation for LDREXD/SRREXD they
require double-word alignment of data as well.

That said if for some reason atomic64_t variable is unaligned execution on
any (or at least most) 32-bit architectures will lead to run-time failure,
i.e. we'll know about it and this will be fixed.

And what I'm doing by that change (ARCH_SLAB_MINALIGN=8 for ARC) I'm just
working-around peculiarity of ARC ABI.

Out of curiosity I checked if there're any other occurrences of "alingof(long long)"
and there seems to be a couple of more:
----------------------------------->8-----------------------------
# git grep alignof | grep "long long"

...

kernel/workqueue.c:5693:        WARN_ON(__alignof__(struct pool_workqueue) < __alignof__(long long));
mm/slab.c:155:#define   REDZONE_ALIGN           max(BYTES_PER_WORD, __alignof__(unsigned long long))
mm/slab.c:2034: if (ralign > __alignof__(unsigned long long))
----------------------------------->8-----------------------------

Not really sure how important is "kernel/workqueue.c" part but in case of "mm/slab.c"
shouldn't we use ARCH_SLAB_MINALIGN there instead of that "not very meaningful" __alignof__(long long)?

-Alexey
