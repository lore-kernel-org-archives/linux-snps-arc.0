From: peterz@infradead.org (Peter Zijlstra)
Date: Wed, 13 Feb 2019 13:56:51 +0100
Subject: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
In-Reply-To: <bfc65835-21f9-6d5e-791d-ee49113d939c@synopsys.com>
References: <20190208105519.26750-1-abrodkin@synopsys.com>
 <81017fe4-b31f-4942-e822-a7b70008b74d@synopsys.com>
 <f83412d1e7fd4d67b4632c1f81fae963@AcuMS.aculab.com>
 <bfc65835-21f9-6d5e-791d-ee49113d939c@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190213125651.GP32494@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Tue, Feb 12, 2019@09:45:53AM -0800, Vineet Gupta wrote:
> +CC some folks interested in alignment stuff in the past.
> 
> On 2/12/19 9:30 AM, David Laight wrote:
> > From:  Vineet Gupta
> >> Sent: 12 February 2019 17:17
> >>
> >> On 2/8/19 2:55 AM, Alexey Brodkin wrote:
> >>> By default ARCH_SLAB_MINALIGN is defined in "include/linux/slab.h" as
> >>> "__alignof__(unsigned long long)" which looks fine but not for ARC.
> >>
> >> Just for the record, the issue happens because a LLOCKD (exclusive 64-bit load)
> >> was trying to use a 32-bit aligned effective address (for atomic64_t), not allowed
> >> by ISA (LLOCKD can only take 64-bit aligned address, even when the CPU has
> >> unaligned access enabled).
> >>
> >> This in turn was happening because this word is embedded in some other struct and
> >> happens to be 4 byte aligned
> >>
> >>
> >>> ARC tools ABI sets align of "long long" the same as for "long" = 4
> >>> instead of 8 one may think of.
> > 
> > Right, but __alignof__() doesn't have to return the alignment that would
> > be used for a data item of the specified type.
> > (Read the gcc 'bug' info for gory details.)
> > 
> > On i386 __alignof__(long long) is 8, but structure members of type 'long long'
> > are 4 byte aligned and the alignment of a structure with a 'long long' member
> > is only 4.
> > (Although the microsoft compiler returns 4.)
> 
> Exactly my point that this fudging of outer alignment is no magic bullet.

IMO (and yes I knew about that i386 thing) this is just plain wrong. Of
course we'll have to live with that crap, but that doesn't make it less
crap.

> >> Right, this was indeed unexpected and not like most other arches. ARCv2 ISA allows
> >> regular 64-bit loads/stores (LDD/STD) to take 32-bit aligned addresses. Thus ABI
> >> relaxing the alignment for 64-bit data potentially causes more packing and less
> >> space waste. But on the flip side we need to waste space at arbitrary places liek
> >> this.
> >>
> >> So this is all good and theory, but I'm not 100% sure how slab alignment helps
> >> here (and is future proof). So the outer struct with embedded atomic64_t was
> >> allocated via slab and your patch ensures that outer struct is 64-bit aligned ?
> > 
> > Presumable 'atomic64_t' has an alignment attribute to force 8 byte alignment.
> 
> It does for ARC
> 
> typedef struct {
>         aligned_u64 counter;
> } atomic64_t;

Note that atomic*_t is signed; also note that it doesn't matter in
practise because -fno-strict-overflow.

Personally I think u64 and company should already force natural
alignment; but alas. I though that was part of the reason we have __u64
and co., so that ABI is invariant to kernel alignment changes.

> >> But how does that guarantee that all embedded atomic64_t in there will be 64-bit
> >> aligned (in future say) in the light of ARC ABI and the gcc bug/feature which
> >> Peter alluded to
> >>
> >>    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54188
> >>    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=10360

I strongly agree with all those that say __alignof__ is broken and argue
for the C11 _Alignof/alignof semantics.

In particular I think that:

T x;

struct foo {
	T x;
};

alignof(x) == alignof(foo::x)

And:

    Aggregates (structures and arrays) and unions assume the alignment
    of their most strictly aligned component.

Otherwise none of this is remotely usable.

> >>> Thus slab allocator may easily allocate a buffer which is 32-bit aligned.
> >>> And most of the time it's OK until we start dealing with 64-bit atomics
> >>> with special LLOCKD/SCONDD instructions which (as opposed to their 32-bit
> >>> counterparts LLOCK/SCOND) operate with full 64-bit words but those words
> >>> must be 64-bit aligned.
> >>
> >> Some of this text needed to go above to give more context.
> > 
> > I suspect the slab allocator should be returning 8 byte aligned addresses
> > on all systems.... 
> 
> why ? As I understand it is still not fool proof against the expected alignment of
> inner members. There ought to be a better way to enforce all this.

I agree that for ARC ARCH_SLAB_MINALIGN should be at least 8.

In the past I've proposed a GCC plugin / checker that would verify the
alignment requirements against the various allocators.

For instance:

struct foo {
	spinlock_t a;
	int b;
} __cacheline_aligned;

struct foo *my_foo = kmalloc(sizeof(struct foo), GFP_KERNEL);

would result in a warning; because obviously kmalloc (as per
ARCH_SLAB_MINALIGN) doesn't respect the cacheline alignment of the type.

Of course; it appears our kmalloc() function definition doesn't even
have a __malloc attribute, so there's plenty work to be done here.
