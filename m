From: David.Laight@ACULAB.COM (David Laight)
Date: Wed, 13 Feb 2019 14:13:08 +0000
Subject: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
In-Reply-To: <20190213125651.GP32494@hirez.programming.kicks-ass.net>
References: <20190208105519.26750-1-abrodkin@synopsys.com>
 <81017fe4-b31f-4942-e822-a7b70008b74d@synopsys.com>
 <f83412d1e7fd4d67b4632c1f81fae963@AcuMS.aculab.com>
 <bfc65835-21f9-6d5e-791d-ee49113d939c@synopsys.com>
 <20190213125651.GP32494@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <536eb8d0112b44dc90b9b9a7f670e96d@AcuMS.aculab.com>
To: linux-snps-arc@lists.infradead.org

From: Peter Zijlstra 
> Sent: 13 February 2019 12:57
...
...
> In the past I've proposed a GCC plugin / checker that would verify the
> alignment requirements against the various allocators.
> 
> For instance:
> 
> struct foo {
> 	spinlock_t a;
> 	int b;
> } __cacheline_aligned;
> 
> struct foo *my_foo = kmalloc(sizeof(struct foo), GFP_KERNEL);
> 
> would result in a warning; because obviously kmalloc (as per
> ARCH_SLAB_MINALIGN) doesn't respect the cacheline alignment of the type.
> 
> Of course; it appears our kmalloc() function definition doesn't even
> have a __malloc attribute, so there's plenty work to be done here.

We could pass the alignment to the allocator by defining something like:

#define do_malloc(x) ((x) = (typeof(*(x)))_do_malloc(sizeof *(x), __alignof__(*(x))))

Although you probably want to compile-time detect alignments that are smaller
than the normal minimal alignment.

If the allocator needs to add a header it would need to use the byte before
the allocated item to find the header.
OTOH adding a header is horrid for page-sized items.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
