From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 9 Jul 2018 14:30:41 +0000
Subject: [PATCH] atomic{64}_t: Explicitly specify data storage length
 and alignment
In-Reply-To: <20180709133542.GP2476@hirez.programming.kicks-ass.net>
References: <20180709124741.21037-1-abrodkin@synopsys.com>
 <20180709133542.GP2476@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <6762443004f96d279cba77b7c412163769c930fe.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter,

On Mon, 2018-07-09@15:35 +0200, Peter Zijlstra wrote:
> On Mon, Jul 09, 2018@03:47:41PM +0300, Alexey Brodkin wrote:
> > diff --git a/include/asm-generic/atomic64.h b/include/asm-generic/atomic64.h
> > index 8d28eb010d0d..b94b749b5952 100644
> > --- a/include/asm-generic/atomic64.h
> > +++ b/include/asm-generic/atomic64.h
> > @@ -13,7 +13,7 @@
> >  #define _ASM_GENERIC_ATOMIC64_H
> >  
> >  typedef struct {
> > -	long long counter;
> > +	u64 __aligned(8) counter;
> >  } atomic64_t;
> 
> The type is wrong, atomic is signed, the alignment also really doesn't
> matter, generic atomic64 is utter crap.

Hm, any thoughts on why it's "u64" for 32-bit x86?
See https://elixir.bootlin.com/linux/latest/source/arch/x86/include/asm/atomic64_32.h#L12
------------------------->8-----------------------
/* An 64bit atomic type */

typedef struct {
	u64 __aligned(8) counter;
} atomic64_t;
------------------------->8-----------------------

> >  #define ATOMIC64_INIT(i)	{ (i) }
> > diff --git a/include/linux/types.h b/include/linux/types.h
> > index 9834e90aa010..e2f631782621 100644
> > --- a/include/linux/types.h
> > +++ b/include/linux/types.h
> > @@ -174,12 +174,12 @@ typedef phys_addr_t resource_size_t;
> >  typedef unsigned long irq_hw_number_t;
> >  
> >  typedef struct {
> > -	int counter;
> > +	u32 __aligned(4) counter;
> >  } atomic_t;
> 
> u32 is wrong, the atomic type is signed.
> 
> Also, if an architecture doesn't properly align its native machine word
> size but requires alignment for atomics it's a broken architecture.

Ok we may not touch 32-bit atomics as there's a hope most of arches
properly align native machine words.

> >  
> >  #ifdef CONFIG_64BIT
> >  typedef struct {
> > -	long counter;
> > +	u64 __aligned(8) counter;
> >  } atomic64_t;
> >  #endif
> >  
> 
> Similar for this one, on 64bit archs that support atomics the native
> 64bit types (long included) had better already imply this alignment.

Ok agree.

-Alexey
