From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 13 Feb 2019 15:23:36 -0800
Subject: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
In-Reply-To: <20190213125651.GP32494@hirez.programming.kicks-ass.net>
References: <20190208105519.26750-1-abrodkin@synopsys.com>
 <81017fe4-b31f-4942-e822-a7b70008b74d@synopsys.com>
 <f83412d1e7fd4d67b4632c1f81fae963@AcuMS.aculab.com>
 <bfc65835-21f9-6d5e-791d-ee49113d939c@synopsys.com>
 <20190213125651.GP32494@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e6138aeb-9ce4-fbfa-4d6a-b76f189a3e47@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 2/13/19 4:56 AM, Peter Zijlstra wrote:
>
> Personally I think u64 and company should already force natural
> alignment; but alas.

But there is an ISA/ABI angle here too. e.g. On 32-bit ARC, LDD (load double) is
allowed to take a 32-bit aligned address to load a register pair. Thus all u64
need not be 64-bit aligned (unless attribute aligned 8 etc) hence the relaxation
in ABI (alignment of long long is 4). You could certainly argue that we end up
undoing some of it anyways by defining things like ARCH_KMALLOC_MINALIGN to 8, but
still...

> I though that was part of the reason we have __u64
> and co., so that ABI is invariant to kernel alignment changes.

Apparently not.

>>> I suspect the slab allocator should be returning 8 byte aligned addresses
>>> on all systems.... 
>>
>> why ? As I understand it is still not fool proof against the expected alignment of
>> inner members. There ought to be a better way to enforce all this.
> 
> I agree that for ARC ARCH_SLAB_MINALIGN should be at least 8.

This issue aside, are there other reasons ? Because making it 8 on ARC is just
pending the eventuality for later.
