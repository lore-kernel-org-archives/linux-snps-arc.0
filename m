From: David.Laight@ACULAB.COM (David Laight)
Date: Tue, 12 Feb 2019 17:30:38 +0000
Subject: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
In-Reply-To: <81017fe4-b31f-4942-e822-a7b70008b74d@synopsys.com>
References: <20190208105519.26750-1-abrodkin@synopsys.com>
 <81017fe4-b31f-4942-e822-a7b70008b74d@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f83412d1e7fd4d67b4632c1f81fae963@AcuMS.aculab.com>
To: linux-snps-arc@lists.infradead.org

From:  Vineet Gupta
> Sent: 12 February 2019 17:17
> 
> On 2/8/19 2:55 AM, Alexey Brodkin wrote:
> > By default ARCH_SLAB_MINALIGN is defined in "include/linux/slab.h" as
> > "__alignof__(unsigned long long)" which looks fine but not for ARC.
> 
> Just for the record, the issue happens because a LLOCKD (exclusive 64-bit load)
> was trying to use a 32-bit aligned effective address (for atomic64_t), not allowed
> by ISA (LLOCKD can only take 64-bit aligned address, even when the CPU has
> unaligned access enabled).
> 
> This in turn was happening because this word is embedded in some other struct and
> happens to be 4 byte aligned
> 
> 
> > ARC tools ABI sets align of "long long" the same as for "long" = 4
> > instead of 8 one may think of.

Right, but __alignof__() doesn't have to return the alignment that would
be used for a data item of the specified type.
(Read the gcc 'bug' info for gory details.)

On i386 __alignof__(long long) is 8, but structure members of type 'long long'
are 4 byte aligned and the alignment of a structure with a 'long long' member
is only 4.
(Although the microsoft compiler returns 4.)

> Right, this was indeed unexpected and not like most other arches. ARCv2 ISA allows
> regular 64-bit loads/stores (LDD/STD) to take 32-bit aligned addresses. Thus ABI
> relaxing the alignment for 64-bit data potentially causes more packing and less
> space waste. But on the flip side we need to waste space at arbitrary places liek
> this.
> 
> So this is all good and theory, but I'm not 100% sure how slab alignment helps
> here (and is future proof). So the outer struct with embedded atomic64_t was
> allocated via slab and your patch ensures that outer struct is 64-bit aligned ?

Presumable 'atomic64_t' has an alignment attribute to force 8 byte alignment.

> But how does that guarantee that all embedded atomic64_t in there will be 64-bit
> aligned (in future say) in the light of ARC ABI and the gcc bug/feature which
> Peter alluded to
> 
>    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54188
>    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=10360
> 
> > Thus slab allocator may easily allocate a buffer which is 32-bit aligned.
> > And most of the time it's OK until we start dealing with 64-bit atomics
> > with special LLOCKD/SCONDD instructions which (as opposed to their 32-bit
> > counterparts LLOCK/SCOND) operate with full 64-bit words but those words
> > must be 64-bit aligned.
> 
> Some of this text needed to go above to give more context.

I suspect the slab allocator should be returning 8 byte aligned addresses
on all systems....

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
