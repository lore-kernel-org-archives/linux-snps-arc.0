From: peterz@infradead.org (Peter Zijlstra)
Date: Wed, 22 Jun 2016 12:24:29 +0200
Subject: Build failures in -next due to 'locking/atomic, arch/arc:
 Implement atomic_fetch_{add,sub,and,andnot,or,xor}()'
In-Reply-To: <576A62C6.5080207@synopsys.com>
References: <57640B08.4090007@roeck-us.net>
 <20160617143942.GV30154@twins.programming.kicks-ass.net>
 <20160617144136.GK30927@twins.programming.kicks-ass.net>
 <576A62C6.5080207@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160622102429.GC30154@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Wed, Jun 22, 2016@03:34:54PM +0530, Vineet Gupta wrote:
> 
> Peter the fixlet below doesn't show up in linux-next yet. Could you please do that
> soon. Our internal build lords are yelling at me :-)
> 
> To keep things bisectable, it would be desirable to squash this with the orig commit !

The fix seems to be in tip/locking/arch-atomic, albeit not squashed.

Ingo?

if you're going to rebase that branch, I have one more fix for
tilepro, so let me know.

> > ---
> >  arch/arc/include/asm/atomic.h | 8 --------
> >  1 file changed, 8 deletions(-)
> > 
> > diff --git a/arch/arc/include/asm/atomic.h b/arch/arc/include/asm/atomic.h
> > index bd9c51cb2bfd..4e3c1b6b0806 100644
> > --- a/arch/arc/include/asm/atomic.h
> > +++ b/arch/arc/include/asm/atomic.h
> > @@ -71,7 +71,6 @@ static inline int atomic_##op##_return(int i, atomic_t *v)		\
> >  static inline int atomic_fetch_##op(int i, atomic_t *v)			\
> >  {									\
> >  	unsigned int val, orig;						\
> > -	SCOND_FAIL_RETRY_VAR_DEF                                        \
> >  									\
> >  	/*								\
> >  	 * Explicit full memory barrier needed before/after as		\
> > @@ -84,11 +83,8 @@ static inline int atomic_fetch_##op(int i, atomic_t *v)			\
> >  	"	" #asm_op " %[val], %[orig], %[i]	\n"		\
> >  	"	scond   %[val], [%[ctr]]		\n"		\
> >  	"						\n"		\
> > -	SCOND_FAIL_RETRY_ASM						\
> > -									\
> >  	: [val]	"=&r"	(val),						\
> >  	  [orig] "=&r" (orig)						\
> > -	  SCOND_FAIL_RETRY_VARS						\
> >  	: [ctr]	"r"	(&v->counter),					\
> >  	  [i]	"ir"	(i)						\
> >  	: "cc");							\
> > @@ -199,10 +195,6 @@ ATOMIC_OPS(andnot, &= ~, bic)
> >  ATOMIC_OPS(or, |=, or)
> >  ATOMIC_OPS(xor, ^=, xor)
> >  
> > -#undef SCOND_FAIL_RETRY_VAR_DEF
> > -#undef SCOND_FAIL_RETRY_ASM
> > -#undef SCOND_FAIL_RETRY_VARS
> > -
> >  #else /* CONFIG_ARC_PLAT_EZNPS */
> >  
> >  static inline int atomic_read(const atomic_t *v)
